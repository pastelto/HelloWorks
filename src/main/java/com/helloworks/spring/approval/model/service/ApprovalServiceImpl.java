package com.helloworks.spring.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.approval.model.dao.ApprovalDao;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalExDetails;
import com.helloworks.spring.approval.model.vo.ApprovalExpenditure;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;

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

	@Override
	public void insertCcEmpl(ApprovalCC ac) {
		int result = approvalDao.insertCcEmpl(sqlSession, ac);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertCcDept(ApprovalCC ac) {
		
		int result = approvalDao.insertCcDept(sqlSession, ac);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public ArrayList<ApprovalExDetails> selectExNumch() {
		// TODO Auto-generated method stub
		return approvalDao.selectExNumch(sqlSession);
	}


	@Override
	public ArrayList<ApprovalExDetails> selectExNumco() {
		// TODO Auto-generated method stub
		return approvalDao.selectExNumco(sqlSession);
	}


	@Override
	public void insertExpenditure(ApprovalExpenditure ae) {
		
		int result = approvalDao.insertExpenditure(sqlSession, ae);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}


	@Override
	public void insertExpenditureDetail(ApprovalExDetails ad) {
		
		int result = approvalDao.insertExpenditureDetail(sqlSession, ad);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}


	@Override
	public int selectListCount(int loginEmpNo) {
		// TODO Auto-generated method stub
		return approvalDao.selectListCount(sqlSession, loginEmpNo);
	}


	@Override
	public ArrayList<Approval> selectTempApproval(int loginEmpNo, PageInfo pi) {
		// TODO Auto-generated method stub
		return approvalDao.selectTempApproval(sqlSession, loginEmpNo, pi);
	}

	@Override
	public ArrayList<Approval> selectTempDate(HashMap<String, Integer> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectTempDate(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateBoundSortTemp(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateBoundSortTemp(sqlSession, searchMap);
	}

}
