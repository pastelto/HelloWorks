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
		                  <select class="form-control form-control-sm select2" name="sch_type">
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
		                 <input class="form-control form-control-sm" type="text" name="sch_place">
		                 </div>
		                 </div>
		                 <br>
		               <label>일자 : </label>
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

<!-- Edit Modal -->
<div class="modal fade" id="schedule-edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Edit Your Schedule</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Schedule Name:</label>
                        <input type="text" class="form-control">
                    </div>
                </form>
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