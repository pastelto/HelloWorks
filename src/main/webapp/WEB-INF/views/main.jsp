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
.approval, .workShare, .mailMain{
	padding-top:20px;
	margin-left:20px;
}
.request{
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
		   		<div class="workShare" id="workShare">
		   	 		<jsp:include page="./workShare/mainWorkShare.jsp" />
		   		</div>	
	   			<div class="mailMain"  id="mailMain" >
	   	 			<jsp:include page="./request/mainMtrEq.jsp" />
	   			</div> 				   		
			</div>

			
			
			<!-- 오른쪽-->
			<div style="width:23%;" >
				<div class="mySchedule" id="mySchedule">
		   	 		<jsp:include page="./schedule/mainMySchedule.jsp" />
		   		</div>
 		   		<div class="mail" id="mail" style="margin-left: 20px;">
		   	 			<jsp:include page="./mail/mainMail.jsp" />
		   		</div>	 
			</div>
			
			
			
   		</div>
  
   </div>
   

   <jsp:include page="./common/footer.jsp" />
  
  <!-- 김다혜 - 업무공유 -->
  <script>
  	$(function(){
  	
  		
  		$.ajax({
			url:"mainAll.mi",
			type:"post",
			success:function(mainAll){
				
				var valueUnchecked = ""; // 업무공유 미확인
				var valueSend = ""; // 업무공유 발신
				var valueMtr = ""; // 회의실 목록
				var valueEq = ""; // 비품 목록
				var valueMail = ""; // 메일 inbox
				
				for(var key in mainAll){
					
					if(key == "unCheckedList"){
						$.each(mainAll[key], function(key, obj){
							valueUnchecked += "<tr>" +
											  "<td>" + obj.ws_no + "</td>" + 
											  "<td>" + obj.ws_title + "</td>" +
										      "<td>" + obj.ws_senderName + "&nbsp;" + obj.ws_senderJobName + "</td>" +
										      "<td>" + obj.createDate + "</td>" +
										      "</tr>";
						
						});
					} else if(key == "sendList"){
						
						$.each(mainAll[key], function(key, obj){
							valueSend += "<tr>" +
										 "<td>" + obj.ws_no + "</td>" + 
										 "<td>" + obj.ws_title + "</td>" +
									     "<td>" + obj.createDate + "</td>" +
										 "</tr>";
						
						});
						
					} else if(key == "mtrRList"){
						
						$.each(mainAll[key], function(key, obj){
							valueMtr += "<tr>" +
										 "<td 20%>[" + obj.mRDate + "/</td>" + 
										 "<td 20%>" + obj.mRTime + " 시 ]</td>" +
										 "<td 30%>회의실 명: " + obj.mMName + "/</td>" +
										 "<td 30%>용도 : " + obj.mRUsg + "</td>" +
										 "</tr>";
						
						});
					} else if(key == "eqRList"){
						
						$.each(mainAll[key], function(key, obj){
							valueEq += "<tr>" +
										 "<td 30%>[처리상태: " + obj.erCondition + "]</td>" + 
										 "<td 30%>" + obj.eqName + " /</td>" +
									     "<td 20%>" + obj.sDate + " 부터 </td>" +
									     "<td 20%>" + obj.eDate + " 까지 </td>" +
										 "</tr>";
						
						});
						
					} else if(key == "mailList"){
						
						$.each(mainAll[key], function(key, obj){
							valueMail += "<tr>" +
										 "<td>[" + obj.mailSndrDept + obj.mailSndrName +obj.mailSndrJobName +"]</td>" + 
										 "<td>" + obj.mailTitle + "</td>" +
									     "<td>" + obj.mailDate + "</td>" +
										 "</tr>";
						
						});
					}
					
					console.log("ajax 성공!! -- mainAll");
					$("#unCheckedListTable tbody").html(valueUnchecked); // 업무공유 미확인
					$("#sendListTable tbody").html(valueSend); // 업무공유 발신
					$("#mainRequestMtrTable tbody").html(valueMtr); // 회의실 신청
					$("#mainRequestEqTable tbody").html(valueEq); // 비품 신청
					$("#mailListTable tbody").html(valueMail); // 메일 inbox
					
					
				}
				
				
				
			},error:function(){
				console.log("댓글 삭제 ajax 통신 실패");
			}
		});
  		
  		
  		
  		
  		
  	})
  	
  	
  
  
  </script>

</body>
</html>