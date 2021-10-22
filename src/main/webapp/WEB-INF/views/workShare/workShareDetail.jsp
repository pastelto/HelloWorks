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
<!-- include libraries(jQuery, bootstrap) -->
<!-- 화면단을 전반적으로 작게 만들어주는 부트스트랩! 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include summernote css/js-->
<link href="summernote.css">
<!-- <script src="summernote.js"></script> -->

<style>
	th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	} 
	.content-wrapper{
		overflow:auto;
	}
	
	#ws_content{
	overflow:auto;
	height: 300px;
	border: solid 1px #DAE1E7; 
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

						<form id="UpdateWSForm" method="post" enctype="multipart/form-data">

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
												<td colspan="3">
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
													<c:if test="${ !empty ws.editDate }">
														&nbsp;
														${ ws.editDate }
													</c:if>
													<c:if test="${ empty ws.editDate }">
													</c:if>
												</td>
											</tr>
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
												<c:forEach items="${ wsa }" var="wsa">
													<c:if test="${ !empty wsa.wsa_origin }">
							                        	<a href="${ pageContext.servletContext.contextPath }/resources/workshare_files/${wsa.wsa_change}" download="${wsa.wsa_origin}">${ wsa.wsa_origin }</a>
							                        	</br>
							                        </c:if>
							                        <c:if test="${ empty wsa.wsa_origin }">
							                        	첨부파일이 없습니다.
							                        </c:if>
							                     </c:forEach>
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="click2edit" id="ws_content"> ${ ws.ws_content }</div>
									</div>
								</div>


							</div>

							<div class="card-footer">
								<div class="float-right" id="editPlace">	
									&nbsp;						
									<c:if test="${ ws.ws_empno eq loginUser.empNo }">
									<button id="editBtn" type="button" class="btn btn-warning btn-sm">수정하기</button>
									&nbsp;
									<button id="resetBtn" type="button" class="btn btn-danger btn-sm" onclick="backToList();">삭제</button>
									&nbsp;
									</c:if>
									
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
	
	<!-- 버튼 이동 -->
	<script>
	// 업무공유 보내기 -> 저장하기로 옮기기 (1)
 	function insertWorkShare(){
		$('#insertWSForm').each(function(){	
			
 		$("#updateWSForm").attr("action", "<%=request.getContextPath()%>/update.ws");
		$("#updateWSForm").submit();
		alert("업무공유가 수정되었습니다."); 
		});
	}
	
	// 업무공유 수정하기 
 	$("#editBtn").one("click", function(){
 		  $('.click2edit').summernote({
 			  height: 300,
 			  minHeight: 300,
 			  maxHeight: 300,
 			  focus: true
 			  });
 		  // console.log("클릭!");
 		  $("#resetBtn").remove();
 		  $("#editBtn").remove(); 		  
 		  $('#editPlace').append('<button id="save" type="button" class="btn btn-info btn-sm" onclick="saveBtn()">저장하기</button>');
 		 
 	})
	
 	// 업무공유 수정하기 (1)
	function saveBtn() {
	  var markup = $('.click2edit').summernote('code');
	  	
	  	// 업무공유 수정하기 
	  <%--  $("#insertWSForm").attr("action", "<%=request.getContextPath()%>/insert.ws?ws_status=Y");
		$("#insertWSForm").submit();
		alert("업무공유가 발송되었습니다."); --%>
		// console.log("저장 클릭!");
	 	$('.click2edit').summernote('destroy');
	 	$('#editPlace').append('<button id="editBtn" type="button" class="btn btn-warning btn-sm">수정하기</button>&nbsp;');
	 	$('#editPlace').append('&nbsp;<button id="resetBtn" type="button" class="btn btn-danger btn-sm" onclick="backToList();">삭제</button>');
	  	$("#save").remove();
	};

	
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