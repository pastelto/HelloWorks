package com.helloworks.spring.offieceRoom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.CommonResources;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.DeptResources;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Repository
public class OfficeRoomDao {

	public ArrayList<Employee> selectAllEmployee(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectAllEmployee");
	}

	public ArrayList<Employee> selectDeptEmployee(SqlSessionTemplate sqlSession, String deptCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptEmployee", deptCode);
	}

	public ArrayList<Employee> selectKorSortEmployee(SqlSessionTemplate sqlSession, String catTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectKorSortEmployee", catTitle);
	}

	public ArrayList<Employee> selectEngSortEmployee(SqlSessionTemplate sqlSession, String catTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectEngSortEmployee", catTitle);
	}

	public Employee searchEmployeeDetail(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.searchEmployeeDetail",empNo);
	}

	public ArrayList<Employee> searchEmployee(SqlSessionTemplate sqlSession, SearchEmployee se) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.searchEmployee", se);
	}

	public int selectCommResourcesListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectCommResourcesListCount");
	}

	public ArrayList<CommonResources> selectCommResourcesList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectCommResourcesList", null, rowBounds);
	}

	public int selectDeptResourcesListCount(SqlSessionTemplate sqlSession, String deptCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDeptResourcesListCount", deptCode);
	}

	public ArrayList<DeptResources> selectDeptResourcesList(SqlSessionTemplate sqlSession, String deptCode,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptResourcesList", deptCode, rowBounds);
	}

	public CommonResources selectCommonResources(SqlSessionTemplate sqlSession, int crNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectCommonResources", crNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int crNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.increaseCount", crNo);
	}

	public ArrayList<CommonResourcesAttachment> selectCommonResourcesAttachMent(SqlSessionTemplate sqlSession,
			int crNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectCommonResourcesAttachMent", crNo);
	}

	public ArrayList<CommonResourcesReply> selectCommReplyList(SqlSessionTemplate sqlSession, int crNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectCommReplyList", crNo);
	}

	public int addCommReply(SqlSessionTemplate sqlSession, CommonResourcesReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.addCommReply", r);
	}

	public int deleteCommReply(SqlSessionTemplate sqlSession, int crNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.deleteCommReply", crNo);
	}

	public int selectCommonResourcesCategoryTypeListCount(SqlSessionTemplate sqlSession,
			CommonResources commonResources) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectCommonResourcesCategoryTypeListCount", commonResources);
	}

	public ArrayList<CommonResources> selectCommonResourcesCategoryTypeList(SqlSessionTemplate sqlSession,
			CommonResources commonResources, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectCommonResourcesCategoryTypeList", commonResources, rowBounds);
	}

	public int insertCommResources(SqlSessionTemplate sqlSession, CommonResources commonResources) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertCommResources", commonResources);
	}

	public int insertCommResourcesAttach(SqlSessionTemplate sqlSession,
			CommonResourcesAttachment commonResourcesAttach) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertCommResourcesAttach", commonResourcesAttach);
	}

	public int selectDeptResourcesCategoryTypeListCount(SqlSessionTemplate sqlSession, DeptResources deptResources) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDeptResourcesCategoryTypeListCount", deptResources);
	}

	public ArrayList<DeptResources> selectDeptResourcesCategoryTypeList(SqlSessionTemplate sqlSession,
			DeptResources deptResources, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptResourcesCategoryTypeList", deptResources, rowBounds);
	}

	public int addDeptCommReply(SqlSessionTemplate sqlSession, DeptResourcesReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.addDeptCommReply", r);
	}

	public int deleteDeptReply(SqlSessionTemplate sqlSession, int deptrNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.deleteDeptReply", deptrNo);
	}

	public int increaseDeptCount(SqlSessionTemplate sqlSession, int deptrNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.increaseDeptCount", deptrNo);
	}

	public DeptResources selectDeptResources(SqlSessionTemplate sqlSession, int deptrNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDeptResources", deptrNo);
	}

	public ArrayList<DeptResourcesAttachment> selectDeptResourcesAttachMent(SqlSessionTemplate sqlSession,
			int deptrNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptResourcesAttachMent", deptrNo);
	}

	public ArrayList<CommonResourcesReply> selectDeptReplyList(SqlSessionTemplate sqlSession, int deptrNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptReplyList", deptrNo);
	}

	public int insertDeptResources(SqlSessionTemplate sqlSession, DeptResources deptResources) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertDeptResources", deptResources);
	}

	public int insertDeptResourcesAttach(SqlSessionTemplate sqlSession, DeptResourcesAttachment deptResourcesAttach) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertDeptResourcesAttach", deptResourcesAttach);
	}

	public int selectDeptResourcesSearchListCount(SqlSessionTemplate sqlSession, DeptResources deptResources) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDeptResourcesSearchListCount", deptResources);
	}

	public ArrayList<DeptResources> selectDeptResourcesSearchList(SqlSessionTemplate sqlSession,
			DeptResources deptResources, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptResourcesSearchList", deptResources, rowBounds);
	}

	public int selectCommResourcesSearchListCount(SqlSessionTemplate sqlSession, CommonResources commResources) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectCommResourcesSearchListCount", commResources);
	}

	public ArrayList<CommonResources> selectCommResourcesSearchList(SqlSessionTemplate sqlSession,
			CommonResources commResources, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectCommResourcesSearchList", commResources, rowBounds);
	}

	public CommonResourcesAttachment selectDelCommonResourcesAttachment(SqlSessionTemplate sqlSession, int crAttachNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDelCommonResourcesAttachment", crAttachNo);
	}

	public int deleteCommonResourcesAttachment(SqlSessionTemplate sqlSession, int crAttachNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("officeroomMapper.deleteCommonResourcesAttachment", crAttachNo);
	}

	public ArrayList<CommonResourcesAttachment> commAttachList(SqlSessionTemplate sqlSession, int crNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.commAttachList", crNo);
	}

	public int updateCommResources(SqlSessionTemplate sqlSession, CommonResources commonResources) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.updateCommResources", commonResources);
	}

	public int insertUpdateCommResourcesAttach(SqlSessionTemplate sqlSession,
			CommonResourcesAttachment commonResourcesAttach) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertUpdateCommResourcesAttach", commonResourcesAttach);
	}

	public DeptResourcesAttachment selectDelDeptResourcesAttachment(SqlSessionTemplate sqlSession, int deptrAttachNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.selectDelDeptResourcesAttachment", deptrAttachNo);
	}

	public int deleteDeptResourcesAttachment(SqlSessionTemplate sqlSession, int deptrAttachNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("officeroomMapper.deleteDeptResourcesAttachment", deptrAttachNo);
	}

	public ArrayList<DeptResourcesAttachment> deptrAttachList(SqlSessionTemplate sqlSession, int deptrNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.deptrAttachList", deptrNo);
	}

	public int updateDeptResources(SqlSessionTemplate sqlSession, DeptResources deptResources) {
		// TODO Auto-generated method stub
		return sqlSession.update("officeroomMapper.updateDeptResources", deptResources);
	}

	public int insertUpdateDeptResourcesAttach(SqlSessionTemplate sqlSession,
			DeptResourcesAttachment deptResourcesAttachment) {
		// TODO Auto-generated method stub
		return sqlSession.insert("officeroomMapper.insertUpdateDeptResourcesAttach", deptResourcesAttachment);
	}

	public Attendance attendanceEmployee(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.attendanceEmployee", empNo);
	}


}
