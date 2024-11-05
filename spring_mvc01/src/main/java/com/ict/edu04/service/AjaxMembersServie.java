package com.ict.edu04.service;

import java.util.List;

import com.ict.edu04.vo.MembersVO;

public interface AjaxMembersServie {
	
	public List<MembersVO> getMemberList();
	public MembersVO getMemberDetail(String m_idx);
	public String getMemberIdChk(String m_id);
	public String getMemberInsert(MembersVO mvo);
	public String getMemberDelete(String m_idx);
	public String getMemberUpdate(MembersVO mvo);
	
}
