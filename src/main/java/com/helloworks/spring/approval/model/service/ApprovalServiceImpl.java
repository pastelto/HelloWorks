package com.helloworks.spring.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.approval.model.dao.ApprovalDao;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.exception.CommException;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao approvalDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//기안서 및 결재 기본정보 insert
	@Override
	public void insertApproval(Approval ap) {
		int result = approvalDao.insertApproval(sqlSession,ap);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	//수신참조 insert
	@Override
	public void insertCoopertation(ApprovalCC ac) {		
		int result = approvalDao.insertCoopertation(sqlSession, ac);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertLine(ApprovalLine line) {
		int result = approvalDao.insertLine(sqlSession, line);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertDiploma(ApprovalDiploma ad) {
		int result = approvalDao.insertDiploma(sqlSession, ad);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertMinutes(ApprovalMinutes am) {
		int result = approvalDao.insertMinutes(sqlSession, am);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertHr(ApprovalHr ah) {
		int result = approvalDao.insertHr(sqlSession, ah);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertAttachment(Approval ap) {
		int result = approvalDao.insertAttachment(sqlSession, ap);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

}
