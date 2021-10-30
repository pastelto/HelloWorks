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
	private int annual; //실제지급 연차
	private int appliedAnnual; // 적용되는 연차
	private int useAnnual; // 사용연차
	private int leftAnnual; // 잔여연차
	private int empNo; // 사번
}
