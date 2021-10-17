<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<!-- css NoticeListView  -->
<link href="resources/css/notice/Notice.css" rel="stylesheet" type="text/css"> 
<!-- summernote --> 
<link rel="stylesheet"	href="./resources/plugins/summernote/summernote-bs4.min.css">
<style>

</style>
</head>
<body>

 	<jsp:include page="../common/menubar.jsp" />
    <div class="content-wrapper">
    
    <!-- 타이틀 -->
      <div class="col-12" id="titlediv">
         <div class="main_common1">
            <i class="far fa-file-alt fa-lg"></i>
         </div>
         <div class="main_common2">
            <h5>공지사항 작성</h5>
         </div>
      </div>
     <!-- 작성 -->
		<section class="content">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<form method="post" id="insertForm" enctype="multipart/form-data">
						<div class="card-body">

							<input type="hidden" id="empNo" name="empNo" value="202100005"><!-- value="${ loginUser.empNo }"  -->
							<table class="table table-bordered">
						        <tr>
						            <td id="formWriteTilte">제목</td>
						            <td colspan="3"><input type=text class="form-control" id="noticeinputTitle" name="noticeTitle" placeholder="제목을 입력해주세요"></td>
						        </tr>
						        <tr >
						            <td width="10%;" >작성자</td>
						            <td width="30%;"><input id="noticeWriter" name="noticeWriter"  value="김하연"/></td><!-- value="${ loginUser.empName }"  -->
						            <td width="12%;">직급</td>
						            <td width="30%;"><input id="jobName" name="jobName" value="팀장"/></td><!-- value="${ loginUser.jobName }"  -->
						        </tr>
						    </table>
							<br>
							<textarea id="summernote" name="noticeContent"></textarea>
			                <div>
			                <input type="file" id="upfile" class="form-control-file border" name="uploadFile">				              
			                </div>
						</div>
						<!--버튼 -->
						<div class="card-footer clearfix">
							<div class="writeBtn">
								<button class="btn btn-block btn-outline-primary" onclick="insertNotice();">등록</button>
							</div>
							<div class="writeBtn">
								<button class="btn btn-block btn-outline-secondary" onclick="temporaryNotice();">임시저장</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>

	</div>
    <jsp:include page="../common/footer.jsp" />
    
    <!-- Summernote -->	
    <script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>
    <script>
					$(document).ready(function() {
						$('#summernote').summernote({
							height : 200,
							maxHeight : null,
							focus : true,
							lang : 'ko-KR',
							codeviewFilter: false,
							codeviewIframeFilter: true
						});
					});
	</script>
		<script>
			function insertNotice(){
				$('#insertForm').each(function(){	
					
					<%--
					var title = $('#noticeinputTitle').value();
					console.log('title' + title);
					
					if (title.trim() == ''){
						alert("제목을 입력해주세요");
						return false;
					}
					
					if (writer.trim() == ''){
						content("내용을 입력해주세요");
						return false;
					}
					
					--%>
				    $("#insertForm").attr("action", "<%=request.getContextPath()%>/insertNotice.nt?nStatus=Y");
					$("#insertForm").submit();
									    
				});								
			}
			
			function temporaryNotice(){
				$('#insertForm').each(function(){				    
				    $("#insertForm").attr("action", "<%=request.getContextPath()%>/insertNotice.nt?nStatus=T");
					$("#insertForm").submit();	
					
					alert("게시글이 임시저장되었습니다")
				});		
			}
	</script>

</body>
