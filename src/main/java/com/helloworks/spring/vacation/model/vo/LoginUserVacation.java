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
public class LoginUserVacation {
	
	private int psdNo; //연차번호
	private double annual; //지급 연차
	private double useAnnual; // 사용연차
	private double leftAnnual; // 잔여연차
	private int empNo; // 사번
	private String name; //이름
	private String jobName; //직급
	
	private int psvNo; //휴가번호
	private int manstural;//보건휴가
	private int maternity;//출산휴가
	private int event;//경조사
	private int parental; //육아휴직
	private int psvEmpNo;//휴가테이블 사번
	private String vcType;//타입
	
}
