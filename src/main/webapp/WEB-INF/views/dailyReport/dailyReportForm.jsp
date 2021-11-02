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
							<i class="nav-icon fas fa-edit"></i><b> 일일보고 작성</b>
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
								<b>일일보고</b>
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
												<input type="hidden" name="drWriterNo" id="drWriterNo" value="${ loginUser.empNo }">
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
													<input type="radio" id="DR" value="D" name="drCategory" checked> 일일보고
													&nbsp;&nbsp;&nbsp;
													<input type="radio" id="WR" value="W" name="drCategory"> 주간보고
													&nbsp;&nbsp;&nbsp;
													<input type="radio" id="MR" value="M" name="drCategory"> 월간보고
												</td>
											</tr>
											<tr>
												<th>수신직원</th>
												<td colspan="3">
												<div class="row m-0">
													<button id="addressBook" type="button" class="btn btn-default btn-xs" onclick="popupAddressBook()">주소록</button>
													&nbsp;
													<button id="searchEmp" type="button" class="btn btn-default btn-xs" onclick="popupSearchEmp()">직원 검색</button>
												&nbsp;&nbsp;
												<div id="receiveListDiv">
												<input type="hidden" id="checking" name="checking">
												<!-- <b><span class="badge badge-info" id="receiveListTag"></span></b>
												<input type="text" id="receiveListKey" name="drReceiverList">
												<b><span class="badge badge-info" id="receiveDeptTag"></span></b> -->
												</div>
												
													
												</div>
												</td>
											</tr>
											<tr>
												<th>참조</th>
												<td colspan="3">
												<div id="refListDiv">
												
												<!-- <b><span class="badge badge-warning" id="refListTag"></span></b>
												<input type="text" id="refListKeyTag" name="drRefList">
												<b><span class="badge badge-warning" id="refDeptTag"></span></b> -->
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
													<c:if test="${ !empty dailyReport.drAttachOrigin }">
							                            <span class="badge badge-info" id="reportAttachName">${ dailyReport.drAttachOrigin }</span>
							                            <input type="hidden" name="changeName" value="${ b.drAttachChange }">
							                            <input type="hidden" name="originName" value="${ dailyReport.drAttachOrigin }">
							                            <div class="btn btn-default btn-file btn-xs">
									                    	<i class="fas fa-paperclip"></i> 첨부파일
									                    	<input type="file" name="uploadFile" id="reportAttach">
									                  </div> 
						                            </c:if>
						                            <c:if test="${ empty dailyReport.drAttachOrigin }">
							                            <span class="badge badge-info" id="reportAttachName"></span>
							                            <div class="btn btn-default btn-file btn-xs">
										                    <i class="fas fa-paperclip"></i> 첨부파일
										                    <input type="file" name="uploadFile" id="reportAttach">
									                    </div> 
						                            </c:if>
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote" name="drContent">${ dailyReport.drContent }</textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm" onclick="tempSave()">임시저장</button>
									&nbsp;
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
		$("#reportAttach").on("change", function() {
			var filename = $(this)[0].files[0].name;
			$('#reportAttachName').text(filename);
		});
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
	
	<!-- 일일보고 발송 버튼 -->
	<script>
		function submitFunc(){
			//var check = $("input[name=checking]").val()
			
			//alert($("input[name=drCategory]:checked").val())
			
			if($("input[name=checking]").val() == ""){
				alert("수신직원을 선택해주세요.")
			}else if($("input[name=drTitle]").val()==""){
				alert("제목을 입력해주세요.")
			}else if($("#summernote").val()==""){
				alert("내용을 입력해주세요.")
			}else{
				if(confirm("저장 후 수정이 불가합니다. 제출하시겠습니까?") == true){
					
					$("#enrollForm").attr("action", "<%=request.getContextPath()%>/insertDailyReport.dr");
					$("#enrollForm").submit();
				}else{   
				   //취소 버튼 눌렀을 때 실행 할 코드
				   return false;
				}
			}
			
		}
	</script>
	
	<!-- 일일보고 임시저장 버튼 -->
	<script>
		function tempSave(){
			
			$("#enrollForm").attr("action", "<%=request.getContextPath()%>/tempSaveDailyReport.dr");
			$("#enrollForm").submit();
			
		}
	</script>
	
	<!-- 일일보고 취소 버튼 -->
	<script>
		function cancelFunc(){
			
			$("#enrollForm").attr("action", "<%=request.getContextPath()%>/cancelDailyReport.dr");
			$("#enrollForm").submit();
			
		}
	</script>
	
	<!-- 일일 보고 유형 임시저장 값 -->
	<script>
	   	$(function(){
	   		if("${dailyReport.drCategory}" == "D"){
	   			$("#DR").attr("checked", true);
	   		}else if("${dailyReport.drCategory}" == "W"){
	   			$("#WR").attr("checked", true);
	   		}else if("${dailyReport.drCategory}" == "M"){
	   			$("#MR").attr("checked", true);
	   		}
	   	});
   </script>
	
</body>
</html>