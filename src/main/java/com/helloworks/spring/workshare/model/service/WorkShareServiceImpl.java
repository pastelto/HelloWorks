package com.helloworks.spring.workshare.model.service;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.helloworks.spring.workshare.model.dao.WorkShareDao;

@Service
public class WorkShareServiceImpl implements WorkShareService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkShareDao workShareDao;

	// 업무공유 생성하기 및 첨부파일 추가하기
	@Override
	public void insertWorkShare(CommandMap commandMap, MultipartFile[] file) throws Exception {

		int result1 = workShareDao.insertWorkShare(sqlSession, commandMap);
		
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(commandMap.getMap(), file);
		
		for(int i = 0; i < fileList.size(); i++) {
			workShareDao.insertWSAttach(sqlSession, fileList.get(i));
		}
		
	}

	// 업무공유 생성하기 및 첨부파일 추가하기
	/*
	 * @Override public void insertWorkShare(WorkShare ws, List<Map<String, Object>>
	 * list) throws Exception {
	 * 
	 * // 업무공유 생성 int result1 = workShareDao.insertWorkShare(sqlSession, ws);
	 * 
	 * // 첨부파일 추가 int result2 = 1; if(list.size() > 0) { for(WSAttachment wsa :
	 * list) { workShareDao.insertWSAttach(sqlSession, wsa); } }
	 * 
	 * if(result1 * result2 < 0) { throw new CommException("업무공유 삽입 실패"); } }
	 */

	
}
