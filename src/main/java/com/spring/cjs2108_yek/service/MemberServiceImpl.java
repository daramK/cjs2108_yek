package com.spring.cjs2108_yek.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs2108_yek.dao.MemberDAO;
import com.spring.cjs2108_yek.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO getIdCheck(String mid) {
		return memberDAO.getIdCheck(mid);
	}

	@Override
	public MemberVO getNicknameCheck(String nickname) {
		return memberDAO.getNicknameCheck(nickname);
	}

	@Override
	public int setMemInput(MemberVO vo) {
		int res = 0;
		memberDAO.setMemInput(vo);
		res = 1;
		
		return res;
	}

	// 로그인 후 처리
	@Override
	public void getMemTodayProcess(int todayCnt) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String lastDate = (String) session.getAttribute("sLastDate");
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		int newPoint = 0;
		if(lastDate.substring(0, 10).equals(strToday)) {
			if(todayCnt >= 5) newPoint = 0;
			else newPoint = 10;
			todayCnt += 1;
		}
		else {
			todayCnt = 1;
			newPoint = 10;
		}
		
		memberDAO.setLastDateUpdate(mid, newPoint, todayCnt);
	}

	@Override
	public int setMemUpdate(MemberVO vo) {
		int res = 0;
		memberDAO.setMemUpdate(vo);
		res = 1;
		System.out.println("impl res : " + res);
		return res;
	}

	@Override
	public void setMemDelete(String mid) {
		memberDAO.setMemDelete(mid);
	}

	@Override
	public int getBordWriteCnt(String mid) {
		return memberDAO.getBoardWriteCnt(mid);
	}

}
