package com.helloworks.spring.mail.model.service;

import java.util.ArrayList;

import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.mail.model.vo.MailAttachment;
import com.helloworks.spring.mail.model.vo.MailInfo;

public interface MailService {
	
	//메일쓰기
	void sendMail(Mail m);
	
	//메일첨부파일 넣기
	void insertMailAttach(ArrayList<MailAttachment> mailAttachmentList);
	
	//받은 메일함
	ArrayList<Mail> inboxMailList(Employee myEmp);
	
	//메일 상세조회
	Mail readMail(int mailNo);
	
	//메일 수신인 읽음처리
	void readStatusMail(Mail newMail);

	//메일 첨부파일 상세조회 
	ArrayList<MailAttachment> readMailAttachment(int mailNo);
	
	//보낸 메일함
	ArrayList<Mail> sentMailList(int myEmp);
	
	//임시 보관함
	ArrayList<Mail> draftMailList(int myEmp);
	
//	//휴지통
//	ArrayList<Mail> trashMailList(Employee myEmp);
	
	//메일가져오기
	ArrayList<Mail> getMail(Mail mail);
	
	//수신자 정보 저장하기 위해메일 수신자 정보 받아오기
	Employee getEmpInfo(int rEmpNo);
	
	//메일 수신자 정보 입력하기
	void insertMailRcvrInfo(Mail mailInfo);
	
	//메일 수신자 정보조회
	Mail getRcvrInfo(Mail rEmp);
	
	//임시보관 메일보내기
	void dsendMail(Mail m);
	
	//임시보관 메일 첨부파일
	void insertDMailAttach(ArrayList<MailAttachment> mailAttachmentList);
	
	//inbox 메일 삭제
	void delMail(int mailNo);
	
	
}
