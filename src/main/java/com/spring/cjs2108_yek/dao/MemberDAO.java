package com.spring.cjs2108_yek.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_yek.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getIdCheck(@Param("mid") String mid);

	public MemberVO getNicknameCheck(@Param("nickname") String nickname);

	public void setMemInput(@Param("vo") MemberVO vo);

	public void setLastDateUpdate(@Param("mid") String mid, @Param("newPoint") int newPoint, @Param("todayCnt") int todayCnt);

	public void setMemUpdate(@Param("vo") MemberVO vo);

	public void setMemDelete(@Param("mid") String mid);

	public int getBoardWriteCnt(@Param("mid") String mid);

}
