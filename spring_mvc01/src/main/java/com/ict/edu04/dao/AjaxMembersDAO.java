package com.ict.edu04.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.edu04.vo.MembersVO;

// 어노테이션 DB에 붙이는 것 : @Repository
// @Repository
public interface AjaxMembersDAO {
//	@Autowired
//	private SqlSessionTemplate sessionTemplate;
//
//	// setter 만 가져오기
//	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
//		this.sessionTemplate = sessionTemplate;
//	}
	
	public List<MembersVO> getMemberList();
	public MembersVO getMemberDetail(String m_idx);
	public String getMemberIdChk(String m_id);
	public String getMemberInsert(MembersVO mvo);
	public String getMemberDelete(String m_idx);
	public String getMemberUpdate(MembersVO mvo);
	
}
