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
public class Approval  {	
	
	
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
	private String cooName;	
	private String cooJob;		// 협조자 직급
	private String deptShare;		// 부서공유 Y,N
	private String progress;	// 진행상태 (진행중, 임시저장, 반려, 전결, 결재완료)
	private String status;		// 임시저장-등록 y,n
	
	private int atNo;
	private String newName;
	private String originName;
	


	public Approval(int apNo2) {
		// TODO Auto-generated constructor stub
	}
	
	

}
