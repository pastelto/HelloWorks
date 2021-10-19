package com.helloworks.spring.workshare.model.dao;

import javax.activation.CommandMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.workshare.model.vo.WSAttachment;

@Repository
public class WorkShareDao {

	public int insertWorkShare(SqlSessionTemplate sqlSession, CommandMap commandMap) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWorkShare", commandMap);
	}

	public int insertWSAttach(SqlSessionTemplate sqlSession, WSAttachment wsa) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWSAttach", wsa);
	}
	
	
}
