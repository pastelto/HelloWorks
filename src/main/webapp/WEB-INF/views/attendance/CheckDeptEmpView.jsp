<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 출근 기록</title>
<!-- css attendance  -->
<link href="resources/css/attendance/CheckDeptEmp.css" rel="stylesheet" type="text/css">
<style>
#searchEmpTable>thead>tr>th, #searchEmpTable>tbody>tr>th {
   background-color: #DAE1E7;
   text-align: center;
   padding: 8px;
   font-size: small;
}

#employeeTable>thead>tr>th, #employeeTable>tbody>tr>td {
   text-align: center;
}

#attendanceYear, #attendanceMonth {
   margin-left: 10px;
}
.content-wrapper {
   overflow: auto;
}

#mainContent{
   margin-left : 4% !important;
}

input[id*="radio"], input[id*="vacation"] {
   margin-left : 1% ;
   font-size : 10px;;
}

.line{
   border-bottom : 1px solid gray;
   border-color : rgb(227,227,227);
}

#realtype1, #realtype2{
   margin-left : 3px;
   padding-top : 5px;
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
               <div class="col-9" id="mainContent">
                  <br> <br>
                  <div class="card card-outline card-info">
                     <div class="card-header text-center">
                        <h6 style="margin-bottom: 0px">
                           <b>부서원 출결 조회</b>
                        </h6>
                     </div>
                     <div class="card-body">
                        <div class="card">
                           <div class="card-body">
                              <div class="card" style="margin-bottom: 0px;">      
                             	 <form action="checkDeptTime.ps" method="post">                           
                                 <table id="searchEmpTable" style="width:100%;">                                
                                    <thead>
                                       <tr>
                                          <th style="width: 20%" class="line">검색일</th>
                                          <td style="width: 80%" class="line">
                                             <select id="attendanceYear" name="attendanceYear" class="custom-select custom-select-sm" style="width: 15%;" >
                                                <option value="21/">2021</option>
                                                <option value="20/">2020</option>
                                                <option value="19/">2019</option>
                                                <option value="18/">2018</option>
                                                <option value="17/">2017</option>
                                             </select> &nbsp; 
                                             <select id="attendanceMonth"name="attendanceMonth" class="custom-select custom-select-sm" style="width: 15%;" >
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
                                             </select>
                                          </td>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <th style="width: 20%" class="line">구분</th>
                                          <td style="width: 80%" class="line">                                             
                                             <div class="container-fluid">
                                                <button id="realtype1" type="button"  class="btn btn-default btn-sm" >근태구분</button>&nbsp;
                                                <button id="realtype2" type="button" class="btn btn-default btn-sm" >휴가구분</button>
                                             </div>                                             
                                             <div class="attendancetype">&nbsp;
                                                <input type="radio" name="attendance_type" value="출근전" id="radio1">출근전
                                                <input type="radio" name="attendance_type" value="정상출근" id="radio2">정상출근
                                                <input type="radio" name="attendance_type" value="지각" id="radio3">지각
                                                <input type="radio" name="attendance_type" value="결근" id="radio4">결근
                                                <input type="radio" name="attendance_type" value="반차" id="radio5">반차
                                                <input type="radio" name="attendance_type" value="연차" id="radio6">연차
                                                <input type="radio" name="attendance_type" value="병가" id="radio7">병가
                                                <input type="radio" name="attendance_type" value="조퇴" id="radio8">조퇴
                                             </div>
                                             <div class="vacationtype">&nbsp;                                          
                                                <input type="radio" name="vacation_type" value="보건휴가" id="vacation1">보건휴가
                                                <input type="radio" name="vacation_type" value="출산휴가" id="vacation2">출산휴가
                                                <input type="radio" name="vacation_type" value="대체휴가" id="vacation3">대체휴가
                                                <input type="radio" name="vacation_type" value="경조사" id="vacation4">경조사
                                                <input type="radio" name="vacation_type" value="육아휴직" id="vacation5">육아휴직   
                                             </div>                        
                                          </td>
                                       </tr>
                                       <tr>
                                          <th style="width: 20%">검색조건</th>
                                          <td style="width: 80%">
                                             <div class="row" style="margin-left: 0px;">
                                                &nbsp;&nbsp;&nbsp;                                             
                                                <select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;">
                                                   <option value="전체">전체</option>
	                                                   <c:if test="${ loginUser.deptCode eq 'A1' }">
	                                               <option value="부서" >부서</option>
	                                                   </c:if>
                                                   <option value="사번">사번</option>
                                                   <option value="이름">이름</option>
                                                </select>
                                                &nbsp;&nbsp;&nbsp;
                                                <div class="input-group" style="width: 30%;">
                                                   <input type="search" id="searchInput"
                                                      class="form-control form-control-sm"
                                                      placeholder="검색어를 입력하세요." name="search" value="${ search }">
                                                   <div class="input-group-append">
                                                      <button type="submit" class="btn btn-sm btn-default" >
                                                         <i class="fa fa-search"></i>
                                                      </button>
                                                   </div>
                                                </div>
                                             </div>
                                          </td>
                                       </tr>
                                    </tbody>                                  
                                 </table> 
                                 </form>                                
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- /.col -->
                     <div class="col-md-12" style="overflow: auto; height: 450px">
                        <table id="employeeTable" class="table table-sm">
                           <caption style=" caption-side: top ">
                              * 정렬 기준 : <span class="container-fluid" id="sortOption">날짜</span>
                              <c:if test="${ loginUser.deptCode eq 'A1' }">
                              <span class="float-right"><button id="updatebtn" class="btn btn-block btn-outline-warning" >상태 수정</button></span>
                              </c:if>
                           </caption>
                           <thead>
                              <tr aling="center">
                              <c:if test="${ loginUser.deptCode eq 'A1' }">
                                 <th style="width: 10px;"><input type='checkbox' name='deleteAll' value='selectall'></th>
                              </c:if>
                              	 <th style="width: 12%;">날짜</th>
                                 <th style="width: 12%;">사번</th>
                                 <th style="width: 12%;">부서</th>
                                 <th style="width: 12%;">이름</th>
                                 <th style="width: 12%;">직급</th>
                                 <th style="width: 12%;">상태</th>
                                 <th style="width: 12%;">출근시간</th>
                                 <th style="width: 12%;">퇴근시간</th>
                              </tr>
                           </thead>
                           <tbody>
                           <c:if test="${ !empty searchlist }">
                           	  <c:forEach items="${ searchlist }" var="search">
	                              <tr>
	                              	
		                              <c:if test="${ loginUser.deptCode eq 'A1' }">
		                                 <td><input type='checkbox' name='deleteOne' value="${search.psaNo}"></td>
		                              </c:if>
		                               	 <td>${search.psCreateDate }</td>
		                                 <td>${search.empNo }</td>
		                                 <td>${search.deptName }</td>
		                                 <td>${search.name }</td>
		                                 <td>${search.jobName }</td>
			                                 <c:if test="${ search.psStatus eq '휴가' }">
			                                 <td>${search.vacation }</td>
			                                 </c:if>
			                                 <c:if test="${ search.psStatus ne '휴가' }">
			                                 <td>${search.psStatus }</td>
			                                 </c:if>			                             
		                                 <td>${search.inTime }</td>
		                                 <td>${search.outTime }</td>
	                                	                                
	                              </tr>
                              </c:forEach>
                            </c:if>
                            <c:if test="${ empty searchlist }">
                                   <tr>
                                   	  <td colspan="9">검색결과가 없습니다</td>   
                                   </tr>
                            </c:if>
                           </tbody>
                        </table>
                     </div>
                     <!-- /.col -->
                  </div>
                  <!-- /.row -->
               </div>
               <br> <br> 
            </div>
         </div>
      
   </div>
   <jsp:include page="../common/footer.jsp" />
   <script>
   $("#updatebtn").click(function() {
	   
	   var ckvalue= "";
	   $("input[name='deleteOne']:checked").each(function() {
			ckvalue = $(this).val();
			console.log("~~~~~~~~"+ckvalue);
			
		});
	   var _width = '370';
	     var _height = '500';
	     console.log("~~~~~~~~"+ckvalue);
	     // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	     var _left = Math.ceil(( window.screen.width - _width )/2);
	     var _top = Math.ceil(( window.screen.height - _height )/4); 
	  
	        window.open('<%=request.getContextPath()%>/updateStatus.ps?psaNo='+ckvalue,
	    		  '상태 수정', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	   
   });
  
   </script>
   <!-- 
   <script>
   function searchSubmit(){
   	   var attendanceYear = $('select[name="attendanceYear"]').val();
	   var attendanceMonth = $('select[name="attendanceMonth"]').val();
	   var attendance = $('input:radio[name="attendance_type"]:checked').val();
	  
	   var vacation = $('input:radio[name="vacation_type"]:checked').val();
	   var optionType = $('select[name="optionType"]').val();
	   var search = $('#searchInput').val();
	   
	   
		$.ajax({
			url:"checkDeptTime.ps",
			data:{
				attendanceYear:attendanceYear,
				attendanceMonth:attendanceMonth,
				attendance_type:attendance,
				vacation_type:vacation,
				optionType:optionType,
				search:search		
			},
			type:"post",
			success:function(list){
				 
				var value="";
				$.each(list, function(i, obj){
					
					value +="<tr>"+
					"<c:if test=" + ${ loginUser.deptCode eq 'A1' } +">" +
	                 "<td><input type='checkbox' name='deleteOne' value="${c.CMNo}"></td>"+
	                 "</c:if>"+
	                 "<td>"+ list.psCreateDate + "</td>"+
	                 "<td>"+ list.empNo + "</td>"+
	                 "<td>"+ list.deptName + "</td>"+
	                 "<td>"+ list.name + "</td>"+
	                 "<td>"+ list.jobName + "</td>"+
	                 "<td>"+ list.psStatus + "</td>"+
	                 "<td>"+ list.inTime + "</td>"+
	                 "<td>"+ list.outTime + "</td>"+
					"</tr>";
					
				});
				
				 $("#employeeTable>tbody>tr").html(value);
			},error:function(){
				console.log("ajax 통신 실패");
			}
		});
   )
   
   </script> -->
   
   <!-- 검색조건  
   <script>
   function searchSubmit(){
	   var attendance = $('input:radio[name="attendance_type"]:checked').val();
	   var vacation = $('input:radio[name="vacation_type"]:checked').val();
	   var search = $('#searchInput').val();
	   
	   console.log("attendance" + attendance);
	   
	   
	   $(function(){
	      $.ajax({
	         url: "checkDeptEmp.ps",
	         type: "post",
	         data : {
	        	 attendanceYear : attendanceYear,
	        	 attendanceMonth : attendanceMonth,
	        	 attendance_type : attendance,
	        	 vacation_type : vacation,
	        	 optionType : optionType,
	        	 searchEmployee : search        	 
	         } ,
	         success:function(list){
	            
	            var value="";
	            
	            $.each(list, function(i, obj){               
	               value +=
	               "<td>" +  obj.empNo + "</td>" + 
	               "<td>" +  obj.deptName + "</td>" + 
	               "<td>" +  obj.name + "</td>" + 
	               "<td>" +  obj.jobName + "</td>" + 
	               "<td>" +  obj.psStatus + "</td>" + 
	               "<td>" +  obj.inTime + "</td>" + 
	               "<td>" +  obj.outTime + "</td>" ;
	            });
	            
	            $("#employeeTable>tbody>tr").html(value);
	         },
	         error:function(){
	            console.log("ajax 통신 실패")
	         }
	      })
	   });
   }
   
   </script>-->
   
   
   <!--  
   <script>
   function searchSubmit(){
	   var attendanceYear = $('select[name="attendanceYear"]').val();
	   var attendanceMonth = $('select[name="attendanceMonth"]').val();
	   var attendance = $('input:radio[name="attendance_type"]:checked').val();
	  
	   var vacation = $('input:radio[name="vacation_type"]:checked').val();
	   var optionType = $('select[name="optionType"]').val();
	   var search = $('#searchInput').val();
	   
	   console.log("Dd" + attendanceYear);
	   console.log("Dd" + attendanceMonth);
	   console.log("Dd" + attendance);
	   console.log("Dd" + vacation);
	   console.log("Dd" + optionType);
	   console.log("Dd" + search);
	   
	   $(function() {
		   location.href = "checkDeptEmp.ps?attendanceYear=" + attendanceYear + "&attendanceMonth=" + attendanceMonth +
		   "&attendance_type=" + attendance +"&vacation_type=" + vacation +"&optionType=" + optionType +"&search=" + search ;
	   });
	   
   }
   </script>
   -->
   <!-- 체크박스 all -->
   <script>   
   $("input[name='deleteAll']").click(function(){
      
      if(($("input[name='deleteAll']")).prop("checked")){
         $("input[name='deleteOne']").prop("checked",true);
      }else{
         $("input[name='deleteOne']").prop("checked",false);
      }
   });
   </script>
   
   
   
   <!-- 근태구분 휴가구분  -->
   <script>
   $(function(){
	   var attendance = $('input:radio[name="attendance_type"]:checked').val();
	   var vacation = $('input:radio[name="vacation_type"]:checked').val();
	   var search = $('#searchInput').val();
	   
	   console.log("attendance" + attendance);
      $('.attendancetype').hide();
      $('.vacationtype').hide();
               
      $('#realtype1').click(function(){
         $(".attendancetype").show();
         $('.vacationtype').hide();         
      });
      
      $('#realtype2').click(function(){
         $(".vacationtype").show();
         $('.attendancetype').hide();         
      });
      
   });
   
   
   </script>
</body>
</html>