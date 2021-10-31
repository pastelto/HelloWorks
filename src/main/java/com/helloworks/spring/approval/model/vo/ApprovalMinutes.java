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
public class ApprovalMinutes extends Approval{

	private String title; 		// 회의 이름
	private String attendees;	// 회의 참석자 
	
	/*public ApprovalMinutes() {
		// TODO Auto-generated constructor stub
	}*/

	public ApprovalMinutes(int apNo, String title, String attendees) {
		super(apNo);
		this.title = title;
		this.attendees = attendees;
	}

	/*public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAttendees() {
		return Attendees;
	}

	public void setAttendees(String attendees) {
		Attendees = attendees;
	}*/
	
	
}
