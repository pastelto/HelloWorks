package com.helloworks.spring.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class ApprovalController {

	
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("normalApprovalForm.ea")
	public String normalApprovalForm() {
		
		/*
		 * Employee e = new Employee();
		 * 
		 * String deptCode =
		 * ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();
		 * 
		 * String deptName = approvalService.selectUserDept(deptCode);
		 * 
		 * mv.addObject("detpName",
		 * deptName).setViewName("approval/normalApprovalForm");
		 */
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
