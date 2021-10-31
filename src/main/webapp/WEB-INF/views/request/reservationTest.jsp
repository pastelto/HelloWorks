<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>G2Works Demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon"
	href="/resource/gw/images/kor/g2works/main/basic/common/favicon.ico"
	type="image/x-ico">
<link rel="stylesheet" type="text/css"
	href="/resource/gw/css/kor/g2works/main/basic/common.css">
<link type="text/css" rel="stylesheet"
	href="/resource/comm/css/jquery/jquery-alert.css">
<script type="text/javascript" async=""
	src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="/resource/gw/js/g2works/main/basic/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/resource/comm/js/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="/resource/gw/js/g2works/main/basic/common.js"></script>
<script type="text/javascript"
	src="/resource/comm/js/jquery/jquery-alert.js"></script>
<script type="text/javascript"
	src="/resource/comm/js/websock/sockjs.min.js"></script>
<!-- <script type="text/javascript" src="/resource/comm/js/websock/sockjs.min.js.map"></script> -->
<script type="text/javascript" src="/resource/comm/js/websock/stomp.js"></script>
<script type="text/javascript"
	src="/resource/gw/js/g2works/allg/allg_common.js?v=20211030034549"></script>

<!--[if lt IE 10]>
  <script type="text/javascript" src="js/html5shiv.js"></script>
  <script type="text/javascript" src="js/IE9.js"></script>
  <![endif]-->

<script type="text/javascript">
	var wizardEnd = "Y";

	function logoLink(str) {

		top.location.href = str;
	}

	/**
	 * 최상위 경고창
	 */
	function topAlert(msg, flag) {
		if (flag == 'logout') {
			$.alert(msg, logout);
		} else {
			$.alert(msg, topMove);
		}
	}

	//상위 이동 페이지
	function topMove() {
		top.location.href = "/";
	}

	var logout = function() {
		// delete cookie
		deleteCookie('myCookie', '', -1);
		// check use mail
		var isMail = "";
		if (isMail == "true") {
			//mail_lougout();
			//parent.navi_frame.logouts();
		}
		// submit logout
		var objForm = document.frm;
		objForm.action = "/g2works/login/ajaxLogOut.do";
		objForm.target = "_parent";
		objForm.submit();
	}

	function deleteCookie(sName, sValue, sDate) {
		var today = new Date();
		today.setDate(today.getDate() + parseInt(sDate));
		var cookies = sName + "=" + escape(sValue) + "; path=/; expires="
				+ today.toGMTString() + ';';
		document.cookie = cookies;
	}

	$(document).ready(function() {
		$("#whoisTalkIframe").draggable();

	});

	function main_type_reg() {
		var radioVal = $('input[name="menu_type_num"]:checked').val();
		main_type_change(radioVal);
	}

	function main_type_close() {
		$("#type_change").hide();
	}
	function guide_pop_close() {
		$("#demo_guide_pop").hide();
	}

	function main_type_change(idx) {
		var main_type_num = "";
		if (idx != "") {
			main_type_num = "?main_type_num=" + idx;
		}
		$(top.document).find("#contentsWrap").attr("src",
				"/g2works/main/contentPage.do" + main_type_num);
		$(top.document).find("#headerWrap").attr("src",
				"/g2works/main/headerPage.do" + main_type_num);
	}
</script>
</head>

<body style="overflow: hidden;">
	<!-- wrapper -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
