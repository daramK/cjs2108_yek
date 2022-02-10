package com.spring.cjs2108_yek.vo;

import lombok.Data;

@Data
public class BoardReplyVO {
	private int idx;
	private int boardIdx;
	private String mid;
	private String nickname;
	private String wDate;
	private String hostIp;
	private String content;
	private int level;
	private int levelOrder;
}
