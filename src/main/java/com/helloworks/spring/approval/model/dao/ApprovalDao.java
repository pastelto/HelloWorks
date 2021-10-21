package com.helloworks.spring.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;

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


}
