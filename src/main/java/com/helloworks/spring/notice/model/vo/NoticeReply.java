package com.helloworks.spring.notice.model.vo;

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
public class NoticeReply {

	private int replyNo;
	private String replyContent;
	private int refBoardNo;
	private int replyWriter;
	//private Date createDate;
	private Timestamp createDate;
	private String status;
}
