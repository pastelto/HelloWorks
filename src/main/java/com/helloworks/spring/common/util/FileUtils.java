package com.helloworks.spring.common.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileUtils")
public class FileUtils {

	private static final Logger logger = LoggerFactory.getLogger(FileUtils.class);
	
	public List<Map<String, Object>> parseFileInfo(Map<String, Object> map, MultipartFile[] file) throws Exception {
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < file.length; i++) {
			
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\workshare_files\\";

			System.out.println("savePath : " + savePath);

			String originName = file.getOriginalFilename();

			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

			String ext = originName.substring(originName.lastIndexOf("."));

			String changeName = currentTime + ext;
			
		}
		
		
		
	}
	
}
