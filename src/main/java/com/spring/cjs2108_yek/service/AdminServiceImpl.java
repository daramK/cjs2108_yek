package com.spring.cjs2108_yek.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_yek.dao.AdminDAO;
import com.spring.cjs2108_yek.vo.BoardVO;
import com.spring.cjs2108_yek.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public int getNewMember() {
		return adminDAO.getNewMember();
	}

	@Override
	public int totRecCnt(int level) {
		return adminDAO.totRecCnt(level);
	}

	@Override
	public int totRecCntMid(String mid) {
		return adminDAO.totRecCntMid(mid);
	}

	@Override
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level) {
		return adminDAO.getMemberList(startIndexNo, pageSize, level);
	}

	@Override
	public ArrayList<MemberVO> getMemberListMid(int startIndexNo, int pageSize, String mid) {
		return adminDAO.getMemberListMid(startIndexNo, pageSize, mid);
	}

	@Override
	public void setLevelUpdate(int idx, int level) {
		adminDAO.setLevelUpdate(idx, level);
	}

	@Override
	public int totRecCntBoard() {
		return adminDAO.totRecCntBoard();
	}

	@Override
	public int totRecCntBoardNick(String nickname) {
		return adminDAO.totRecCntBoardNick(nickname);
	}

	@Override
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		return adminDAO.getBoardList(startIndexNo, pageSize);
	}

	@Override
	public ArrayList<BoardVO> getBoardListNick(int startIndexNo, int pageSize, String nickname) {
		return adminDAO.getBoardListNick(startIndexNo, pageSize, nickname);
	}

	@Override
	public void setMemberReset(int idx) {
		adminDAO.setMemberReset(idx);
	}

}
