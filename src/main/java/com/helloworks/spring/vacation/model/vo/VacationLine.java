package com.helloworks.spring.vacation.model.vo;

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
public class VacationLine extends Vacation{
	
	//결재라인
	private Integer line1; 
	private Integer line2;
	private Integer line3;
	private Integer line4;
	private Integer confirmStatus; 
	
	/*public ApprovalLine() {
		// TODO Auto-generated constructor stub
	}
*/
	public VacationLine(int apNo, int line1, int line2, int line3, int line4, int confirmStatus) {
		super(apNo);
		this.line1 = line1;
		this.line2 = line2;
		this.line3 = line3;
		this.line4 = line4;
		this.confirmStatus = confirmStatus;
	}
	/*
	public int getLine1() {
		return line1;
	}

	public void setLine1(int line1) {
		this.line1 = line1;
	}

	public int getLine2() {
		return line2;
	}

	public void setLine2(int line2) {
		this.line2 = line2;
	}

	public int getLine3() {
		return line3;
	}

	public void setLine3(int line3) {
		this.line3 = line3;
	}

	public int getLine4() {
		return line4;
	}

	public void setLine4(int line4) {
		this.line4 = line4;
	}

	public int getConfirmStatus() {
		return confirmStatus;
	}

	public void setConfirmStatus(int confirmStatus) {
		this.confirmStatus = confirmStatus;
	}
	*/
	
	
	
}
