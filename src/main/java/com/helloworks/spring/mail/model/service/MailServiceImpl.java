package com.helloworks.spring.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.dao.MailDao;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.mail.model.vo.MailAttachment;
import com.helloworks.spring.mail.model.vo.MailInfo;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MailDao mailDao;

	// 메일쓰기
	@Override
	public void sendMail(Mail m) {

		int result = mailDao.sendMail(sqlSession, m);
		System.out.println("WS result ? " + result);

		if (result < 0) {
			throw new CommException("메일보내기 실패");
		}
	}

	// 메일 첨부파일 넣기
	@Override
	public void insertMailAttach(ArrayList<MailAttachment> mailAttachmentList) {
		int result1 = 0;

		System.out.println("wsaList size ? " + mailAttachmentList);
		for (MailAttachment mailAttachment : mailAttachmentList) {
			result1 = mailDao.insertMailAttach(sqlSession, mailAttachment);
			System.out.println("mailAttachment ? " + mailAttachment);
		}

		if (result1 < 0) {
			throw new CommException("메일 첨부파일 삽입 실패");
		}
	}

	// 받은 메일함
	@Override
	public ArrayList<Mail> inboxMailList(Employee myEmp) {
		// TODO Auto-generated method stub
		return mailDao.inboxMailList(sqlSession, myEmp);
	}

	// 메일 상세조회
	@Override
	public Mail readMail(int mailNo) {
		// TODO Auto-generated method stub
		return mailDao.readMail(sqlSession, mailNo);
	}

	// 메일 수신인 읽음처리
	@Override
	public void readStatusMail(Mail newMail) {
		int result = mailDao.readStatusMail(sqlSession, newMail);

		if (result < 0) {
			throw new CommException("메일 수신인 읽음처리 실패");
		}
	}

	// 메일첨부파일 상세조회
	@Override
	public ArrayList<MailAttachment> readMailAttachment(int mailNo) {
		// TODO Auto-generated method stub
		return mailDao.readMailAttachment(sqlSession, mailNo);
	}

	// 임시 보관함
	@Override
	public ArrayList<Mail> draftMailList(int myEmp) {
		// TODO Auto-generated method stub
		return mailDao.draftMailList(sqlSession, myEmp);
	}

//	//휴지통
//	@Override
//	public ArrayList<Mail> trashMailList(Employee myEmp) {
//		// TODO Auto-generated method stub
//		return mailDao.trashMailList(sqlSession, myEmp);
//	}

	// 메일 객체
	@Override
	public ArrayList<Mail> getMail(Mail mail) {
		// TODO Auto-generated method stub
		return mailDao.getMail(sqlSession, mail);
	}

	// 메일 수신자 정보 받아오기
	@Override
	public Employee getEmpInfo(int rEmpNo) {
		// TODO Auto-generated method stub
		return mailDao.getEmpInfo(sqlSession, rEmpNo);
	}

	// 메일 수신자 정보 입력
	@Override
	public void insertMailRcvrInfo(Mail mailInfo) {

		int result = mailDao.insertMailRcvrInfo(sqlSession, mailInfo);
		System.out.println("WS result ? " + result);

		if (result < 0) {
			throw new CommException("메일 수신자 정보입력실패");
		}
	}

	// 보낸 메일함
	@Override
	public ArrayList<Mail> sentMailList(int myEmp) {
		// TODO Auto-generated method stub
		return mailDao.sentMailList(sqlSession, myEmp);
	}

	// 수신자정보
	@Override
	public Mail getRcvrInfo(Mail rEmp) {
		// TODO Auto-generated method stub
		return mailDao.getRcvrInfo(sqlSession, rEmp);
	}

	// 임시보관 메일쓰기
	@Override
	public void dsendMail(Mail m) {

		int result = mailDao.dsendMail(sqlSession, m);
		System.out.println("dsendMail result ? " + result);

		if (result < 0) {
			throw new CommException("메일보내기 실패");
		}
	}
	
	// 임시보관 첨부파일삽입
	@Override
	public void insertDMailAttach(ArrayList<MailAttachment> mailAttachmentList) {
		int result1 = 0;

		System.out.println("insertDMailAttach size ? " + mailAttachmentList);
		for (MailAttachment mailAttachment : mailAttachmentList) {
			System.out.println(mailAttachment.getMailAtNo());
			result1 = mailDao.insertDMailAttach(sqlSession, mailAttachment);
			System.out.println("insertDMailAttach ? " + mailAttachment);
			
		}

		if (result1 < 0) {
			throw new CommException("임시메일 첨부파일 삽입 실패");
		}
	}
	
	//inbox 메일삭제
	@Override
	public void delMail(int mailNo) {
		int result = mailDao.delMail(sqlSession, mailNo);
		System.out.println("dsendMail result ? " + result);

		if (result < 0) {
			throw new CommException("inbox 메일삭제 실패");
		}
	}
}
