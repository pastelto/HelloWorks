package com.helloworks.spring.request.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.request.model.dao.RequestDao;
import com.helloworks.spring.request.model.vo.Mtr;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RequestDao requestDao;
	
	@Override
	public void addMtr(Mtr mtr) {
		System.out.println("Impl 입장 ? ");
		
		int result = requestDao.addMtr(sqlSession, mtr);
		
		if(result < 0) {
			throw new CommException("회의실 등록 실패");
		}
		
	}

}
