package com.spring.cjs2108_yek.service;

import java.util.List;

import com.spring.cjs2108_yek.vo.GuestVO;

public interface GuestService {

	public List<GuestVO> getGuestList(int startIndexNo, int pageSize);

	public int totRecCnt();

	public void setGuestInput(GuestVO vo);

	public void setGuestDelete(int idx);

}
