<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 신청페이지</title>
<link rel="stylesheet"
	href="./resources/plugins/datepicker/jquery-ui.css">
<script src="../plugins/jquery/jquery.min.js"></script>
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
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
								<h3 class="card-title">배차 신청</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-6">
											<!-- 사이드바 캘린더 -->
											<div class="calendar" style="padding: 0;">
												<div id="datepicker"></div>
											</div>
										</div>
										<div class="col-6">차량종류(체크박스/드롭박스)</div>
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
	function resevationMtrValidate() {
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("날짜를 선택해 주세요")
			return false;
		}
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("회의실을 선택해 주세요")
			return false;
		}
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("사용시간을 선택해 주세요")
			return false;
		}
		return true;
	}
</script>
<script>
	$(function() {
		$.datepicker.regional["ko"] = {
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			monthNames : [ "1월(JAN)", "2월(FEB)", "3월(MAR)", "4월(APR)",
					"5월(MAY)", "6월(JUN)", "7월(JUL)", "8월(AUG)", "9월(SEP)",
					"10월(OCT)", "11월(NOV)", "12월(DEC)" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			changeMonth : true, // month 셀렉트박스 사용
			changeYear : true, // year 셀렉트박스 사용
			weekHeader : "Wk",
			dateFormat : "yymmdd",
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : ""
		};
		$.datepicker.setDefaults($.datepicker.regional["ko"]);

		// Today 버튼 코드 추가
		$.datepicker._gotoToday = function(id) {
			$(id).datepicker('setDate', new Date());
			$(".ui-datepicker").hide().blur();
		};
	});
</script>

</html>