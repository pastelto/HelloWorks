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
  
  <!-- 김다혜 - 업무공유 -->
  <script>
  	$(function(){
  	
  		
  		$.ajax({
			url:"mainWorkShare.ws",
			type:"post",
			success:function(workShareMap){
				
				var valueUnchecked = "";
				var valueSend = "";
				
				for(var key in workShareMap){
					
					if(key == "unCheckedList"){
						$.each(workShareMap[key], function(key, obj){
							valueUnchecked += "<tr>" +
											  "<td>" + obj.ws_no + "</td>" + 
											  "<td>" + obj.ws_title + "</td>" +
										      "<td>" + obj.ws_senderName + "&nbsp;" + obj.ws_senderJobName + "</td>" +
										      "<td>" + obj.createDate + "</td>" +
										      "</tr>";
						
						});
					} else if(key == "sendList"){
						
						$.each(workShareMap[key], function(key, obj){
							valueSend += "<tr>" +
										 "<td>" + obj.ws_no + "</td>" + 
										 "<td>" + obj.ws_title + "</td>" +
									     "<td>" + obj.createDate + "</td>" +
										 "</tr>";
						
						});
						
					}
					
					console.log("ajax 성공!! -- 업무공유");
					$("#unCheckedListTable tbody").html(valueUnchecked); 
					$("#sendListTable tbody").html(valueSend); 
					
					
				}
				
				
				
			},error:function(){
				console.log("댓글 삭제 ajax 통신 실패");
			}
		});
  		
  		
  		
  		
  		
  	})
  	
  	
  
  
  </script>

</body>
</html>