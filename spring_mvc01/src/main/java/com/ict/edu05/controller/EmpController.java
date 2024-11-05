package com.ict.edu05.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu05.service.EmpService;
import com.ict.edu05.vo.empVO;

@Controller
public class EmpController {
	@Autowired
	private EmpService empService;
	
	
	@RequestMapping("/emp")
	public ModelAndView emp_form() {
		return new ModelAndView("day05/emp_form");
	}
	
	@PostMapping("/emp_getlist")
	public ModelAndView emp_list() {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_list");
			List<empVO> list = empService.getlist();
			mv.addObject("list", list);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	@PostMapping("/emp_search")
	public ModelAndView search_go(@RequestParam("deptno") String deptno) {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_search");
			List<empVO> list = empService.getSearch(deptno);
			mv.addObject("list", list);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	// 파라미터가 vo에 존재하지 않을 경우 처리 방법
	// 1. vo에 넣는다.
	/*
	@PostMapping("/emp_dynamic_search")
	public ModelAndView emp_dynamic_search(empVO empVO) {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_dynamic");
			
			List<empVO> list = empService.getSearch(empVO);
			mv.addObject("list", list);
			mv.addObject("idx", empVO.getIdx());
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	*/

	// 2. 별도로 받아서 나중에 Map으로 처리한다.
	// 다음 jsp에 받은 idx를 그대로 넘기기 위해서 => @ModelAttribute("idx") 사용
	public ModelAndView emp_dynamic_search(
		@ModelAttribute("idx") String idx,
		@RequestParam("keyword") String keyword) {
		
		try {
			ModelAndView mv = new ModelAndView("day05/emp_dynamic");
			
			List<empVO> list = empService.getSearch(idx, keyword);
			mv.addObject("list", list);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
