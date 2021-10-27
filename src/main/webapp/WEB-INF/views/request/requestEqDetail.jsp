<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품 신청 상세내용</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<h4>
							<i class="fas fa-clipboard-list"></i><b> 비품 신청 상세</b>
						</h4>
					</div>
					<div class="col-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="request.menu">신청페이지</a></li>
							<li class="breadcrumb-item active">비품 신청 상세</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<div class="card card-outline card-info ">
			<div class="card-header p-0 border-bottom-0">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card-header">
								<h3 class="card-title">비품 신청 상세</h3>
								<div class="float-right">
									<c:if
										test="${ (loginUser.deptCode eq 'A2'|| loginUser.empNo eq requestEq.empNo) && requestEq.erCondition eq '제출'}">
										<div class="float-letf">
											<button class="btn btn-default" id="deleteOneEqBtn" onclick="deleteOneEq(${ requestEq.requestEqNo });">
												<i class="far fa-trash-alt"> 삭제</i>
											</button>
										</div>
									</c:if>
								</div>
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
												<input id=requestDate name="requestDate"
													value="${requestEq.requestDate}" class="form-control"
													readonly>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-3">
											<label>신청자</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="empName" name="empName"
													value="${requestEq.empName}" class="form-control" readonly>
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
													value="${requestEq.deptDname}" class="form-control"
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
													value="${requestEq.jobName}" class="form-control" readonly>
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
													value="${requestEq.place}" class="form-control" readonly>
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
													value="${requestEq.usage}" class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-3">
											<label>사용기간</label>
										</div>
										<div class="col-3">
											<input id="sDate" name="sDate" value="${requestEq.SDate}"
												class="form-control" readonly>
										</div>
										<div class="col-1">
											<label> 부터</label>
										</div>
										<div class="col-3">
											<input id="eDate" name="eDate" value="${requestEq.EDate}"
												class="form-control" readonly>
										</div>
										<div class="col-1">
											<label> 까지</label>
										</div>
									</div>
									<br>
									<!-- 비품종류 -->
									<div class="row">
										<div class="col-3">
											<label>비품종류</label>
										</div>
										<div class="col-9">
											<input id="eDate" name="eDate" value="${requestEq.eqName}"
												class="form-control" readonly>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-3">
											<label>기타 요청사항</label>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="eDate" name="eDate"
													value="${requestEq.addRequest}" class="form-control"
													readonly>
											</div>
										</div>
									</div>
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<c:if test="${ loginUser.deptCode eq 'A2'}">
										<button class="btn btn-default" id="cancelOneEqBtn" onclick="cancelOneEq(${ requestEq.requestEqNo });">
											<i class="fas fa-times"></i>승인취소
										</button>
										<div class="float-right">
											<button class="btn btn-primary" id="confirmOneEqBtn" onclick="confirmOneEq(${ requestEq.requestEqNo });">
												<i class="far fa-circle"></i>승인완료
											</button>
										</div>
									</c:if>
								</div>
							</div>
							<!-- /.card-footer -->
							<!-- /.card -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script type="text/javascript">
		
		//비품 제출 -> 승인완료
		function confirmOneEq(requestEqNo) {
			/* alert(requestEqNo);
			console.log(requestEqNo);	 */	
			//var requestEqNo = requestEqNo;
 			$.ajax({
				url : "confirmOne.eq",
				type : "post",
				data : {
					requestEqNo : requestEqNo
				},
				success : function(result) {
					if (result == "??!") {
						alert("비품신청 승인완료 처리성공!");
						//location.reload(true);
						location.href = "request.menu"; //페이지 새로고침
						//history.go(0);
					}
				}
			});
 		}
		// 비품 제출 -> 승인취소
		function cancelOneEq(requestEqNo) {
			/* alert(requestEqNo);
			console.log(requestEqNo);	 */	
			//var requestEqNo = requestEqNo;
 			$.ajax({
				url : "cancelOne.eq",
				type : "post",
				data : {
					requestEqNo : requestEqNo
				},
				success : function(result) {
					if (result == "??!") {
						alert("비품신청 승인취소 처리성공!");
						//location.reload(true);
						location.href = "request.menu"; //페이지 새로고침
						//history.go(0);
					}
				}
			});
 		}
	
		//비품 신청 삭제(제출인 상태만 삭제) 
		function deleteOneEq(requestEqNo) {
			/* alert(requestEqNo);
			console.log(requestEqNo);	 */	
			//var requestEqNo = requestEqNo;
 			$.ajax({
				url : "deleteOne.eq",
				type : "post",
				data : {
					requestEqNo : requestEqNo
				},
				success : function(result) {
					if (result == "??!") {
						alert("비품신청 삭제성공!");
						//location.reload(true);
						location.href = "request.menu"; //페이지 새로고침
						//history.go(0);
					}
				}
			});
 		}
	</script>
</body>
</html>