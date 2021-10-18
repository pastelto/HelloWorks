<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청하기</title>
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
							<i class="fas fa-clipboard-list"></i><b> 신청하기</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<!-- 탭 화면 -->
		<div class="col-12">
			<div class="card card-outline card-info card-outline-tabs">
				<div class="card-header p-0 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-five-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="custom-tabs-five-meetingRoom-tab" data-toggle="pill"
							href="#custom-tabs-five-meetingRoom" role="tab"
							aria-controls="custom-tabs-five-meetingRoom" aria-selected="true">회의실신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-car-tab" data-toggle="pill"
							href="#custom-tabs-five-car" role="tab"
							aria-controls="custom-tabs-five-car" aria-selected="false">배차신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-equipment-tab" data-toggle="pill"
							href="#custom-tabs-five-equipment" role="tab"
							aria-controls="custom-tabs-five-equipment" aria-selected="false">비품신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-idCard-tab" data-toggle="pill"
							href="#custom-tabs-five-idCard" role="tab"
							aria-controls="custom-tabs-five-idCard" aria-selected="false">사원증신청</a></li>
						<c:if test="${ loginUser.deptCode eq 'A2'}"> <!-- 총무과이거나 작성자일때만 보이게 -->
							<li class="nav-item"><a class="nav-link"
								id="custom-tabs-five-requestList-tab" data-toggle="pill"
								href="#custom-tabs-five-requestList" role="tab"
								aria-controls="custom-tabs-five-requestList"
								aria-selected="false">신청내역</a></li>
						</c:if>
					</ul>
				</div>
				<!-- card body -->
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-five-tabContent">
						<div class="tab-pane fade show active"
							id="custom-tabs-five-meetingRoom" role="tabpanel"
							aria-labelledby="custom-tabs-five-meetingRoom-tab">
							<!-- 회의실신청 -->
							<div class="card">
								<!-- 달력 -->
								<!-- 회의실종류 카드 -->
								<!-- 시간선택 테이블/ 리스트 가져오기-->
								<c:if test="${ loginUser.deptCode eq 'A2'}">
									<div class="card-footer clearfix">
										<div class="col-md-1 float-right">
											<!-- 회의실관리 페이지로 -->
											<button class="btn btn-block btn-outline-info m-0 "
												id="manageMeetingRoom" onclick="location.href = 'manage.mtr' ">회의실관리</button>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-car"
							role="tabpanel" aria-labelledby="custom-tabs-five-car-tab">
							<!-- 배차신청 -->
							<div class="card">
								<!-- 달력 -->
								<!-- 차량종류 카드 -->
								<!-- 시간선택 테이블/ 리스트 가져오기-->
								<c:if test="${ loginUser.deptCode eq 'A2'}">
									<div class="card-footer clearfix">
										<div class="col-md-1 float-right">
											<!-- 차량관리 페이지로 -->
											<button class="btn btn-block btn-outline-info m-0 "
												id="manageCar" onclick="location.href = 'manage.car' ">차량관리</button>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-equipment"
							role="tabpanel" aria-labelledby="custom-tabs-five-equipment-tab">
							<!-- 비품신청 -->
								<!-- 비품신청폼 페이지 인클루드-->
								<jsp:include page="./equipmentRequestForm.jsp" />
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-idCard"
							role="tabpanel" aria-labelledby="custom-tabs-five-idCard-tab">
							<!-- 사원증신청 -->
							<div class="card">
								<!-- 사원증 신청폼 페이지 인클루드-->
								<jsp:include page="./idCardRequestForm.jsp" />						
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-requestList"
							role="tabpanel"
							aria-labelledby="custom-tabs-five-requestList-tab">
							<!-- 신청내역 -->
							<div class="card">
								<!-- 신청내역리스트 페이지 인클루드-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>