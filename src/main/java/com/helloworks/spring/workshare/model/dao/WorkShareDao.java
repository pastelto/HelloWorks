package com.helloworks.spring.workshare.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Repository
public class WorkShareDao {

	public int insertWorkShare(SqlSessionTemplate sqlSession, WorkShare ws) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWorkShare", ws);
	}

	public int insertWSAttach(SqlSessionTemplate sqlSession, WSAttachment wsa) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWSAttach", wsa);
	}
	
	
}
