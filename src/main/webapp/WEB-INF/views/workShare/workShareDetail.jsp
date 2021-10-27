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

						<form id="workShareForm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="workShareNo" name="workShareNo" value="${ ws.ws_no }">
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
											<tr id="editAttachment" style="display:none;">
												<th>파일첨부</th>
												<td colspan="3">
													<span class="badge badge-info" id="workShareAttachName"></span>
									                  <div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input type="file" name="uploadFile" id="workShareAttach" multiple="multiple">
									                  </div> 
												</td>
											</tr>
											<tr>
												<td colspan="12">
													<div class="click2edit" id="ws_content"> ${ ws.ws_content }</div>
												</td>
											</tr>
<!-- 											<tr>
												<td colspan="12">															
													<div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input type="file" class="normalAttach" name="normalAttach" id="normalAttach" multiple="true">
							                  		</div> 
												</td>
											</tr> -->
<!-- 											<tr>
												<td colspan="6">
													<input type="text" placeholder="댓글을 입력하세요." >
												</td>
												<td colspan="6">
													<button>등록하기</button>
												</td>
 												<td colspan="3">
													<span>삭제</span>
												</td>
											<tr>
											<tr id="fileRow">
												<td colspan="6">
													 <span class="normalAttachName"></span>
												</td >
												<td colspan="3">
													<span class="normalAttachSize"></span>
												</td>
												<td colspan="3">
													<button type="button" class="btn btn-danger" style="font-size:1em">삭제</button>
												</td>
											</tr> -->
										</table>

							            <table id="replyArea" class="table" align="center">
							                <thead>
							                    <tr>
							                    	<c:set var="loop_flag" value="false" />
							                    	<c:if test="${not loop_flag }">
								                    	<c:if test="${ myEmpNo eq loginUser.empNo }">
								                    		    <th colspan="3" style="width:75%">
									                            	<textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>	
										                        </th>
										                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
								                    		 <c:set var="loop_flag" value="true" />
							                    		</c:if>
							                    	 </c:if>	
							                    	 <c:if test="${not loop_flag }">
							                    		<c:if test="${ myEmpNo ne loginUser.empNo }">
								                    		<th colspan="3" style="width:75%">
									                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%" placeholder="댓글작성 권한이 없습니다." disabled></textarea>
									                        </th>
									                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply" disabled>등록하기</button></th>
							                    		<c:set var="loop_flag" value="false" />
							                    		</c:if>
							                    	</c:if>
							                    </tr>
							                    <tr>
							                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
							                    </tr>
							                </thead>
							                <tbody>
							                
							                </tbody>
							            </table>
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
									<button id="editBtn" type="button" class="btn btn-warning btn-sm">수정하기</button>
									&nbsp;
									<button id="deleteBtn" type="button" class="btn btn-danger btn-sm" onclick="deleteWS();">삭제</button>
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
    
    <!-- 첨부파일 라벨 이름 추가 -->
	<script>
		
		$("#workShareAttach").on("change", function() {
			var filename = "";
			
			for(var i = 0; i < $(this)[0].files.length; i++){
				filename += $(this)[0].files[i].name;
				filename += "<br>";
			}
			console.log("filename : " + filename)
			$('#workShareAttachName').append(filename); 
		});
	</script>
	
	<!-- 버튼 이동 -->
	<script>
	// 업무공유 수정화면 전환
 	$("#editBtn").one("click", function(){
 		  $('.click2edit').summernote({
 			  height: 300,
 			  minHeight: 300,
 			  maxHeight: 300,
 			  focus: true
 			  });
 		  // console.log("클릭!");
 		  $('#editPlace').append('<button id="save" type="button" class="btn btn-info btn-sm" onclick="saveBtn()">저장하기</button>&nbsp;&nbsp;');
 		  $('#editPlace').append('<button id="cancel" type="button" class="btn btn-danger btn-sm" onclick="backToList()">취소</button>');
 		  $('#editAttachment').attr("style", "display:''");
 		  $("#resetBtn").remove();
 		  $("#editBtn").remove(); 		  
 		 
 	})
	
 	// 업무공유 수정 완료 및 저장
	function saveBtn() {
	  var markup = $('.click2edit').summernote('code');
	  	
	  	// 업무공유 수정하기 
	  <%--  $("#insertWSForm").attr("action", "<%=request.getContextPath()%>/insert.ws?ws_status=Y");
		$("#insertWSForm").submit();
		alert("업무공유가 발송되었습니다."); --%>
		// console.log("저장 클릭!");
	 	$('.click2edit').summernote('destroy');
	 	$('#editPlace').append('<button id="editBtn" type="button" class="btn btn-info btn-sm">수정하기</button>&nbsp;');
	  	$("#save").remove();
	};
	
	// 업무공유 수정하기
 	function insertWorkShare(){
		$('#workShareForm').each(function(){	
			
 		$("#workShareForm").attr("action", "<%=request.getContextPath()%>/updateWS.ws");
		$("#workShareForm").submit();
		alert("업무공유가 수정되었습니다."); 
		});
	}
	
	// 업무공유 삭제하기
	function deleteWS(){
		
		var wno = $('#workShareNo').val();
		console.log(wno)
		var really = confirm("정말로 해당 업무공유를 삭제하시겠습니까?");
		
		if(really){
		$('#workShareForm').each(function(){	
			
 		$("#workShareForm").attr("action", "<%=request.getContextPath()%>/deleteWS.ws");
		$("#workShareForm").submit();
		alert("업무공유가 삭제되었습니다."); 
		});
		}
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
	
    
    <script>
		$(function(){
			selectReplyList();
			
			$("#addReply").click(function(){
		   		var wno = ${ws.ws_no};
		
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ws",
						type:"post",
						data:{wsr_content:$("#replyContent").val(),
							  wno:wno,
							  wsr_empNo:"${loginUser.empNo}"},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("댓글등록실패");
							}
						},error:function(){
							console.log("댓글 작성 ajax 통신 실패");
						}
					});
					
				}else{
					alert("댓글등록하셈");
				}
				
			});
		});
	
		function selectReplyList(){
			var wno = ${ws.ws_no};
			$.ajax({
				url:"rlist.ws",
				data:{wno:wno},
				type:"get",
				success:function(list){
					$("#rcount").text(list.length);
					
					var value="";
					$.each(list, function(i, obj){
						
						if(obj.wsr_empNo == ${loginUser.empNo}){
						value += "<tr>" +
								 "<th>" + obj.wsr_empName + " " + obj.wsr_empJobName + "</th>" + 
								 "<td>" + obj.wsr_content + "</td>" + 
							     "<td>" + obj.wsr_date + "</td>" +
							     "<td>" + "<a>'삭제하기'</a>" + "</td>" +
							     "</tr>";
						}else {
							value += "<tr>" +
							 "<th>" + obj.wsr_empName + " " + obj.wsr_empJobName + "</th>" + 
							 "<td>" + obj.wsr_content + "</td>" + 
						     "<td>" + obj.wsr_date + "</td>" +
						     "<td></td>" +
						     "</tr>";
						}
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		}
  </script>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>