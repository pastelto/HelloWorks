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
<script src="../plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet"
	href="./resources/plugins/datepicker/jquery-ui.css">
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script>
<link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
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
<!-- 						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-car-tab" data-toggle="pill"
							href="#custom-tabs-five-car" role="tab"
							aria-controls="custom-tabs-five-car" aria-selected="false">배차신청</a></li> -->
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-equipment-tab" data-toggle="pill"
							href="#custom-tabs-five-equipment" role="tab"
							aria-controls="custom-tabs-five-equipment" aria-selected="false">비품신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-idCard-tab" data-toggle="pill"
							href="#custom-tabs-five-idCard" role="tab"
							aria-controls="custom-tabs-five-idCard" aria-selected="false">사원증신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-five-requestList-tab" data-toggle="pill"
							href="#custom-tabs-five-requestList" role="tab"
							aria-controls="custom-tabs-five-requestList"
							aria-selected="false">신청내역</a></li>
					</ul>
				</div>
				<!-- card body -->
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-five-tabContent">
						<div class="tab-pane fade show active"
							id="custom-tabs-five-meetingRoom" role="tabpanel"
							aria-labelledby="custom-tabs-five-meetingRoom-tab">
							<!-- 총무팀만 보이게 -->
							<div class="row float-right">
								<c:if test="${ loginUser.deptCode eq 'A2'}">
									<!-- 회의실관리 페이지로 -->
									<button class="btn btn-primary" id="manageMeetingRoom"
										onclick="location.href = 'manage.mtr' ">회의실관리</button>
								</c:if>
							</div>
							<br><br>
							<div>
								<!-- 회의실신청 -->
								<!-- 회의실 신청 페이지 인클루드 -->
								<jsp:include page="./reservationMtr.jsp" />
							</div>
						</div>
					<div class="tab-pane fade" id="custom-tabs-five-car"
							role="tabpanel" aria-labelledby="custom-tabs-five-car-tab">
							<!-- 총무팀만 보이게 -->
							<div class="row float-right">
								<c:if test="${ loginUser.deptCode eq 'A2'}">
									<!-- 차량관리 페이지로 -->
									<button class="btn btn-primary" id="manageCar"
										onclick="location.href = 'manage.car' ">차량관리</button>
								</c:if>
							</div>
							<br><br>
							<div>
								<!-- 배차신청 -->
								<!-- 차량 신청페이지 인클루드 -->
								<jsp:include page="./reservationCar.jsp" />
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-equipment"
							role="tabpanel" aria-labelledby="custom-tabs-five-equipment-tab">
							<!-- 비품신청폼 페이지 인클루드-->
							<jsp:include page="./equipmentRequestForm.jsp" />
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-idCard"
							role="tabpanel" aria-labelledby="custom-tabs-five-idCard-tab">
							<!-- 사원증 신청폼 페이지 인클루드-->
							<jsp:include page="./idCardRequestForm.jsp" />
						</div>
						<div class="tab-pane fade" id="custom-tabs-five-requestList"
							role="tabpanel"
							aria-labelledby="custom-tabs-five-requestList-tab">
							<!-- 신청내역리스트 페이지 인클루드-->
							<jsp:include page="./requestList.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>		
	</script>
		
		<!-- 미팅룸 예약 -->
		<script>
		$(document).ready(
				
				function() {
					$.ajax({
						url : "list.mtr",
						dataType : "json",
						success : function(list) {
							var valueMtr = ""; // 회의실신청 
							var valueCar = ""; // 차 신청
							
							for (var key in  list) { // HashMap에서 key 값을 뽑아옴!
							
							// key값이 listMtr일 때	
							if(key == "listMtr"){
									console.log("listMTR 탔음!");
 									console.log("obj listMTR?? " + list[key]);
 								$.each(list[key], function(key, obj){
 									console.log('key:' + key + ' / ' + 'value:' + obj);
 									console.log("mMno ? " + obj.mMNo);

 									valueMtr += "<tr align='center'>"
 										+ "<td onclick='checkMtr(" + obj.mMNo  + ")'><input type='radio' name='mMNo' value='"+ obj.mMNo +"' >&nbsp;&nbsp;"+ obj.mMNo + "</td>"
										+ "<td>" + obj.mMName + "</td>"
										+ "<td>" + obj.mMCapacity + "</td>" 
										+ "</tr>"; 
										
 									});

							
							} else if (key == "listCar"){ // key값이 listCar일 때
 									console.log("listCar 탔음!");
 									console.log("obj listCar?? " + list[key]);
 								$.each(list[key], function(key, obj){
 									console.log('key:' + key + ' / ' + 'value:' + obj);
 									console.log("cSNo ? " + obj.cSNo);
								
									valueCar += "<tr align='center'>"
										+ "<td onclick='checkCar(" + obj.cSNo  + ")'><input type='radio' name='cSNo' value='"+ obj.cSNo +"' >&nbsp;&nbsp;"+ obj.cMNo + "</td>"
										+ "<td>" + obj.cMMfr + "</td>"
										+ "<td>" + obj.cMName + "</td>" 
										+ "</tr>";
									});
							} // else if 끝
							
							$("#mtrList tbody").html(valueMtr); // 회의실 테이블 태그
							$("#carList tbody").html(valueCar); // 배차 테이블 태그
						} // for-each문 끝!
						}, // success
						error : function() {
							console.log("mtrList/carList ajax 통신 실패");
						}
						
					}); // ajax 끝
				} // function() 끝
		);
	</script>
</body>
</html>