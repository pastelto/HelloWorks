<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
								<b>소속 휴가 통계</b>
							</h6>
						</div>
						<!-- 카드바디 -->
						<div class="card-body">
							<div class="card">
								<!-- 검색부분 -->
								<div class="card-body">
									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
										<form action="statisticsSearch.ps" id="tableForm">
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
														<option value="전체">전체</option>														
														<option value="사번">사번</option>
														<option value="이름">이름</option>
													</select>
													&nbsp;&nbsp;
													<div class="input-group" style="width: 30%;">
														<input type="search" id="searchInput"
															class="form-control form-control-sm"
															placeholder="검색어를 입력하세요." name="searchtext" value="${ search }">
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
								<h4>2021년 11월</h4>
							</div>
					
							<!-- 조회테이블 -->
							<div class="card-body">
				                <table class="table table-bordered" id="employeeStatistics">
				                  <thead align="center">
				                    <tr >				                    	
										<th  rowspan="2" width="14%" >사번</th>	
										<th  rowspan="2" width="14%" >이름</th>
										<th  rowspan="2" width="14%" >직급</th>
										<th  rowspan="2" width="14%" >입사일</th>
										<th  rowspan="2" width="14%" >연차지급일</th>
										<th  rowspan="2" width="14%" >연차사용일</th>
										<th  rowspan="2" width="14%" >연차잔여일</th>					
									</tr>
				                  </thead>
				                  <tbody align="center">
										<tr align="center">
											<td>202100008</td>	
											<td>조아행</td>	
											<td>팀장</td>	
											<td>2021-10-06</td>	
											<td>18일 0시간</td>	
											<td>5일 5시간</td>	
											<td>12일 21시간</td>																					
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
	    					
		    					value += "<option value="+ obj.start_date + obj.end_date +">" + obj.start_date+ " ~ " + obj.end_date + "</option>"  
	    					
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