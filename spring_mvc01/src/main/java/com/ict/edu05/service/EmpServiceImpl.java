package com.ict.edu05.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu05.dao.EmpDAO;
import com.ict.edu05.vo.empVO;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDAO empDAO;
	
	@Override
	public List<empVO> getlist() throws Exception {
		return empDAO.getlist();
	}

	@Override
	public List<empVO> getSearch(String deptno) throws Exception {
		return empDAO.getSearch(deptno);
	}

	@Override
	public List<empVO> getSearch(String searchType, String searchValue) throws Exception {
		return empDAO.getSearch(searchType, searchValue);
	}

	@Override
	public List<empVO> getSearch(empVO empVO) throws Exception {
		return empDAO.getSearch(empVO);
	}
	
}
