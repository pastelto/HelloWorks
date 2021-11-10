<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script>
<link rel="stylesheet" href="./resources/plugins/daterangepicker/daterangepicker.css">
<!--<link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
<link rel="stylesheet" href="./resources/plugins/datepicker/jquery-ui.css">
 daterange picker 
<link rel="stylesheet" href="./resources/plugins/daterangepicker/daterangepicker.css">-->
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
	
	// 수정할 일정 내용 가져오기
	$('#detailEditBtn').click(function(){
	

	    var schNo = $('#detailSchNo').val();
	    console.log("updateNo : " + schNo);

	    location.href = "getUpdateCal.sc?schNo=" + schNo;

	});
	
	
</script>

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



<!-- Bootstrap 4 -->
<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="./resources/plugins/daterangepicker/daterangepicker.js"></script>
<script src="./resources/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- Select2 -->
<script src="./resources/plugins/select2/js/select2.full.min.js"></script>	
<!-- InputMask -->
<script src="./resources/plugins/moment/moment.min.js"></script>
	<script src="./resources/plugins/inputmask/jquery.inputmask.min.js"></script>
</body>
</html>