package com.ict.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginIntercepter implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 결과가 true 이면 controller, false 이면 특정 jsp로 이동
		
		// 로그인 하면 세션에 로그인이 성공했다는 정보를 담거나, 사용자 정보를 담자
		
		// 로그인 체크를 해서 만약에 로그인이 안된 상태이면 value 에 false 저장
		
		// 만약에 session이 삭제된 상태라면 새로운 session을 생성해 준다.
		// 삭제가 안된 상태라면 사용하고 있는 그대로 전달해준다. (기존 session 호출)
		Object obj = request.getSession(true).getAttribute("loginchhk");
		
		if (obj == null) {
			// 로그인 안된 상태
			
			// 자바스크립트 코드 작성
			String script = "<script> alert('해당 로그인 정보가 없습니다. 다시 확인해주세요.'); location.href='/sns_login;</script>";
			response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write(script);
            response.getWriter().flush();
			return false;
		} 
		
		return true;
		
		// return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	/*
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	*/
	
}