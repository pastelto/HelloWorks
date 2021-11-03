package com.helloworks.spring.notice.model.service;

import java.util.ArrayList;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.common.model.vo.SearchCondition;
import com.helloworks.spring.notice.model.vo.Notice;

public interface NoticeService {
	
	//총게시글 갯수
	int selectListCount();
	
	//공지사항리스트
	ArrayList<Notice> selectList(PageInfo pi);

	//등록
	void insertNotice(Notice n);
	
	//상세조회
	Notice selectNotice(int bno);

	//수정
	void updateNotice(Notice n);
	
	//삭제
	void deleteNotice(int bno);
	
	//총 임시저장 게시글 갯수
	int selectTListCount(int empNo);
	
	//임시저장리스트
	ArrayList<Notice> selectTList(PageInfo piT, int empNo);
	
	//임시저장 상세조회
	Notice selectTNotice(int bno);

	
	
	//공지사항 검색 총 게시글수
	int getSearchListCount(SearchCondition sc);

	
	
	//공지사항검색리스트
	ArrayList<Notice> getSearchList(SearchCondition sc, PageInfo pi);
	
	//임시저장 검색  총 게시글수
	int getSearchlistTCount(SearchCondition sc);
	
	//임시저장 검색리스트
	ArrayList<Notice> searchNoticeTlist(SearchCondition sc, PageInfo piT);
	
	//공지사항 탑리스트
	ArrayList<Notice> selectTopList();

}
