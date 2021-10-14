package com.helloworks.spring.approval.model.vo;

public class ApprovalAttachment extends Approval{
	
	private int atNo;
	private String newName;
	private String originName;
	
	public ApprovalAttachment() {
		// TODO Auto-generated constructor stub
	}

	public ApprovalAttachment(int apNo, int atNo, String newName, String originName) {
		super(apNo);
		this.atNo = atNo;
		this.newName = newName;
		this.originName = originName;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
	
	
}
