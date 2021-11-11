<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title> 
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<!-- 로그인 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

    <style>
    	body{
    		background-color: #DAE1E7;
    	}
 
    	#loginDiv{
    		width: 400px; 
    		height:460px;
    		margin: auto;
            margin-top: 120px;    
    		text-align: center;
    		background-color: white;
    		border-radius: 10px;
    	}
    	  
    	.login_logo{
    		width: 240px;
    		height: 200px;    		    						
    		margin-top: 30px;   		     		  
    	}
      
    	.loginForm{
    		width: 270px;   		
    		margin-top: 30px;  
    		display: inline-block; 
    		   	  		
    	}
     
     	#btn_login{
     		width: 200px;
     		margin: 0px auot;
     		margin-top: 7px;
     	}
         
    </style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

    <div id="loginDiv" class="example-container">
    	<!-- logoImage -->
        <img class="login_logo" src="resources/common/login_logo.png" alt="login logo">
      	
        <form action="login.me" method="post" class="loginForm">
        	<div class="input-group mb-3">
				<div class="input-group-append">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
				</div>
				<input type="text" id="empNo"  name="empNo" class="form-control input_user" placeholder="사번">
			</div>
     		<div class="input-group mb-2">
				<div class="input-group-append">
					<span class="input-group-text"><i class="fas fa-key"></i></span>
				</div>
				<input type="password" id="empPwd" name="empPwd" class="form-control input_pass" placeholder="비번">
			</div>
     
	        <div>
	        	<button type="submit" id="btn_login" class="btn btn-outline-primary">로그인</button>	            
	        </div>
        </form>
    </div>
    
</body>
</html>