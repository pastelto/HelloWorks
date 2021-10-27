<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	        	<label for="empNo"></label>
	            <input type="text" id="empNo" name="empNo" placeholder="사번" >
	            <br>
	            <label for="empPwd"></label>
	            <input type="password" id="empPwd" name="empPwd" placeholder="비번">
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