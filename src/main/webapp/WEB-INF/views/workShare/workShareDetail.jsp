<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 업무공유</title>

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
							<i class="nav-icon fas fa-link"></i><b> 업무공유 </b>
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

						<form id="insertWSForm" method="post" enctype="multipart/form-data">

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											
											<tr>
												<th>업무요약</th>
												<td colspan="3">
													&nbsp;&nbsp;
													${ ws.ws_title }
												</td>
											</tr>
											<tr>
												<th>발송인</th>
												<td style="width: 35%;">
												&nbsp;
												<input type="text" name="loginEmpId" value="${loginUser.empName} ${loginUser.jobName}" style="border: none;" readonly>
												<input type="hidden" name="ws_empno" value="${loginUser.empNo}">
												</td>
											</tr>
											<tr>
												<th>수신직원</th>
												<td colspan="3">
												&nbsp;&nbsp;
													수신직원 목록 -> 컴마로 구분해서 입력
												</td>
											</tr>
											<tr>
												<th>참조</th>
												<td colspan="3">
												&nbsp;&nbsp;
													참조직원 목록 -> 컴마로 구분해서 입력
												</td>
											</tr>
											<tr>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													${ ws.createDate }
												</td>
												<th>수정일</th>
												<td style="width: 35%;">
													&nbsp;
													DB에서 수정일이 있으면 가져오기 
												</td>
											</tr>
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
												<%-- <c:forEach items="${ wsa }" var="wsa">
													<c:if test="${ !empty wsa.wsa_origin }">
							                        	<a href="${ pageContext.servletContext.contextPath }/resources/workshare_files/${wsa.wsa_change}" download="${wsa.wsa_origin}">${ wsa.wsa_origin }</a>
							                        </c:if>
							                        <c:if test="${ empty wsa.wsa_origin }">
							                        	첨부파일이 없습니다.
							                        </c:if>
							                     </c:forEach> --%>
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote" name="ws_content"></textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm" onclick="saveWorkShare();">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="insertWorkShare();">등록</button>
									&nbsp;
									<button id="resetBtn" type="button" class="btn btn-danger btn-sm" onclick="backToList();">취소</button>
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
			var filename = "";
			
			for(var i = 0; i < $(this)[0].files.length; i++){
				filename += $(this)[0].files[i].name;
				filename += " ";
			}
			console.log("filename : " + filename)
			$('#workShareAttachName').append(filename); 
		});

	</script>
	
	<!-- 버튼 이동 -->
	<script>
	// 업무공유 보내기
 	function insertWorkShare(){
		$('#insertWSForm').each(function(){	
			
		    $("#insertWSForm").attr("action", "<%=request.getContextPath()%>/insert.ws?ws_status=Y");
			$("#insertWSForm").submit();
			alert("업무공유가 발송되었습니다.");
		});
	}
	// 업무공유 임시저장하기
 	function saveWorkShare(){
		$('#insertWSForm').each(function(){	

		    $("#insertWSForm").attr("action", "<%=request.getContextPath()%>/insert.ws?ws_status=S");
			$("#insertWSForm").submit();
			alert("업무공유가 임시저장 되었습니다.");
		});
	} 
	
	// 취소버튼 - 뒤로가기
 	function backToList(){
		
		var result = confirm("정말 취소하시겠습니까? (작성 중인 업무공유가 초기화됩니다.)");
		
		if(result){
			// 뒤로 가기
			history.back();
		} 
		
	} 
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>