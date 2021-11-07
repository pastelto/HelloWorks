<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품 신청 양식</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto;
}
</style>
</head>
<body>
	<div class="card card-outline card-info ">
		<div class="card-header p-0 border-bottom-0">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<form method="post" id="eRequestForm" action="request.eq"
							enctype="multipart/form-data" onsubmit="return submitValidate();">
							<input type="hidden" id="empNo" name="empNo"
								value="${ loginUser.empNo }">
							<div class="card-header">
								<h3 class="card-title">비품 신청서</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-3">
											<label>신청일시</label>
										</div>
										<div class="col-9">
											<div class="float-right">												
												<c:set var="now" value="<%=new java.util.Date()%>"/>
												<c:set var="sysdate">
													<fmt:formatDate value="${now}" pattern="yyyy년  MM월 dd일  HH시  mm분"/>
												</c:set>
												<label>
													<c:out value="${sysdate}"/>
												</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>신청자</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="empName" name="empName"
													value="${loginUser.empName}" class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>부서명</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="deptDname" name="deptDname"
													value="${loginUser.deptDname}" class="form-control"
													readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>직급명</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="jobName" name="jobName"
													value="${loginUser.jobName}" class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>사용장소</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input type="text" id="place" name="place"
													class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>사용목적</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input type="text" id="usage" name="usage"
													class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>사용기간</label>
										</div>
										<div class="col-3">
											<!-- 시작일시 -->
											<div class="form-group">
												<input type="date" name="sDate" class="form-control"
													id="sDate">
											</div>
										</div>
										<div class="col-1">
											<label> 부터</label>
										</div>
										<div class="col-3">
											<!-- 종료일시 -->
											<div class="form-group">
												<input type="date" name="eDate" class="form-control"
													id="eDate">
											</div>
										</div>
										<div class="col-1">
											<label> 까지</label>
										</div>
									</div>
									<!-- 비품종류 -->
									<div class="row">
										<div class="col-3">
											<label>비품종류</label>
										</div>
										<div class="col-9">
											<!-- <div class="container-fluid"> -->
												<div class="row">
													<div class="col-3">
														<input type="radio" name="eqName" value="빔프로젝트" id="eqName1" checked><label> 빔프로젝트</label>
													</div>
													<div class="col-3">
														<input type="radio" name="eqName" value="화이트보드" id="eqName2"><label> 화이트보드</label>
													</div>
													<div class="col-3">
														<input type="radio" name="eqName" value="카메라" id="eqName3"><label> 카메라</label>
													</div>
													<div class="col-3">
														<input type="radio" name="eqName" value="노트북" id="eqName4"><label> 노트북</label>
													</div>
												</div>
											<!-- </div> -->
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>기타 요청사항</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<textarea class="form-control" id="addRequest"
													name="addRequest" rows="3"></textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<div class="alert alert-light" role="alert">
												<label>
													[주의사항] <br> 
													1. 사용일시가 중복될 경우 접수순과 중요성을 고려하여 결정합니다.<br>
													2. 사용이 끝나면 즉시 총무팀으로 반납하여야 합니다.<br> 
													3. 기타 비품은 총무팀에서 심사후 신청인에게 결과 통보합니다.<br>
												</label>
											</div>
										</div>
									</div>
									<!-- /.container -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="submit" id="submitBtn" class="btn btn-primary">
											<i class="fas fa-clipboard-check"></i> 신청하기
										</button>
									</div>
									<button type="reset" class="btn btn-default">
										<i class="fas fa-times"></i> 취소하기
									</button>
								</div>
							</div>
							<!-- /.card-footer -->
							<!-- /.card -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	/* 	$('input[type="date"]').on('click', function() {
	 var sDate = $("#sDate").val();
	 console.log("시작 : " + sDate);

	 var eDate = $("#eDate").val();
	 console.log("끝 : " + eDate);
	 }); */
 	

	function submitValidate() {
		if (($('#place').val() == "")) {
			$("#eRequestForm input[name=place]").focus();
			alert("사용장소를 입력해 주세요")
			return false;
		}
		if (($('#usage').val() == "")) {
			$("#eRequestForm input[name=usage]").focus();
			alert("사용목적을 입력해 주세요")
			return false;
		}
		if (($('#sDate').val() == "")) {
			$("#eRequestForm input[name=sDate]").focus();
			alert("시작날짜를 입력해 주세요")
			return false;
		}
		if (($('#eDate').val() == "")) {
			$("#eRequestForm input[name=eDate]").focus();
			alert("종료날짜를 입력해 주세요")
			return false;
		} 
		return true;
	}
</script>
</html>