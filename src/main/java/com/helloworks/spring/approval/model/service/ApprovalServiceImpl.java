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
	public int selectListCount(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectListCount(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectApproval(HashMap<String, Object> searchMap, PageInfo pi) {
		// TODO Auto-generated method stub
		return approvalDao.selectApproval(sqlSession, searchMap, pi);
	}

	@Override
	public ArrayList<Approval> selectDate(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDate(sqlSession, searchMap);
	}
	

	@Override
	public ArrayList<Approval> selectAllApproval(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectAllApproval(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectSearchApNo(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectSearchApNo(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectSearchTitle(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectSearchTitle(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDetailApNo(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDetailApNo(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDetailTitle(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDetailTitle(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateApNo(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateApNo(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateTitle(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateTitle(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDeteDetailApNo(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDeteDetailApNo(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateDetailTitle(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateDetailTitle(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectOnlyDateSort(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectOnlyDateSort(sqlSession, searchMap);
	}


	@Override
	public Approval selectApprovalDetail(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalDetail(sqlSession, searchMap);
	}


	@Override
	public ApprovalCC selectApprovalCC(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalCC(sqlSession, searchMap);
	}


	@Override
	public ArrayList<ApprovalLine> selectApprovalLine(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalLine(sqlSession, searchMap);
	}


	@Override
	public Approval selectAttachDetail(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectAttachDetail(sqlSession, searchMap);
	}


	@Override
	public void updateApproval(Approval ap) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateApproval(sqlSession, ap);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateAttachment(Approval ap) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateAttachment(sqlSession, ap);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}

	}
	
	@Override
	public void updateCcEmpl(ApprovalCC ac) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateCcEmpl(sqlSession, ac);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateCcDept(ApprovalCC ac) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateCcDept(sqlSession, ac);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateExpenditure(ApprovalExpenditure ae) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateExpenditure(sqlSession, ae);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateExpenditureDetail(ApprovalExDetails ad) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateExpenditureDetail(sqlSession, ad);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateLine(ApprovalLine line) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateLine(sqlSession, line);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updatetHr(ApprovalHr ah) {
		// TODO Auto-generated method stub
		int result = approvalDao.updatetHr(sqlSession, ah);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateMinutes(ApprovalMinutes am) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateMinutes(sqlSession, am);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void updateDiploma(ApprovalDiploma ad) {
		// TODO Auto-generated method stub
		int result = approvalDao.updateDiploma(sqlSession, ad);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}


	@Override
	public void deleteLine(int apNo) {
		int result = approvalDao.deleteLine(sqlSession, apNo);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
	}
	
	@Override
	public void deleteExDetails(int apNo) {
		int result = approvalDao.deleteExDetails(sqlSession, apNo);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
		
	}


	@Override
	public ApprovalDiploma selectApprovalDiploma(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalDiploma(sqlSession, searchMap);
	}


	@Override
	public ApprovalHr selectApprovalHr(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalHr(sqlSession, searchMap);
	}


	@Override
	public ApprovalMinutes selectApprovalMinutes(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalMinutes(sqlSession, searchMap);
	}


	@Override
	public ApprovalExpenditure selectApprovalExpenditure(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalExpenditure(sqlSession, searchMap);
	}


	@Override
	public ArrayList<ApprovalExDetails> selectApprovalExDetails(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalExDetails(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectpendingList(HashMap<String, Object> searchMap, PageInfo pi) {
		// TODO Auto-generated method stub
		return approvalDao.selectpendingList(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectSearchApNoPending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectSearchApNoPending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectSearchTitlePending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectSearchTitlePending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDetailApNoPending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDetailApNoPending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDetailTitlePending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDetailTitlePending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateApNoPending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateApNoPending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateTitlePending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateTitlePending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDeteDetailApNoPending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDeteDetailApNoPending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDateDetailTitlePending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDateDetailTitlePending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectAllPending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectAllPending(sqlSession, searchMap);
	}


	@Override
	public ArrayList<Approval> selectDatePending(HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return approvalDao.selectDatePending(sqlSession, searchMap);
	}


	

}
