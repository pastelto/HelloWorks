package com.helloworks.spring.workshare.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.workshare.model.dao.WorkShareDao;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Service
public class WorkShareServiceImpl implements WorkShareService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkShareDao workShareDao;

	// 업무공유 생성하기 및 첨부파일 추가하기
	@Override
	public void insertWorkShare(WorkShare ws) throws Exception {
		 // 업무공유 생성 
		 int result = workShareDao.insertWorkShare(sqlSession, ws);
		 System.out.println("WS result ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}
	
	// 첨부파일 추가하기
	@Override
	public void insertWSAttach(ArrayList<WSAttachment> wsaList) throws Exception {
		int result1 = 0;
		
		System.out.println("wsaList size ? " + wsaList);
		 for(WSAttachment wsa : wsaList) { 
			 result1 = workShareDao.insertWSAttach(sqlSession, wsa);
			 System.out.println("wsa ? " + wsa);
		 }
		 
		 if(result1 < 0) { 
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}
	
	// 미확인 업무 개수 
	@Override
	public int selectUncheckedWSListCount(Employee myEmp) throws Exception {
		
		return workShareDao.selectUncheckedWSListCount(sqlSession, myEmp);
	}
	
	// 미확인 업무 목록
	@Override
	public ArrayList<WorkShare> selectUnCheckedList(Employee myEmp, PageInfo pi) throws Exception {
		
		return workShareDao.selectUnCheckedList(sqlSession, myEmp, pi);
	}
	
	// 수신 업무 개수
	@Override
	public int selectRecvWSListCount(Employee myEmp) throws Exception {
		
		return workShareDao.selectRecvWSListCount(sqlSession, myEmp);
	}
	
	// 수신 업무 목록
	@Override
	public ArrayList<WorkShare> selectRecvList(Employee myEmp, PageInfo pi) throws Exception {
		
		return workShareDao.selectRecvList(sqlSession, myEmp, pi);
	}
	
	// 발신 업무 개수
	@Override
	public int selectSendWSListCount(Employee myEmp) throws Exception {
		
		return workShareDao.selectSendWSListCount(sqlSession, myEmp);
	}
	
	// 발신 업무 목록
	@Override
	public ArrayList<WorkShare> selectSendList(Employee myEmp, PageInfo pi) throws Exception {
		
		return workShareDao.selectSendList(sqlSession, myEmp, pi);
	}
	
	// 임시저장 업무 개수
	@Override
	public int selectSavedWSListCount(Employee myEmp) throws Exception {

		return workShareDao.selectSavedWSListCount(sqlSession, myEmp);
	}
	
	// 임시저장 업무 목록
	@Override
	public ArrayList<WorkShare> selectSavedList(Employee myEmp, PageInfo pi) throws Exception {
		
		return workShareDao.selectSavedList(sqlSession, myEmp, pi);
	}

	
}
