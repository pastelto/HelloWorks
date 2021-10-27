package com.helloworks.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.common.model.vo.SearchCondition;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.notice.model.service.NoticeService;
import com.helloworks.spring.notice.model.vo.Notice;

@Controller
public class NoticeController {

	  @Autowired
	  private NoticeService noticeService;
	
	  //보드리스트
	  @RequestMapping("list.nt")
	  public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			  																HttpServletRequest request, Model model) {
		  int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		  
		  
		   //공지사항
		   int listCount = noticeService.selectListCount();//총 게시글 갯수
		   System.out.println("listCount : " + listCount);
		   
		   PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		   
		   ArrayList<Notice> list = noticeService.selectList(pi);//보드 리스트
		   System.out.println("noticelist : " + list);
		   
		   model.addAttribute("list",list);
		   model.addAttribute("pi",pi);		   
		   
		   
		   
		
		   //임시저장 
		   int tlistCount = noticeService.selectTListCount(empNo);//총 게시글 갯수
		   System.out.println("tlistCount : " + tlistCount);
		   
		   PageInfo piT = Pagination.getPageInfo(tlistCount, currentPage, 10, 5);
		   
		   ArrayList<Notice> tlist =noticeService.selectTList(piT, empNo);//임시저장 리스트
		   System.out.println("noticeTlist : " + tlist);
		   
		   model.addAttribute("tlist",tlist);
		   model.addAttribute("piT",piT);
		   
	      return "notice/NoticeListView";
		   
	   }
	   
	   //게시글 작성 폼 화면전환
	   @RequestMapping("enrollForm.nt")
	   public String enrollForm() {
		   return "notice/NoticeEnrollForm";
	   }
	   
	   //게시글 작성 
	   @RequestMapping("insertNotice.nt")
	   public String insertNotice(Notice n, String nStatus,  HttpServletRequest request, Model model,
			   					 @RequestParam(name="uploadFile" , required=false) MultipartFile file) {
		   
		   //상태값에 따라 
		   System.out.println("n : "+n);
		   if(nStatus.equals("Y")) { //등록
			   n.setNStatus(nStatus);
		   }else if(nStatus.equals("T")) {//임시저장
			   n.setNStatus(nStatus);
		   }
		   System.out.println("스테이터스" + nStatus);
		  
		   System.out.println(file.getOriginalFilename());
		   
		   //파일set
		   if(!file.getOriginalFilename().equals("")) {
			   String changeName = saveFile(file, request); //saveFile메소드 생성
			   
			   if(changeName != null) {
				   n.setOriginName(file.getOriginalFilename());
				   n.setChangeName(changeName);
			   }
		   }
		   
		   //게시판 insert
		   noticeService.insertNotice(n);   
		   model.addAttribute("msg","공지사항이 등록되었습니다.");
		   
		   return "redirect:list.nt";
	   }
	   
	   //saveFile메소드
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\"; //저장경로
			
			System.out.println("savePath : "+ savePath);
			
			String originName = file.getOriginalFilename(); //원본파일명
			
			String cuurentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //시간
			
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = cuurentTime + ext;
			
		
				try {
					file.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException e ) {
					changeName="";
					e.printStackTrace();
					throw new CommException("file upload error");
				} catch (IOException e) {
					changeName="";
					e.printStackTrace();
					throw new CommException("file upload error");
				}
			
			return changeName;
		}
		
		//게시글 상세보기
		@RequestMapping("detail.nt")
		public ModelAndView selectBoard(int bno, ModelAndView mv) {
			 System.out.println("게시글 상세보기 번호~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+bno);
			 Notice n = noticeService.selectNotice(bno);			 
			 System.out.println(n.getNStatus());
			 mv.addObject("n", n).setViewName("notice/NoticeDetail");
			 
			 System.out.println("$$$$$$$$$$$$$$$$$$$ + n " + n);
			 
			 return mv;
		}
		
		 
		//게시글 수정 화면전환
		 @RequestMapping("updateForm.nt")
		 public ModelAndView updateForm(int bno, ModelAndView mv) {
			 
			 Notice n = noticeService.selectNotice(bno);
			 System.out.println("게시글 수정 화면전환~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+bno);
			 System.out.println(n.getNStatus());
			 mv.addObject("n", n).setViewName("notice/NoticeUpdateForm");
			 
			 return mv;
		 }
	  

		//게시글 수정
		@RequestMapping("updateNotice.nt")
	    public ModelAndView updateBoard(Notice n, ModelAndView mv, HttpServletRequest request, 
	                           @RequestParam(value="reUploadFile", required=false) MultipartFile file ) {
			 
			  //상태값에 따라 
			   System.out.println("n : "+n);
			   if(n.getNStatus().equals("Y")) { //등록
				   n.setNStatus(n.getNStatus());
			   }else if(n.getNStatus().equals("T")) {//임시저장
				   n.setNStatus(n.getNStatus());
			   }
			   System.out.println("스테이터스" + n.getNStatus());
			
		      if(!file.getOriginalFilename().equals("")) {
		         if(n.getChangeName() != null) {
		            deleteFile(n.getChangeName(), request); //파일지우기
		         }
		         String changeName = saveFile(file, request); // 파일저장 //업로드 하고 changeName을 받아옴
		         
		         n.setOriginName(file.getOriginalFilename()); //파일 담기
		         n.setChangeName(changeName);
		      }
		      
		     
		      noticeService.updateNotice(n);
		      mv.addObject("bno", n.getNoticeNo()).setViewName("redirect:detail.nt");
		      
		      return mv;
	    }
		
		//첨부파일 삭제 메소드
		private void deleteFile(String fileName, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\"; 
			
			System.out.println("savePath : "+ savePath);
			
			File deleteFile = new File(savePath + fileName);
			deleteFile.delete();
			
		}
		
		//게시글 삭제
		 @RequestMapping("delete.nt")
		 public String deleteBoard(int bno, String fileName, HttpServletRequest request) {
			 
			 noticeService.deleteNotice(bno);
			 
			 //첨부파일 삭제
			 if(!fileName.equals("")) {//파일이 널이 아니면
				 deleteFile(fileName, request);
			 }
			 
			 return "redirect:list.nt";
		 }
		 
	/*~~~~~~~~~~~~~~~~~~임시저장~~~~~~~~~~~~~~~~~~~~~~~*/
		//임시저장 게시글 재등록
		@RequestMapping("updateStatus.nt")
	    public ModelAndView updateStatus(Notice n, ModelAndView mv, HttpServletRequest request, 
	                           @RequestParam(value="reUploadFile", required=false) MultipartFile file ) {
	      		
		      if(!file.getOriginalFilename().equals("")) {
		         if(n.getChangeName() != null) {
		            deleteFile(n.getChangeName(), request); //파일지우기
		         }
		         String changeName = saveFile(file, request); // 파일저장 //업로드 하고 changeName을 받아옴
		         
		         n.setOriginName(file.getOriginalFilename()); //파일 담기
		         n.setChangeName(changeName);
		      }
		      
		      n.setNStatus("Y");
		      
		      noticeService.updateNotice(n);
		      mv.addObject("bno", n.getNoticeNo()).setViewName("redirect:detail.nt");
		      
		      return mv;
	    }
		
		
	/*~~~~~~~~~~~~~~~~~~~~~~검색~~~~~~~~~~~~~~~~~~~~~~~*/
		@RequestMapping("searchNotice.nt")
		public String selectSearchNotice(String condition, String search, 
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
	  	   
			   System.out.println("condition" + condition); //select
			   System.out.println("search" + search); //검색 내용
			   
			   SearchCondition sc = new SearchCondition();
				
				switch(condition) {
				case "all":
					sc.setWriter(search);
					break;
				case "writer":
					sc.setWriter(search);
					break;
				case "title":
					sc.setTitle(search);
					break;
				case "content":
					sc.setContent(search);
					break;	
				}
			   
			   //공지사항 리스트 
			   int getSearchlistCount = noticeService.getSearchListCount(sc);
			   System.out.println("getSearchlistCount : " + getSearchlistCount); 
			   
			   PageInfo pi = Pagination.getPageInfo(getSearchlistCount, currentPage, 10, 5);
			   
			   ArrayList<Notice> list = noticeService. getSearchList(sc,pi);
			   System.out.println("searchNoticelist : " + list);
			   
			   model.addAttribute("list",list);
			   model.addAttribute("pi",pi);		
			   
			   
			   //임시저장 리스트
			   int getSearchlistTCount = noticeService.getSearchlistTCount(sc);
			   System.out.println("getSearchlistTCount : " + getSearchlistCount); 
			   
			   PageInfo piT = Pagination.getPageInfo(getSearchlistTCount, currentPage, 10, 5);
			   
			   ArrayList<Notice> tlist = noticeService. searchNoticeTlist(sc,piT);
			   System.out.println("searchNoticeTlist : " + tlist);
			   
			   model.addAttribute("tlist",tlist);
			   model.addAttribute("piT",piT);		
			   
		
		   
	      return "notice/NoticeListView";
	   }
		 
}
