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
public class WSReply {

	private int wsr_no; // 댓글 번호
	private int wsr_wsNo; // 업무 번호
	private int wsr_g; // 댓글(0) 답댓글(1)
	private int wsr_gno; // 댓글이 속한 댓글 번호
	private int wsr_gnos; // 동일 WSR_GNO의 시퀀스번호
	private String wsr_content; // 댓글 내용
	private int wsr_empNo; // 댓글 작성 사원 번호
	private String wsr_empName; // 댓글 작성 사원 이름
	private String wsr_empJobName; // 댓글 작성 사원 직급 
	private Timestamp wsr_date; // 작성 시간
	private String wsr_status; // 삭제여부
	
}
