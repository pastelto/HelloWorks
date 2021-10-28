package com.helloworks.spring.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.mail.model.vo.MailAttachment;

@Repository
public class MailDao {
	
	// 메일쓰기
	public int sendMail(SqlSessionTemplate sqlSession, Mail m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mailMapper.sendMail", m);
	}
	
	// 첨부파일추가하기
	public int insertMailAttach(SqlSessionTemplate sqlSession, MailAttachment mailAttachment) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mailMapper.insertMailAttach", mailAttachment);
	}
	
	// 받은 메일함
	public ArrayList<Mail> inboxMailList(SqlSessionTemplate sqlSession, Employee myEmp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.inboxMailList", myEmp);
	}
	
	// 메일 상세조회
	public Mail readMail(SqlSessionTemplate sqlSession, int mailNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mailMapper.readMail", mailNo);
	}
	
	// 메일 수신인 읽음처리
	public int readStatusMail(SqlSessionTemplate sqlSession, Mail newMail) {
		// TODO Auto-generated method stub
		return sqlSession.update("mailMapper.readStatusMail", newMail);
	}
	
	// 메일 첨부파일조회
	public ArrayList<MailAttachment> readMailAttachment(SqlSessionTemplate sqlSession, int mailNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.readMailAttachment", mailNo);
	}

	// 보낸 메일목록
	public ArrayList<Mail> sentMailList(SqlSessionTemplate sqlSession, Mail mail) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.sentMailList", mail);
	}
	
	// 임시 보관함
	public ArrayList<Mail> draftMailList(SqlSessionTemplate sqlSession, Employee myEmp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.draftMailList", myEmp);
	}
	
	// 휴지통
	public ArrayList<Mail> trashMailList(SqlSessionTemplate sqlSession, Employee myEmp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.trashMailList", myEmp);
	}
	
	//메일 객체 가져오기
	public ArrayList<Mail> getMail(SqlSessionTemplate sqlSession, Mail mail) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mailMapper.getMail", mail);
	}

}
