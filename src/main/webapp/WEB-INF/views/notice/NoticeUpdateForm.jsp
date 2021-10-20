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
    
    <!-- 공지사항 타이틀 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<h4>
						<i class="fas fa-bullhorn"></i><b> &nbsp;공지사항 수정</b>
					</h4>
				</div>
			</div>
		</div>
	</section>
	
	
     <!-- 작성 -->
		<section class="content">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<form method="post" id="updateForm" enctype="multipart/form-data">
						<div class="card-body">							
							<input type="hidden" id="noticeNo" name="noticeNo"value="${ n.noticeNo }"/>
							<input type="hidden" id="nStatus" name="nStatus" value="${ n.NStatus }"/>
							<input type="hidden" id="empNo" name="empNo" value="${ loginUser.empNo }"/>
							<table class="table table-bordered">
						        <tr>
						            <td id="formWriteTilte">제목</td>
						            <td colspan="3"><input type=text class="form-control" id="noticeinputTitle" name="noticeTitle"  value="${ n.noticeTitle }" required></td>
						        </tr>
						        <tr >
						            <td width="10%;" >작성자</td>
						            <td width="30%;"><input id="noticeWriter" name="noticeWriter"  value="${ loginUser.empName }" readonly/></td>
						            <td width="12%;">직급</td>
						            <td width="30%;">
						            	<c:choose>
											<c:when test="${loginUser.jobCode eq 'J1'}"> 
													<c:set var="empJobCode" value="대표이사"/>
											</c:when>
											<c:when test="${loginUser.jobCode eq 'J2'}"> 
													<c:set var="empJobCode" value="본부장"/>
											</c:when>
											<c:when test="${loginUser.jobCode eq 'J3'}"> 
													<c:set var="empJobCode" value="팀장"/>
											</c:when>
											<c:when test="${loginUser.jobCode eq 'J4'}"> 
													<c:set var="empJobCode" value="팀원"/>
											</c:when>
										</c:choose>
						            	<input id="jobName" name="jobName" value="${ empJobCode }" readonly/>
						            </td>
						        </tr>
						    </table>
							<br>
							<textarea id="summernote" name="noticeContent" >${ n.noticeContent }</textarea>
			                <div>
				                <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">	
				                <div style="margin-top : 10px;">
					                <c:if test="${ !empty n.originName }">
			                                                               현재 업로드된 파일 : ${ n.originName } <br>
			                            <input type="hidden" name="changeName" value="${ n.changeName }">
			                            <input type="hidden" name="originName" value="${ n.originName }">
		                            </c:if>	
	                            </div>			              
			                </div>
						</div>
						<!--버튼 -->
						<div class="card-footer clearfix">
							<!-- 임시저장된글만 공지등록 버튼이 보이게 -->
							<c:if test="${ n.NStatus == 'T' }">
								<div class="writeBtn">
									<button  type="submit" class="btn btn-block btn-outline-primary" onclick = "updateStatus();">공지등록</button>
								</div>
							</c:if>
							<div class="writeBtn">
								<button  type="submit" class="btn btn-block btn-outline-warning" onclick = "updateNotice();">수정하기</button>
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
			function updateNotice(){
				$('#updateForm').each(function(){
					
				    $("#updateForm").attr("action", "<%=request.getContextPath()%>/updateNotice.nt");
					$("#updateForm").submit();  
					
					alert("게시글이 수정되었습니다")
				});								
			}
			function updateStatus(){
				$('#updateForm').each(function(){
					
				    $("#updateForm").attr("action", "<%=request.getContextPath()%>/updateStatus.nt");
					$("#updateForm").submit();  
					
					alert("공지사항으로 등록되었습니다")
				});								
			}
			
	</script>
</body>
