package com.ict.edu05.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu05.vo.empVO;

@Service
public class EmpDAOImpl implements EmpDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<empVO> getlist() throws Exception {
		return sqlSessionTemplate.selectList("emp.list");
	}

	@Override
	public List<empVO> getSearch(String deptno) throws Exception {
		return sqlSessionTemplate.selectList("emp.search", deptno);
	}

	@Override
	public List<empVO> getSearch(empVO empVO) throws Exception {
		return sqlSessionTemplate.selectList("emp.dynamic", empVO);
	}

	@Override
	public List<empVO> getSearch(String searchType, String searchValue) throws Exception {
		return null;
	}

}
