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
public class Vacation  {	
	private int apNo; 			// 문서번호
	private int rownum;
	private String apClass;		// 결재분류
	private String detailClass; // 세부분류
	private String title;		// 제목
	private int writer;			// 작성자
	private String writerJob; 	// 작성자 직급
	private String writerName;	// 작성자 이름
	private String createDate;	// 작성일자
	private String deptName;	// 하위부서이름
	private String content;		// 결재내용
	private String cooper;		// 협조
	private String cooJob;		// 협조자 직급
	private String deptShare;		// 부서공유 Y,N
	private String progress;	// 진행상태 (진행중, 임시저장, 반려, 전결, 결재완료)
	private String status;		// 임시저장-등록 y,n
	
	private int atNo;
	private String newName;
	private String originName;
	
	
	private String startDate;
	private String endDate;
	private String documentType;
	private String vcType;
	
	
	
	//문서번호	
	public Vacation(int apNo) {
		super();
		this.apNo = apNo;
	}

	//Approval 테이블 전체 
	/*public Approval(int apNo, String apClass, String title, int writer, String createDate, String deptCode,
			String content, String cooper, char deptShare, String progress) {
		super();
		this.apNo = apNo;
		this.apClass = apClass;
		this.title = title;
		this.writer = writer;
		this.createDate = createDate;
		this.deptCode = deptCode;
		this.content = content;
		this.cooper = cooper;
		this.deptShare = deptShare;
		this.progress = progress;
	}

	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
	}

	public String getApClass() {
		return apClass;
	}

	public void setApClass(String apClass) {
		this.apClass = apClass;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCooper() {
		return cooper;
	}

	public void setCooper(String cooper) {
		this.cooper = cooper;
	}

	public char getDeptShare() {
		return deptShare;
	}

	public void setDeptShare(char deptShare) {
		this.deptShare = deptShare;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}*/
	
	

}
