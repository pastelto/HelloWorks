<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeEnrollFrom</title>
<style>
	#insertForm{
		overflow: hidden;
		padding: 13px 30px;
		width: 100%;	
	}

	table{
		width: 95%;
		margin: auto;
		text-align: center;
	}
	
	.insertBtn{
		margin: 10px;
		text-align: center;
		
	}
	
</style>

</head>
<body>
	<!--  -->
	<c:if test="${ msg }">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<!--  -->
	<jsp:include page="../common/menubar.jsp" />
	 
	 	 
	 <!--  -->
	 <div class="content-wrapper">

		<!-- 페이지 해더 -->
		<section class="content-header">
			<div class="container-fluid">			
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4>
							<i class=""></i><b>사원등록</b>
						</h4>
					</div>
				</div>				
			</div>
		</section>
		
		<div class="col-12">
				<div class="card card-outline card-info">
					<div class="card-header text-center">
						<h6 style="margin-bottom: 0px">
							<b>사원등록</b>
						</h6>
					</div><br>
							
					<!-- 기본정보 -->		
					<h5>
						<b>기본정보</b>
					</h5>
						
					<form id="insertForm" action="insert.hr" method="post" onsubmit="">
						<table border=1>
							
								<tbody>
						
									<tr>
										<th>사번</th>
										<td colspan="3"><input type="number" class="form-control" name="empNo" placeholder="사번" required></td>						
									</tr>	
									<tr>
										<th>비밀번호</th>
										<td colspan="3"><input type="password" class="form-control" name="empPwd" placeholder="비밀번호" required></td>						
									</tr>	
									<tr>
										<th>성명</th>
										<td><input type="text" class="form-control" name="empName" placeholder="성명" required></td>	
										<th>영문이름</th>
										<td><input type="text" class="form-control" name="empEn" placeholder="영문이름" required></td>					
									</tr>	
									<tr>
										<th>이메일</th>
										<td colspan="3"><input type="email" class="form-control" name="empEmail" placeholder="@helloworks.com" required></td>						
									</tr>	
									<tr>
										<th>주민번호</th>
										<td colspan="3"><input type="text" class="form-control" name="empPid" placeholder="주민번호" required></td>
									</tr>								
									<tr>
										<th>입사일</th>
										<td><input type="date" class="form-control" name="empHire" placeholder="입사일" required></td>
										<th>퇴사일</th>
										<td><input type="date" class="form-control" name="empFire" placeholder="퇴사일"></td>						
									</tr>	
									<tr>
										<th>연봉</th>
										<td colspan="3"><input type="text" class="form-control" name="empSalary" placeholder="연봉" required></td>						
									</tr>	
								</tbody>	
						</table>
			
						<br><hr><br>

						<!-- 상세정보 -->
						<h5>
							<b>상세정보</b>
						</h5>						
											
						<table border=1>

							<colgroup>
								<col width="140">
							</colgroup>
								<tbody>
								<td rowspan="6" class="img">
									<div id="user_pic2">
										<img id="photo_src" src="" onerror=""> 
									</div>
								</td>	
								<!--  
									<tr>
										<th>소속</th>
										<td colspan="3">
											<select name="deptUname" required>
												<option>경영지원본부</option>
												<option>영업지원본부</option>
												<option>사업본부</option>
											</select>
										</td>						
									</tr>	
									<tr>
										<th>소속팀</th>
										<td colspan="3">
											<select name="deptDname" required>
												<option>인사팀</option>
												<option>총무팀</option>
												<option>재무회계팀</option>
												<option>영업팀</option>
												<option>운영지원팀</option>
												<option>마케팅팀</option>
												<option>디자인팀</option>
												<option>IT개발팀</option>
											</select>
										</td>						
									</tr>
									-->
									<tr>
										<th>소속</th>
										<td><input type="text" class="form-control" name="deptUname" placeholder="소속" required></td>						
										<th>소속팀</th>
										<td><input type="text" class="form-control" name="deptDname" placeholder="소속팀" required></td>
										<th>직급</th>
										<td><input type="text" class="form-control" name="jobName" placeholder="직급" required></td>																				
									</tr>	
									<tr>
										<th>재직여부</th>
										<td><input type="text" class="form-control" name="empStatus" placeholder="재직여부" required></td>		
										<th>핸드폰</th>
										<td><input type="text" class="form-control" name="empPhone" placeholder="핸드폰" required></td>	
										<th>내선번호</th>
										<td><input type="text" class="form-control" name="empEphone" placeholder="02-" required></td>					
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="5"><input type="text" class="form-control" name="empAddress" placeholder="주소" required></td>														
									</tr>	
									<tr>
										<th>상세내용</th>
										<td colspan="5" ><input type="text" class="form-control" name="empNote" placeholder="상세내용 작성"></td>
									</tr>		
								</tbody>
							</table>
							
							<div class="insertBtn">
								<button type="submit" class="btn btn-primary">제출</button>
							</div>		
											
					</form>
				</div>
			</div>
		</div>
		
	
	 <jsp:include page="../common/footer.jsp" />
</body>
</html>