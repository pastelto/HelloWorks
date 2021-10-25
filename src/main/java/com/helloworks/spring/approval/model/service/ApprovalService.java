package com.helloworks.spring.approval.model.service;

import java.util.ArrayList;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalExDetails;
import com.helloworks.spring.approval.model.vo.ApprovalExpenditure;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;

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

	

}
