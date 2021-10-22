package com.helloworks.spring.request.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;

@Repository
public class RequestDao {

	//회의실 등록
	public int addMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("requestMapper.addMtr", mtr);
	}
	
	//회의실 목록
	public ArrayList<Mtr> manageMtr(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("requestMapper.manageMtr");
	}
	
	//차량 등록
	public int addCar(SqlSessionTemplate sqlSession, Car car) {
		// TODO Auto-generated method stub
		return sqlSession.insert("requestMapper.addCar", car);
	}

	//차량 목록
	public ArrayList<Mtr> manageCar(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("requestMapper.manageCar");
	}
	
	//차량 삭제
	public int deleteCar(SqlSessionTemplate sqlSession, List<String> checkArr) {
		// TODO Auto-generated method stub
		return sqlSession.delete("requestMapper.deleteCar", checkArr);
	}
}
