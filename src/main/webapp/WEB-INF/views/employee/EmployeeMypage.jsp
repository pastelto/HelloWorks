<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeMypage</title>
<style>

	#section{
		position: relative;
		clear: both;
		overflow: hidden;
		padding: 13px 30px;
		width: 100%;
		box-sizing: border-box;
	}
	#btn{
		
		align-content: center;
	}

</style>
</head>
<body>
 	<jsp:include page="../common/menubar.jsp" />
	
	<div class="content-wrapper">
		
		
		<!-- 페이지 해더 -->
		<section class="content-header">
			<div class="container-fluid">			
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4>
							<i class="nav-icon fas fa-edit"></i><b> 마이페이지</b>
						</h4>
					</div>
				</div>				
			</div>
		</section>
	
		<div class="row">
			<div class="col-12">
				<div class="card card-outline card-info">
					<div class="card-header text-center">
						<h6 style="margin-bottom: 0px">
							<b>마이페이지</b>
						</h6>
					</div><br>
				
						<form id="update" action="update.me" method="post">
							<div class="section">
								<table style="width: 100%">
									<colgroup>
										<col width="140">
									</colgroup>
										
										<tbody>
											<tr>
												<!-- 유저이미지 -->
												<td rowspan="6" valign="top" class="img">
													<div id="user_pic2">
														<img id="photo_src" src="" onerror=""> 
													</div>
												</td>									
												<th scope="row">사번</th>
												<td><input type="text" class="form-control" name="empNo" value="${ loginUser.empNo }" readonly></td>
										
												<th scope="row">이메일</th>								
												<td><input type="text" class="form-control" id="empEmail" name="empEmail" value="${ loginUser.empEmail }" readonly></td>
											</tr>
											
											<tr>
												<th scope="row">성명</th>
												<td><input type="text" class="form-control" id="empName" name="empName" value="${ loginUser.empName }" readonly> </td>
												<th scope="row">영문이름</th>
												<td> <input type="text" class="form-control" id="empEn" name="empEn" value="${ loginUser.empEn }" readonly> </td>
											</tr>
											
											<tr>
												<th scope="row">주민번호</th>
												<td><input type="text" class="form-control" id="empPid" name="empPid" maxlength="6" value="${ loginUser.empPid }" readonly> </td>
												<th scope="row">핸드폰</th>
												<td> <input type="text" class="form-control" id="empPhone" name="empPhone" value="${ loginUser.empPhone }"></td>
											</tr>	
														
											<tr>
												<th scope="row">주소</th>
												<td> <input type="text" class="form-control" id="empAddress" name="empAddress" value="${ loginUser.empAddress }" readonly> </td>
											</tr>														
										</tbody>																					
									</table>									
								</div>
											
								<div class="btn">
									<button type="submit" class="btn btn-primary">수정하기</button>
								</div><br>	
											
							</form>						
						</div>
					</div>
				</div>
			</div>
	

			<jsp:include page="../common/footer.jsp" />

</body>
</html>