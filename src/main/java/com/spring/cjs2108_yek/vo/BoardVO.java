package com.spring.cjs2108_yek.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int idx;
	private String category;
	private String mid;
	private String nickname;
	private String title;
	private String email;
	private String content;
	private String wDate;
	private int readNum;
	private String hostIp;
	private int pin;
	
	private int diffTime;
	private String oriContent;
	
	private int replyCount;
}
