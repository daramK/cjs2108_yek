package com.spring.cjs2108_yek.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_yek.vo.BoardVO;
import com.spring.cjs2108_yek.vo.MemberVO;

public interface AdminDAO {

	public int getNewMember();

	public int totRecCnt(@Param("level") int level);

	public int totRecCntMid(@Param("mid") String mid);

	public ArrayList<MemberVO> getMemberList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("level") int level);

	public ArrayList<MemberVO> getMemberListMid(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("mid") String mid);

	public void setLevelUpdate(@Param("idx") int idx, @Param("level") int level);

	public int totRecCntBoard();

	public int totRecCntBoardNick(@Param("nickname") String nickname);

	public ArrayList<BoardVO> getBoardList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public ArrayList<BoardVO> getBoardListNick(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("nickname") String nickname);

	public void setMemberReset(@Param("idx") int idx);

}
