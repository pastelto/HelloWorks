package com.helloworks.spring.Schedule.model.vo;

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
public class Schedule {

	// 캘린더 타입
	private int calNo; // 캘린더 번호
	private String cal_type; // 캘린더 타입
	private String cal_deptCode; // 하위 부서코드 
	private int cal_maker; // 캘린더 만든 사원번호
	private String cal_name; // 캘린더 이름
	private Date cal_makeDay; // 생성일자
	
	// 일정 기본
	private int shc_no; // 일정 번호
	private int sch_empno; // 일정 만드는 사원 정보 번호
	private String sch_type; // 일정 타입
	// private int sch_calNo; 캘린더 번호
	private String sch_title; // 일정 제목
	private String sch_writer; // 작성자
	private String sch_content; // 일정 내용
	private Date sch_startdate; // 시작 날짜
	private Date sch_endate; // 마감 날짜
	private String sch_allday; // 종일 여부
	private String sch_place; // 장소 
	
	// 일정 첨부파일
	private int cala_no; // 첨부파일 번호
	// private int cala_schNo; 일정 번호
	private String cala_origin; // 첨부파일 기존이름
	private String cala_Change; // 첨부파일 변경이름

	
}
