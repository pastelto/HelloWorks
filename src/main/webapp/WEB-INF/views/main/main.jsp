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

var empNo = ${loginUser.empNo};

$(function(){
	$("#attendance").ready(function(){
		console.log(1)
		$.ajax({
			
			//url : 데이터를 전송할 url(필수)
			url:"attendance.ps",
			//data : 요청시 전달할 파라미터 설정
			data:{empNo:empNo},//key:value
			datatype:"json",
			
			//type : 전송방식(get/post)
			type :"post",
			
			success: function(result){
				alert(result);
				location.href="attendance.ps?a=" + result;  

			},
			
			error: function(){
				console.log("Ajax 통신 실패")
				
				
			},
			
			complete:function(){//통신이 실패하던 성공하던 무조건 실행
				console.log("무조건 호출")
			}
			
			
			
		})	
		
		console.log(2)
	})
	
})




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