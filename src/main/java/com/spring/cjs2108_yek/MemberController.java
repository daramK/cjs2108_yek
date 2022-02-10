package com.spring.cjs2108_yek;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_yek.service.MemberService;
import com.spring.cjs2108_yek.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag = "";
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 폼
	@RequestMapping(value="/memLogin", method = RequestMethod.GET)
	public String memLoginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		return "member/memLogin";
	}
	
	// 로그인 인증처리
	@RequestMapping(value="/memLogin", method = RequestMethod.POST)
	public String memLoginPost(String mid, String pwd, HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model) {
		MemberVO vo = memberService.getIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "특별회원";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			else if(vo.getLevel() == 3) strLevel = "정회원";
			else if(vo.getLevel() == 4) strLevel = "준회원";
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickname", vo.getNickname());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			
			// 최종 접속일 저장
			session.setAttribute("sLastDate", vo.getLastDate().substring(0, vo.getLastDate().lastIndexOf(" ")));
			
			// 방문카운트, 포인트 누적
			memberService.getMemTodayProcess(vo.getTodayCnt());
			
			// 아이디 쿠키 저장
			String idCheck = request.getParameter("idCheck")==null ? "" : request.getParameter("idCheck");
			
			if(idCheck.equals("on")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*4);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			msgFlag = "memLoginOk";
		}
		else {
			msgFlag = "memLoginNo";
		}
		return "redirect:/msg/" + msgFlag;
	}
	
	// 로그인 후 회원메인창
	@RequestMapping(value="/memMain", method = RequestMethod.GET)
	public String memMainGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		
		// 게시판에 올린 글 수 가져오기
		int boardCnt = memberService.getBordWriteCnt(mid);
		model.addAttribute("boardCnt", boardCnt);
		
		return "member/memMain";
	}
	
	// 로그아웃
	@RequestMapping(value="/memLogout", method = RequestMethod.GET)
	public String memLogoutGet() {
		msgFlag = "memLogout";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 회원가입 폼
	@RequestMapping(value="/memInput", method = RequestMethod.GET)
	public String memInputGet() {
		return "member/memInput";
	}

	// 아이디 검색하기
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public String idCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null) res = "1";
		return res;
	}
	
	// 닉네임 검색하기
	@ResponseBody
	@RequestMapping(value="/nicknameCheck", method = RequestMethod.POST)
	public String nicknameCheckPost(String nickname) {
		String res = "0";
		MemberVO vo = memberService.getNicknameCheck(nickname);
		if(vo != null) res = "1";
		return res;
	}
	
	// 회원가입
	@RequestMapping(value="/memInput", method = RequestMethod.POST)
	public String memInputPost(MemberVO vo) {
		// 아이디 중복체크
		if(memberService.getIdCheck(vo.getMid()) != null) {
			msgFlag = "memIdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		// 닉네임 중복체크
		if(memberService.getNicknameCheck(vo.getNickname()) != null) {
			msgFlag = "memNicknameCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		
		// 비밀번호 암호화
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		// DB에 저장
		int res = memberService.setMemInput(vo);
		
		if(res == 1) msgFlag = "memInputOk";
		else msgFlag = "memInputNo";
		
		return "redirect:/msg/" + msgFlag;
	}
	
	@RequestMapping(value="/memPwdCheck", method = RequestMethod.GET)
	public String memPwdCheckGet() {
		return "member/memPwdCheck";
	}
	
	@RequestMapping(value="/memPwdCheck", method = RequestMethod.POST)
	public String memPwdCheckPost(String pwd, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd())) {
			session.setAttribute("sPwd", pwd);
			model.addAttribute("vo", vo);
			return "member/memUpdate";
		}
		else {
			msgFlag = "pwdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
	}	
	
	// 회원정보변경
	@RequestMapping(value="/memUpdate", method = RequestMethod.GET)
	public String memUpdateGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		return "member/memUpdate";
	}
	
	@RequestMapping(value="/memUpdate", method = RequestMethod.POST)
	public String memUpdatePost(MemberVO vo, HttpSession session) {
		System.out.println("vo : " + vo);
		String nickname = (String) session.getAttribute("sNickname");
		
		if(!nickname.equals(vo.getNickname())) {
			if(memberService.getNicknameCheck(vo.getNickname()) != null) {
				msgFlag = "memNickNameCheckNo";
				return "redirect:/msg/" + msgFlag;
			}
			else {
				session.setAttribute("sNickname", vo.getNickname());
			}
		}
		System.out.println("vo : " + vo);
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		System.out.println("vo : " + vo);
		int res = memberService.setMemUpdate(vo);
		
		if(res == 1) {
			msgFlag = "memUpdateOk";
		}
		else {
			msgFlag = "memUpdateNo";
		}
		return "redirect:/msg/" + msgFlag;
	}
	
	@RequestMapping(value="/memDelete", method = RequestMethod.GET)
	public String memDeleteGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		memberService.setMemDelete(mid);
		msgFlag = "memDeleteOk";
		return "redirect:/msg/" + msgFlag;
	}
}
