package com.helloworks.spring.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ApprovalExpenditure extends Approval{

	public ApprovalExpenditure(int apNo) {
		// TODO Auto-generated constructor stub
	}
	private String exForm; 		// 지급형식
	private String exCommon; 		// 공통경비 여부 
	
	/*public ApprovalExpenditure() {
		// TODO Auto-generated constructor stub
	}*/
	

	/*public String getExForm() {
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
	}*/
	
	
	
	
}