<div id="tierConWrap">
		<div id="container">
			<h3>
				<span>회의실대여신청</span>
			</h3>
			<!-- Calendar START -->
			<div class="contain">
				<div class="section" style="display: table; table-layout: fixed;">
					<div style="width: 390px; display: table-cell; vertical-align: top;">
						<div class="calender_header " style="width: 100%; text-align: center;">
							<a href="javascript:goMonth('2021','9');"><i class="fas fa-chevron-left"></i></a>
							 <span class="c_year">2021.</span><span class="c_month">10</span>
							 <a href="javascript:goMonth('2021','11');"><i class="fas fa-chevron-right"></i></a>
						</div>
						<table id="eqListTable" class="table table-bordered table-striped">
							<colgroup>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<tbody><tr style="font-weight: bold;">
								<th scope="col"><font color="#FF3300">일</font></th>
								<th scope="col">월</th>
								<th scope="col">화</th>
								<th scope="col">수</th>
								<th scope="col">목</th>
								<th scope="col">금</th>
								<th scope="col"><font color="#327bc0">토</font></th>
							</tr>
							
							<tr valign="top">
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="day01">
									<div>
										<div onclick="chgDay(&quot;2021-10-01&quot;)" style="cursor:pointer;">01</div>
									</div>
								</td>
							
								<td id="day02">
									<div>
										<div onclick="chgDay(&quot;2021-10-02&quot;)" style="cursor:pointer;">02</div>
									</div>
								</td>
							
							</tr>
							
							<tr valign="top">
							
								<td id="day03">
									<div>
										<div onclick="chgDay(&quot;2021-10-03&quot;)" style="cursor:pointer;">03</div>
									</div>
								</td>
							
								<td id="day04">
									<div>
										<div onclick="chgDay(&quot;2021-10-04&quot;)" style="cursor:pointer;">04</div>
									</div>
								</td>
							
								<td id="day05">
									<div>
										<div onclick="chgDay(&quot;2021-10-05&quot;)" style="cursor:pointer;">05</div>
									</div>
								</td>
							
								<td id="day06">
									<div>
										<div onclick="chgDay(&quot;2021-10-06&quot;)" style="cursor:pointer;">06</div>
									</div>
								</td>
							
								<td id="day07">
									<div>
										<div onclick="chgDay(&quot;2021-10-07&quot;)" style="cursor:pointer;">07</div>
									</div>
								</td>
							
								<td id="day08">
									<div>
										<div onclick="chgDay(&quot;2021-10-08&quot;)" style="cursor:pointer;">08</div>
									</div>
								</td>
							
								<td id="day09">
									<div>
										<div onclick="chgDay(&quot;2021-10-09&quot;)" style="cursor:pointer;">09</div>
									</div>
								</td>
							
							</tr>
							
							<tr valign="top">
							
								<td id="day10">
									<div>
										<div onclick="chgDay(&quot;2021-10-10&quot;)" style="cursor:pointer;">10</div>
									</div>
								</td>
							
								<td id="day11">
									<div>
										<div onclick="chgDay(&quot;2021-10-11&quot;)" style="cursor:pointer;">11</div>
									</div>
								</td>
							
								<td id="day12">
									<div>
										<div onclick="chgDay(&quot;2021-10-12&quot;)" style="cursor:pointer;">12</div>
									</div>
								</td>
							
								<td id="day13">
									<div>
										<div onclick="chgDay(&quot;2021-10-13&quot;)" style="cursor:pointer;">13</div>
									</div>
								</td>
							
								<td id="day14">
									<div>
										<div onclick="chgDay(&quot;2021-10-14&quot;)" style="cursor:pointer;">14</div>
									</div>
								</td>
							
								<td id="day15">
									<div>
										<div onclick="chgDay(&quot;2021-10-15&quot;)" style="cursor:pointer;">15</div>
									</div>
								</td>
							
								<td id="day16">
									<div>
										<div onclick="chgDay(&quot;2021-10-16&quot;)" style="cursor:pointer;">16</div>
									</div>
								</td>
							
							</tr>
							
							<tr valign="top">
							
								<td id="day17">
									<div>
										<div onclick="chgDay(&quot;2021-10-17&quot;)" style="cursor:pointer;">17</div>
									</div>
								</td>
							
								<td id="day18">
									<div>
										<div onclick="chgDay(&quot;2021-10-18&quot;)" style="cursor:pointer;">18</div>
									</div>
								</td>
							
								<td id="day19">
									<div>
										<div onclick="chgDay(&quot;2021-10-19&quot;)" style="cursor:pointer;">19</div>
									</div>
								</td>
							
								<td id="day20">
									<div>
										<div onclick="chgDay(&quot;2021-10-20&quot;)" style="cursor:pointer;">20</div>
									</div>
								</td>
							
								<td id="day21">
									<div>
										<div onclick="chgDay(&quot;2021-10-21&quot;)" style="cursor:pointer;">21</div>
									</div>
								</td>
							
								<td id="day22">
									<div>
										<div onclick="chgDay(&quot;2021-10-22&quot;)" style="cursor:pointer;">22</div>
									</div>
								</td>
							
								<td id="day23">
									<div>
										<div onclick="chgDay(&quot;2021-10-23&quot;)" style="cursor:pointer;">23</div>
									</div>
								</td>
							
							</tr>
							
							<tr valign="top">
							
								<td id="day24">
									<div>
										<div onclick="chgDay(&quot;2021-10-24&quot;)" style="cursor:pointer;">24</div>
									</div>
								</td>
							
								<td id="day25">
									<div>
										<div onclick="chgDay(&quot;2021-10-25&quot;)" style="cursor:pointer;">25</div>
									</div>
								</td>
							
								<td id="day26">
									<div>
										<div onclick="chgDay(&quot;2021-10-26&quot;)" style="cursor:pointer;">26</div>
									</div>
								</td>
							
								<td id="day27">
									<div>
										<div onclick="chgDay(&quot;2021-10-27&quot;)" style="cursor:pointer;">27</div>
									</div>
								</td>
							
								<td id="day28">
									<div>
										<div onclick="chgDay(&quot;2021-10-28&quot;)" style="cursor:pointer;">28</div>
									</div>
								</td>
							
								<td id="day29">
									<div>
										<div onclick="chgDay(&quot;2021-10-29&quot;)" style="cursor:pointer;">29</div>
									</div>
								</td>
							
								<td id="day30" bgcolor="#eaedff">
									<div>
										<div onclick="chgDay(&quot;2021-10-30&quot;)" style="cursor:pointer;">30</div>
									</div>
								</td>
							
							</tr>
							
							<tr valign="top">
							
								<td id="day31">
									<div>
										<div onclick="chgDay(&quot;2021-10-31&quot;)" style="cursor:pointer;">31</div>
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
								<td id="">
									<div>
										
									</div>
								</td>
							
							</tr>
							
						</tbody></table>
					</div>
					<!-- Calendar END -->
					<div style="padding: 30px 0 0 25px; width: 100%; display: table-cell; vertical-align: top;">
						<table id="idListTable" class="table table-bordered table-striped">
							<tbody><tr>
								<th style="text-align: center;">
									<b>
