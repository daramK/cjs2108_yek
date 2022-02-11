package com.spring.cjs2108_yek;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_yek.service.BoardService;
import com.spring.cjs2108_yek.vo.BoardReplyVO;
import com.spring.cjs2108_yek.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardColtroller {
	String msgFlag = "";
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
			@RequestParam(name="lately", defaultValue="0", required=false) int lately,
			Model model) {
		int totRecCnt = boardService.totRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) +1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<BoardVO> vos = boardService.getBoardList(startIndexNo, pageSize);
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("lately", lately);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardContent", method = RequestMethod.GET)
	public String boardContentGet(int idx, int pag, int pageSize, int lately, Model model) {
		boardService.addReadNum(idx);
		
		BoardVO vo = boardService.getBoardContent(idx);
		
		List<BoardVO> pnVos = boardService.getPreNext(idx);
		
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("lately", lately);
		
		List<BoardReplyVO> rVos = boardService.getBoardReply(idx);
		model.addAttribute("rVos", rVos);
		
		return "board/boardContent";
	}
	
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDeleteGet(int idx, int pag, int pageSize, int lately) {
		boardService.setBoardDelete(idx);
		msgFlag = "boardDeleteOk$pag="+pag+"&pageSize="+pageSize+"&lately="+lately;
		return "redirect:/msg/" + msgFlag;
	}
	
	@RequestMapping(value="/boardInput", method = RequestMethod.GET)
	public String boardInputGet() {
		return "board/boardInput";
	}
	
	@RequestMapping(value="/boardInput", method = RequestMethod.POST)
	public String boardInputPost(BoardVO vo) {
		boardService.imgCheck(vo.getContent());
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		System.out.println("vo : " + vo);
		boardService.setBoardInput(vo);
		
		return "redirect:/msg/boardInputOk";
	}
	
	@RequestMapping(value="/boardUpdate",method = RequestMethod.GET)
	public String boardUpdateGet(Model model, int idx, int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
			@RequestParam(name="lately", defaultValue="0", required=false) int lately) {
		BoardVO vo = boardService.getBoardContent(idx);
		
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgCheckUpdate(vo.getContent());
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("lately", lately);
		return "board/boardUpdate";
	}
	
	@RequestMapping(value="/boardUpdate",method = RequestMethod.POST)
	public String boardUpdatePost(BoardVO vo, int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
			@RequestParam(name="lately", defaultValue="0", required=false) int lately) {
		
		if(vo.getOriContent().indexOf("src=\"/") != -1)	boardService.imgDelete(vo.getOriContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/board/", "/data/ckeditor/"));
		
		boardService.imgCheck(vo.getContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		
		boardService.setBoardUpdate(vo);
		
		msgFlag = "boardUpdateOk$idx="+vo.getIdx()+"&pag="+pag+"&pageSize="+pageSize+"&lately="+lately;
		return "redirect:/msg/" + msgFlag;
	}
	
	@ResponseBody
	@RequestMapping(value="/boardReplyInsert", method = RequestMethod.POST)
	public String boardReplyInsertPost(BoardReplyVO rVo) {
		int levelOrder = 0;
		String strLevelOrder = boardService.maxLevelOrder(rVo.getBoardIdx());
		if(strLevelOrder != null) levelOrder = Integer.parseInt(strLevelOrder) + 1;
		rVo.setLevelOrder(levelOrder);
		
		boardService.setReplyInsert(rVo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardReplyInsert2", method = RequestMethod.POST)
	public String boardReplyInsert2InsertPost(BoardReplyVO rVo) {
		boardService.levelOrderPlusUpdate(rVo);
		rVo.setLevel(rVo.getLevel()+1);
		rVo.setLevelOrder(rVo.getLevelOrder()+1);
		
		boardService.setReplyInsert2(rVo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardReplyDelete", method = RequestMethod.POST)
	public String boardReplyDeletePost(int replyIdx) {
		boardService.setReplyDelete(replyIdx);
		return "";
	}
	
}
