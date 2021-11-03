<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통 자료실 등록</title>

<!-- summernote -->
<link rel="stylesheet"	href="./resources/plugins/summernote/summernote-bs4.min.css">

<style>
	.content-wrapper{
		overflow:auto;
	}
	th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	} 
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-edit"></i><b> 공통 자료실 등록</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>공통자료실 등록</b>
							</h6>
						</div>


						<form id="enrollForm" method="post" enctype="multipart/form-data">

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>작성자</th>
												<td style="width: 35%;">
												&nbsp;
												<b>${ loginUser.empName }</b>
												<input type="hidden" name="crWriterNo" id="crWriterNo" value="${ loginUser.empNo }">
												</td>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd " /></c:set> 
													<c:out value="${sysdate}" />
													<span id="nowTimes"></span>
												 </td>
											</tr>
											<tr>
												<th>보고유형</th>
												<td colspan="3">
													&nbsp;
													<input type="radio" value="공유" name="crCategory" checked> 공유
													&nbsp;&nbsp;&nbsp;
													<input type="radio" value="문서" name="crCategory"> 문서
													&nbsp;&nbsp;&nbsp;
													<input type="radio" value="기타" name="crCategory"> 기타
												</td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td colspan="3">
												<div class="row m-0">
													<input type="text" id="crCode" name="crCode"> 
												</div>
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<input id="drTitle" name="drTitle" type="text" class="form-control form-control-sm" value="${ dailyReport.drTitle }">
												</td>
											</tr>
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
													<span id="resourcesAttachName"></span>
								                  	<div class="btn btn-default btn-file btn-xs">
								                   		<i class="fas fa-paperclip"></i> 첨부파일
								                    	<input type="file" name="uploadFile" id="resourcesAttach" multiple="multiple"> 
								               	  	</div> 
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote" name="drContent"></textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="submitFunc()">발송하기</button>
									&nbsp;
									<button id="cancelBtn" type="button" class="btn btn-danger btn-sm" onclick="cancelFunc()" >돌아가기</button>
									&nbsp;
								</div>
							</div>
						</form>

					</div>
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
    	    height : 400
    	  });
    	});
    </script>
    
    <!-- 첨부파일 라벨 이름 추가 -->
	<script>
		$("#resourcesAttach").on("change", function() {
			// 첨부파일 새로 첨부시 내용 삭제
			$('#resourcesAttachName').empty();
			
			var filename = "";
			for(var i = 0; i < $(this)[0].files.length; i++){
				
				filename += $(this)[0].files[i].name + "&nbsp;&nbsp;";
				filename += "( " + Math.round(($(this)[0].files[i].size/1024)*100)/100 + " KB )	" ;
				filename += "<br>";
			}
			console.log("filename : " + filename)
			$('#resourcesAttachName').append(filename); 
		});

	</script>
</body>
</html>