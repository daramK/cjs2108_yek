package com.spring.cjs2108_yek.service;

import java.util.ArrayList;

import com.spring.cjs2108_yek.vo.BoardVO;
import com.spring.cjs2108_yek.vo.MemberVO;

public interface AdminService {

	public int getNewMember();

	public int totRecCnt(int level);

	public int totRecCntMid(String mid);

	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level);

	public ArrayList<MemberVO> getMemberListMid(int startIndexNo, int pageSize, String mid);

	public void setLevelUpdate(int idx, int level);

	public int totRecCntBoard();

	public int totRecCntBoardNick(String nickname);

	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize);

	public ArrayList<BoardVO> getBoardListNick(int startIndexNo, int pageSize, String nickname);

	public void setMemberReset(int idx);

}
