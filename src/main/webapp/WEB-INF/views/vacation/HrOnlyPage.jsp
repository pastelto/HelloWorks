<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사팀 근태 휴가 결재</title>
<!-- css attendance  -->
<link href="resources/css/attendance/CheckDeptEmp.css" rel="stylesheet" type="text/css">
<style>
#hrOnlyPage>thead>tr>th, #hrOnlyPage>tbody>tr>th {
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

#updatebtn{
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
                           <b>인사팀 근태 휴가 결재</b>
                        </h6>
                     </div>
                     <div class="card-body">
                        <div class="card">
                           <div class="card-body">
                              <div class="card" style="margin-bottom: 0px;">      
                             	 <form action="#" method="post">                           
                                 <table id="hrOnlyPage" style="width:100%;">                                
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
                           <caption style=" caption-side: top " >
                              * 정렬 기준 : <span class="container-fluid" id="sortOption">날짜</span>
                            
                               <span class="float-right"><button id="marginBtn" class="btn btn-block btn-outline-danger" >반려</button></span>
                               <span class="float-right"><button id="updatebtn"  class="btn btn-block btn-outline-warning" >승인</button></span>
                           </caption>
                           <thead>
                              <tr aling="center">
                              <c:if test="${ loginUser.deptCode eq 'A1' }">
                                 <th style="width: 10px;"><input type='checkbox' name='deleteAll' value='selectall'></th>
                              </c:if>
                              	 <th style="width: 14%;">부서</th>
                                 <th style="width: 14%;">이름</th>
                                 <th style="width: 14%;">직급</th>
                                 <th style="width: 14%;">문서</th>
                                 <th style="width: 14%;">시작일</th>
                                 <th style="width: 14%;">종료일</th>
                                 <th style="width: 14%;">상태</th>
                              </tr>
                           </thead>
                           <tbody>
                           <c:if test="${ !empty hr }">
                           	  <c:forEach items="${ hr }" var="hrlist">
	                              <tr>
	                              	
		                                 <td><input type='checkbox' name='deleteOne' value="${hrlist.apNo}"></td>
		                               	 <td>${hrlist.deptName }</td>
		                                 <td>${hrlist.writerName }</td>
		                                 <td>${hrlist.writerJob }</td>
		                                 <td>${hrlist.documentType }</td>
		                                 <td>${hrlist.startDate }</td>
		                                 <td>${hrlist.endDate }</td>
		                                 <td>${hrlist.progress }</td>
	                                	                                
	                              </tr>
                              </c:forEach>
                            </c:if>
                            <c:if test="${ empty hr }">
                                   <tr>
                                   	  <td colspan="9">결재 할 문서가 없습니다.</td>   
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
			
			location.href="progressChange.ps?documentNo="+ckvalue;
			
			alert("결재가 승인되었습니다.")
			
		});
	
	   
   });
  
   </script>

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
   
   
   

</body>
</html>