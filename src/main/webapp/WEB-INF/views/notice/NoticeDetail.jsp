<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<!-- css NoticeListView  -->
<link href="resources/css/notice/Notice.css" rel="stylesheet" type="text/css"> 
<style>


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">
		 <!-- 공지사항 타이틀 -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<h4>
							<i class="fas fa-bullhorn"></i><b> &nbsp;공지사항</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		
		
		<section class="content">
			<div class="col-md-12">
				<div class="card card-outline card-info">
						
						<!-- 제목 -->
						<div class="card-header" >
						
						   <div class="titlefloat1"> &nbsp; &nbsp;제목 :  &nbsp; ${ n.noticeTitle }</div>
						   <div class="titlefloat2">${ n.createDate }</div>
						   <div class="titlefloat2">조회수 : ${ n.nt_count }</div>
						   <div class="titlefloat2">작성자  : ${ n.noticeWriter }&nbsp; ${ n.jobName } </div>
						</div>
						<!-- 내용 -->
						<div class="card-body detail1">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header detailContent">내용</div>
									<div class="card-header"><br>${ n.noticeContent }</div>
									<div class="card-header detailAttachment">
									<c:if test="${ !empty n.originName }">
										첨부파일  &nbsp;
			                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${n.changeName}" download="${ n.originName }">${ n.originName }</a>
			                        </c:if>
			                        <c:if test="${ empty n.originName }">
			                        	첨부파일이 없습니다.
			                        </c:if>
									</div>
								</div>
							</div>
						</div>
				
						
						<!-- 댓글영역 -->
						<div class="card-body detail2">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">댓글</div>
								</div>
							</div>
						</div>
						<!--버튼 -->
						<div class="card-footer clearfix">
							<div class="writeBtn">
								<button class="btn btn-block btn-outline-primary" onclick = "location.href='list.nt'">목록으로</button>
							</div>
							<!-- 본인만 수정삭제 가능하게  -->
							<c:if test="${ loginUser.empNo eq n.empNo  }">
								<div class="writeBtn">
									<button class="btn btn-block btn-outline-danger" onclick = "postFormSubmit(2);">삭제</button>
								</div>
								<div class="writeBtn">
									<button class="btn btn-block btn-outline-warning" onclick = "postFormSubmit(1)">수정</button>
								</div>
							</c:if>
						</div>
					
				            <form id="postForm" action="" method="post">
								<input type="hidden" name="bno" value="${ n.noticeNo }">
								<input type="hidden" name="fileName" value="${ n.changeName }"> 
							</form>
							
					
					
			</div>
		</section>
		
	<script>
		function postFormSubmit(num){
			var postForm = $("#postForm");
			
			if(num == 1){
				postForm.attr("action", "updateForm.nt");
				postForm.submit();
			}else{
				 var answer;
		   		 answer = confirm("정말로 삭제하시겠습니까?");
				
				 if(answer == true){
		   			 
					 postForm.attr("action", "delete.nt");
					 postForm.submit();
					 
		   			 alert("공지사항이 삭제되었습니다.");
		   		 }
			}
		}
	</script>	
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>