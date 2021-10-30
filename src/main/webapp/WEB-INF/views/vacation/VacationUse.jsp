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


/*메인*/
#vacationTable, #approvalTable{
	font-size : small;
	text-align:center;
	
	
}
.table td, .table th {
	border: 1px solid rgb(216,216,216) !important; 
	padding : 0px !important;
	height : 35px !important;
	vertical-align: middle !important;
	
}


.blue{
	text-align:left !important;
	background : #DAE1E7;
	
}

#approvalTable th{
	background : #DAE1E7;
}


</style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp" />
   <div class="content-wrapper">

      
     <div class="container-fluid">
     <div class="row">
     <jsp:include page="../attendance/AttendanceSidebar.jsp" />
               
     <div class="col-9" id="statisticsContent">
         <br><br>
             <div class="card card-outline card-info">
                
                
                <!-- 전체카드 타이틀 -->
                  <div class="card-header text-center">
                     <h6 style="margin-bottom: 0px">
                        <b>휴가 사용 현황</b>
                     </h6>
                  </div>
                  <!-- 전체카드 타이틀 --> 
                  
                  
            	 <!--카드바디 -->
                  <div class="card-body" style="margin-top:-30px;">
                     <div class="card-body">
					 <div class="row">
						<div class="col-md-12">
						
						<!-- card -->
						<div class="card">
				              <div class="card-header" style="height:40px;">
				                <h6 class="card-title" style="font-size:small;"><b>◼휴가정보</b></h6>
				              </div>
							   
							   <!-- 휴가정보 -->         
				              <div class="card-body">
				                <table class="table table-bordered" id="vacationTable">
				                  <thead>
				                    <tr>
				                      <th width="13%" class="blue">발생연차</th>
				                      <td width="17%">18일 0시간</td>
				                      <th width="13%"  class="blue">사용연차</th>
				                      <td width="17%">5일 8시간</td> 
				                      <th width="13%"  class="blue">잔여연차</th>
				                      <td width="17%">12일 7시간</td>
				                    </tr>
				                  </thead>
				                  <tbody >
				                    <tr>
				                      <th  class="blue">포상휴가일수</th>
				                      <td>미사용</td>
				                      <th  class="blue">대체휴가일수</th>
				                      <td>0일 0시간</td> 
				                      <th  class="blue">입사일</th>
				                      <td>${loginUser.empHire}</td>
				                    </tr>
				                  </tbody>
				                </table>
				              </div>
							   <!-- 휴가정보 -->   
                        </div>
                        <!-- card -->
                        
                        <!-- card -->
						<div class="card">
				              <div class="card-header" style="height:40px;">
				                <h6 class="card-title" style="font-size:small;"><b>◼휴가 사용 일수</b></h6>
				              </div>
							   
							   <!-- 휴가 사용 일수 -->         
				              <div class="card-body">
				                <table class="table table-bordered" id="approvalTable">
				                  <thead>
				                    <tr>
				                      <th width="25%">반차</th>
				                      <th width="25%">연차</th>
				                      <th width="25%">조퇴</th>
				                      <th width="25%">결근</th> 
				                    </tr>
				                  </thead>
				                  <tbody >
				                    <tr>
				                      <td>0일 0시간</td>
				                      <td>0일 0시간</td>
				                      <td>0일 0시간</td>
				                      <td>0일 0시간</td>
				                    </tr>
				                  </tbody>
				                </table>
				              </div>
							   <!-- 휴가 사용 일수 -->   
							   
							   <!-- 휴가 사용 일수 -->         
				              <div class="card-body">
				               <table class="table table-bordered" id="approvalTable">
				                  <thead>
				                    <tr>
				                      <th width="20%">보건휴가</th>
				                      <th width="20%">출산휴가</th>
				                      <th width="20%">대체휴가</th>
				                      <th width="20%">경조사</th> 
				                      <th width="20%">육아휴직</th>
				                    </tr>
				                  </thead>
				                  <tbody >
				                    <tr>
				                      <td>0일</td>
				                      <td>0일</td>
				                      <td>0일</td>
				                      <td>0일</td>
				                      <td>0일</td>
				                    </tr>
				                  </tbody>
				                </table>
				              </div>
							   <!-- 휴가 사용 일수 -->   
                        </div>
                        <!-- card -->
                        
                        <!-- card -->
						<div class="card">
				              <div class="card-header" style="height:40px;">
				                <h6 class="card-title" style="font-size:small;"><b>◼제출한 휴가문서</b></h6>
				              </div>
							   
							   <!-- 제출한 휴가문서 -->         
				              <div class="card-body">
				                <table class="table table-bordered" id="approvalTable">
				                  <thead>
				                    <tr>
				                      <th width="14%">휴가분류</th>
				                      <th width="14%">작성자(사번)</th>
				                      <th width="14%">시작일</th>
				                      <th width="14%">종료일</th> 
				                      <th width="14%">사용일수</th>
				                      <th width="14%">상태</th>
				                      <th width="14%">신청일자</th>
				                    </tr>
				                  </thead>
				                  <tbody >
				                    <tr>
				                      <td>반차(오전)</td>
				                      <td>조아혜 (202100008)</td>
				                      <td>2021-06-05</td>
				                      <td>2021-06-05</td>
				                      <td>1일 0시간</td>
				                      <td>결재진행중</td>
				                      <td>2021-05-04</td>
				                    </tr>
				                  </tbody>
				                </table>
				              </div>
							   <!-- 제출한 휴가문서 -->   
                        </div>
                        <!-- card -->
                        
                        
                        
                        </div>
                      
                    </div>
               		</div>
              		<br> <br> 
                 </div> 
         
         	</div>
     </div>
     </div>       
     </div>
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