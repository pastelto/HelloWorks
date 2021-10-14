package com.helloworks.spring.workshare.model.vo;

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
public class WorkShare {

	private int ws_no; // 업무번호
	private int ws_empno; // 사원번호
	private String ws_recv; // 수신인
	private String ws_ref; // 참조
	private String ws_sref; // 숨은 참조
	private String ws_title; // 업무 제목
	private String ws_content; // 업무 내용
	private Date createDate; // 작성일자
	private Date editDate; // 수정일자
	private String ws_status; // 상태
	private String ws_recv_status; // 수신여부
	private String ws_reply; // 회신여부
	private String ws_favb; // 즐겨찾기

}
