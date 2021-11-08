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
												<b>${ deptResources.writerName }</b>
												<input type="hidden" name="deptrNo" id="deptrNo" value="${ deptResources.deptrNo }">
												<input type="hidden" name="deptrWriterNo" id="deptrWriterNo" value="${ loginUser.empNo }">
												</td>
												<th>변경일</th>
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
													<c:if test="${ deptResources.deptrCategory == '공유'}">
														&nbsp;
														<input type="radio" value="공유" name="deptrCategory" checked> 공유
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="문서" name="deptrCategory"> 문서
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="기타" name="deptrCategory"> 기타
													</c:if>
													<c:if test="${ deptResources.deptrCategory == '문서'}">
														&nbsp;
														<input type="radio" value="공유" name="deptrCategory" > 공유
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="문서" name="deptrCategory" checked> 문서
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="기타" name="deptrCategory"> 기타
													</c:if>
													<c:if test="${ deptResources.deptrCategory == '기타'}">
														&nbsp;
														<input type="radio" value="공유" name="deptrCategory" > 공유
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="문서" name="deptrCategory"> 문서
														&nbsp;&nbsp;&nbsp;
														<input type="radio" value="기타" name="deptrCategory" checked> 기타
													</c:if>
													
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<input id="deptrTitle" name="deptrTitle" type="text" class="form-control form-control-sm" value="${ deptResources.deptrTitle}">
												</td>
											</tr>
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
													<div id="originDiv">
														<c:forEach items="${ deptResourcesAttach }" var="deptResourcesAttach">
															<c:if test="${ !empty deptResourcesAttach.deptrAttachOrigin }">
																
																	<i type='button' class='fas fa-trash-alt' style='color: red; background-color: none;' onclick="deleteFile(${deptResourcesAttach.deptrAttachNo})"></i>
										                        	<span class='badge badge-info'>${ deptResourcesAttach.deptrAttachOrigin }</span>&nbsp;&nbsp;
										                        	</br>
									                        	
									                        </c:if>
							                   		 	</c:forEach>
													</div>
													<span id="resourcesAttachName"></span>
								                  	<div class="btn btn-default btn-file btn-xs" >
								                   		<i class="fas fa-paperclip" ></i> 첨부파일
								                    	<input type="file" name="uploadFile" id="resourcesAttach" multiple="multiple">
								               	  	</div> 
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote" name="deptrContent">${ deptResources.deptrContent}</textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="updateBtn" type="button" class="btn btn-primary btn-sm" onclick="updateFunc()">수정하기</button>
									&nbsp;
									<button id="cancelBtn" type="button" class="btn btn-danger btn-sm" onclick="cancelFunc()">돌아가기</button>
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
    
    <!-- 시간 출력 -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		    // 시간을 딜레이 없이 나타내기위한 선 실행
		    realTimer();
		    // 이후 0.5초에 한번씩 시간을 갱신한다.
		    setInterval(realTimer, 100);
		});
		
		// 시간을 출력
		function realTimer() {
		
		   const nowDate = new Date();
		   const year = nowDate.getFullYear();
		   const month= nowDate.getMonth() + 1;
		   const date = nowDate.getDate();
		   const hour = nowDate.getHours();
		   const min = nowDate.getMinutes();
		   const sec = nowDate.getSeconds();
		   document.getElementById("nowTimes").innerHTML = 
		              hour + ": " + addzero(min) + ": " + addzero(sec);
		}
		
		// 1자리수의 숫자인 경우 앞에 0을 붙여준다.
		function addzero(num) {
		   if(num < 10) { num = "0" + num; }
		   return num;
		
		}
	</script>
    
    <!-- 첨부파일 라벨 이름 추가 -->
	<script>
		$("#resourcesAttach").on("change", function() {
			// 첨부파일 새로 첨부시 내용 삭제
			$('#resourcesAttachName').empty();
			
			var filename = "";
			for(var i = 0; i < $(this)[0].files.length; i++){
				
				filename += "<span class='badge badge-info'>"+$(this)[0].files[i].name + "</span>&nbsp;&nbsp;";
			}
			console.log("filename : " + filename)
			$('#resourcesAttachName').append(filename); 
		});
	</script>
	
	<!-- 자료실 등록 버튼 -->
	<script>
		function updateFunc(){
			
			if($("input[name=deptrTitle]").val()==""){
				alert("제목을 입력해주세요.")
			}else if($("#summernote").val()==""){
				alert("내용을 입력해주세요.")
			}else{
				if(confirm("제출하시겠습니까?") == true){
					
					$("#enrollForm").attr("action", "<%=request.getContextPath()%>/deptResourcesUpdate.or");
					$("#enrollForm").submit();
				}else{   
				   //취소 버튼 눌렀을 때 실행 할 코드
				   return false;
				}
			}
		}
	</script>
	
	<!-- 자료실 취소 버튼 -->
	<script>
		function cancelFunc(){
			location.href="<%=request.getContextPath()%>/deptResourcesList.or";
		}
	</script>
	
	<!-- 파일 삭제 -->
	<script>
		function deleteFile(num){
			console.log(num)
			
			if(confirm("첨부파일 삭제시 복구가 불가능합니다. 삭제하시겠습니까?") == false){
				return false;
			}
			
			if(num != ""){
				$.ajax({
					url:"deleteDeptrAttach.or",
					type:"post",
					data:{deptrAttachNo:num},
					success:function(result){
						if(result > 0){
							alert("첨부파일이 삭제되었습니다.");
							selectDeptList();
							$('#originDiv').html("")
						}else{
							console.log("첨부파일 삭제 실패");
						}	
					},error:function(){
						console.log("첨부파일 ajax 통신 실패");
					}
				});
				
			};
		}
	</script>
	
	<script>
	 	function selectDeptList(){
	 		var deptrNo = ${deptResources.deptrNo};
	 		$.ajax({
				url:"deptrAttachList.or",
				data:{deptrNo:deptrNo},
				type:"post",
				success:function(list){
					var value="";
					if(list != 0){
					$.each(list, function(i, obj){
						if(list != ""){
						value += "<i type='button' class='fas fa-trash-alt' style='color: red; background-color: none' onclick='deleteFile("+obj.deptrAttachNo+")'></i>" + 
								 "<span class='badge badge-info'>"+obj.deptrAttachOrigin+"</span>&nbsp;&nbsp;" + 
							     "</br>"
						} else{
							value += "첨부파일이 없습니다.";
						}
					});
					}
					$("#originDiv").html(value);
				},error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}; 
	</script>

</body>
</html>