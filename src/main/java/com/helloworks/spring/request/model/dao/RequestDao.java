package com.helloworks.spring.request.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.request.model.vo.Mtr;

@Repository
public class RequestDao {

	public int addMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("requestMapper.addMtr", mtr);
	}

}
