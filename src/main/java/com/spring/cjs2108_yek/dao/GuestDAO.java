package com.spring.cjs2108_yek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_yek.vo.GuestVO;

public interface GuestDAO {

	public List<GuestVO> getGuestList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public int totRecCnt();

	public void setGuestInput(@Param("vo") GuestVO vo);

	public void setGuestDelete(@Param("idx") int idx);

}
