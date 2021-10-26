package com.helloworks.spring.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalExDetails;
import com.helloworks.spring.approval.model.vo.ApprovalExpenditure;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	public int insertApproval(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertApproval", ap);
	}

	public int insertLine(SqlSessionTemplate sqlSession, ApprovalLine line) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertLine", line);
	}

	public int insertDiploma(SqlSessionTemplate sqlSession, ApprovalDiploma ad) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertDiploma", ad);
	}

	public int insertMinutes(SqlSessionTemplate sqlSession, ApprovalMinutes am) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertMinutes", am);
	}

	public int insertHr(SqlSessionTemplate sqlSession, ApprovalHr ah) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertHr", ah);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertAttachment", ap);
	}

	public int insertCcDept(SqlSessionTemplate sqlSession, ApprovalCC ac) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertCcDept", ac);
	}

	public int insertCcEmpl(SqlSessionTemplate sqlSession, ApprovalCC ac) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertCcEmpl", ac);
	}

	public ArrayList<ApprovalExDetails> selectExNumch(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectExNumch");
	}

	public ArrayList<ApprovalExDetails> selectExNumco(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectExNumco");
	}

	public int insertExpenditure(SqlSessionTemplate sqlSession, ApprovalExpenditure ae) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertExpenditure", ae);
	}

	public int insertExpenditureDetail(SqlSessionTemplate sqlSession, ApprovalExDetails ad) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertExpenditureDetail", ad);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int loginEmpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectListCount", loginEmpNo);
	}

	public ArrayList<Approval> selectTempApproval(SqlSessionTemplate sqlSession, int loginEmpNo, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempApproval", loginEmpNo, rowBounds);
	}

	public ArrayList<Approval> selectTempDate(SqlSessionTemplate sqlSession, HashMap<String, Integer> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempDate",searchMap);
	}

	public ArrayList<Approval> selectDateBoundSortTemp(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateBoundSortTemp",searchMap);
	}

	public ArrayList<Approval> selectAllTempApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllTempApproval",searchMap);
	}


}
