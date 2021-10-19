package com.helloworks.spring.workshare.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.workshare.model.dao.WorkShareDao;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Service
public abstract class WorkShareServiceImpl implements WorkShareService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkShareDao workShareDao;

	// 업무공유 생성하기 및 첨부파일 추가하기
	@Override
	public void insertWorkShare(WorkShare ws) throws Exception {
		 // 업무공유 생성 
		 int result = workShareDao.insertWorkShare(sqlSession, ws);
		 System.out.println("WS result ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}
	
	// 첨부파일 추가하기
	@Override
	public void insertWSAttach(ArrayList<WSAttachment> wsaList) throws Exception {
		int result1 = 0;
		
		 for(WSAttachment wsa : wsaList) { 
			 result1 = workShareDao.insertWSAttach(sqlSession, wsa);
		 }
		 
		 if(result1 < 0) { 
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}

	
}
