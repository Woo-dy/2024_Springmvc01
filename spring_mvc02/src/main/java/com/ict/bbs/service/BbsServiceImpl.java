package com.ict.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.bbs.dao.BbsDAO;
import com.ict.bbs.vo.BbsVO;
import com.ict.bbs.vo.CommentVO;

@Service
public class BbsServiceImpl implements BbsService {
	@Autowired 
	private BbsDAO bbsdao;

	@Override
	public List<BbsVO> getBbsList() {
		return bbsdao.getBbsList();
	}

	@Override
	public int getBbsInsert(BbsVO bvo) {
		return bbsdao.getBbsInsert(bvo);
	}

	@Override
	public BbsVO getBbsDetail(String b_idx) {
		return bbsdao.getBbsDetail(b_idx);
	}

	@Override
	public int getBbsDelete(String b_idx) {
		return bbsdao.getBbsDelete(b_idx);
	}

	@Override
	public int getBbsUpdate(BbsVO bvo) {
		return bbsdao.getBbsUpdate(bvo);
	}

	@Override
	public int getHitUpdate(String b_idx) {
		return bbsdao.getHitUpdate(b_idx);
	}

	@Override
	public int getTotalCount() {
		return bbsdao.getTotalCount();
	}

	@Override
	public List<BbsVO> getBbsList(int offset, int limit) {
		return bbsdao.getBbsList(offset, limit);
	}

	@Override
	public List<CommentVO> getCommentList(String b_idx) {
		return bbsdao.getCommentList(b_idx);
	}

	@Override
	public int getCommentInsert(CommentVO cvo) {
		return bbsdao.getCommentInsert(cvo);
	}

	@Override
	public int getCommentDelete(String c_idx) {
		return bbsdao.getCommentDelete(c_idx);
	}

}
