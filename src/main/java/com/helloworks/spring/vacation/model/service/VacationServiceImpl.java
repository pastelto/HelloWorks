package com.helloworks.spring.vacation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.vacation.model.dao.VacationDao;
import com.helloworks.spring.vacation.model.vo.VacationLine;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationDao vacationDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//결재라인 insert
	@Override
	public void insertLine(VacationLine line) {
		int result = vacationDao.insertLine(sqlSession, line);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}
}
