<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- daterange picker -->
<link rel="stylesheet" href="./resources/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
<script src="./resources/plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/plugins/datepicker/jquery-ui.css">
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<style>
  textarea {
    width: 100%;
    height: 3em;
    border: none;
    resize: none;
  }
  
  p>#dateStartCheck{
  	padding: 0;
  	margin: 0;
  }
  
  #detailPlace, #detailType, #detailTitle{
  	border : none;
  }
</style>
</head>
<body>
<!-- Add Modal -->
<div class="modal fade" id="schedule-add">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">간편 일정 등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form id="insertNewEvent" method="post" enctype="multipart/form-data">
                   <input type="hidden" name="formType" value="2">
                   <input type="hidden" name="setEventTime" value="0">
                    <div class="form-group">
                   		<label> 일정 제목 : </label>
                       <input type="text" name="sch_title" class="form-control form-control-sm">
                        <br>
                        <div class="row">
                        <div class="col-5">
                        <label>캘린더타입 :</label>
		                  <select class="form-control form-control-sm select2" style="width: 200px;" name="sch_type">
		                    <option selected="selected">선택하세요</option>
		                    <!-- 조건 (전체 / 본부별) -> 로그인 계정의 DeptCode(A/B/C)에 따라, 직급(J)에 따라! -->
		                    <option>사내 전체</option>
		                    <option>경영지원본부</option>
		                    <option>영업지원본부</option>
		                    <option>사업본부</option>
		                    <option>인사팀</option>
		                    <option>총무팀</option>
		                    <option>재무회계팀</option>
		                    <option>영업팀</option>
		                    <option>운영지원팀</option>
		                    <option>마케팅팀</option>
		                    <option>디자인팀</option>
		                    <option>IT개발팀</option>
		                    <option value="PRIVATE">내 캘린더</option>
		                  </select>
		                 </div>
		                 <div class="col-1"></div>
		                 <div class="col-4">
		                 <label>장소 :</label>
		                 <input class="form-control form-control-sm" style="width: 200px;" type="text" name="sch_place">
		                 </div>
		                 </div>
		                 <br>
		               <label>일자 : </label>
		               <label for="sch_allday" class="float-right"> 
					<input type="checkbox" class="form-check-input input-group-text" name="sch_allday">
					종일</label> 
         			<div class="input-group">
                    	<input type="date" class="form-control form-control-sm datetimepicker-input datepicker" id="startDate" name="sch_startdate" style="font-size:0.8rem; width: 150px;">
					<div class="input-group-append">
					    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">~</span>
					</div>
						<input type="date" class="form-control form-control-sm datetimepicker-input datepicker" id="endDate" name="sch_endate" style="font-size:0.8rem; width: 150px">	
                  	</div>
                  	 
                    </div>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-success" onclick="insertSimpleEvent();">일정 추가하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 일정상세확인 Modal -->
<div class="modal fade" id="schedule-check">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">일정 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="card card-outline card-info">
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>상세 일정</b>
							</h6>
						</div>

						<form id="insertNewEvent" method="post" enctype="multipart/form-data">
								<input type="hidden" name="formType" value="1">
								<input type="hidden" name="detailEmpNo" id="detailEmpNo" value="">
								<input type="hidden" name="detailSchNo" id="detailSchNo" value="">
							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>일자</th>
												<td colspan="3" >
												<!-- 날짜 및 시간 선택 -->
												<div class="col-12">
									                <div class="form-group">
									                  <div class="input-group">
									                  <div class="col-1"><span class="badge badge-info right" id="detailAllday"></span></div>
									                   	<div class="col-4"><p id="dateStartCheck"></p></div>
									                   	<div class="col-5"><p id="dateEndCheck"></p></div>
									                   	
									                   	
									                  </div>
									                  </div>
									                 </div>
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<input type="text" id="detailTitle" name="sch_title" readonly>
												</td>
											</tr>
											<tr>
												<th>캘린더 타입</th>
												<td style="width: 35%;">
												<div class="form-group">
									                  <input type="text" name="sch_type" id="detailType" readonly>
									                </div>
												</td>
												<th>장소</th>
												<td style="width: 35%;">
												<div class="form-group">
													<input type="text" name="sch_place" id="detailPlace" readonly>
												 </div>
												 </td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="detailContent" name="sch_content" placeholder="일정 상세 내용이 없습니다." readonly></textarea>
									</div>
								</div>

							</div>
						</form>

					</div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="detailEditBtn" style="display: none;">수정</button>
                <button type="button" class="btn btn-danger" id="detailDeleteBtn" style="display: none;">삭제</button>
	            <button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
            </div>
        </div>
    </div>
</div>

