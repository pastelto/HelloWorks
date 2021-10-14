package com.helloworks.spring.approval.model.vo;

public class ApprovalDiploma extends Approval{
	
	private String email;
	private String phone;
	private String officeAddress;
	
	public ApprovalDiploma() {
		// TODO Auto-generated constructor stub
	}

	public ApprovalDiploma(int apNo, String email, String phone, String officeAddress) {
		super(apNo);
		this.email = email;
		this.phone = phone;
		this.officeAddress = officeAddress;
		 
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	
	
	
	

}
