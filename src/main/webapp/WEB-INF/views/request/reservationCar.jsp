<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 신청페이지</title>
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
						<form method="post" id="reservationCarForm"
							action="reservation.car" enctype="multipart/form-data">
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
											<div class="calendar col-12">
												<div id="datepicker2"></div>
											</div>
										</div>
										<div class="col-6">
											<div class="card mt-2">
												<table class="table table-hover text-nowrap" id="carList">
													<thead>
														<tr align="center">
															<th colspan="3" align="center"><h5><b>차량 목록</b></h5></th>
														</tr>
														<tr align="center">
															<th width="35%">차량 번호</th>
															<th width="30%">제조사</th>
															<th width="35%">차량 명</th>
														</tr>
													</thead>
													<tbody>
													<!-- 차량 목록 -->
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
											<table class="table table-hover text-nowrap" id="timeCar">
												<thead>
													<tr align="center">
														<th colspan="6" align="center"><h5><b>예약 시간 선택</b></h5></th>
													</tr>
													<!-- 시간표 -->
													<tr align="center">
														<th width="20%">사용시간</th>
														<th width="15%">신청자</th>
														<th width="15%">목적지</th>
														<th width="20%">용도</th>
														<th width="15%">동승자</th>
														<th width="15%">삭제</th>
													</tr>
												</thead>
												<tbody id="timeCarBody">
													<!-- 시간표 -->
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="9Checkbox" value="9" > 09:00~10:00</td>
														<td id="9Name"></td>
														<td id="9Dest"></td>
														<td id="9Use"></td>
														<td id="9Psng"></td>
														<td><button type="button" name="delCarBtn" id="9Button" class="btn btn-default" style="display:none;" >삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="10Checkbox" value="10"> 10:00~11:00</td>
														<td id="10Name"></td>
														<td id="10Dest"></td>
														<td id="10Use"></td>
														<td id="10Psng"></td>
														<td><button type="button" name="delCarBtn" id="10Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="11Checkbox" value="11"> 11:00~12:00</td>
														<td id="11Name"></td>
														<td id="11Dest"></td>
														<td id="11Use"></td>
														<td id="11Psng"></td>
														<td><button type="button" name="delCarBtn" id="11Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="12Checkbox" value="12"> 12:00~13:00</td>
														<td id="12Name"></td>
														<td id="12Dest"></td>
														<td id="12Use"></td>
														<td id="12Psng"></td>
														<td><button type="button" name="delCarBtn" id="12Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="13Checkbox"  value="13"> 13:00~14:00</td>
														<td id="13Name"></td>
														<td id="13Dest"></td>
														<td id="13Use"></td>
														<td id="13Psng"></td>
														<td><button type="button" name="delCarBtn" id="13Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="14Checkbox" value="14"> 14:00~15:00</td>
														<td id="14Name"></td>
														<td id="14Dest"></td>
														<td id="14Use"></td>
														<td id="14Psng"></td>
														<td><button type="button" name="delCarBtn" id="14Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="15Checkbox" value="15"> 15:00~16:00</td>
														<td id="15Name"></td>
														<td id="15Dest"></td>
														<td id="15Use"></td>
														<td id="15Psng"></td>
														<td><button type="button" name="delCarBtn" id="15Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="16Checkbox" value="16"> 16:00~17:00</td>
														<td id="16Name"></td>
														<td id="16Dest"></td>
														<td id="16Use"></td>
														<td id="16Psng"></td>
														<td><button type="button" name="delCarBtn" id="16Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="17Checkbox" value="17"> 17:00~18:00</td>
														<td id="17Name"></td>
														<td id="17Dest"></td>
														<td id="17Use"></td>
														<td id="17Psng"></td>
														<td><button type="button" name="delCarBtn" id="17Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="18Checkbox" value="18"> 18:00~19:00</td>
														<td id="18Name"></td>
														<td id="18Dest"></td>
														<td id="18Use"></td>
														<td id="18Psng"></td>
														<td><button type="button" name="delCarBtn" id="18Button" class="btn btn-default" style="display:none;">삭제</button></td>
													</tr>
													<tr align="center">
														<td><input type="checkbox" name="cRTime" id="19Checkbox" value="19"> 19:00~20:00</td>
														<td id="19Name"></td>
														<td id="19Dest"></td>
														<td id="19Use"></td>
														<td id="19Psng"></td>
														<td><button type="button" name="delCarBtn" id="19Button" class="btn btn-default" style="display:none;">삭제</button></td>
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
										<button type="button" id="rsvCarBtn" class="btn btn-primary" onclick="rsvCar();">
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
		$(document).ready(function() {
						
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
							$("#datepicker2").datepicker();
						});
	</script>

	<script>
		
	function checkCar(cMNo) {
			
			alert("checkCar!!" + cMNo);
			//새로운 날짜&회의실 선택할때 값비우기
			for(var i =9; i <20; i ++){
				var iName = "#" + i + "Name";
				var iUse = "#" + i + "Use";
				var iDest = "#" + i + "Dest";
				var iPsng = "#" + i + "Psng";
				var iCheckbox = "#" +  i + "Checkbox";
				var iButton = "#" + i + "Button";

				$(iName).text("");			
				$(iUse).text("");			
				$(iDest).text("");			
				$(iPsng).text("");			
				$(iCheckbox).attr("disabled", false);			
				$(iButton).attr("style", "display:none");		
				
			}
			
			var cMNo = cMNo;
			var getDate = $.datepicker.formatDate("yy/mm/dd", $("#datepicker2").datepicker("getDate"));
			
			// 예약된 시간표 가져오기
			$.ajax({
				url : "time.car",
				data : {
					cMNo : cMNo,
					getDate : getDate
				},
				dataType : "json",
				success : function(list) {

					$.each(list, function(i, obj) {

						for(var i =9; i <20; i ++){
							var iName = "#" + i + "Name";
							var iUse = "#" + i + "Use";
							var iDest = "#" + i + "Dest";
							var iPsng = "#" + i + "Psng";
							var iCheckbox = "#" +  i + "Checkbox";
							var iButton = "#" + i + "Button";
							
							// 예약내용이 있으면 시간표에 나타내기
							if(obj.cRTime==i){							
								$(iName).text("");			
								$(iUse).text("");			
								$(iDest).text("");			
								$(iPsng).text("");			
								$(iCheckbox).attr("disabled", false);			
								$(iButton).attr("style", "display:none");	
								
								//예약자 = 작성자 일경우 삭제할 수 있도록
								 if(obj.rEmpNo == "${loginUser.empNo}"){ 
									$(iButton).attr("onclick", "delRsvCar('"+ obj.cRNo +"');");
								}else if(obj.rEmpNo != "${loginUser.empNo}"){
									$(iButton).prop("style", "display:none");

								} 
								
							}
														
						}					

					});

				},
				error : function() {
					console.log("timeCar ajax 통신 실패");
				}
			});
		}
		// 예약 삭제하기	
		function delRsvCar(cRNo){
				
				var cRNo = cRNo;
				alert(cRNo);
				
				$.ajax({
					url : "delRsv.car",
					type : "post",
					data : {
						cRNo : cRNo
					},
					success : function(result) {
						if (result == "??!") {
							alert("차량 예약 삭제성공!")
							location.reload(true);//페이지 새로고침
							//location.href = location.href;
							//history.go(0);
						} else {
							alert("삭제 실패");
						}
					}
				});
		}
		
 		function rsvCar(){
			
 			var empNo = ${ loginUser.empNo }
 			var cMNo = $("input:radio[name='cMNo']:checked").val();
 			var cRTime = $("input[name='cRTime']:checked").val();
	        var getDate = $.datepicker.formatDate("yy/mm/dd", $("#datepicker2").datepicker("getDate"));
	        
	        if(cMNo==null){
	        	alert("회의실을 선택해 주세요!");
				return false;	        
	        }
	        if(cRTime==null){
	        	alert("시간을 선택해 주세요!");
				return false;	        
	        }
	        if(getDate==null){
	        	alert("날짜를 선택해 주세요!");
				return false;	        
	        }
			
	        confirm(getDate + "\n" + cRTime + " 시 부터  \n" + cMNo+ " 번 차량을  예약하시겠습니까?");        
	        var cRDest = window.prompt("목적지를 작성해 주세요", "예시: OO시 OO구");
	        
	        if(cRDest==""){
	        	alert("목적지를 작성해 주세요!");
				return false;	        
	        }
			
	        var cRUsg = window.prompt("차량 사용용도를 간단하게 작성해 주세요");
	        
	        if(cRUsg==""){
	        	alert("사용용도를 작성해 주세요!");
				return false;	        
	        }

			var cRPsng = window.prompt("동승자 이름을 간단하게 작성해 주세요");
	        
	        if(cRPsng==""){
	        	alert("동승자 이름을 작성해 주세요!");
				return false;	        
	        }

	   
	        $.ajax({
				url : "rsv.car",
				type : "post",
				data : {
					cMNo : cMNo,
					cRTime : cRTime,
					getDate : getDate,
					cRDest : cRDest,
					cRUsg : cRUsg,
					cRPsng : cRPsng
				},
				success : function(result) {
					
					if (result == "successCar") {
						alert(cMNo + "차량에  " + getDate + " 일자로\n" + cRTime +" 시에 예약되었습니다." );
						location.reload(true);
						//location.href("/request.menu").reload(true);
						//history.go(0);
					}
				},
				error : function(error) {   // 오류가 발생했을 때 호출된다. 
					console.log("차량 예약 ajax 통신실패")
				}

			});	       
	      
 		} 
		
	</script>

</body>
</html>