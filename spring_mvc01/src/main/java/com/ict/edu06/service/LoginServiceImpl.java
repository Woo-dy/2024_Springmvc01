package com.ict.edu06.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu06.dao.LoginDAO;
import com.ict.edu06.vo.LoginVO;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public LoginVO Loginchk(LoginVO lvo) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.Loginchk(lvo);
	}

	@Override
	public int LoginJoin(LoginVO lvo) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.LoginJoin(lvo);
	}
	
	
}