<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content-wrapper {
	overflow: auto;
}

#statisticsContent{
	margin-left : 4% !important;
}


/*ajax 테이블*/
#employeeStatistics{
	font-size : small;
}

#employeeStatistics>thead{
	height : 40px;
}
#employeeStatistics>thead>tr>th{
	padding : 7px !important;
	vertical-align: middle !important;
	background-color: #DAE1E7;
	border : 1px solid rgb(192,192,192) !important;
	
	
}
#employeeStatistics>tbody>tr>td{
	padding : 11px !important;
	
}

#rowspan{
	padding-bottom : auto !important;
	
}
/*검색부분*/
#searchEmpTable>tbody>tr>th{
	background-color: #DAE1E7 !important;
	text-align:center;
	font-size : small;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">

		
			<div class="container-fluid">
				<div class="row">
				<jsp:include page="../attendance/AttendanceSidebar.jsp" />
					
				<!--메인 -->
				<div class="col-9" id="statisticsContent">
				<br><br>
				    <div class="card card-outline card-info">
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>소속 근로시간 통계</b>
							</h6>
						</div>
						<!-- 카드바디 -->
						<div class="card-body">
							<div class="card">
								<!-- 검색부분 -->
								<div class="card-body">
									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
										<form action="monthselect.ps" id="tableForm">
											<tr>
												<th>검색일</th>
												<td>												
												<div class="row" style="margin-left: 0px;">	&nbsp;&nbsp;												
													<select id="yearselect" name="yearselect" class="custom-select custom-select-sm" style="width: 10%;" >
														<option value="2021">2021</option>
														<option value="2020" >2020</option>
														<option value="2019">2019</option>
														<option value="2018">2018</option>
														<option value="2017">2017</option>
													</select>&nbsp;&nbsp;
													<select id="monthselect" name="monthselect" class="custom-select custom-select-sm" style="width: 10%;">
														<option value="01">1월</option>
														<option value="02">2월</option>
														<option value="03">3월</option>
														<option value="04">4월</option>
														<option value="05">5월</option>
														<option value="06">6월</option>
														<option value="07">7월</option>
														<option value="08">8월</option>
														<option value="09">9월</option>
														<option value="10">10월</option>
														<option value="11">11월</option>
														<option value="12">12월</option>
													</select>&nbsp;&nbsp;
													<select id="weekselect" name="weekselect" class="custom-select custom-select-sm" style="width: 10%;">
														
													</select>					
												</div>													
												</td>
											</tr>
											<tr>
												<th>검색 조건</th>
												<td>												
												<div class="row" style="margin-left: 0px;">
													&nbsp;&nbsp;
													<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllEmployee();">전체검색</button>
													&nbsp;&nbsp;
														
													<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
														<option value="allType">전체</option>
														<option value="deptType" >부서</option>
														<option value="empNoType">사번</option>
														<option value="empNameType">이름</option>
														<option value="ePhoneType">내선번호</option>
														<option value="emailType">이메일</option>
													</select>
													&nbsp;&nbsp;
													<div class="input-group" style="width: 30%;">
														<input type="search" id="searchInput"
															class="form-control form-control-sm"
															placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
														<div class="input-group-append">
															<button type="submit" class="btn btn-sm btn-default">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</div>	
												</td>
											</tr>
										</form>
										</table>
									</div>
								</div>
							</div>
							<!-- 검색부분 -->
							
							<br>
							<div class="text-center">
								<h4>2021년 10월</h4>
							</div>
					
							<!-- 조회테이블 -->
							<div class="card-body">
				                <table class="table table-bordered" id="employeeStatistics">
				                  <thead align="center">
				                    <tr >				                    	
										<th  rowspan="2" width="14%" >소속</th>
										<th rowspan="2" width="13%" class="rowspan">성명</th>
										<th colspan="3">누적근로시간</th>											
										<th colspan="2">잔여근로시간</th>							
									</tr>
									<tr>																					
										<th  width="14%">소정근로시간</th>
										<th  width="14%">소정외근로시간</th>
										<th  width="14%">총 근로시간</th>
										<th  width="14%">소정근로시간</th>
										<th  width="14%">소정외근로시간</th>
									</tr>
				                  </thead>
				                  <tbody align="center">
				                    <tr>
										<td>경영지원팀</td>
										<td>장도연</td>
										<td>24시간 20분</td>
										<td>10시간 0분</td>
										<td>36시간 0분</td>
										<td>5시간 0분</td>
										<td>8시간 0분</td>
									</tr>
				                  </tbody>
				                </table>
				            </div>
		            		<!-- 조회테이블 -->
			             
		                </div>
		            	<!-- /.card -->
						
						</div>
						<!-- /.row -->
					</div>
					<br> <br> 
				</div>
			</div>
			
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			
	
			 
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	

		
	</script>	   
	<script>
      $(function() {
         
        
         $("#weekselect").attr("style", "display:none");
      
         $("select[name=monthselect]").change(function() {
          
           var monthselect =  $("select[name=monthselect] option:selected").val(); //text값 가져오기  
           
           console.log("~~" + monthselect);
    		
    		var params = $("#tableForm").serialize();
    		$.ajax(
    		{
    			url : 'monthselect.ps',
    			type: 'POST',
    			data : params,
    			dataType: 'json',
    			success : function(weeklist)
    					{			

		    				var value="";
		    				$.each(weeklist, function(i, obj){
		    					
		    					
		    					value += 
		    							"<option value="+ obj.month1 +">" + obj.start_date+ " ~ " + obj.end_date + "</option>"  
		    						
		    					
		    				});
		    				$("#weekselect").html(value);
		    				$("#weekselect").css("display" ,"");
		    				$("#weekselect").css("width" ,"20%");
    						
    					},
    			error: function(e){
    				console.log("에러다" + e)
    			}
    		});
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
      });
   })
	</script>
</body>
</html>