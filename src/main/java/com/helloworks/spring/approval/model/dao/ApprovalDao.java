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

	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectListCount", searchMap);
	}

	public ArrayList<Approval> selectTempApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempApproval", searchMap, rowBounds);
	}

	public ArrayList<Approval> selectTempDate(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempDate",searchMap);
	}

	public ArrayList<Approval> selectAllTempApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllTempApproval",searchMap);
	}

	public ArrayList<Approval> selectSearchApNoTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchApNoTemp",searchMap);
	}

	public ArrayList<Approval> selectSearchTitleTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchTitleTemp",searchMap);
	}

	public ArrayList<Approval> selectDetailApNoTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailApNoTemp",searchMap);
	}

	public ArrayList<Approval> selectDetailTitleTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailTitleTemp",searchMap);
	}

	public ArrayList<Approval> selectDateApNoTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateApNoTemp",searchMap);
	}

	public ArrayList<Approval> selectDateTitleTemp(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateTitleTemp",searchMap);
	}

	public ArrayList<Approval> selectDeteDetailApNoTemp(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeteDetailApNoTemp",searchMap);
	}

	public ArrayList<Approval> selectDateDetailTitleTemp(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateDetailTitleTemp",searchMap);
	}

	public ArrayList<Approval> selectOnlyDateSortTemp(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectOnlyDateSortTemp",searchMap);
	}

	public Approval selectApprovalDetail(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalDetail", searchMap);
	}

	public ApprovalCC selectApprovalCC(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalCC", searchMap);
	}

	public ArrayList<ApprovalLine> selectApprovalLine(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalLine", searchMap);
	}

	public Approval selectAttachDetail(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectAttachDetail", searchMap);
	}

	public int updateApproval(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateApproval", ap);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateAttachment", ap);
	}

	public int updateCcEmpl(SqlSessionTemplate sqlSession, ApprovalCC ac) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateCcEmpl", ac);
	}

	public int updateCcDept(SqlSessionTemplate sqlSession, ApprovalCC ac) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateCcDept", ac);
	}

	public int updateExpenditure(SqlSessionTemplate sqlSession, ApprovalExpenditure ae) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateExpenditure", ae);
	}

	public int updateExpenditureDetail(SqlSessionTemplate sqlSession, ApprovalExDetails ad) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateExpenditureDetail", ad);
	}

	public int updateLine(SqlSessionTemplate sqlSession, ApprovalLine line) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.updateLine", line);
	}

	public int updatetHr(SqlSessionTemplate sqlSession, ApprovalHr ah) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updatetHr", ah);
	}

	public int updateMinutes(SqlSessionTemplate sqlSession, ApprovalMinutes am) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateMinutes", am);
	}

	public int updateDiploma(SqlSessionTemplate sqlSession, ApprovalDiploma ad) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateDiploma", ad);
	}

	public int deleteLine(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("approvalMapper.deleteLine", apNo);
	}




}
