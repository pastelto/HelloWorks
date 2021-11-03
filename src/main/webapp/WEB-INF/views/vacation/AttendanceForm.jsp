<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bluetitle{
		color: blue;
		margin-left : 10px;
		margin-top: 5px;
		padding-right : 0;
		padding-left : 0;
		position :none;
	}
</style>
</head>
<body>
						<form id="attendanceApro" method="post" enctype="multipart/form-data">
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header">
									<h3 class="card-title">근태계</h3>
								</div>
								<div class="card-body">
									<input type="hidden" value="근태구분" name="datailType"/>
									<table width="400px" style="font-size: 0.8em;" height="50px"
										align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<colgroup>
															<col width="15%" />
															<col width="17%" />
															<col width="17%" />
															<col width="17%" />
															<col width="17%" />
															<col width="17%" />
														</colgroup>
														<tbody>
															<tr>
																<th rowspan="2" scope="col">결재</th>
																<th class="table emp_level" scope="col"><input
																	type="text" class="emp_level0" id="emp_level1_0"
																	name="writerJob" value="${loginUser.jobName}" readonly />
																</th>
																<th class="table emp_level" scope="col"><input
																	type="text" class="emp_level1" id="emp_level1_1"
																	name="job" readonly /></th>
																<th class="table emp_level" scope="col"><input
																	type="text" class="emp_level2" id="emp_level1_2"
																	name="job" readonly /></th>
																<th class="table emp_level" scope="col"><input
																	type="text" class="emp_level3" id="emp_level1_3"
																	name="job" readonly /></th>
																<th class="table emp_level" scope="col"><input
																	type="text" class="emp_level4" id="emp_level1_4"
																	name="job" readonly /></th>
															</tr>
															<tr>
																<td class="table emp_name" scope="col"><input
																	type="text" class="emp_name0" id="emp_name0"
																	value="${loginUser.empName}" disabled /> <input
																	type="hidden" class="line0" id="writer" name="writer"
																	value="${loginUser.empNo}"></td>
																<td class="table emp_name" scope="col"><input
																	type="text" class="emp_name1" id="emp_name1_1"
																	name="lineName" readonly /> <input type="hidden"
																	class="line1" id="line1_1" name="line"></td>
																<td class="table emp_name" scope="col"><input
																	type="text" class="emp_name2" id="emp_name1_2"
																	name="lineName" readonly /> <input type="hidden"
																	class="line2" id="line1_2" name="line"></td>
																<td class="table emp_name" scope="col"><input
																	type="text" class="emp_name3" id="emp_name1_3"
																	name="lineName" readonly /> <input type="hidden"
																	class="line3" id="line1_3" name="line"></td>
																<td class="table emp_name" scope="col"><input
																	type="text" class="emp_name4" id="emp_name1_4"
																	name="lineName" readonly /> <input type="hidden"
																	class="line4" id="line1_4" name="line"></td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>

											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default"
														style="font-size: 0.8rem" id="plus_line_btn"
														onclick="plusLine(1);">+ 결재라인 추가</button>
												</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" style="font-size: 0.8rem"
										vertical-align="middle">
										<tr>
											<td>
												<table class="table table-bordered" id="detail_table">
													<tbody>
														<tr>
															<td colspan="3"><span>문서 종류</span></td>
															<td colspan="6">
																<div class="row" style="margin-left: 0px;">
																	&nbsp;&nbsp; <select id="documentType"
																		name="documentType"
																		class="custom-select custom-select-sm"
																		style="width: 10%;">
																		<option value="연차">연차</option>
																		<option value="반차">반차</option>
																		<option value="결근">결근</option>
																	</select>&nbsp;&nbsp;&nbsp; <select id="halfDay" name="halfDay"
																		class="custom-select custom-select-sm"
																		style="width: 5%;">
																		<option value="">선택</option>
																		<option value="오전">오전</option>
																		<option value="오후">오후</option>
																	</select>&nbsp;


																	<div id="bluetitle">[잔여일:&nbsp;&nbsp; ${ loginUserAnnual} ]</div>
																</div>

															</td>
														</tr>
														<tr height="30px">
															<td width="10%" colspan="3"><span>수신참조 </span></td>
															<td colspan="6" style="text-align: left !important;">
																<div class="input-group" style="width: 30% !important;">
																	<input type="text" id="ccName1" class="form-control"
																		name="ccName" width="30%" /> <input type="hidden"
																		id="ccCode1" name="ccCode" />
																	<div class="input-group-append">
																		<button type="button" class="btn btn-default"
																			style="font-size: 0.8rem" onclick="plusCC(1);">수신자등록</button>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3"><span>제목</span></td>
															<td colspan="6">
															<input type=text class="form-control" id="ap_title" name="ap_title">
															</td>
														</tr>
														<tr>
															<td colspan="3"><span>요청일자</span></td>
															<td colspan="6">
																<div class="container-fluid">
																	시작일자 <input type="date"
																		class="form-control datetimepicker-input col-2"
																		data-target="#startDate" name="startDate"
																		style="font-size: 0.8rem">
																</div> <br>
																<div class="container-fluid">
																	종료일자 <input type="date"
																		class="form-control datetimepicker-input col-2"
																		data-target="#endDate" name="endDate"
																		style="font-size: 0.8rem">
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3"><span>대체근무자</span></td>
															<td colspan="6">
																<div class="input-group" style="width: 30% !important;">
																	<input type="text" id="ccName1" class="form-control"
																		name="ccName" width="30%" /> <input type="hidden"
																		id="ccCode1" name="ccCode" />
																	<div class="input-group-append">
																		<button type="button" class="btn btn-default"
																			style="font-size: 0.8rem" onclick="worker(1);">근무자
																			등록</button>서비스구현 예정입니다
																	</div>
																</div> 
															</td>
														</tr>
														<tr>
															<td colspan="9"><textarea id="summernote"
																	name="apContent"></textarea></td>
														</tr>
														<tr>
															<td colspan="3"><span>부서공유</span></td>
															<td colspan="6"><input type="checkbox"
																id="deptShare" name="deptShare" value='Y' /> <input
																type="hidden" id="deptShare_hidden" name="deptShare"
																value='N' /></td>
														</tr>
														<tr>
															<td colspan="9">
																<div class="btn btn-default btn-file btn-xs">
																	<i class="fas fa-paperclip"></i> 첨부파일 <input
																		type="file" class="normalAttach" name="normalAttach"
																		id="normalAttach" multiple="true">
																</div>
															</td>
														</tr>
														<tr>
															<td width="60%" colspan="5"><span>파일명</span></td>
															<td colspan="2"><span>크기</span></td>
															<td colspan="2"><span>삭제</span></td>
															<tr>
													
														<tr id="fileRow">
														<td colspan="5">
															 <span class="normalAttachName"></span>
														</td>
														<td colspan="2">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="2">
															<button type="button" class="btn btn-danger"
																	style="font-size:1em" onclick="deletefile();">삭제</button>
														</td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</table>
									<!-- footer -->
										<div class="card-footer">
											<div class="float-right">
												<button id="tempSaveBtn" type="button"
												class="btn btn-secondary btn-sm" >임시저장</button>
												&nbsp;
												<button id="submitBtn" type="button"
												class="btn btn-primary btn-sm">등록</button>
												&nbsp;
												<button type="reset" class="btn btn-danger btn-sm">취소</button>
												&nbsp;
											</div>
										</div>
									
									
								</div>
							</div>
					</form>	
						
		<script>
			$(function(){
				  $('#halfDay').hide();
				 
				  $("select[name='documentType']").change(function() {
					  var documentType =  $("select[name='documentType'] option:selected").val();
						 
						 console.log("~~"+documentType)
						 
						 if(documentType == '반차'){							 
							 $('#halfDay').show();
						 }else if(documentType == '연차'){
							 $('#halfDay').hide();
						 }else if (documentType == '결근'){
							 $('#halfDay').hide();
						 }
					  
				  })
				 
			   });	
		</script>
		<script>
		
		$(function(){
			$('#submitBtn').click(function(){
				
				var line = $('#emp_level1_1').val();
				var ap_title = $('#ap_title').val();
				var summernote = $('#summernote').val();
				var startDate = $('input[name=startDate]').val();
				var endDate = $('input[name=endDate]').val();
							
				if(line == ""){
					alert("결재라인을 추가해주세요")
					return false;
				}else if(ap_title == ""){
					alert("제목을 입력해주세요")
					return false;
				}else if(startDate == ""){
					alert("요청 시작일자를 선택해주세요")
					return false;
				}else if(endDate == ""){
					alert("요청 종료일자를 선택해주세요")
					return false;
				}else if(summernote ==""){
					alert("사유를 입력해주세요")
					return false;
				}
				
			   $('#attendanceApro').attr("action", "<%=request.getContextPath()%>/insertAttendanceF.ps?status=Y");
				$('#attendanceApro').submit();
				
			});
		});
		
		$(function(){
			$('#tempSaveBtn').click(function(){
				$('#attendanceApro').attr("action", "<%=request.getContextPath()%>/insertAttendanceF.ps?status=N");
				$('#attendanceApro').submit();
				
			});
		});
		
		</script>
</body>
</html>