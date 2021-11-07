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
	
}
