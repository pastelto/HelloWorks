<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <style>
        .center{
            width: 70%;
            height: 70%;
            margin: 0 auto;
            margin-top: 10%;
            text-align: center;
        }
        .login{  
            margin-top: 15px;
        }
        #userId{
            
        }
        #userPwd{
           
        }
    </style>
</head>
<body>
    <div class="center">
    	<!-- logoImage -->
        <img src="resources/common/loginLogo.png" alt="login logo"  style="width: 22%; height: 22%;">
      	
        <form action="login.me" method="post">
	        <div class="login">
	        	<label for="userId"></label>
	            <input type="text" id="userId" placeholder="사번" >
	            <br>
	            <label for="userPwd"></label>
	            <input type="password" id="userPwd" placeholder="비번">
	            <br>	       
	        </div>
	        <div>
	        	<button type="submit" class="btn btn-primary">로그인</button>
	            <br>
	        </div>
        </form>
    </div>
    
</body>
</html>