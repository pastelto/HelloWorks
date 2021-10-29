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
public class VacationCC extends Vacation{

	private String ccDept; 	// 수신부서
	private Integer ccMember;	// 수신자
	private int ckCount;	// 확인인원
	private int ccCount;	// 수신인원 
	
	/*public ApprovalCC() {
		// TODO Auto-generated constructor stub
	}*/

	public VacationCC(int apNo, String ccDept, Integer ccMember, int ckCount, int ccCount) {
		super(apNo);
		this.ccDept = ccDept;
		this.ccMember = ccMember;
		this.ckCount = ckCount;
		this.ccCount = ccCount;
	}

	/*public String getCcDept() {
		return ccDept;
	}

	public void setCcDept(String ccDept) {
		this.ccDept = ccDept;
	}

	public int getCcMember() {
		return ccMember;
	}

	public void setCcMember(int ccMember) {
		this.ccMember = ccMember;
	}

	public int getCkCount() {
		return ckCount;
	}

	public void setCkCount(int ckCount) {
		this.ckCount = ckCount;
	}

	public int getCcCount() {
		return ccCount;
	}

	public void setCcCount(int ccCount) {
		this.ccCount = ccCount;
	}*/
	
	
	
}
