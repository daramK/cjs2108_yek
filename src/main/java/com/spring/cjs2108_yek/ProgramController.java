package com.spring.cjs2108_yek;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/program")
public class ProgramController {
	String masFlag = "";
	
	@RequestMapping(value="/gracieCombatives", method = RequestMethod.GET)
	public String gracieCombativesGet() {
		return "program/gracieCombatives";
	}
	
	@RequestMapping(value="/gracieBullyproof", method = RequestMethod.GET)
	public String gracieBullyproofGet() {
		return "program/gracieBullyproof";
	}
	
	@RequestMapping(value="/masterCycle", method = RequestMethod.GET)
	public String masterCycleGet() {
		return "program/masterCycle";
	}
	
	@RequestMapping(value="/privateClass", method = RequestMethod.GET)
	public String privateClassGet() {
		return "program/privateClass";
	}
}
