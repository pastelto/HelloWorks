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
							<i class="nav-icon fas fa-link"></i><b> 업무공유 수정 </b>
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
								<b>업무공유 수정</b>
							</h6>
						</div>

						<form id="workShareForm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="workShareNo" name="workShareNo" value="${ ws.ws_no }">
							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											
											<tr>
												<th>업무요약</th>
												<td colspan="3" id="editTitle">
												<input type="text" name="ws_title" class="form-control form-control-sm" value="${ws.ws_title}">
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
												<c:forEach items="${ wsRecvEmpName }" var="sren">
													<c:if test="${ !empty sren.ws_empno }">
													<span class="badge badge-info">
							                        	${sren.ws_senderName} ${sren.ws_senderJobName}(${sren.ws_empno})
							                        </span>
							                        </c:if>
							                     </c:forEach>
												</td>
												<td colspan="3" id="editRecvList" style="display:none;">
												&nbsp;&nbsp;
												<input type="text" name="ws_recv">
												<div class="float-right">
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
												<c:forEach items="${ wsRefEmpName }" var="srefn">
													<c:if test="${ !empty srefn.ws_empno }">
													<span class="badge badge-warning">
							                        	${srefn.ws_senderName} ${srefn.ws_senderJobName}(${srefn.ws_empno})
							                        </span>
							                        </c:if>
							                     </c:forEach>
												</td>
												<td colspan="3" id="editRefRecv" style="display:none;">
												&nbsp;&nbsp;
												<input type="text" name="ws_ref">
												<div class="float-right">
													<button id="refAB" type="button" class="btn btn-default btn-xs" onclick="">주소록</button>
													&nbsp;&nbsp;
													<button id="refSEmp" type="button" class="btn btn-default btn-xs" onclick="popupSearchEmp.or">직원 검색</button>
												</div>
												</td>
											</tr>
											<tr>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													${ ws.createDate }
												</td>
												<th>수정일</th>
												<td style="width: 35%;" id="editDate">
													&nbsp;
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
													<c:out value="${sysdate}" />
												 </td>
											</tr>
											<tr id="editAttachment">
												<th>파일첨부</th>
												<td colspan="3">
												<c:forEach items="${ wsa }" var="wsa">
													<c:if test="${ !empty wsa.wsa_origin }">
														<i type='button' class='fas fa-trash-alt' style='color: red; background-color: none;' onclick="deleteFile(${wsa.wsa_no})"></i>
							                        	<a href="${ pageContext.servletContext.contextPath }/resources/workshare_files/${wsa.wsa_change}" download="${wsa.wsa_origin}">${ wsa.wsa_origin }</a>
							                        	</br>
							                        </c:if>
													<c:if test="${ empty wsa.wsa_origin }">
														
							                        </c:if>
							                    </c:forEach>
													<span id="workShareAttachName"></span>
									                  <div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input type="file" name="uploadFile" id="workShareAttach" multiple="multiple">
									                  </div> 
												</td>
											</tr>
											</table>
												<div class="row">
													<div class="col-12">
														<textarea id="summernote" name="ws_content">${ ws.ws_content }</textarea>
													</div>
												</div>
										
									</div>
								</div>
<!-- 								<div class="row">
									<div class="col-12">
									</div>
								</div> -->


							</div>

							<div class="card-footer">
								<div class="float-right" id="editPlace">	
									&nbsp;						
									<c:if test="${ ws.ws_empno eq loginUser.empNo }">
									<button type="button" class="btn btn-info btn-sm" onclick="saveBtn()">저장하기</button>
									&nbsp;&nbsp;
									<button id="cancelBtn" type="button" class="btn btn-danger btn-sm" onclick="backToList()">취소</button>
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
    
    <!-- 첨부파일 라벨 이름 추가 -->
	<script>
	$("#workShareAttach").on("change", function() {
		// 첨부파일 새로 첨부시 내용 삭제
		$('#workShareAttachName').empty();
		
		var filename = "";
		for(var i = 0; i < $(this)[0].files.length; i++){
			
			filename += "<i type='button' class='fas fa-trash-alt' style='color: red; background-color: none')></i>";
			filename += $(this)[0].files[i].name + "&nbsp;&nbsp;";
			filename += "( " + Math.round(($(this)[0].files[i].size/1024)*100)/100 + " KB )	" ;
			filename += "<br>";
		}
		// console.log("filename : " + filename)
		$('#workShareAttachName').append(filename); 
	});
	
	function deleteFile(num){
		console.log(num)
			
			if(num != ""){
				$.ajax({
					url:"deleteWsa.ws",
					type:"post",
					data:{wsaNo:num},
					success:function(result){
						if(result > 0){
							//selectReplyList();
							alert("첨부파일이 삭제되었습니다.");
						}else{
							console.log("첨부파일 삭제 실패");
						}	
					},error:function(){
						console.log("첨부파일 ajax 통신 실패");
					}
				});
				
			};
	}
	// 첨부파일 리스트 불러오기
 	function selectWSAList(){
		var wno = ${ws.ws_no};
		$.ajax({
			url:"wsaList.ws",
			data:{wno:wno},
			type:"get",
			success:function(list){
				var value="";
				if(list != 0){
				$.each(list, function(i, obj){

					if(list != ""){
					value += "<i type='button' class='fas fa-trash-alt' style='color: red; background-color: none' onclick='deleteFile("+obj.wsa_no+"')></i>" + 
							 "<a href='${ pageContext.servletContext.contextPath }/resources/workshare_files/"+obj.wsa_change+"' download='"+obj.wsa_origin+"'>"+obj.wsa_origin+"</a>" + 
						     "</br>"
					} else{
						value += "첨부파일이 없습니다.";
					}
				});
				}
				$("#workShareAttachName").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}; 
	</script>
	
	<!-- 버튼 이동 -->
	<script>
 	// 업무공유 수정 완료 및 저장
	function saveBtn() {
	  	alert("업무공유가 수정되었습니다.");
		$("#workShareForm").attr("action", "<%=request.getContextPath()%>/updateWS.ws");
		$("#workShareForm").submit();

	};
	
	// 취소버튼 - 뒤로가기
 	function backToList(){
		
		var result = confirm("정말 취소하시겠습니까? (수정 중인 업무공유가 초기화됩니다.)");
		
		if(result){
			// 뒤로 가기
			history.back();
		} 
		
	} 
	</script>
	
	<!-- 주소록 -->
	<script>
		function popupAddressBook(){
			var addressBookPopUp = window.open("popupOfficeAddressBook.adb", "주소록", "width=1000,height=605");
		}
	</script>
	
	<!-- 직원 검색  -->
	<script>
		function popupSearchEmp(){
			var addressBookPopUp = window.open("popupSearchEmp.or", "직원검색", "width=1300,height=800");
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>