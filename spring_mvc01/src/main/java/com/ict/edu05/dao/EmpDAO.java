package com.ict.edu05.dao;

import java.util.List;

import com.ict.edu05.vo.empVO;

public interface EmpDAO {
	List<empVO> getlist() throws Exception;
	List<empVO> getSearch(String deptno) throws Exception;
	List<empVO> getSearch(empVO empVO) throws Exception;
	List<empVO> getSearch(String searchType, String searchValue) throws Exception;
	// List<empVO> getSearch(String idx, String keyword) throws Exception;
}
