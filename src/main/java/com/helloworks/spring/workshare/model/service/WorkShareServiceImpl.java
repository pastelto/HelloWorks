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
import com.helloworks.spring.workshare.model.vo.WSReply;
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
	
	// 업무공유 상세조회에서 작성자 가져오기
	@Override
	public WorkShare detailWS(int wno) throws Exception {
		
		return workShareDao.detailWS(sqlSession, wno);
	}
	
	// 업무공유 상세조회
	@Override
	public WorkShare detailAllWS(WorkShare updateWS) throws Exception {
	
		return workShareDao.detailAllWS(sqlSession, updateWS);
	}

	
	// 업무공유 상세조회 - 첨부파일
	@Override
	public ArrayList<WSAttachment> detailWSAttachment(int wsno) throws Exception  {
		
		return workShareDao.detailWSAttachment(sqlSession, wsno);
	}
	
	// 미확인 업무 수신처리
	@Override
	public void readStatusWS(WorkShare updateWS) throws Exception {
		
		int result = workShareDao.readStatusWS(sqlSession, updateWS);
		System.out.println("WS result ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 수신처리 실패"); 
		 }
		
	}
	
	// 댓글 조회
	@Override
	public ArrayList<WSReply> selectReplyList(int wno) throws Exception {
	
		return workShareDao.selectReplyList(sqlSession, wno);
	}
	
	// 댓글 추가
	@Override
	public int insertReply(WSReply wsr) throws Exception {
		
		return workShareDao.insertReply(sqlSession, wsr);
	}
	
	// 업무공유 삭제
	@Override
	public void deleteWS(int wno) throws Exception {
		
		 int result = workShareDao.deleteWS(sqlSession, wno);
		 System.out.println("Delete WorkShare ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 삭제 실패"); 
		 }
	}

	// 업무공유 - 첨부파일 삭제
	@Override
	public void deleteWSAttachment(int wno) throws Exception {
		
		 int result = workShareDao.deleteWSAttachment(sqlSession, wno);
		 System.out.println("Delete WorkShare Attachment ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 첨부파일 삭제 실패"); 
		 }
	}
	
	// 업무공유 - 해당 첨부파일 가져오기
	@Override
	public WSAttachment selectWsa(int wsaNo) throws Exception {
	
		return workShareDao.selectWsa(sqlSession, wsaNo);
	}
	
	// 업무공유 - 수정
	@Override
	public void updateWorkShare(WorkShare ws) throws Exception {
		 
		 int result = workShareDao.updateWorkShare(sqlSession, ws);
		 System.out.println("WS result ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 수정 실패"); 
		 }
	}

	// 업무공유 - 첨부파일 수정
	@Override
	public void updateWSAttachment(ArrayList<WSAttachment> wsaList) throws Exception {
		
		int result1 = 0;
		
		System.out.println("wsaList size ? " + wsaList);
		 for(WSAttachment wsa : wsaList) { 
			 result1 = workShareDao.updateWSAttachment(sqlSession, wsa);
			 System.out.println("wsa ? " + wsa);
		 }
		 
		 if(result1 < 0) { 
			 throw new CommException("업무공유 삽입 실패"); 
		 }
	}
	
	// 업무공유 - 해당 첨부파일 삭제
	@Override
	public int deleteWsa(int wsaNo) throws Exception {
		
		int result = workShareDao.deleteWsa(sqlSession, wsaNo);
		 System.out.println("Delete WorkShare 첨부파일 ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 첨부파일 삭제 실패"); 
		 }
		
		 return result;
	}

	// 업무공유 댓글 삭제
	@Override
	public int deleteReply(int rno) throws Exception {
		
		 int result = workShareDao.deleteReply(sqlSession, rno);
		 System.out.println("Delete WorkShare Reply ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("업무공유 댓글 삭제 실패"); 
		 }
		
		 return result;
	}
	
	// 업무공유 수신인 성함 가져오기
	@Override
	public WorkShare selectRecvEmpName(int recvEmpNo) throws Exception {
		
		return workShareDao.selectRecvEmpName(sqlSession, recvEmpNo);
	}





	
}
