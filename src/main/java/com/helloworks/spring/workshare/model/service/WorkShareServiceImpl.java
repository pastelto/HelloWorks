package com.helloworks.spring.workshare.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.workshare.model.dao.WorkShareDao;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Service
public class WorkShareServiceImpl implements WorkShareService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkShareDao workShareDao;

	// 업무공유 생성하기 및 첨부파일 추가하기
	@Override
	public void insertWorkShare(WorkShare ws, List<WSAttachment> wsAttach) throws Exception {
		
		// 업무공유 생성
		int result1 = workShareDao.insertWorkShare(sqlSession, ws);
		
		// 첨부파일 추가 
		int result2 = 1;
		if(wsAttach.size() > 0) {
			for(WSAttachment wsa : wsAttach) {
				workShareDao.insertWSAttach(sqlSession, wsa);
			}
		}
		
		if(result1 * result2 < 0) {
			throw new CommException("업무공유 삽입 실패"); 
		}
	}

	
}
