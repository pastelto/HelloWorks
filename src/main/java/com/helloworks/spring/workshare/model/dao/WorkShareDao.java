package com.helloworks.spring.workshare.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
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

	public int selectUncheckedWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception  {
		
		return sqlSession.selectOne("workShareMapper.selectUncheckedWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectUnCheckedList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception  {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectUnCheckedList", myEmp, rowBounds); 
	}

	public int selectRecvWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectRecvWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectRecvList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectRecvList", myEmp, rowBounds); 
	}

	public int selectSendWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectSendWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectSendList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectSendList", myEmp, rowBounds); 
	}

	public int selectSavedWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectSavedWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectSavedList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectSavedList", myEmp, rowBounds); 
	}

	public WorkShare detailWS(SqlSessionTemplate sqlSession, int wno) {
		
		return sqlSession.selectOne("workShareMapper.detailWS", wno);
	}

	public ArrayList<WSAttachment> detailWSAttachment(SqlSessionTemplate sqlSession, int wsno) {
		
		System.out.println("dao wsno ? " + wsno);
		
		ArrayList<WSAttachment> wsa = (ArrayList)sqlSession.selectList("workShareMapper.detailWSAttachment", wsno);
		System.out.println(" DAO wsa ? " + wsa);
		return wsa;
	}
	
	
}
