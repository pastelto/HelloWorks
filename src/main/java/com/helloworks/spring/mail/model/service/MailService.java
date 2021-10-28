package com.helloworks.spring.mail.model.service;

import java.util.ArrayList;

import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.mail.model.vo.MailAttachment;

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
	ArrayList<Mail> sentMailList(Mail mail);
	
	//임시 보관함
	ArrayList<Mail> draftMailList(Employee myEmp);
	
	//휴지통
	ArrayList<Mail> trashMailList(Employee myEmp);
	
	//메일가져오기
	ArrayList<Mail> getMail(Mail mail);


}
