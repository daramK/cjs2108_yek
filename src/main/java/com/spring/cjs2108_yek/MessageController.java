package com.spring.cjs2108_yek;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	
	@RequestMapping(value="/msg/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model, HttpSession session) {
		String nickname = session.getAttribute("sNickname")==null ? "" : (String) session.getAttribute("sNickname");
		String strLevel = session.getAttribute("sStrLevel")==null ? "" : (String) session.getAttribute("sStrLevel");
		
		if(msgFlag.equals("memLoginOk")) {
			model.addAttribute("msg", nickname+"님("+strLevel+") 로그인 되었습니다.");
			model.addAttribute("url", "member/memMain");
		}
		else if(msgFlag.equals("memLoginNo")) {
			model.addAttribute("msg", "아이디, 비밀번호를 확인하세요.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("memLogout")) {
			session.invalidate();
			model.addAttribute("msg", nickname + "님 로그아웃 되었습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memIdCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다.");
			model.addAttribute("url", "member/memInput");
		}
		else if(msgFlag.equals("memNicknameCheckNo")) {
			model.addAttribute("msg", "닉네임이 중복되었습니다.");
			model.addAttribute("url", "member/memInput");
		}
		else if(msgFlag.equals("memInputOk")) {
			model.addAttribute("msg", "회원가입이 되었습니다.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("memInputNo")) {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			model.addAttribute("url", "member/memInput");
		}
		else if(msgFlag.equals("guestInputOk")) {
			model.addAttribute("msg", "방명록에 글이 등록되었습니다.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("pwdCheckNo")) {
			model.addAttribute("msg", "비밀번호를 확인하세요.");
			model.addAttribute("url", "member/memPwdCheck");
		}
		else if(msgFlag.equals("memUpdateOk")) {
			model.addAttribute("msg", "회원정보가 수정되었습니다.");
			model.addAttribute("url", "member/memUpdate");
		}
		else if(msgFlag.equals("memUpdateNo")) {
			model.addAttribute("msg", "회원정보수정에 실패했습니다.");
			model.addAttribute("url", "member/memUpdate");
		}
		else if(msgFlag.equals("memDeleteOk")) {
			session.invalidate();
			model.addAttribute("msg", nickname + "회원님 탈퇴신청이 처리되었습니다.\\n1개월간은 동일한 아이디로 가입할 수 없습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("boardInputOk")) {
			model.addAttribute("msg", "게시글이 저장되었습니다.");
			model.addAttribute("url", "board/boardList");
		}
		
		else if(msgFlag.substring(0,13).equals("boardUpdateOk")) {
			model.addAttribute("msg", "게시물이 수정되었습니다.");
			model.addAttribute("url", "/board/boardContent?"+msgFlag.substring(14));
		}
		else if(msgFlag.substring(0,13).equals("boardDeleteOk")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "/board/boardList?"+msgFlag.substring(14));
		}
		
		return "include/message";
	}
}
