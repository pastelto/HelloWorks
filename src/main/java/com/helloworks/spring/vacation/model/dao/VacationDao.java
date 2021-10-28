package com.helloworks.spring.vacation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.vacation.model.vo.VacationLine;

@Repository
public class VacationDao {
	
	//결재라인 insert
	public int insertLine(SqlSessionTemplate sqlSession, VacationLine line) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertLine", line);
	}

}
