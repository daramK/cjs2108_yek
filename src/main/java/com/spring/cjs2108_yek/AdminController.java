package com.spring.cjs2108_yek;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_yek.service.AdminService;
import com.spring.cjs2108_yek.service.BoardService;
import com.spring.cjs2108_yek.service.GuestService;
import com.spring.cjs2108_yek.service.MemberService;
import com.spring.cjs2108_yek.vo.BoardVO;
import com.spring.cjs2108_yek.vo.GuestVO;
import com.spring.cjs2108_yek.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag = "";
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	GuestService guestService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/adMenu", method = RequestMethod.GET)
	public String adMenuGet() {
		return "admin/adMenu";
	}
	
	@RequestMapping(value="/adLeft", method = RequestMethod.GET)
	public String adLeftGet() {
		return "admin/adLeft";
	}
	
	@RequestMapping(value="/adContent", method = RequestMethod.GET)
	public String adContentGet(Model model) {
		int newMember = adminService.getNewMember();
		model.addAttribute("newMember", newMember);
		return "admin/adContent";
	}
	
	@RequestMapping(value="/adMemberList", method = RequestMethod.GET)
	public String adMemberListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="level", defaultValue="99", required=false) int level,
			@RequestParam(name="mid", defaultValue="", required=false) String mid,
			Model model) {
		int pageSize = 10;
		int totRecCnt = 0;
		if(mid.equals("")) {
			totRecCnt = adminService.totRecCnt(level);
		}
		else {
			totRecCnt = adminService.totRecCntMid(mid);
		}
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag -1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		if(mid.equals("")) {
			vos = adminService.getMemberList(startIndexNo, pageSize, level);
		}
		else {
			vos = adminService.getMemberListMid(startIndexNo, pageSize, mid);
		}
		
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("level", level);
		model.addAttribute("mid", mid);
		model.addAttribute("totRecCnt", totRecCnt);
		
		return "admin/member/adMemberList";
	}

	@ResponseBody
	@RequestMapping(value="/adMemberLevel", method = RequestMethod.POST)
	public String adMemberLevelPost(int idx, int level) {
		adminService.setLevelUpdate(idx, level);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/adMemberReset", method = RequestMethod.POST)
	public String adMemberResetPost(int idx) {
		adminService.setMemberReset(idx);
		return "";
	}
	
	@RequestMapping(value="/adGuestList", method = RequestMethod.GET)
	public String adGuestListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			Model model) {
		int pageSize = 5;
		int totRecCnt = guestService.totRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<GuestVO> vos = guestService.getGuestList(startIndexNo,  pageSize);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("totRecCnt", totRecCnt);
		
		return "admin/guest/adGuestList";
	}
	
	@ResponseBody
	@RequestMapping(value="/adGuestList", method = RequestMethod.POST)
	public String adGuestListPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			guestService.setGuestDelete(Integer.parseInt(idx));
		}
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/adBoardList", method = RequestMethod.POST)
	public String adBoardListPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			boardService.setBoardDelete(Integer.parseInt(idx));
		}
		return "";
	}
	
	@RequestMapping(value="/adMemberInfo", method = RequestMethod.GET)
	public String adMemberInfoGet(String mid) {
		MemberVO vo = memberService.getIdCheck(mid);
		
		return "admin/member/adMemberInfo";
	}
	
	@RequestMapping(value="/adBoardList", method = RequestMethod.GET)
	public String adBoardListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="nickname", defaultValue="", required=false) String nickname,
			Model model) {
		int pageSize = 10;
		int totRecCnt = 0;
		if(nickname.equals("")) {
			totRecCnt = adminService.totRecCntBoard();
		}
		else {
			totRecCnt = adminService.totRecCntBoardNick(nickname);
		}
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag -1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		if(nickname.equals("")) {
			vos = adminService.getBoardList(startIndexNo, pageSize);
		}
		else {
			vos = adminService.getBoardListNick(startIndexNo, pageSize, nickname);
		}
		
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("nickname", nickname);
		model.addAttribute("totRecCnt", totRecCnt);
		
		return "admin/board/adBoardList";
	}
	
	
}
