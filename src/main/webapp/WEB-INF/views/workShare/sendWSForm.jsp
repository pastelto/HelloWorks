<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일보고</title>

<!-- summernote -->
 <link rel="stylesheet"	href="./resources/plugins/summernote/summernote-bs4.min.css">

<style>
	th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	} 
	.content-wrapper{
		overflow:auto;
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
							<i class="nav-icon fas fa-link"></i><b> 업무공유 작성</b>
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
								<b>업무공유</b>
							</h6>
						</div>

						<form id="insertWorkShare" method="post" action="insert.ws" enctype="multipart/form-data">

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>작성자</th>
												<td style="width: 35%;">
												&nbsp;
												<input type="text" name="loginEmpId" value="김다혜 팀장님" style="border: none;" readonly>
												<input type="hidden" name="ws_empno" value="202100003">
												</td>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
													<c:out value="${sysdate}" />
													<input type="hidden" name="createDate" value="${sysdate}" />
												 </td>
											</tr>
											<tr>
												<th>업무요약</th>
												<td colspan="3">
												<input type="text" name="ws_content" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th>수신직원</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<div class="float-right">
													<input type="text" name="ws_recv">
													<button id="addressBook" type="button" class="btn btn-default btn-xs">주소록</button>
													&nbsp;&nbsp;
													<button id="searchEmp" type="button" class="btn btn-default btn-xs">직원 검색</button>
												</div>
												</td>
											</tr>
											<tr>
												<th>참조</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<input type="text" name="ws_ref">
												</td>
											</tr>
<!-- 											<tr>
												<th>수정권한</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<div class="float-right">
													<button id="addressBook" type="button" class="btn btn-default btn-xs">주소록</button>
													&nbsp;&nbsp;
													<button id="searchEmp" type="button" class="btn btn-default btn-xs">직원 검색</button>
												</div>
												</td>
											</tr> -->
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
													<span class="badge badge-info" id="workShareAttachName"></span>
									                  <div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input multiple="multiple" type="file" name="workShareAttach" id="workShareAttach">
									                  </div> 
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote"></textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm">등록</button>
									&nbsp;
									<button id="resetBtn" type="button" class="btn btn-danger btn-sm" >취소</button>
									&nbsp;
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>
	</div>



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
		$("#workShareAttach").on("change", function() {
			var filename = $(this)[0].files[0].name + " ";
			// 어떻게 하나씩 분리??
			$('#workShareAttachName').append(filename);
		});
	</script>
	
	<!-- 버튼 이동 -->
	<script>
	// 임시저장 버튼 클릭시 저장
	$(function(){
		$("#tempSaveBtn").onClick(){
			
		}
	});
		
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>