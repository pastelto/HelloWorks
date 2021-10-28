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
public class VacationComment extends Vacation{

	private int coNo;			// 결재의견번호
	private int writer; 		// 작성자
	private String createDate;	// 작성일자
	private String acContent;	// 작성내용 
	
	/*public ApprovalComment() {
		// TODO Auto-generated constructor stub
	}*/

	public VacationComment(int apNo, int coNo, int writer, String createDate, String acContent) {
		super(apNo);
		this.coNo = coNo;
		this.writer = writer;
		this.createDate = createDate;
		this.acContent = acContent;
	}

	/*public int getCoNo() {
		return coNo;
	}

	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAcContent() {
		return acContent;
	}

	public void setAcContent(String acContent) {
		this.acContent = acContent;
	}
	
	*/
	
}
