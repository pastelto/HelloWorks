<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
    <style>
    	.loginDiv{
    		width: 40%;
    		height:300px;
    		margin: auto;
            margin-top: 10%;    
    		border: 1px solid black;
    		text-align: center;
    	}
    	.loginDiv , .login_logo{
    		display: inline-block;
    		
    	}
    	.login_logo{
    		width: 50%;
    		height: 230px; 		
    		margin-top: 4%;
    		padding-right: 15%;
    		
    	}
    	
    	.loginDiv, .loginForm{    		
    		display: inline-block;
    	}
    	.loginForm{
    		padding-right: 5%;
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

    <div class="loginDiv">
    	<!-- logoImage -->
        <img class="login_logo" src="resources/common/loginLogo.png" alt="login logo">
      	
        <form action="login.me" method="post" class="loginForm">
	        <div class="login">
	        	<label for="empNo"></label>
	            <input type="text" id="empNo" name="empNo" placeholder="사번" >
	            <br>
	            <label for="empPwd"></label>
	            <input type="password" id="empPwd" name="empPwd" placeholder="비번">
	            <br>	       
	        </div>
	        <div>
	        	<button type="submit" class="btn btn-primary">로그인</button>	            
	        </div>
        </form>
    </div>

</body>
</html>