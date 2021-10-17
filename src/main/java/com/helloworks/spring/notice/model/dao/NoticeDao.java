package com.helloworks.spring.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	/*~~~~~~~~~~~~~~~~공지사항~~~~~~~~~~~~~~~~*/
	//총개시글갯수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	//공지사항리스트
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	      
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      
	      return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	//공지사항 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	//조회수
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.increaseCount", bno);
	}

	//상세조회
	public Notice selectNotice(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.selectOne("noticeMapper.selectNotice", bno);
	}
	
	//수정
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	//삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteNotice", bno);
	}
	
	/*~~~~~~~~~~~~~~~~임시저장~~~~~~~~~~~~~~~~*/
	//총 임시저장 게시글 갯수
	public int selectTListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectTListCount");
	}
	
	//임시저장 리스트
	public ArrayList<Notice> selectTList(SqlSessionTemplate sqlSession, PageInfo piT) {
		 int offset = (piT.getCurrentPage() - 1) * piT.getBoardLimit();
	      
	      RowBounds rowBounds = new RowBounds(offset, piT.getBoardLimit());
	      
	      return (ArrayList)sqlSession.selectList("noticeMapper.selectTList", null, rowBounds);
	}

}
