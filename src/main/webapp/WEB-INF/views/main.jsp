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
	/* margin-left:20px; */
}
.approval,.mail{
	padding-top:30px;
}
.request{
	margin-left:20px;
}
body{
	overflow-x:hidden !important;
	overflow-y:hidden !important;
}
</style>
</head>
<body>


  <jsp:include page="./common/menubar.jsp" />
   <div class="content-wrapper" >
   		
   		<!-- <div style="width: 100%;"> -->
   		<div class="row">
   		
   			<div class="col-12">
   			<!-- 왼쪽 -->
   			<div class="row">
			<div class="col-2 ml-4 mr-4" > <!-- style="width:23%;"  style="width:54%;"  style="width:23%;" -->

				<div class="attendance" id="attendance" >
		   	 		<jsp:include page="./attendance/mainAttendance.jsp" />
		   		</div>
			</div>
			
			<div class="col-9 ml-2">
			<div class="row">
			<!-- 중간-->

			<div class="col-5">
				<div class="approval" id="approval">
		   	 		<jsp:include page="./approval/mainApproval.jsp" />
		   		</div>
		   		<div class="workShare" id="workShare">
		   	 		<jsp:include page="./workShare/mainWorkShare.jsp" />
		   		</div>	
	  
	   			   		
			</div>
			
			<div class="col-5 mail ml-3" style="padding-right: 0px; margin-right: 0px;">
			 	<div id="mail">
		   	 			<jsp:include page="./mail/mainMail.jsp" />
		   		</div>
		   		
		   		<div class="mainMtr"  id="mainMtr" >
	   	 			<jsp:include page="./request/mainMtrEq.jsp" />
	   			</div> 	
			</div>
			
			<div class="col-1" >
				<div class="mySchedule" id="mySchedule">
		   	 		<jsp:include page="./schedule/mainMySchedule.jsp" />
		   		</div>
	 
			</div>
			</div>
			</div>
			
			<!-- 오른쪽-->
			

			
			
			
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
				var valueMyApproval = ""; // 내결재함
				var valuePending=""; // 미결재함
				
				for(var key in mainAll){
					
					if(key == "unCheckedList"){
						$.each(mainAll[key], function(key, obj){
							valueUnchecked += "<tr onclick='goDetail("+obj.ws_no+")'>" +
											  "<td>" + obj.ws_no + "</td>" + 
											  "<td>" + obj.ws_title + "</td>" +
										      "<td>" + obj.ws_senderName + "&nbsp;" + obj.ws_senderJobName + "</td>" +
										      "<td>" + obj.createDate + "</td>" +
										      "</tr>";
						
						});
					} else if(key == "sendList"){
						
						$.each(mainAll[key], function(key, obj){
							valueSend += "<tr onclick='goDetail("+obj.ws_no+")>" +
										 "<td>" + obj.ws_no + "</td>" + 
										 "<td>" + obj.ws_title + "</td>" +
									     "<td>" + obj.createDate + "</td>" +
										 "</tr>";
						
						});
						
					} else if(key == "mtrRList"){
						
						$.each(mainAll[key], function(key, obj){
							valueMtr += "<tr>" +
										 "<td>" +"<strong style='color:gray;'>"+ "[" + obj.mRDate + "]" + "&nbsp;" +  obj.mRTime + " 시 " + "</strong>"+"</td>" +
										 "<td>" + obj.mMName + "</td>" +
										 "<td>" + obj.mRUsg + "</td>" +
										 "</tr>";
						
						});
					} else if(key == "eqRList"){
						
						$.each(mainAll[key], function(key, obj){
							if(obj.erCondition == "제출"){
							valueEq += "<tr>" +
										 "<td>" +"<strong style='color:gray;'>"+ "[" + obj.erCondition + "]" + "</strong>"+ "</td>" +										 
										 "<td> " + obj.eqName + "</td>" +
									     "<td> " + obj.sDate + "~" + obj.eDate + "</td>" +
										 "</tr>";
							} else if(obj.erCondition == "승인취소"){
								valueEq += "<tr>" +
								 "<td>" +"<strong style='color:salmon;'>"+ "[" + obj.erCondition + "]" + "</strong>"+ "</td>" +										 
								 "<td> " + obj.eqName + "</td>" +
							     "<td> " + obj.sDate + "~" + obj.eDate + "</td>" +
								 "</tr>";
							} else if(obj.erCondition == "승인완료"){
								valueEq += "<tr>" +
								 "<td>" +"<strong style='color:mediumturquoise;'>"+ "[" + obj.erCondition + "]" + "</strong>"+ "</td>" +										 
								 "<td> " + obj.eqName + "</td>" +
							     "<td> " + obj.sDate + "~" + obj.eDate + "</td>" +
								 "</tr>";
							}
						
						});
						
					} else if(key == "mailList"){
						
						$.each(mainAll[key], function(key, obj){
							valueMail += "<tr>" +
										 "<td>"+"<strong style='color:gray;'>"+"[" + obj.mailSndrDept + obj.mailSndrName +obj.mailSndrJobName +"]"+"</strong>"+ " </td>" + 
										 "<td>" + obj.mailTitle + "</td>" +
									     "<td>" + obj.mailDate + "</td>" +
										 "</tr>";
						
						});
						
					} else if(key == "acList"){
						console.log("확인")
						$.each(mainAll[key], function(key, obj){
							valueMyApproval += '<tr>'+'<td>'+'<div class="approvalSimple style="font-size:small;">' + 
											'<div class="user-block">' +
											'<strong style="color:gray;">['+ obj.commentDate +']</strong>&nbsp;' +
											obj.cmDept +'&nbsp;'+ obj.cmName +'&nbsp;'+obj.cmJob + 
											'</div>'+ '<br>'+
											'<strong style="color:gray;" class="apTitle" onclick="selectApDetail('+obj.apNo+",'"+obj.detailClass+"'"+');">'+ obj.title +'&nbsp;'+'</strong>'+ '<strong class="ap_progress">'+'[' + obj.progress +"]"+'</strong>'+
											'<div class="div_comment">'+
											'<p>'+
												obj.comment+
											'</p>'+ '</div>' +'<hr color="gray">'+
										   '</div>' +'</td>' + '</tr>';
						
						});
					} else if(key == "pendingList"){
						
						$.each(mainAll[key], function(key, obj){
							valuePending += '<div class="pendingSimple">' + 
											'<div class="user-block">' +
											'<strong>['+ obj.createDate +']</strong>&nbsp;' +
											obj.deptName +'&nbsp;'+ obj.writerName +'&nbsp;'+'</div>'+ '<br>'+
											'<strong  style="color:gray;" class="apTitle" onclick="selectApDetail('+obj.apNo+",'"+obj.detailClass+"'"+');">'+ obj.title + '</strong>'+ 
											'<hr color="gray">'+'</div>';
						
						});
					}
					
					console.log("ajax 성공!! -- mainAll");
					$("#unCheckedListTable tbody").html(valueUnchecked); // 업무공유 미확인
					$("#sendListTable tbody").html(valueSend); // 업무공유 발신
					$("#mainRequestMtrTable tbody").html(valueMtr); // 회의실 신청
					$("#mainRequestEqTable tbody").html(valueEq); // 비품 신청
					$("#mailListTable tbody").html(valueMail); // 메일 inbox
					$("#mainMyApprovalTable tbody").html(valueMyApproval); // 내결재함
					$("#mainPendingApprovalTable tbody").html(valuePending); // 미결재함
					
				}
				
				
				
			},error:function(){
				console.log("댓글 삭제 ajax 통신 실패");
			}
		});
  		
  		
  		
  		
  		
  	})
  	
  	
  
  
  </script>

</body>
</html>