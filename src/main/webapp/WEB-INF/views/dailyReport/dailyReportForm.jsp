<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일보고</title>

<!-- naver Editor -->
<script type="text/javascript" src="./resources/plugins/smarteditor/js/service/HuskyEZCreator.js"></script>

<style>
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

						<form id="enrollForm" method="post" action="insertDailyReport.dr" enctype="multipart/form-data">

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>작성자</th>
												<td style="width: 35%;">
												&nbsp;
												로그인 유저 이름 들어갈 예정
												</td>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
													<c:out value="${sysdate}" />
												 </td>
											</tr>
											<tr>
												<th>보고유형</th>
												<td colspan="3">
													&nbsp;
													<input type="radio" value="daily" name="reportType" checked> 일일보고
													&nbsp;&nbsp;&nbsp;
													<input type="radio" value="weekly" name="reportType"> 주간보고
													&nbsp;&nbsp;&nbsp;
													<input type="radio" value="monthly" name="reportType"> 월간보고
												</td>
											</tr>
											<tr>
												<th>수신직원</th>
												<td colspan="3">
												&nbsp;&nbsp;
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
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<input type="text" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
													<span class="badge badge-info" id="reportAttachName"></span>
									                  <div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input type="file" name="reportAttach" id="reportAttach">
									                  </div> 
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea name="editor" id="editor" style="width: 100%; height: 400px;"></textarea>

									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm">등록</button>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm" >취소</button>
									&nbsp;
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>
	</div>



	<!-- naver editor -->
	<script>
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "./resources/plugins/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼
	    $("#submitBtn").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#enrollForm").submit();
	    })
	})

	</script>
	
	<!-- 첨부파일 라벨 이름 추가 -->
	<script>
		$("#reportAttach").on("change", function() {
			var filename = $(this)[0].files[0].name;
			$('#reportAttachName').text(filename);
		});
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>