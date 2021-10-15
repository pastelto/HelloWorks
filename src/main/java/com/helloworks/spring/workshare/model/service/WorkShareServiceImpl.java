package com.helloworks.spring.workshare.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.workshare.model.dao.WorkShareDao;

@Service
public class WorkShareServiceImpl implements WorkShareService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkShareDao workShareDao;
	
}
