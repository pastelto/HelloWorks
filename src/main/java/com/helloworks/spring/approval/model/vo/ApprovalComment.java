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
public class ApprovalComment extends Approval{

	private int coNo;			// 결재의견번호
	private int cmWriter; 		// 작성자
	private String cmName;
	private String cmDept;
	private String cmJob;
	private String commentDate;	// 작성일자
	private String comment;	// 작성내용 
	
	/*public ApprovalComment() {
		// TODO Auto-generated constructor stub
	}*/


	public ApprovalComment(int apNo, int coNo, int cmWriter, String cmName, String cmDept, String cmJob,
			String commentDate, String comment) {
		super(apNo);
		this.coNo = coNo;
		this.cmWriter = cmWriter;
		this.cmName = cmName;
		this.cmDept = cmDept;
		this.cmJob = cmJob;
		this.commentDate = commentDate;
		this.comment = comment;
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
