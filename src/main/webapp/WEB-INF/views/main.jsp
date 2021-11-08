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
	margin-left:20px;
}
.approval, .request, .workShare{
	padding-top:20px;
	margin-left:20px;
}
body{
	overflow-x:hidden;
}
</style>
</head>
<body>


  <jsp:include page="./common/menubar.jsp" />
   <div class="content-wrapper" >
   		
   		<div class="row">
   		
   		
   			<!-- 왼쪽 -->
			<div style="width:23%;" >
				<div class="attendance" id="attendance">
		   	 		<jsp:include page="./attendance/mainAttendance.jsp" />
		   		</div>
			</div>
			
			
			
			<!-- 중간-->
			<div style="width:54%;">
				<div class="approval" id="approval">
		   	 		<jsp:include page="./approval/mainApproval.jsp" />
		   		</div>
<<<<<<< HEAD
		   		<div class="row">
					<div class="request col-6" id="request">
		   	 			<jsp:include page="./request/mainRequest.jsp" />
		   			</div>		
		   			<div class="request col-6" id="mailMain">
		   	 			<jsp:include page="./request/mainRequest.jsp" />
		   			</div>	   		
=======
		   		<div class="workShare" id="workShare">
		   	 		<jsp:include page="./workShare/mainWorkShare.jsp" />
		   		</div>
		   		<div class="request" id="request">
		   	 		<jsp:include page="./request/mainRequest.jsp" />
>>>>>>> branch 'Master' of https://github.com/pastelto/HelloWorks.git
		   		</div>
		   		
			</div>

			
			
			<!-- 오른쪽-->
			<div style="width:23%;" >
				<div class="mySchedule" id="mySchedule">
		   	 		<jsp:include page="./schedule/mainMySchedule.jsp" />
		   		</div>
			</div>
			
			
			
   		</div>
  
   </div>
   

   <jsp:include page="./common/footer.jsp" />
  

</body>
</html>