<script>

	function showEditBtn(){
		
		  //var dEmpNo = $('#detailEmpNo').val();
		  var dEmpNo = $('#detailEmpNo').val();
		  var myEmpNo = ${loginUser.empNo};
		  console.log("작성자 사번 2 ? " + dEmpNo);
			
			if(dEmpNo == myEmpNo){
				console.log("로그인 사번 3 ? " + myEmpNo);
				$("#detailEditBtn").attr("style", "display:''");
				$("#detailDeleteBtn").attr("style", "display:''");
		}
	}

	// 일정 삭제
	$('#detailDeleteBtn').click(function(){
		
		var yes = confirm("정말 일정을 삭제하시겠습니까?");
		var schNo = $('#detailSchNo').val();
		console.log(schNo);
		
		if(yes){
			console.log("delete Yes!");
			
		    	$.ajax({
      		    	url: 'deleteCal.cal',
       		        type: 'POST',
       		        data: {
       		        	schNo:schNo
       		        },
       		        success: function(result){
       		        	console.log(result);
       		        	alert("일정이 정상적으로 삭제 되었습니다.");
       		            
       		        	location.reload(true); // 새로고침
       		       } 
      		      });
		}
		
		
	})
	
</script>

<!-- 일정 수정 Modal -->
<div class="modal fade" id="schedule-edit">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">일정 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="card card-outline card-info">
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>일정등록</b>
							</h6>
						</div>

						<form id="insertNewEvent" method="post" enctype="multipart/form-data">
								<input type="hidden" name="formType" value="1">
							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>일자</th>
												<td colspan="3" >
												<!-- 날짜 및 시간 선택 -->
												<div class="col-6">
									                <div class="form-group">
									                  <div class="input-group">
									                    <div class="input-group-prepend">
									                      <span class="input-group-text"><i class="far fa-clock"></i></span>
									                    </div>
									                    <input type="text" class="form-control float-left" id="setEventTime" name="setEventTime" style=" margin-right: 60px;"> 
									                  	<label for="sch_allday">
									                    <input type="checkbox" class="form-check-input input-group-text" name="sch_allday">
									            		 종일</label>
									                  </div>
									                  </div>
									                 </div>
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<input type="text" name="sch_title" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th>캘린더 타입</th>
												<td style="width: 35%;">
												<div class="form-group">
									                  <select class="form-control select2" style="width: 50%;" name="sch_type">
									                    <option selected="selected">선택하세요</option>
									                    <!-- 조건 (전체 / 본부별) -> 로그인 계정의 DeptCode(A/B/C)에 따라, 직급(J)에 따라! -->
									                    <option>사내 전체</option>
									                    <option>경영지원본부</option>
									                    <option>영업지원본부</option>
									                    <option>사업본부</option>
									                    <option>인사팀</option>
									                    <option>총무팀</option>
									                    <option>재무회계팀</option>
									                    <option>영업팀</option>
									                    <option>운영지원팀</option>
									                    <option>마케팅팀</option>
									                    <option>디자인팀</option>
									                    <option>IT개발팀</option>
									                    <option value="PRIVATE">내 캘린더</option>
									                  </select>
									                </div>
												</td>
												<th>장소</th>
												<td style="width: 35%;">
													<input class="form-control form-control-sm" type="text" name="sch_place">
												 </td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="addEventNote" name="sch_content"></textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="insertEvent();">저장</button>
									&nbsp;
									<button id="resetBtn" type="button" class="btn btn-danger btn-sm" onclick="location.href='schMain.sc'">취소</button>
									&nbsp;
								</div>
							</div>
						</form>

					</div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Save Your Schedule</button>
            </div>
        </div>
    </div>
</div>

<!-- 간편일정 등록 -->
<script>
	function insertSimpleEvent(){
		
		var checked = false;

		if($('input[name=sch_allday]').prop("checked")){
			checked = true;
		}
		
		console.log(checked);
		console.log($('input[name=setEventTime]').val());
	    $("#insertNewEvent").attr("action", "<%=request.getContextPath()%>/addEvent.sc?checked=" +checked);
		$("#insertNewEvent").submit();
	}
</script>

	<script>
    $(document).ready(function() {   

     $( "#datepicker" ).datepicker();
   	 $('#setEventTime').daterangepicker({
	      timePicker: true,
	      timePickerIncrement: 30,
	      locale: {
	        format: 'YYYY/MM/DD'
	      }
	    })
    });
    </script>
	
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 4 -->
<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="./resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Select2 -->
<script src="./resources/plugins/select2/js/select2.full.min.js"></script>	
<!-- InputMask -->
<script src="./resources/plugins/moment/moment.min.js"></script>
<script src="./resources/plugins/inputmask/jquery.inputmask.min.js"></script>
</body>
</html>