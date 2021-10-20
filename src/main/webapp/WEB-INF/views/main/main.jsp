<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<style>
.attendance{
	padding-top:20px;
	margin-left:10px;
}
</style>
</head>
<body>
  <jsp:include page="../common/menubar.jsp" />
   <div class="content-wrapper">
   		
   		<div class="attendance" id="attendance">
   	 		<jsp:include page="../attendance/mainAttendance.jsp" />
   		</div>
  
   </div>
   
<script>






<%--
$(document).ready(function(){ 
	
	
	function test(){
		var empNo = ${loginUser.empNo};
		  console.log(empNo);
		  location.href="attendance.ps?empNo=" + empNo;  
	
		  
	}
	
	var time1 = setTimeout() =>{
        test()
    }, 1000);
	
	setTimeout(() =>{  
		clearInterval(time1); // 설정된 timeout 함수 종료
    });
 
});
--%>

	
</script>

   <jsp:include page="../common/footer.jsp" />
</body>
</html>