<!-- 										<script>document.write(getCutMenuNm(2));</script>  -->
										목록
									</b>
								</th>
							</tr>
							
								
									
									<tr align="left">
										<td class="c">
											<div id="conferenceList" style="overflow: auto;">
												
													<span style="cursor: pointer;" onclick="javascript:chgConference(100012);$('#conferenceNm').val('1층 로비 회의실');" id="conference100012">
														1층 로비 회의실
														<font color="#327bc0">(  수용인원 : 10명 )</font><br>
													</span>
												
													<span style="cursor: pointer;" onclick="javascript:chgConference(100011);$('#conferenceNm').val('2층 대회의실');" id="conference100011">
														2층 대회의실
														<font color="#327bc0">(  수용인원 : 50명 )</font><br>
													</span>
												
													<span style="cursor: pointer;" onclick="javascript:chgConference(100010);$('#conferenceNm').val('3층 회의실');" id="conference100010">
														3층 회의실
														<font color="#327bc0">(  수용인원 : 30명 )</font><br>
													</span>
												
											</div>
										</td>
									</tr>
								
								
							
						</tbody></table>
					</div>
				</div>
				<!-- 예약시간 선택 -->
				<div class="section">
						<table id="idListTable" class="table table-bordered table-striped">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="15%">
							<col>
							<col width="15%">
						</colgroup>
						<tbody><tr>
							<th colspan="5"><b>예약시간 선택</b></th>
						</tr>
						<tr>
							<th scope="col">사용시간</th>
							<th scope="col">신청부서</th>
							
							<th scope="col">담당자</th>
							<th scope="col">용도</th>
							<th scope="col">삭제</th>
						</tr>
						</tbody><tbody id="reserveTimeList">
							<tr>
								<td colspan="5" style="text-align: center;">
									입력된 정보가 없습니다.
								</td>
							</tr>
						</tbody>
					</table>
					<!--button id="bt_registration">등록</button-->
					<span id="click_message"></span>
				</div>
				<div class="section tAr">
					<span id="bt_registration" class="btn1 sH1" style="display: none;">등록</span>
				</div>
			</div>
		</div>
	</div>
					
	</div>
	<script>


	var sleConference = "";
	var format = new Date();
	var day = format.getDate();
	var month = format.getMonth() + 1;

	var nYear = '2021';
	var tMonth = '11';
	var selcdate = nYear + "" + tMonth + "" + day;

	var currtime = format.getHours();
	var currday = format.getDate();
	var currmonth = format.getMonth() + 1;
	if(currmonth.toString().length < 2){
		currmonth = "0"+currmonth;
	}
	var curryear = format.getFullYear();
	var currdate = curryear + "" + currmonth + "" + currday;

	if(day.length < 2){
		day = "0"+day;
	}

	jQuery(function() {

		$("#day"+day).attr("bgcolor","#eaedff");

		$("#conferenceDate").val(nYear+"-"+tMonth+"-"+day);

		$("#btn_close").click(function(){
			$("#reserveForm").hide();
			$("#reserve_log").val("");
		});

		$("#btn_info_close").click(function(){
			$("#infoForm").hide();
		});

		$("#btn_regist").click(function(){
			regist();
		});

		$("#btn_delete").click(function(){
			deleteReserve();
		});

		// 초기실행시 등록버트 숨김
		$("#bt_registration").hide();

		// 등록버튼 클릭
		$("#bt_registration").click(function(){
			if ($("input[name=reservChkBox]:checkbox:checked").length < 1) {
				$("#click_message").text("한개이상의 사용시간을 체크하셔야합니다").css("color",'#f00');
				return;
			}
			//체크된 시간에 대한 예약처리
			var strCheckTime = "";
			$("input:checkbox[name=reservChkBox]:checked").each(function() {
				strCheckTime = strCheckTime + this.value + ",";
			});
			if(strCheckTime.length > 0) {
				strCheckTime = strCheckTime.substring(0,strCheckTime.length-1);
			}

			reserveForm(strCheckTime);

		});

		$("#reserveForm").draggable();

	});

	var c_id_time_click = function(val) {
		// 시간클릭시 체크박스 체크
		if ($("input:checkbox[name=reservChkBox]").filter("input[value="+ val + "]").is(":checked")) {
			$("input:checkbox[name=reservChkBox]").filter("input[value="+ val + "]").removeAttr("checked");
		} else {
			$("input:checkbox[name=reservChkBox]").filter("input[value="+ val + "]").attr("checked","checked");
		}
	}

	var regist = function(){

		var objForm = document.frm_ins;
		if (validateRequired(objForm, 2)) {
			var conference_time = $("#time").val();
			var conference_cd = $("#conferenceCD").val();
			var conference_date = $("#conferenceDate").val();
			var reserve_log = $("#reserve_log").val();

			jQuery.ajax({
				url : "conference.do?command=insReservePost",
				global : false,
				type : "POST",
				data: {
						conference_cd : conference_cd,
						conference_date : conference_date,
						conference_time : conference_time,
						reserve_log : reserve_log
					},
				dataType: "json",
				async : false,
				clearForm:true,
				resetForm:true,
				success: function(data){
					unload = true;
					jQuery("#loading_message").hide();

					$("#reserveForm").hide();
					$("#reserve_log").val("");

					alert(data.jsonMessage['message']);

					ajaxReserveList();
				},
				beforeSend:function() {
					jQuery("#loading_message").show();
				}
			});
		}
	}

	var deleteReserve = function(idx){

		jQuery.ajax({
			url : "conference.do?command=delReservePost",
			global : false,
			type : "POST",
			data: { idx : idx },
			dataType: "json",
			async : false,
			clearForm:true,
			resetForm:true,
			success: function(data){
				unload = true;
				jQuery("#loading_message").hide();

				alert(data.jsonMessage['message']);

				$("#infoForm").hide();

				ajaxReserveList();
			},
			beforeSend:function() {
				jQuery("#loading_message").show();
			}
		});
	}

	var reserveList = function(data) {

		var reserveIdx = Array();
		var reserveTime = Array();
		var reserveName = Array();
		var reserveLog = Array();
		var reserveBranch = Array();
		var reserveEmp = Array();
		$("#reserveTimeList tr").remove();

		$.each(data, function(messageIndex, message) {
			reserveIdx.push(Number(message["idx"]));
			reserveTime.push(Number(message["conference_time"]));
			reserveName.push(message["name_kor"]);
			reserveLog.push(message["reserve_log"]);
			reserveBranch.push(message["branch_name"]);
			reserveEmp.push(message["reg_emp"]);
		});

	 	for(var i = 0 ;  i < 24 ; i++ ) {

			var time = "";
			var html = "";
			var fontType = "";
			var clickEvent = "";
			var chkBox = "";
			var userAdminFlag = 'N';
			var currEmp = '1005';

			var index = jQuery.inArray(i,reserveTime);

			if (parseInt(selcdate) == parseInt(currdate)) {
				if(i >= currtime){ // MOD 2018-01-11 회의실을 예약하려는 날이 오늘인 경우 현재시간을 확인하여 레이아웃 조정
					// 오늘 날짜의 예약 등록 가능한 경우
					fontType = "#000";

					if(index > -1){
						fontType = "#D1D4DB";
						clickEvent = "style='cursor:pointer;'";
					} else {
						chkBox = "<input type='checkbox' id='reservChkBox' name='reservChkBox' value="+i+">";
						clickEvent = " onclick='c_id_time_click("+i+");' style='cursor:pointer;'";
					}
				} else {
					// 오늘 날짜의 예약 등록 불가능한 경우
					fontType = "#D1D4DB";
				}
			} else if (parseInt(selcdate) > parseInt(currdate)) {
				// 오늘 이후 날짜의 예약 등록 가능한 경우
				fontType = "#000";

				if(index > -1){
					fontType = "#D1D4DB";
					clickEvent = "style='cursor:pointer;'";
				} else {
					chkBox = "<input type='checkbox' id='reservChkBox' name='reservChkBox' value="+i+">";
					clickEvent = " onclick='c_id_time_click("+i+");' style='cursor:pointer;'";
				}
			} else {
				// 오늘 이전 날짜의 예약 등록 불가능한 경우
				fontType = "#D1D4DB";
			}

			if( index > -1){

				html += "<tr><td><span id='id_time' "+clickEvent+"><font color='"+fontType+"'>"+timeText(reserveTime[index])+"</font></span></td>";
				html += "<td>"+reserveBranch[index]+"</td>";
				html += "<td>"+reserveName[index]+"</td>";
				html += "<td align='left'>"+reserveLog[index]+"</td>";
				if(userAdminFlag == 'Y'){
					html += "<td><span id='btn_delete' class='btn1' title='삭제' onclick='deleteReserve("+reserveIdx[index]+")';>삭제</span></td></tr>";
				}else{
					if(reserveEmp[index] != currEmp) {
						html += "<td></td></tr>";
					} else {
						html += "<td><span id='btn_delete' class='btn1' title='삭제' onclick='deleteReserve("+reserveIdx[index]+")';>삭제</span></td></tr>";
					}
				}

			} else {

				html += "<tr><td>"+chkBox+"<span id='id_time' class='c_docu_cd_old' "+clickEvent+"><font color='"+fontType+"'>"+timeText(i)+"</font></span></td>";
				html += "<td></td><td></td><td></td><td></td><tr>";
			}

			$("#reserveTimeList").append(html);
		}
		$("#bt_registration").show();
	}

	var timeText = function (val){

		var timeText = "";

		if(val < 10) {
			s_time = "0"+val;
		} else {
			s_time = val;
		}

		timeText = s_time+":00 ~ "+(parseInt(val)+1)+":00";

		return timeText;
	}

	var chgDay = function(val) {
		if(day.toString().length < 2){
			day = "0"+day;
		}
		$("#day"+day).attr("bgcolor","");
		$("#conferenceDate").val(val);
		day = parseInt(val.substring(val.length-2));
		if(day.toString().length < 2){
			day = "0"+day;
		}
		month = val.substring(5, 7);
		selcdate = nYear + "" + tMonth + "" + day;

		$("#day"+val.substring(8, 10)).attr("bgcolor","#eaedff");

		if($("#conferenceCD").val()) {
			ajaxReserveList();
		}

	}

	var chgConference = function(val){

		$("#conference"+sleConference).css("background-color","");
		sleConference = val;
		$("#conference"+sleConference).css("background-color","#eaedff");
		$("#conferenceCD").val(val);

		ajaxReserveList();
	}

	var goMonth = function(year,month) {
		document.location.href = "conference.do?command=conferenceReserve&year="+year+"&month="+month;
	}


	var ajaxReserveList= function() {

		var conferenceCd = $("#conferenceCD").val();
		var conferenceDate = $("#conferenceDate").val();

		jQuery.ajax({
			url : "conference.do?command=AjaxlstReserve",
			global : false,
			type : "POST",
			data: {
					conference_cd : conferenceCd,
					conference_date : conferenceDate
				},
			dataType: "json",
			async : false,
			clearForm:true,
			resetForm:true,
			success: function(data){
				unload = true;
				jQuery("#loading_message").hide();

				reserveList(data);

			},
			beforeSend:function() {
				jQuery("#loading_message").show();
			}
		});
	}

	var reserveForm = function(val){

		var strConTime = "";
		var arrVal = new Array();

		if (val.indexOf(',')>0) {
			arrVal = val.split(',');
		} else {
			arrVal[0] = val;
		}

		$(this).css("background-color","#eaedff");
		// 스크롤 위치에 맞춰 레이어 팝업 위치 그때그때 맞춰줌
		$("#reserveForm").css({"top" : getScrollXY()[1] + 500 + "px"});
		$("#reserveForm").show();
		$("#conNm").html($("#conferenceNm").val());

		for (var i=0; i<arrVal.length;i++ ) {
			strConTime = strConTime + timeText(arrVal[i]) + ", ";
		}
		strConTime = strConTime.substring(0,strConTime.length -1);

	 	$("#conTime").html(strConTime);
	 	$("#time").val(val);
	}



	</script>
	<jsp:include page="../common/footer.jsp" />
	
	<form name="frm_ins" method="post" id="">
		<div id="reserveForm" style="position: absolute; left: 397px; top: 1256px;" class="divPop ui-draggable ui-draggable-handle">
			<input type="hidden" name="time" id="time" value="12,13,14">
			<h4 class="popup_title">
				신청등록
			</h4>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="data data1 tAc">
				<colgroup>
					<col width="100px">
					<col width="350px">
				</colgroup>
				<tbody><tr>
					<th scope="col">신청대상</th>
					<td align="left"><span id="conNm">2층 대회의실</span></td>
				</tr>
				<tr>
					<th scope="col">사용시간</th>
					<td align="left"><span id="conTime">12:00 ~ 13:00, 13:00 ~ 14:00, 14:00 ~ 15:00,</span></td>
				</tr>
				<tr>
					<th scope="col">용도</th>
					<td><input type="text" name="reserve_log" id="reserve_log" class="essential_input" style="width: 100%; box-sizing: border-box;" required="" required_name="용도"></td>
				</tr>
			</tbody></table>
			<div class="popup_btn">
				<span id="btn_regist" class="btn1" title="저장">저장</span>
				<span id="btn_close" class="btn1" title="닫기">닫기</span>
			</div>
		</div>
	</form>
</body>
</html>