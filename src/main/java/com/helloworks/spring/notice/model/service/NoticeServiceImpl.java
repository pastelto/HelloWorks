package com.helloworks.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.common.model.vo.SearchCondition;
import com.helloworks.spring.notice.model.dao.NoticeDao;
import com.helloworks.spring.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	/*~~~~~~~~~~~~~~~~공지사항~~~~~~~~~~~~~~~~*/
	//총 게시글 갯수
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return noticeDao.selectListCount(sqlSession);
	}
	
	//공지사항리스트
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return noticeDao.selectList(sqlSession, pi);
	}

	//등록
	@Override
	public void insertNotice(Notice n) {
		int result = noticeDao.insertNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("게시글 작성 실패");
		}
		
	}
	
	//상세조회
	@Override
	public Notice selectNotice(int bno) {
		
		Notice n = null;
		
		//조회수 증가
		int result = noticeDao.increaseCount(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("조회수 증가 실패");
		}else {
		  n = noticeDao.selectNotice(sqlSession, bno);
		}
		
		return n;
	}

	
	//수정
	@Override
	public void updateNotice(Notice n) {
		int result = noticeDao.updateNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("updateBoard 실패");
		}
		
	}
	
	//삭제
	@Override
	public void deleteNotice(int bno) {
		int result = noticeDao.deleteNotice(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("deleteNotice 실패");
		}
		
	}
	
	/*~~~~~~~~~~~~~~~~임시저장~~~~~~~~~~~~~~~~*/
	//총 임시저장 게시글 갯수
	@Override
	public int selectTListCount() {
		// TODO Auto-generated method stub
		return noticeDao.selectTListCount(sqlSession);
	}
	
	//임시저장 리스트 
	@Override
	public ArrayList<Notice> selectTList(PageInfo piT) {
		// TODO Auto-generated method stub
		return noticeDao.selectTList(sqlSession, piT);
	}

	@Override
	public Notice selectTNotice(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	/*~~~~~~~~~~~~~~~~검색~~~~~~~~~~~~~~~~*/
	//검색 리스트 갯수
	@Override
	public int getSearchListCount(SearchCondition sc) {
		// TODO Auto-generated method stub
		return noticeDao.getSearchListCount(sqlSession, sc);
	}
	
	//검색 리스트 
	@Override
	public ArrayList<Notice> getSearchList(SearchCondition sc, PageInfo pi) {
		// TODO Auto-generated method stub
		return noticeDao.getSearchList(sqlSession, sc, pi);
	}
	
	//임시저장 리스트 갯수
	@Override
	public int getSearchlistTCount(SearchCondition sc) {
		// TODO Auto-generated method stub
		return noticeDao.getSearchlistTCount(sqlSession, sc);
	}
	
	//임시저장 리스트
	@Override
	public ArrayList<Notice> searchNoticeTlist(SearchCondition sc, PageInfo piT) {
		// TODO Auto-generated method stub
		return noticeDao.searchNoticeTlist(sqlSession, sc, piT);
	}

}
