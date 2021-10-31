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
}
