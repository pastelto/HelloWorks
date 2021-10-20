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
public class WSAttachment {

	// 업무공유 첨부파일
	private int wsa_no; // 첨부파일 번호
	private int wsa_empNo; // 첨부파일 추가한 사원번호
	private int wsa_wsNo; // 업무 번호
	private String wsa_origin; // 첨부파일 기존이름
	private String wsa_change; // 첨부파일 변경이름
	private long wsa_size; // 첨부파일 사이즈
	private String wsa_status; // 첨부파일 상태
	
}
