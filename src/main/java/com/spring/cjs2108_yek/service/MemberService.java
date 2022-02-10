package com.spring.cjs2108_yek.service;

import com.spring.cjs2108_yek.vo.MemberVO;

public interface MemberService {

	public MemberVO getIdCheck(String mid);

	public MemberVO getNicknameCheck(String nickname);

	public int setMemInput(MemberVO vo);

	public void getMemTodayProcess(int todayCnt);

	public int setMemUpdate(MemberVO vo);

	public void setMemDelete(String mid);

	public int getBordWriteCnt(String mid);

}
