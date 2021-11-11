<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
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
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
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
							<i class="nav-icon far fa-address-card"></i> <b>사원등록</b>
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
							
						
					<form id="insertForm" action="insert.hr" method="post" >
						<!-- 기본정보 -->		
						<h5>
							<i class="fas fa-archive"></i> <b>기본정보</b>
						</h5>
							
						<table id="table1" class="table table-bordered">
							
								<tbody>
						
									<tr>
										<th>성명</th>
										<td><input type="text" class="form-control" name="empName" placeholder="성명" required></td>	
										<th>영문이름</th>
										<td><input type="text" class="form-control" name="empEn" placeholder="영문이름" required></td>					
									</tr>	
									<tr>
										<th>비밀번호</th>
										<td colspan="3"><input type="password" class="form-control" name="empPwd" placeholder="비밀번호" required></td>						
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
										<th>연봉</th>
										<td colspan="3"><input type="text" class="form-control" name="empSalary" placeholder="연봉" required></td>				
									</tr>	
									
								</tbody>	
						</table>
			
						<br><hr><br>

						<!-- 상세정보 -->
						<h5>
							<i class="fas fa-archive"></i> <b>상세정보</b>
						</h5>						
											
						<table id="table2" class="table table-bordered">

							<colgroup>
								<col width="140">
							</colgroup>
								<tbody>
								
									<tr>
										
										<th>소속팀</th>
										<td colspan="3">
											
										<div id="test1">
											<select name="deptCode" id="deptDnameA" class="custom-select custom-select-sm">
												
												<option value="A1">인사팀</option>
												<option value="A2">총무팀</option>
												<option value="A3">재무회계팀</option>						
												<option value="B1">영업팀</option>
												<option value="B2">운영지원팀</option>																						
												<option value="C1">디자인팀</option>
												<option value="C2">마케팅팀</option>
												<option value="C3">IT개발팀</option>
											</select>
										</div>	
										</td>		
										
										<th>직급</th>
										<td colspan="3">
											<select name="jobCode" id="jobCode" class="custom-select custom-select-sm">
												<option value="J2">본부장</option>
												<option value="J3">팀장</option>
												<option value="J4">팀원</option>
											</select>										
										</td>			
									</tr>	
									<tr>							
										<th >내선번호</th>
										<td colspan="3"><input type="text" class="form-control" name="empEphone" placeholder="02-413" required></td>					
										<th>핸드폰</th>
										<td ><input type="text" class="form-control" name="empPhone" placeholder="핸드폰" required></td>	
													
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
								<!--  <button type="submit" class="btn btn-primary">제출</button>-->
								<button type="button" class="btn btn-primary" onclick="submitBtn();">제출</button>
							</div>		
											
					</form>
				</div>
			</div>
		</div>
		
	
	 <jsp:include page="../common/footer.jsp" />
	 
	 
	 <!-- select option 부서 선택시 -->
	 <script>
	 	function submitBtn() {
				 		
	 		$('#insertForm').attr("action", "<%=request.getContextPath()%>/insert.hr");
			$('#insertForm').submit();

	 		
		}
	 </script>
	 
	<script>
		function deptSelect(selectOption){			
			
			switch (selectOption) {
			case "경영지원본부":
				
				$("#deptDnameA").show();
				$("#test1 *").attr("disabled", false)
				$("#deptDnameB").hide();
				$("#test2 *").attr("disabled", true)
				$("#deptDnameC").hide();
				$("#test3 *").attr("disabled", true)
				break;
			case "영업지원본부":
				
				$("#deptDnameA").hide();
				$("#test1 *").attr("disabled", true)
				$("#deptDnameB").show();
				$("#test2 *").attr("disabled", false)
				$("#deptDnameC").hide();
				$("#test3 *").attr("disabled", true)
				
				break;
			case "사업본부":
				
				$("#deptDnameA").hide();
				$("#test1 *").attr("disabled", true)
				$("#deptDnameB").hide();
				$("#test2 *").attr("disabled", true)
				$("#deptDnameC").show();
				$("#test3 *").attr("disabled", false)
				break;		
			}
		}
	</script>
	 
</body>
</html>