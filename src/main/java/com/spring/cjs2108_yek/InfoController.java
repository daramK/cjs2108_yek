package com.spring.cjs2108_yek;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {
	String masFlag = "";
	
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String infoGet() {
		return "info/info";
	}
	
	@RequestMapping(value="/curriculum", method = RequestMethod.GET)
	public String curriculumGet() {
		return "info/curriculum";
	}
	
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaGet() {
		return "info/qna";
	}
	
	@RequestMapping(value="/history", method = RequestMethod.GET)
	public String historyGet() {
		return "info/history";
	}
}
