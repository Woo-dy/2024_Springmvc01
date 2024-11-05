package com.ict.edu01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//컨트롤러를 어노테이션 하지 않으면 반드시 Controller를 구현(implements)해야 한다.
public class Start2Controller implements Controller {
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 방법1)
		ModelAndView mv = new ModelAndView();
		/* view 이름 : 되돌아갈 jsp 이름 ="result2" */
		mv.setViewName("result2");
		
		// 방법2)
		// ModelAndView mv = new ModelAndView("result2");
		
		String[] dogName = {"땅콩이", "진돌이", "말복이", "하오"};
		
		mv.addObject(dogName);
		
		ArrayList<String> catName = new ArrayList<String>();
		catName.add("뽀미");
		catName.add("나비");
		catName.add("달콩이");
		catName.add("까망이");
		mv.addObject("catName", catName);
		
		mv.addObject(catName);
		
		return mv;
	}
}
