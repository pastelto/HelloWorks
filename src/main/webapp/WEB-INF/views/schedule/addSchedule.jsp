<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
									                    <!-- 조건 (전체 / 본부별) : 운영지원팀은 모두 작성가능 -->
									                    <c:if test="${loginUser.deptCode eq 'B2'}">
									                    	<option>사내 전체</option>									                    
									                    <c:set var="loop_flag1" value="false" />
									                    <c:set var="loop_flag2" value="false" />
									                    <c:set var="loop_flag3" value="false" />
									                    <c:forEach items="${ deptList }" var="dl" varStatus="status">
									                    
									                    <c:if test="${not loop_flag1 }">
									                    <c:if test = "${fn:contains(dl.deptCode, 'A')}">
										                    <option>${dl.deptUName}</option>
										                 <c:set var="loop_flag1" value="true" />
									                    </c:if>
									                    </c:if>
									                    
									                    <c:if test="${not loop_flag2 }">
									                    <c:if test = "${fn:contains(dl.deptCode, 'B')}">
										                    <option>${dl.deptUName}</option>
										                 <c:set var="loop_flag2" value="true" />
									                    </c:if>
									                    </c:if>
									                    
									                    <c:if test="${not loop_flag3 }">
									                    <c:if test = "${fn:contains(dl.deptCode, 'C')}">
										                    <option>${dl.deptUName}</option>
										                 <c:set var="loop_flag3" value="true" />
									                    </c:if>
									                    </c:if>
									                    
									                     <option>${dl.deptDName}</option>
									                    </c:forEach>
									                    </c:if>
									                   
									                    <!-- 조건 (전체 / 본부별) -> 로그인 계정의 DeptCode(A/B/C)에 따라, 직급(J)에 따라! -->
									                    <c:forEach items="${ deptList }" var="dl" varStatus="status">
									                     <c:if test = "${fn:contains(dl.deptCode, 'A')}">
										                    <c:if test="${dl.deptCode eq loginUser.deptCode }">
										                    <option>${dl.deptUName}</option> <!--  -->
										                    <option>${dl.deptDName}</option>
										                    </c:if>
									                    </c:if>
									                     <c:if test = "${fn:contains(loginUser.deptCode,'B') && loginUser.deptCode ne 'B2'}">
										                    <c:if test="${dl.deptCode eq loginUser.deptCode }">
										                    <option>${dl.deptUName}</option>
										                    <option>${dl.deptDName}</option>
									                    	</c:if>
									                    	
									                    </c:if>
									                    <c:if test = "${fn:contains(loginUser.deptCode, 'C')}">
										                    <c:if test="${dl.deptCode eq loginUser.deptCode }">
										                    <option>${dl.deptUName}</option>
										                    <option>${dl.deptDName}</option>
									                    	</c:if>
									                    </c:if>
															
									                    </c:forEach>
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

		if($('input[name=sch_allday]').prop("checked")){
			checked = true;
		}
		
		if($("input[name=setEventTime]").val() == ""){
			alert("일정 날짜 및 시간을 입력해주세요.")
		}else if($("input[name=sch_title]").val()==""){
			alert("제목을 입력해주세요.")
		}else if($("#summernote").val()==""){
			alert("내용을 입력해주세요.")
		}else if($("input[name=sch_type]").val() == ""){
			alert("캘린더 타입을 선택해주세요.")
		}else{
			if(confirm("일정을 등록하시겠습니까?") == true){
				console.log(checked);
				console.log($('input[name=setEventTime]').val());
			    $("#insertNewEvent").attr("action", "<%=request.getContextPath()%>/addEvent.sc?checked=" +checked);
				$("#insertNewEvent").submit();
				alert("일정이 등록되었습니다.")
				
			}else{   
			   //취소 버튼 눌렀을 때 실행 할 코드
			   return false;
			}
		}
		
	}
	
	</script>

	<script>
	  $(function () {
	    //Date range picker
	    // $('#reservation').daterangepicker()
	    //Date range picker with time picker
	    $('#setEventTime').daterangepicker({
	      timePicker: true,
	      timePickerIncrement: 10,
	      locale: {
	        format: 'YYYY/MM/DD hh:mm:ss'
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