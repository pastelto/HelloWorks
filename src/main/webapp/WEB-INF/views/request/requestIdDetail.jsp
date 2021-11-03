<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원증 신청 상세페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto;
}
/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
.fileRegiBtn input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
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
						<i class="fas fa-clipboard-list"></i><b> 사원증 신청 상세</b>
					</h4>
				</div>
				<div class="col-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="request.menu">신청페이지</a></li>
						<li class="breadcrumb-item active">사원증 신청 상세</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<div class="card card-outline card-info">
		<div class="card-header p-0 border-bottom-0">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card-header">
							<h3 class="card-title">사원증 신청서</h3>
							<div class="float-right">
								<c:if test="${ (loginUser.deptCode eq 'A2'|| loginUser.empNo eq requestId.empNo) && requestId.irCondition eq '제출'}">
									<div class="float-letf">
										<button class="btn btn-default" id="deleteOneIdBtn" onclick="deleteOneId(${ requestId.requestIdNo });">
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
									<div class="col-9">
										<div class="row">
											<div class="col-3">
												<label>신청일시</label>
											</div>
											<div class="col-9">
												<div class="form-group">
													<input id="requestDate" name="requestDate"
													value="${requestId.requestDate}" class="form-control" readonly>
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-3">
												<label>한글이름</label>
											</div>
											<div class="col-3">
												<div class="form-group">
													<input id="empKName" name="empKName"
													value="${requestId.empKName}" class="form-control" readonly>
												</div>
											</div>
											<div class="col-3">
												<label>영문이름</label>
											</div>
											<div class="col-3">
												<div class="form-group">
													<input id="empEName" name="empEName"
													value="${requestId.empEName}" class="form-control" readonly>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-3">
												<label>부서명</label>
											</div>
											<div class="col-3">
												<div class="form-group">
													<input id="deptDname" name="deptDname"
														value="${requestId.deptDname}" class="form-control"
														readonly>
												</div>
											</div>
											<div class="col-3">
												<label>직급명</label>
											</div>
											<div class="col-3">
												<div class="form-group">
													<input id="jobName" name="jobName"
														value="${requestId.jobName}" class="form-control"
														readonly>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-3">
												<label>사번</label>
											</div>
											<div class="col-3">
												<div class="form-group">
													<input id="empNo" name="empNo"
														value="${requestId.empNo}" class="form-control"
														readonly>
												</div>
											</div>
											<div class="col-3">
												<label>발급종류</label>
											</div>
											<div class="col-3">
												<label> 
													<input id="iRkind" name="iRkind"
													value="${requestId.IRkind}" class="form-control"
													readonly>
												</label>
											</div>
										</div>
										<br>
											<div class="row">
											<div class="col-12">
												<div class="alert alert-light" role="alert">
													<label> [사원증 발급 유의사항] <br> 
														1. 총무팀에서 승인처리 전(제출상태)에만 삭제가 가능합니다. <br> 
														2. 신청인 본인 및 총무팀에서만 삭제가 가능합니다. <br> 
														3. 추가 문의사항은 총무팀에 연락주시기 바랍니다(내선번호 : 02-413-2000/ 02-413-2001) <br>
													</label>
												</div>
											</div>
										</div> 
									</div>
									<div class="col-3">
										<!-- 이미지파일 등록 -->
										<div class="col-3">
											<!-- 이미지 들어오는 부분 -->
											<div class="selectCover">
												<img id="uploadImg" src="resources/upload_files/${requestId.chgPic}"
													style="width: 160px; height: 200px;" />
											</div>
										</div>
										<div class="col-9">
											<div class="form-group">
												<input id="orgPic" name="orgPic" class="form-control"
													value="${requestId.orgPic}" readonly>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/. container -->								
							<div class="card-footer">
								<c:if test="${ loginUser.deptCode eq 'A2' && requestId.irCondition eq '제출'}">
									<button class="btn btn-default" id="cancelOneIdBtn" onclick="cancelOneId(${ requestId.requestIdNo });">
										<i class="fas fa-times"></i>승인취소
									</button>
									<div class="float-right">
										<button class="btn btn-primary" id="confirmOneIdBtn" onclick="confirmOneId(${ requestId.requestIdNo });">
											<i class="far fa-circle"></i>승인완료
										</button>
									</div>
								</c:if>
							</div>
							<!-- /.card-footer -->
						</div>
						<!-- /.card-body -->							
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
	//사원증 제출 -> 승인완료
	function confirmOneId(requestIdNo) {
			$.ajax({
			url : "confirmOne.id",
			type : "post",
			data : {
				requestIdNo : requestIdNo
			},
			success : function(result) {
				if (result == "??!") {
					alert("사원증신청 승인완료 처리성공!");
					location.href = "request.menu"; //페이지 새로고침
				}
			}
		});
		}
	//사원증 제출 -> 승인취소
	function cancelOneId(requestIdNo) {
			$.ajax({
			url : "cancelOne.id",
			type : "post",
			data : {
				requestIdNo : requestIdNo
			},
			success : function(result) {
				if (result == "??!") {
					alert("사원증신청 승인취소 처리성공!");
					location.href = "request.menu"; //페이지 새로고침
				}
			}
		});
		}

	//사원증 신청 삭제(제출인 상태만 삭제) 
	function deleteOneId(requestIdNo) {
			$.ajax({
			url : "deleteOne.id",
			type : "post",
			data : {
				requestIdNo : requestIdNo
			},
			success : function(result) {
				if (result == "??!") {
					alert("사원증신청 삭제성공!");
					location.href = "request.menu"; //페이지 새로고침
				}
			}
		});
	}
	</script>
</body>
</html>