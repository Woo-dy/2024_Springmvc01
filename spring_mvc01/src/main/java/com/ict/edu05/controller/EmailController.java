package com.ict.edu05.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu05.service.EmailService;

@Controller
public class EmailController {
	@Autowired
	private JavaMailSender javaMailSender;
	
	@GetMapping("/email")
	public ModelAndView emailForm() {
		
		return new ModelAndView("day05/email_form");
	}
	
	@PostMapping("/email_send")
	public ModelAndView sendMail(
			@RequestParam("email") String email,
			HttpServletRequest request
			) {
		
		try {
			ModelAndView mv = new ModelAndView("day05/email_chk_form");
			// 임시번호 6자리 만들기
			Random random = new Random();
			// 0 ~ 1000000 미만의 정수 무작위로 생성 (6자리 숫자 중 하나를 랜덤으로 만듬)
			String randomNumber = String.valueOf(random.nextInt(1000000) % 1000000);
			
			// 전체 길이 구했을 때 길이가 6자리가 안되면 0으로 채우자
			if (randomNumber.length() < 6) {
				int substract = 6 - randomNumber.length();
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < substract; i++) {
					sb.append("0");
				}
				sb.append(randomNumber);
				randomNumber = sb.toString();
			}
			
			// 임시번호 서버에 출력
			System.out.println("임시번호 : " + randomNumber);
			
			// 해당 임시번호를 DB에 저장하던가 또는 세션에 저장하기
			request.getSession().setAttribute("email_chk", randomNumber);
			
			// 이메일 호출해서 사용하기
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@PostMapping("/email_send_ok")
	public ModelAndView sendMailOk() {
		ModelAndView mv = new ModelAndView("day05/email_chk_form");
		
		return mv;
	}
}
