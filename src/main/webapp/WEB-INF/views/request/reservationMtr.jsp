<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 신청페이지</title>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- <script src="../plugins/jquery/jquery.min.js"></script> -->
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
	<div class="card card-outline card-info ">
		<div class="card-header p-0 border-bottom-0">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<form method="post" id="reservationMtrForm"
							action="reservation.mtr" enctype="multipart/form-data"
							onsubmit="return resevationMtrValidate();">
							<input type="hidden" id="empNo" name="empNo"
								value="${ loginUser.empNo }">
							<div class="card-header">
								<h3 class="card-title">회의실 신청</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-6">
											<!-- 사이드바 캘린더 -->
											<div class="calendar col-12">
												<div id="datepicker"></div>
											</div>
										</div>
										<div class="col-6">
											<div class="card">
												<table class="table table-hover text-nowrap" id="mtrList">
													<tbody>
														<%-- 														<c:forEach items="${ listMtr }" var="mtr"
															varStatus="status">
															<tr align="center">
																<td>${ status.count }</td>
																<td>${ mtr.mMName }</td>
																<td>${ mtr.mMCapacity }</td>
															</tr>
														</c:forEach> --%>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- /.container -->
								</div>
								<div>
								<br>
									<div class="col-12">
										<div class="card">
											<table class="table table-hover text-nowrap" id="timeMtr">
												<thead>
												<tr>
												<th colspan="4">예약 시간 선택</th>
												</tr>													
													<!-- 시간표 -->
													<tr align="center">
														<th>사용시간</th>
														<th>신청자</th>
														<th>용도</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<!-- 시간표 -->

													<tr align="center">
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
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
	<script>
		$(document).ready(
			function() {
				$(function() {

					$.datepicker.regional["ko"] = {
						closeText : "닫기",
						prevText : "이전달",
						nextText : "다음달",
						currentText : "오늘",
						monthNames : [ "1월(JAN)", "2월(FEB)",
								"3월(MAR)", "4월(APR)", "5월(MAY)",
								"6월(JUN)", "7월(JUL)", "8월(AUG)",
								"9월(SEP)", "10월(OCT)", "11월(NOV)",
								"12월(DEC)" ],
						monthNamesShort : [ "1월", "2월", "3월", "4월",
								"5월", "6월", "7월", "8월", "9월",
								"10월", "11월", "12월" ],
						dayNames : [ "일", "월", "화", "수", "목", "금",
								"토" ],
						dayNamesShort : [ "일", "월", "화", "수", "목",
								"금", "토" ],
						dayNamesMin : [ "일", "월", "화", "수", "목",
								"금", "토" ],
						changeMonth : true, // month 셀렉트박스 사용
						changeYear : true, // year 셀렉트박스 사용
						weekHeader : "Wk",
						dateFormat : "yy/mm/dd",
						firstDay : 0,
						isRTL : false,
						showMonthAfterYear : true,
						yearSuffix : "",
						onSelect : function(dateText, inst) {
							var date = $(this).val();
						}

					};
					$.datepicker
							.setDefaults($.datepicker.regional["ko"]);

					// Today 버튼 코드 추가
					$.datepicker._gotoToday = function(id) {
						$(id).datepicker('setDate', new Date());
						$(".ui-datepicker").hide().blur();
					};
				});
				$("#datepicker").datepicker();
			});
	</script>
	<script>
		$(document).ready(
				function() {
					$.ajax({
						url : "list.mtr",
						dataType : "json",
						success : function(list) {
							var value = "";
							$.each(list, function(i, obj) {

								value += "<tr align='center'>"

								+ "<td onclick='checkMtr(" + obj.mMNo + ")'>"+ (i + 1) + "</td>"
								+ "<td onclick='checkMtr(" + obj.mMNo + ")'>" + obj.mMName + "</td>"
								+ "<td onclick='checkMtr(" + obj.mMNo + ")'>" + obj.mMCapacity + "</td>"
								+ "</tr>";

							});

							$("#mtrList tbody").html(value);

						},
						error : function() {
							console.log("mtrList ajax 통신 실패");
						}
					});
				});
	</script>
	<script>
		function checkMtr(mMNo) {

			var mMNo = mMNo;
			var getDate = $.datepicker.formatDate("yy/mm/dd", $("#datepicker").datepicker("getDate"));
			//alert(mMNo + "/" + getDate);
			
			$.ajax({
				url : "time.mtr",
				data:{
					mMNo : mMNo,
					getDate : getDate  
				  },
				dataType : "json",
				success : function(list) {
					var value = "";
					$.each(list, function(i, obj) {

						value += "<tr align='center'>"
								+ "<td onclick='checkMtr(" + obj.mRTime + ")'>" + obj.mRTime+ "</td>" 
								+ "<td onclick='checkMtr(" + obj.empName + ")'>" + obj.empName + "</td>"
								+ "<td onclick='checkMtr(" + obj.mMCapacity + ")'>" + obj.mMCapacity + "</td>"
								+ "<td onclick='checkMtr(" + obj.mMNo + ")'>"
								+ obj.mMCapacity + "</td>" + "</tr>";
					});
					$("#timeMtr tbody").html(value);
				},
				error : function() {
					console.log("timeMtr ajax 통신 실패");
				}
			});
		}
	</script>

</body>

</html>