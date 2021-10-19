package com.helloworks.spring.approval.model.vo;

import java.sql.Date;

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
public class ApprovalHr extends Approval{
	
	private String hrClass;  //인사결재분류
	private String dueDate;	 // 처리시한
	
	/*public ApprovalHr() {
		// TODO Auto-generated constructor stub
	}*/

	public ApprovalHr(int apNo, String hrClass, String dueDate) {
		super(apNo);
		this.hrClass = hrClass;
		this.dueDate = dueDate;
	}

	/*public String getHrClass() {
		return hrClass;
	}

	public void setHrClass(String hrClass) {
		this.hrClass = hrClass;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}*/


	
	
}
