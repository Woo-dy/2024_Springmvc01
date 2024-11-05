package com.ict.edu02.service;

import org.springframework.stereotype.Service;

import com.ict.edu02.vo.CalcVO;

// @Service : 서비스 객체를 생성하는 어노테이션
@Service
public class CalcService {

	public CalcService() {
		System.out.println("CalcService 생성자");
	}
	
	// 정보를 받아서 계산하는 메서드르 만든다.
	public int getCalc(CalcVO cvo) {
		int result = 0;
		int su1 = Integer.getInteger(cvo.getS1());
		int su2 = Integer.getInteger(cvo.getS2());
		
		switch (cvo.getOp()) {
			case "+": result = su1 + su2; break; 
			case "-": result = su1 - su2; break; 
			case "*": result = su1 * su2; break; 
			case "/": result = su1 / su2; break; 
		}
		
		return result;
	}
}