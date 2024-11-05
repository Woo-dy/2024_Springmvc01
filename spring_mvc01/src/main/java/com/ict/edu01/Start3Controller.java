package com.ict.edu01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// 어노테이션으로 @Controller를 하면 자동으로 Spring에서 자동으로 Controller로 인식합니다.
@Controller
public class Start3Controller {
	// URL 매핑이란
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// @RequestMapping(value = "/", method = RequestMethod.posit)
	
	// 애매하거나 둘 다 받아야되는 경우는 @RequestMapping() 사용하면 된다.
	// @RequestMapping("URL")
	
	// 명확하면 Get/Post 로 나눠서 사용하면 된다.
	// @GetMapping("URL")
	// @PostMapping("URL")
	
	// 해당 메서드는 URL 매핑이 와야 실행된다.
	// exec(인자) : 인자는 필요할 때만 사용하면 된다.
	//@GetMapping("/start3")
	@RequestMapping("/start3")
	public ModelAndView exec(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/result3");
		mv.addObject("city", "서울");
		
		return mv;
	}
	
}
