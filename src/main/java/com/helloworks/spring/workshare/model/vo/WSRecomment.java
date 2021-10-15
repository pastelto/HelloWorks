package com.helloworks.spring.workshare.model.vo;

import java.sql.Timestamp;

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
public class WSRecomment {
	
	private int wsrc_no; // 답글 번호
	private int wsrc_wsrNo; // 댓글 번호
	private int wsrc_empNo; // 답글 작성 사원번호
	private Timestamp wsrc_date; // 작성시간
	private String wsrc_status; // 삭제여부
	
}
