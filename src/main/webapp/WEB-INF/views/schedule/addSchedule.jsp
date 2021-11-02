<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 일정등록</title>
<!-- summernote -->
<link rel="stylesheet"	href="./resources/plugins/summernote/summernote-bs4.min.css">
<!-- daterange picker -->
<link rel="stylesheet" href="./resources/plugins/daterangepicker/daterangepicker.css">
<style>
 	#insertWSForm th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	} 
	.content-wrapper{
		overflow:auto;
	}
	
	.fa-trash-alt{
		color: red;
		border: none;
		background-color: #FFFFFF;
	} 
	
	#addEventNote{
		width: 100%;
		height:100%;
		resize: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


	<div class="content-wrapper">
	<div class="row">
	
	<jsp:include page="./scheduleSideMenu.jsp" />

	<div class="col-8" style="margin-left: 5%; margin-top: 10px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-calendar-check"></i><b> &nbsp; 일정등록</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>일정등록</b>
							</h6>
						</div>

						<form id="insertNewEvent" method="post" enctype="multipart/form-data">

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
									                    <option>내 캘린더</option>
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
			</div>
		</section>
	</div>
</div>
</div>
	<jsp:include page="../common/footer.jsp" />
	

	<script>
    $(document).ready(function() {
    	  $('#summernote').summernote({
    	    height : 200
    	  });
    	  
    	  $( "#datepicker" ).datepicker();
    	});
    </script>

	<script>
	
	function insertEvent(){
		
		var checked = false;

		if($('input[name=sch_allday]:checked')){
			checked = true;
			console.log(checked);
		}
		
		console.log(checked);
		console.log();
	    <%-- $("#insertNewEvent").attr("action", "<%=request.getContextPath()%>/addEvent.sc?checked=" +checked);
		$("#insertNewEvent").submit(); --%>
		// alert("일정이 등록되었습니다.");
		
	}
	
	</script>

	<script>
	  $(function () {
	    //Date range picker
	    $('#reservation').daterangepicker()
	    //Date range picker with time picker
	    $('#setEventTime').daterangepicker({
	      timePicker: true,
	      timePickerIncrement: 30,
	      locale: {
	        format: 'MM/DD/YYYY hh:mm A'
	      }
	    })
	    
	    //Colorpicker
	    $('.my-colorpicker1').colorpicker()
	    //color picker with addon
	    $('.my-colorpicker2').colorpicker()
	
	    $('.my-colorpicker2').on('colorpickerChange', function(event) {
	      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
	    })
	
	    $("input[data-bootstrap-switch]").each(function(){
	      $(this).bootstrapSwitch('state', $(this).prop('checked'));
	    })
	
	  })
	</script>

	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- Select2 -->
	<script src="./resources/plugins/select2/js/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="./resources/plugins/moment/moment.min.js"></script>
	<script src="./resources/plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="./resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="./resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="./resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Bootstrap Switch -->
	<script src="./resources/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	
</body>
</html>