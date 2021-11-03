package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.dao.OfficeRoomDao;
import com.helloworks.spring.offieceRoom.model.vo.CommonResources;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.DeptResources;
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
			throw new CommException("조회수 증가 실패");
		}
		return result;
	}


	@Override
	public int deleteCommReply(int crNo) {
		// TODO Auto-generated method stub
		int result = officeRoomDao.deleteCommReply(sqlSession, crNo);
		
		if(result < 0) {
			throw new CommException("조회수 증가 실패");
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
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}


}
