package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.CommonResources;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.DeptResources;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface OfficeRoomService {

	ArrayList<Employee> selectAllEmployee();

	ArrayList<Employee> selectDeptEmployee(String deptCode);

	ArrayList<Employee> selectKorSortEmployee(String catTitle);

	ArrayList<Employee> selectEngSortEmployee(String catTitle);

	Employee searchEmployeeDetail(int empNo);

	ArrayList<Employee> searchEmployee(SearchEmployee se);

	int selectCommResourcesListCount();

	ArrayList<CommonResources> selectCommResourcesList(PageInfo pi);

	int selectDeptResourcesListCount(String deptCode);

	ArrayList<DeptResources> selectDeptResourcesList(String deptCode, PageInfo pi);

	CommonResources selectCommonResources(int crNo);

	void increaseCount(int crNo);

	ArrayList<CommonResourcesAttachment> selectCommonResourcesAttachMent(int crNo);

	ArrayList<CommonResourcesReply> selectCommReplyList(int crNo);

	int addCommReply(CommonResourcesReply r);

	int deleteCommReply(int crNo);

	int selectCommonResourcesCategoryTypeListCount(CommonResources commonResources);

	ArrayList<CommonResources> selectCommonResourcesCategoryTypeList(CommonResources commonResources, PageInfo pi);

	void insertCommResources(CommonResources commonResources);

	void insertCommResourcesAttach(ArrayList<CommonResourcesAttachment> commonResourcesAttachList);

	int selectDeptResourcesCategoryTypeListCount(DeptResources deptResources);

	ArrayList<DeptResources> selectDeptResourcesCategoryTypeList(DeptResources deptResources, PageInfo pi);

	int addDeptCommReply(DeptResourcesReply r);

	int deleteDeptReply(int deptrNo);

	void increaseDeptCount(int deptrNo);

	DeptResources selectDeptResources(int deptrNo);

	ArrayList<DeptResourcesAttachment> selectDeptResourcesAttachMent(int deptrNo);

	ArrayList<CommonResourcesReply> selectDeptReplyList(int deptrNo);

	void insertDeptResources(DeptResources deptResources);

	void insertDeptResourcesAttach(ArrayList<DeptResourcesAttachment> deptResourcesAttachList);


}
