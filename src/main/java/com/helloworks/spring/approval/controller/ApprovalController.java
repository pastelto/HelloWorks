package com.helloworks.spring.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {

	
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("normalApprovalForm.ea")
	public String normalApprovalForm() {
		
		return "approval/normalApprovalForm";
	}
	
	@RequestMapping("expenditureApprovalForm.ea")
	public String expenditureApprovalForm() {
		
		return "approval/expenditureApprovalForm";
	}
	
	@RequestMapping("searchDeptForm.ea")
	public String searchDeptForm() {
		
		return "approval/searchDeptForm";
	}
}
