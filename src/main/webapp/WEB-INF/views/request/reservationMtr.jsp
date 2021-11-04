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
							<input type="hidden" id="mMNo" name="mMNo"
								value="${mtr.mMNo }">
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
											<div class="card mt-2">
												<table class="table table-hover text-nowrap" id="mtrList">
													<thead>
														<tr align="center">
															<th colspan="3" align="center"><h5><b>회의실 목록</b></h5></th>
														</tr>
														<!-- 회의실 목록 -->
														<tr align="center">
															<!-- <th>No</th> -->
															<th width="20%">관리번호</th>
															<th width="40%">회의실 명</th>
															<th width="20%">수용인원</th>
														</tr>
													</thead>
													<tbody>
														<%--<c:forEach items="${ listMtr }" var="mtr"
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
									<div class="container">
									<div class="col-12">
										<div class="card">
											<table class="table table-hover text-nowrap" id="timeMtr">
												<thead>
													<tr align="center">
														<th colspan="4" align="center"><h5><b>예약 시간 선택</b></h5></th>
													</tr>
													<!-- 시간표 -->
													<tr align="center">
														<th width="30%">사용시간</th>
														<th width="20%">신청자</th>
														<th width="30%">용도</th>
														<th width="20%">삭제</th>
													</tr>
												</thead>
												<tbody id="timeMtrBody">
													<!-- 시간표 -->
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="9Checkbox" value="9" > 09:00~10:00</td>
														<td id="9Name"></td>
														<td id="9Use"></td>
														<td><button type="button" name="delMtrBtn" id="9Button" class="btn btn-default" style="display:none;" >삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="10Checkbox" value="10"> 10:00~11:00</td>
														<td id="10Name"></td>
														<td id="10Use"></td>
														<td><button type="button" name="delMtrBtn" id="10Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="11Checkbox" value="11"> 11:00~12:00</td>
														<td id="11Name"></td>
														<td id="11Use"></td>
														<td><button type="button" name="delMtrBtn" id="11Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="12Checkbox" value="12"> 12:00~13:00</td>
														<td id="12Name"></td>
														<td id="12Use"></td>
														<td><button type="button" name="delMtrBtn" id="12Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="13Checkbox"  value="13"> 13:00~14:00</td>
														<td id="13Name"></td>
														<td id="13Use"></td>
														<td><button type="button" name="delMtrBtn" id="13Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="14Checkbox" value="14"> 14:00~15:00</td>
														<td id="14Name"></td>
														<td id="14Use"></td>
														<td><button type="button" name="delMtrBtn" id="14Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="15Checkbox" value="15"> 15:00~16:00</td>
														<td id="15Name"></td>
														<td id="15Use"></td>
														<td><button type="button" name="delMtrBtn" id="15Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="16Checkbox" value="16"> 16:00~17:00</td>
														<td id="16Name"></td>
														<td id="16Use"></td>
														<td><button type="button" name="delMtrBtn" id="16Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="17Checkbox" value="17"> 17:00~18:00</td>
														<td id="17Name"></td>
														<td id="17Use"></td>
														<td><button type="button" name="delMtrBtn" id="17Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="18Checkbox" value="18"> 18:00~19:00</td>
														<td id="18Name"></td>
														<td id="18Use"></td>
														<td><button type="button" name="delMtrBtn" id="18Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="mRTime" id="19Checkbox" value="19"> 19:00~20:00</td>
														<td id="19Name"></td>
														<td id="19Use"></td>
														<td><button type="button" name="delMtrBtn" id="19Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="button" id="rsvMtrBtn" class="btn btn-primary" onclick="rsvMtr();">
											<i class="fas fa-clipboard-check"></i> 신청하기
										</button> 
						<!-- 				<button class="btn btn-primary"
											onclick="window.open('openRsv.mtr','회의실 예약하기','width=600,height=360,location=no,status=no,scrollbars=no');">
											<i class="fas fa-clipboard-check"> 신청하기</i>
										</button> -->
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
									changeMonth : false, // month 셀렉트박스 사용
									changeYear : false, // year 셀렉트박스 사용
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
										/* + "<td onclick='checkMtr(" + obj.mMNo + ")'>"+ (i + 1) + "</td>" */
 										+ "<td onclick='checkMtr(" + obj.mMNo  + ")'><input type='radio' name='mMNo' id='' value='"+ obj.mMNo +"' >&nbsp;&nbsp;"+ obj.mMNo + "</td>"
			/* 							+ "<td onclick='checkMtr(" + obj.mMNo  + ")'>" + obj.mMName + "</td>"
										+ "<td onclick='checkMtr(" + obj.mMNo  + ")'>" + obj.mMCapacity + "</td>" */
										+ "<td>" + obj.mMName + "</td>"
										+ "<td>" + obj.mMCapacity + "</td>" 
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
			
			//새로운 날짜&회의실 선택할때 값비우기
			for(var i =9; i <20; i ++){
				var iName = "#" + i + "Name";
				var iUse = "#" + i + "Use";
				var iCheckbox = "#" +  i + "Checkbox";
				var iButton = "#" + i + "Button";

				$(iName).text("");			
				$(iUse).text("");			
				$(iCheckbox).attr("disabled", false);			
				$(iButton).attr("style", "display:none");		
			}
			
			var mMNo = mMNo;
			var getDate = $.datepicker.formatDate("yy/mm/dd", $("#datepicker").datepicker("getDate"));
			
			// 예약된 시간표 가져오기
			$.ajax({
				url : "time.mtr",
				data : {
					mMNo : mMNo,
					getDate : getDate
				},
				dataType : "json",
				success : function(list) {

					$.each(list, function(i, obj) {

						for(var i =9; i <20; i ++){
							var iName = "#" + i + "Name";
							var iUse = "#" + i + "Use";
							var iCheckbox = "#" +  i + "Checkbox";
							var iButton = "#" + i + "Button";
							
							// 예약내용이 있으면 시간표에 나타내기
							if(obj.mRTime==i){							
								$(iName).text(obj.empName);
								$(iUse).text(obj.mRUsg);
								$(iCheckbox).attr("disabled", true);
								$(iButton).attr("style", "display:''");
								/* $(iButton).attr("onclick", "delRsvMtr("+ obj.mRNo +',"' + obj.rEmpNo+'","' +obj.mRDate +'","' + obj.mRTime + '");'); */
								/* $(iButton).attr("onclick", "delRsvMtr('"+ obj.mRNo +"');");
								console.log( obj.mRNo) */
								//alert(obj.rEmpNo)
								
								//예약자 = 작성자 일경우 삭제할 수 있도록
								 if(obj.rEmpNo == "${loginUser.empNo}"){ 
									$(iButton).attr("onclick", "delRsvMtr('"+ obj.mRNo +"');");
								}else if(obj.rEmpNo != "${loginUser.empNo}"){
									$(iButton).prop("style", "display:none");

								} 
								
							}
														
						}
						
						
						/* if(obj.mRTime==9){							
							$("#9Name").text(obj.empName);
							$("#9Use").text(obj.mRUsg);
							$("#9Checkbox").attr("disabled", true);
							$("#9Button").attr("style", "display:''");
						}else if(obj.mRTime==10){
							$("#10Name").text(obj.empName);
							$("#10Use").text(obj.mRUsg);
							$("#10Checkbox").attr("disabled", true);
							$("#10Button").attr("style", "display:''");
						}else if(obj.mRTime==11){
							$("#11Name").text(obj.empName);
							$("#11Use").text(obj.mRUsg);
							$("#11Checkbox").attr("disabled", true);
							$("#11Button").attr("style", "display:''");							
						}else if(obj.mRTime==12){
							$("#12Name").text(obj.empName);
							$("#12Use").text(obj.mRUsg);
							$("#12Checkbox").attr("disabled", true);
							$("#12Button").attr("style", "display:''");
						}else if(obj.mRTime==13){
							$("#13Name").text(obj.empName);
							$("#13Use").text(obj.mRUsg);
							$("#13Checkbox").attr("disabled", true);
							$("#13Button").attr("style", "display:''");
						}else if(obj.mRTime==14){
							$("#14Name").text(obj.empName);
							$("#14Use").text(obj.mRUsg);
							$("#14Checkbox").attr("disabled", true);
							$("#14Button").attr("style", "display:''");
						}else if(obj.mRTime==15){
							$("#15Name").text(obj.empName);
							$("#15Use").text(obj.mRUsg);
							$("#15Checkbox").attr("disabled", true);
							$("#15Button").attr("style", "display:''");
						}else if(obj.mRTime==15){
							$("#16Name").text(obj.empName);
							$("#16Use").text(obj.mRUsg);
							$("#16Checkbox").attr("disabled", true);
							$("#16Button").attr("style", "display:''");
						}else if(obj.mRTime==15){
							$("#17Name").text(obj.empName);
							$("#17Use").text(obj.mRUsg);
							$("#17Checkbox").attr("disabled", true);
							$("#17Button").attr("style", "display:''");
						}else if(obj.mRTime==15){
							$("#18Name").text(obj.empName);
							$("#18Use").text(obj.mRUsg);
							$("#18Checkbox").attr("disabled", true);
							$("#18Button").attr("style", "display:''");
						}else if(obj.mRTime==15){
							$("#19Name").text(obj.empName);
							$("#19Use").text(obj.mRUsg);
							$("#19Checkbox").attr("disabled", true);
							$("#19Button").attr("style", "display:''");
						} */	
								
					});

				},
				error : function() {
					console.log("timeMtr ajax 통신 실패");
				}
			});
		}
		// 예약 삭제하기	
		function delRsvMtr(mRNo){
				
				var mRNo = mRNo;
				alert(mRNo);
				
				$.ajax({
					url : "delRsv.Mtr",
					type : "post",
					data : {
						mRNo : mRNo,
					},
					success : function(result) {
						if (result == "??!") {
							alert("회의실 예약 삭제성공!");
							location.reload(true);//페이지 새로고침
							//location.href = location.href;
							//history.go(0);
						} else {
							alert("삭제 실패");
						}
					}
				});
		}
		
 		function rsvMtr(){

 			var mMNo = $("input:radio[name='mMNo']:checked").val();
 			var mRTime = $("input[name='mRTime']:checked").val();
	        var getDate = $.datepicker.formatDate("yy/mm/dd", $("#datepicker").datepicker("getDate"));
	        
	        if(mMNo==null){
	        	alert("회의실을 선택해 주세요!");
				return false;	        
	        }
	        if(mRTime==null){
	        	alert("시간을 선택해 주세요!");
				return false;	        
	        }
	        if(getDate==null){
	        	alert("날짜를 선택해 주세요!");
				return false;	        
	        }

	        confirm(getDate + "\n"+mRTime +" 시 부터 한시간동안 \n" + mMNo+ "번 회의실을  예약하시겠습니까?");        
	        var inputNumber = window.prompt("한 자리 숫자를 적어주세요.");
	        
	        
	        //frmData.action = "rsvMtr.jsp";
	        //frmData.submit();
	         
	    }  
		
	</script>

</body>

</html>