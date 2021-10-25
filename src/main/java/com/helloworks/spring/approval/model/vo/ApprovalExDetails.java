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
public class ApprovalExDetails extends ApprovalExpenditure{

	private int exNo; 			// 해당 지출결의서 내 지출번호
	private String exTitle;		// 제목
	private String exDate;		// 지출 날짜
	private String exContent;	// 지출 내용
	private int price;			// 지출금액
	private String accName;		// 업체명
	private String bankName;	// 은행명
	private String	accNum;		// 계좌번호
	private String accHolder;	// 예금주
	private String exDept;		// 지출부서
	private String note; 		// 비고
	
	private String exNum; 		// 법인카드. 체크카드 계좌번호
	private String exType;		// 법인 or 체크 
	
	
	/*public ApprovalExDetails() {
		// TODO Auto-generated constructor stub
	}*/

	

	public ApprovalExDetails(int apNo, int exNo, String exTitle, String exDate, String exContent, int price, String accName, String bankName,
			String accNum, String accHolder, String exDept, String note) {
		super(apNo);
		this.exNo = exNo;
		this.exTitle = exTitle;
		this.exDate = exDate;
		this.exContent = exContent;
		this.price = price;
		this.accName = accName;
		this.bankName = bankName;
		this.accNum = accNum;
		this.accHolder = accHolder;
		this.exDept = exDept;
		this.note = note;
	}
/*
	public int getExNo() {
		return exNo;
	}


	public void setExNo(int exNo) {
		this.exNo = exNo;
	}


	public String getExDate() {
		return exDate;
	}


	public void setExDate(String exDate) {
		this.exDate = exDate;
	}


	public String getExContent() {
		return exContent;
	}


	public void setExContent(String exContent) {
		this.exContent = exContent;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getAccName() {
		return accName;
	}


	public void setAccName(String accName) {
		this.accName = accName;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getAccNum() {
		return accNum;
	}


	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}


	public String getAccHolder() {
		return accHolder;
	}


	public void setAccHolder(String accHolder) {
		this.accHolder = accHolder;
	}


	public String getExDept() {
		return exDept;
	}


	public void setExDept(String exDept) {
		this.exDept = exDept;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}
	*/
	
	
}
