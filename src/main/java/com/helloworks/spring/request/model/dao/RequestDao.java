package com.helloworks.spring.request.model.dao;

<<<<<<< HEAD
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.request.model.vo.Mtr;

@Repository
=======
>>>>>>> refs/heads/Master
public class RequestDao {

<<<<<<< HEAD
	//회의실 등록
	public int addMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("requestMapper.addMtr", mtr);
	}
	
	//회의실 리스트
	public ArrayList<Mtr> manageMtr(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("requestMapper.manageMtr");
	}

=======
>>>>>>> refs/heads/Master
}
