package com.helloworks.spring.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
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

	ArrayList<Approval> selectTempApproval(HashMap<String, Object> searchMap, PageInfo pi);

	ArrayList<Approval> selectTempDate(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectAllTempApproval(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchApNoTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectSearchTitleTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailApNoTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDetailTitleTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateApNoTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateTitleTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDeteDetailApNoTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectDateDetailTitleTemp(HashMap<String, Object> searchMap);

	ArrayList<Approval> selectOnlyDateSortTemp(HashMap<String, Object> searchMap);

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



	

}
