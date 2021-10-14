package com.helloworks.spring.approval.model.vo;

public class ApprovalExpenditure extends Approval{

	private String exForm; 		// 지급형식
	private String exMethod; 	// 지급방법
	private char exCommon; 		// 공통경비 여부 
	
	public ApprovalExpenditure() {
		// TODO Auto-generated constructor stub
	}
	
	public ApprovalExpenditure(int apNo) {
		super(apNo);
		// TODO Auto-generated constructor stub
	}

	public ApprovalExpenditure(int apNo,String exForm, String exMethod, char exCommon) {
		super(apNo);
		this.exForm = exForm;
		this.exMethod = exMethod;
		this.exCommon = exCommon;
	}

	public String getExForm() {
		return exForm;
	}

	public void setExForm(String exForm) {
		this.exForm = exForm;
	}

	public String getExMethod() {
		return exMethod;
	}

	public void setExMethod(String exMethod) {
		this.exMethod = exMethod;
	}

	public char getExCommon() {
		return exCommon;
	}

	public void setExCommon(char exCommon) {
		this.exCommon = exCommon;
	}
	
	
	
	
}
