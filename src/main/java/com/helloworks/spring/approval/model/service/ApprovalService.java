package com.helloworks.spring.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalExDetails;
import com.helloworks.spring.approval.model.vo.ApprovalExpenditure;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.model.vo.PageInfo;

public interface ApprovalService {

	void insertApproval(Approval ap);

	void insertLine(ApprovalLine line);

	void insertDiploma(ApprovalDiploma ad);

	void insertMinutes(ApprovalMinutes am);

	void insertHr(ApprovalHr ah);

	void insertAttachment(Approval ap);

	void insertCcEmpl(ApprovalCC ac);

	void insertCcDept(ApprovalCC ac);

	ArrayList<ApprovalExDetails> selectExNumch();

	ArrayList<ApprovalExDetails> selectExNumco();

	void insertExpenditure(ApprovalExpenditure ae);

	void insertExpenditureDetail(ApprovalExDetails ad);

	int selectListCount(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectApproval(HashMap<String, Object> searchMap, PageInfo pi);

	ArrayList<Approval> selectDate(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectAllApproval(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchApNo(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchTitle(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailApNo(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailTitle(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateApNo(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateTitle(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDeteDetailApNo(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateDetailTitle(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectOnlyDateSort(HashMap<String, Object> searchMap);

	Approval selectApprovalDetail(HashMap<String, Object> searchMap);

	ApprovalCC selectApprovalCC(HashMap<String, Object> searchMap);

	ArrayList<ApprovalLine> selectApprovalLine(HashMap<String, Object> searchMap);

	Approval selectAttachDetail(HashMap<String, Object> searchMap);

	void updateApproval(Approval ap);

	void updateAttachment(Approval ap);

	void updateCcEmpl(ApprovalCC ac);

	void updateCcDept(ApprovalCC ac);

	void updateExpenditure(ApprovalExpenditure ae);

	void updateExpenditureDetail(ApprovalExDetails ad);

	void updateLine(ApprovalLine line);

	void updatetHr(ApprovalHr ah);

	void updateMinutes(ApprovalMinutes am);

	void updateDiploma(ApprovalDiploma ad);

	void deleteLine(int apNo);

	ApprovalDiploma selectApprovalDiploma(HashMap<String, Object> searchMap);

	ApprovalHr selectApprovalHr(HashMap<String, Object> searchMap);

	ApprovalMinutes selectApprovalMinutes(HashMap<String, Object> searchMap);

	ApprovalExpenditure selectApprovalExpenditure(HashMap<String, Object> searchMap);

	ArrayList<ApprovalExDetails> selectApprovalExDetails(HashMap<String, Object> searchMap);

	void deleteExDetails(int apNo);

	ArrayList<Approval> selectpendingList(HashMap<String, Object> searchMap, PageInfo pi);

	ArrayList<Approval> selectSearchApNoPending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchTitlePending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailApNoPending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailTitlePending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateApNoPending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateTitlePending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDeteDetailApNoPending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateDetailTitlePending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectAllPending(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDatePending(HashMap<String, Object> searchMap);

	void insertComment(HashMap<String, Object> insertMap);

	ArrayList<ApprovalComment> selectComment(int apNo);

	void updateLineStatus(int apNo);

	void completeStatus(int apNo);

	void returnStatus(int apNo);

	ArrayList<Approval> selectSignedList(HashMap<String, Object> searchMap, PageInfo pi);

	ArrayList<Approval> selectAllSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchApNoSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchTitleSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailApNoSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailTitleSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateApNoSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateTitleSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDeteDetailApNoSigned(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateDetailTitleSigned(HashMap<String, Object> searchMap);

	void updateProgressDate(HashMap<String, Object> updateMap);



	

}
