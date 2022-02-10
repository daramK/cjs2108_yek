package com.spring.cjs2108_yek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_yek.dao.GuestDAO;
import com.spring.cjs2108_yek.vo.GuestVO;

@Service
public class GuestServiceImpl implements GuestService {
	@Autowired
	GuestDAO guestDAO;
	
	@Override
	public List<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		return guestDAO.getGuestList(startIndexNo, pageSize);
	}

	@Override
	public int totRecCnt() {
		return guestDAO.totRecCnt();
	}

	@Override
	public void setGuestInput(GuestVO vo) {
		guestDAO.setGuestInput(vo);
	}

	@Override
	public void setGuestDelete(int idx) {
		guestDAO.setGuestDelete(idx);
	}

}
