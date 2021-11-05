package com.helloworks.spring.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
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

	public ArrayList<Approval> selectApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApproval", searchMap, rowBounds);
	}

	//1
	public ArrayList<Approval> selectDate(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDate",searchMap);
	}

	public ArrayList<Approval> selectAllApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllApproval",searchMap);
	}

	public ArrayList<Approval> selectSearchApNo(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchApNo",searchMap);
	}

	public ArrayList<Approval> selectSearchTitle(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchTitle",searchMap);
	}

	public ArrayList<Approval> selectDetailApNo(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailApNo",searchMap);
	}

	public ArrayList<Approval> selectDetailTitle(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailTitle",searchMap);
	}

	public ArrayList<Approval> selectDateApNo(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateApNo",searchMap);
	}

	public ArrayList<Approval> selectDateTitle(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateTitle",searchMap);
	}

	public ArrayList<Approval> selectDeteDetailApNo(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeteDetailApNo",searchMap);
	}

	public ArrayList<Approval> selectDateDetailTitle(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateDetailTitle",searchMap);
	}

	public ArrayList<Approval> selectOnlyDateSort(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectOnlyDateSort",searchMap);
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

	public ApprovalDiploma selectApprovalDiploma(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalDiploma", searchMap);
	}

	public ApprovalHr selectApprovalHr(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalHr", searchMap);
	}

	public ApprovalMinutes selectApprovalMinutes(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalMinutes", searchMap);
	}

	public ApprovalExpenditure selectApprovalExpenditure(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApprovalExpenditure", searchMap);
	}

	public ArrayList<ApprovalExDetails> selectApprovalExDetails(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalExDetails", searchMap);
	}

	public int deleteExDetails(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("approvalMapper.deleteExDetails", apNo);
	}

	public ArrayList<Approval> selectpendingList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectpendingList", searchMap);
	}

	public ArrayList<Approval> selectSearchApNoPending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchApNoPending",searchMap);
	}

	public ArrayList<Approval> selectSearchTitlePending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchTitlePending",searchMap);
	}

	public ArrayList<Approval> selectDetailApNoPending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailApNoPending",searchMap);

	}
	
	public ArrayList<Approval> selectDetailTitlePending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailTitlePending",searchMap);
	}

	public ArrayList<Approval> selectDateApNoPending(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateApNoPending",searchMap);
	}

	public ArrayList<Approval> selectDateTitlePending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateTitlePending",searchMap);
	}

	public ArrayList<Approval> selectDeteDetailApNoPending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeteDetailApNoPending",searchMap);
	}

	public ArrayList<Approval> selectDateDetailTitlePending(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateDetailTitlePending",searchMap);
	}

	public ArrayList<Approval> selectAllPending(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllPending",searchMap);
	}

	public ArrayList<Approval> selectDatePending(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDatePending",searchMap);
	}

	public int insertComment(SqlSessionTemplate sqlSession, HashMap<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertComment", insertMap);
	}

	public ArrayList<ApprovalComment> selectComment(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectComment",apNo);
	}

	public int updateLineStatus(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateLineStatus", apNo);
	}

	public int completeStatus(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.completeStatus", apNo);
	}

	public int returnStatus(SqlSessionTemplate sqlSession, int apNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.returnStatus", apNo);
	}
	
	public int updateProgressDate(SqlSessionTemplate sqlSession, HashMap<String, Object> updateMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateProgressDate", updateMap);
	}

	public ArrayList<Approval> selectSignedList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSignedList", searchMap);
	}

	public ArrayList<Approval> selectAllSigned(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllSigned", searchMap);
	}

	public ArrayList<Approval> selectDateSigned(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateSigned", searchMap);
	}

	public ArrayList<Approval> selectSearchApNoSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchApNoSigned", searchMap);
	}

	public ArrayList<Approval> selectSearchTitleSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchTitleSigned", searchMap);
	}

	public ArrayList<Approval> selectDetailApNoSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailApNoSigned", searchMap);
	}

	public ArrayList<Approval> selectDetailTitleSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailTitleSigned", searchMap);
	}

	public ArrayList<Approval> selectDateApNoSigned(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateApNoSigned", searchMap);
	}

	public ArrayList<Approval> selectDateTitleSigned(SqlSessionTemplate sqlSession, HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateTitleSigned", searchMap);
	}

	public ArrayList<Approval> selectDeteDetailApNoSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeteDetailApNoSigned", searchMap);
	}

	public ArrayList<Approval> selectDateDetailTitleSigned(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDateDetailTitleSigned", searchMap);
	}

	public ArrayList<ApprovalComment> mainMyApproval(SqlSessionTemplate sqlSession, HashMap<String, Object> selectMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.mainMyApproval", selectMap);
	}

	public ArrayList<Approval> mainPending(SqlSessionTemplate sqlSession, HashMap<String, Object> selectMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.mainPending", selectMap);
	}

	






}
