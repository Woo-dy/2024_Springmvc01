package com.ict.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.bbs.vo.BbsVO;
import com.ict.bbs.vo.CommentVO;

@Repository
public class BbsDAOImpl implements BbsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;

	@Override
	public List<BbsVO> getBbsList() {
		return sqlsessionTemplate.selectList("bbs.list");
	}

	@Override
	public int getBbsInsert(BbsVO bvo) {
		return sqlsessionTemplate.insert("bbs.insert", bvo);

	}

	@Override
	public BbsVO getBbsDetail(String b_idx) {
		return sqlsessionTemplate.selectOne("bbs.detail", b_idx);
	}

	@Override
	public int getBbsDelete(String b_idx) {
		return sqlsessionTemplate.update("bbs.delete", b_idx);
	}

	@Override
	public int getBbsUpdate(BbsVO bvo) {
		return sqlsessionTemplate.update("bbs.update", bvo);
	}

	@Override
	public int getHitUpdate(String b_idx) {
		return sqlsessionTemplate.selectOne("bbs.hitupdate", b_idx);
	}

	@Override
	public int getTotalCount() {
		return sqlsessionTemplate.selectOne("bbs.count");
	}

	@Override
	public List<BbsVO> getBbsList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		
		return sqlsessionTemplate.selectList("bbs.pageList", map);
	}

	@Override
	public List<CommentVO> getCommentList(String b_idx) {
		return sqlsessionTemplate.selectList("bbs.clist", b_idx);
	}

	@Override
	public int getCommentInsert(CommentVO cvo) {
		return sqlsessionTemplate.insert("bbs.cinsert", cvo);
	}

	@Override
	public int getCommentDelete(String c_idx) {
		return sqlsessionTemplate.delete("bbs.cdelete" ,c_idx);
	}

}
