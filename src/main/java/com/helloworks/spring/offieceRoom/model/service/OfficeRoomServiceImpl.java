package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.dao.OfficeRoomDao;
import com.helloworks.spring.offieceRoom.model.vo.CommonResources;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.DeptResources;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;
import com.helloworks.spring.workshare.model.vo.WSAttachment;

@Service
public class OfficeRoomServiceImpl implements OfficeRoomService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OfficeRoomDao officeRoomDao;
	
	
	@Override
	public ArrayList<Employee> selectAllEmployee() {
		// TODO Auto-generated method stub
		return officeRoomDao.selectAllEmployee(sqlSession);
	}


	@Override
	public ArrayList<Employee> selectDeptEmployee(String deptCode) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptEmployee(sqlSession, deptCode);
	}


	@Override
	public ArrayList<Employee> selectKorSortEmployee(String catTitle) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectKorSortEmployee(sqlSession, catTitle);
	}


	@Override
	public ArrayList<Employee> selectEngSortEmployee(String catTitle) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectEngSortEmployee(sqlSession, catTitle);
	}


	@Override
	public Employee searchEmployeeDetail(int empNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.searchEmployeeDetail(sqlSession, empNo);
	}


	@Override
	public ArrayList<Employee> searchEmployee(SearchEmployee se) {
		// TODO Auto-generated method stub
		return officeRoomDao.searchEmployee(sqlSession, se);
	}


	@Override
	public int selectCommResourcesListCount() {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommResourcesListCount(sqlSession);
	}


	@Override
	public ArrayList<CommonResources> selectCommResourcesList(PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommResourcesList(sqlSession, pi);
	}


	@Override
	public int selectDeptResourcesListCount(String deptCode) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesListCount(sqlSession, deptCode);
	}


	@Override
	public ArrayList<DeptResources> selectDeptResourcesList(String deptCode, PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesList(sqlSession, deptCode, pi);
	}


	@Override
	public CommonResources selectCommonResources(int crNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommonResources(sqlSession, crNo);
	}


	@Override
	public void increaseCount(int crNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.increaseCount(sqlSession, crNo);
		
		if(result < 0) {
			throw new CommException("조회수 증가 실패");
		}
	}


	@Override
	public ArrayList<CommonResourcesAttachment> selectCommonResourcesAttachMent(int crNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommonResourcesAttachMent(sqlSession, crNo);
	}


	@Override
	public ArrayList<CommonResourcesReply> selectCommReplyList(int crNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommReplyList(sqlSession, crNo);
	}


	@Override
	public int addCommReply(CommonResourcesReply r) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.addCommReply(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("댓글 등록 실패");
		}
		return result;
	}


	@Override
	public int deleteCommReply(int crNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.deleteCommReply(sqlSession, crNo);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
	}


	@Override
	public int selectCommonResourcesCategoryTypeListCount(CommonResources commonResources) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommonResourcesCategoryTypeListCount(sqlSession, commonResources);
	}


	@Override
	public ArrayList<CommonResources> selectCommonResourcesCategoryTypeList(CommonResources commonResources,
			PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommonResourcesCategoryTypeList(sqlSession, commonResources, pi);
	}


	@Override
	public void insertCommResources(CommonResources commonResources) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.insertCommResources(sqlSession, commonResources);
		
		if(result < 0) {
			throw new CommException("공유 주소록 등록 실패");
		}
	}


	@Override
	public void insertCommResourcesAttach(ArrayList<CommonResourcesAttachment> commonResourcesAttachList) {
		// TODO Auto-generated method stub
		int result = 0;
		
		 for(CommonResourcesAttachment commonResourcesAttach : commonResourcesAttachList) { 
			 result = officeRoomDao.insertCommResourcesAttach(sqlSession, commonResourcesAttach);
		 }
		 
		 if(result < 0) { 
			 throw new CommException("공통 자료실 첨부파일 삽입 실패"); 
		 }
	}


	@Override
	public int selectDeptResourcesCategoryTypeListCount(DeptResources deptResources) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesCategoryTypeListCount(sqlSession, deptResources);
	}


	@Override
	public ArrayList<DeptResources> selectDeptResourcesCategoryTypeList(DeptResources deptResources, PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesCategoryTypeList(sqlSession, deptResources, pi);
	}


	@Override
	public int addDeptCommReply(DeptResourcesReply r) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.addDeptCommReply(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("댓글 등록 실패");
		}
		return result;
	}


	@Override
	public int deleteDeptReply(int deptrNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.deleteDeptReply(sqlSession, deptrNo);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
	}


	@Override
	public void increaseDeptCount(int deptrNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.increaseDeptCount(sqlSession, deptrNo);
		
		if(result < 0) {
			throw new CommException("조회수 증가 실패");
		}
	}


	@Override
	public DeptResources selectDeptResources(int deptrNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResources(sqlSession, deptrNo);
	}


	@Override
	public ArrayList<DeptResourcesAttachment> selectDeptResourcesAttachMent(int deptrNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesAttachMent(sqlSession, deptrNo);
	}


	@Override
	public ArrayList<CommonResourcesReply> selectDeptReplyList(int deptrNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptReplyList(sqlSession, deptrNo);
	}


	@Override
	public void insertDeptResources(DeptResources deptResources) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.insertDeptResources(sqlSession, deptResources);
		
		if(result < 0) {
			throw new CommException("부서별 주소록 등록 실패");
		}
	}


	@Override
	public void insertDeptResourcesAttach(ArrayList<DeptResourcesAttachment> deptResourcesAttachList) {
		// TODO Auto-generated method stub
		int result = 0;
		
		 for(DeptResourcesAttachment deptResourcesAttach : deptResourcesAttachList) { 
			 result = officeRoomDao.insertDeptResourcesAttach(sqlSession, deptResourcesAttach);
		 }
		 
		 if(result < 0) { 
			 throw new CommException("공통 자료실 첨부파일 삽입 실패"); 
		 }
	}


	@Override
	public int selectDeptResourcesSearchListCount(DeptResources deptResources) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesSearchListCount(sqlSession, deptResources);
	}


	@Override
	public ArrayList<DeptResources> selectDeptResourcesSearchList(DeptResources deptResources, PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptResourcesSearchList(sqlSession, deptResources, pi);
	}


	@Override
	public int selectCommResourcesSearchListCount(CommonResources commResources) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommResourcesSearchListCount(sqlSession, commResources);
	}


	@Override
	public ArrayList<CommonResources> selectCommResourcesSearchList(CommonResources commResources, PageInfo pi) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectCommResourcesSearchList(sqlSession, commResources, pi);
	}


	@Override
	public CommonResourcesAttachment selectDelCommonResourcesAttachment(int crAttachNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDelCommonResourcesAttachment(sqlSession, crAttachNo);
	}


	@Override
	public int deleteCommonResourcesAttachment(int crAttachNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.deleteCommonResourcesAttachment(sqlSession, crAttachNo);
		 
		 if(result < 0) { 
			 throw new CommException("첨부파일 삭제 실패"); 
		 }
		 return result;
	}


	@Override
	public ArrayList<CommonResourcesAttachment> commAttachList(int crNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.commAttachList(sqlSession, crNo);
	}


	@Override
	public void updateCommResources(CommonResources commonResources) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.updateCommResources(sqlSession, commonResources);
		 
		 if(result < 0) { 
			 throw new CommException("수정 실패"); 
		 }
	}


	@Override
	public void insertUpdateCommResourcesAttach(ArrayList<CommonResourcesAttachment> commonResourcesAttachList) {
		// TODO Auto-generated method stub
		int result = 0;
		
		 for(CommonResourcesAttachment commonResourcesAttach : commonResourcesAttachList) { 
			 result = officeRoomDao.insertUpdateCommResourcesAttach(sqlSession, commonResourcesAttach);
		 }
		 
		 if(result < 0) { 
			 throw new CommException("공통 자료실 첨부파일 추가 삽입 실패"); 
		 }
	}


	@Override
	public DeptResourcesAttachment selectDelDeptResourcesAttachment(int deptrAttachNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDelDeptResourcesAttachment(sqlSession, deptrAttachNo);
	}


	@Override
	public int deleteDeptResourcesAttachment(int deptrAttachNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.deleteDeptResourcesAttachment(sqlSession, deptrAttachNo);
		 
		 if(result < 0) { 
			 throw new CommException("첨부파일 삭제 실패"); 
		 }
		 return result;
	}


	@Override
	public ArrayList<DeptResourcesAttachment> deptrAttachList(int deptrNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.deptrAttachList(sqlSession, deptrNo);
	}


	@Override
	public void updateDeptResources(DeptResources deptResources) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.updateDeptResources(sqlSession, deptResources);
		 
		 if(result < 0) { 
			 throw new CommException("수정 실패"); 
		 }
	}


	@Override
	public void insertUpdateDeptResourcesAttach(ArrayList<DeptResourcesAttachment> deptResourcesAttachList) {
		// TODO Auto-generated method stub
		int result = 0;
		
		 for(DeptResourcesAttachment deptResourcesAttachment : deptResourcesAttachList) { 
			 result = officeRoomDao.insertUpdateDeptResourcesAttach(sqlSession, deptResourcesAttachment);
		 }
		 
		 if(result < 0) { 
			 throw new CommException("공통 자료실 첨부파일 추가 삽입 실패"); 
		 }
	}


	@Override
	public Attendance attendanceEmployee(int empNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.attendanceEmployee(sqlSession, empNo);
	}


}
