<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>

	
	#updateForm{						
		overflow: hidden;
		padding: 13px 30px;
		width: 100%;
	}
	
	table{
		width: 95%;
		margin: auto;
		text-align: center;
	}
	
	.selectBtn{
		margin: 10px;
		text-align: center;		
	}
	
	/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
	.fileRegiBtn input[type="file"] , .fileRegiBtn1 input[type="file"] {
		position: absolute;
		width: 100%;
		height: 60%;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	#fileName, #fileName1{
		width: 100%;
	}


</style>
</head>
<body>

	<c:if test="${ msg }">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	
 	<jsp:include page="../common/menubar.jsp" />
	
	<div class="content-wrapper">
		
		
			<!-- 페이지 해더 -->
		<section class="content-header">
			<div class="container-fluid">			
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4>
							<i class="fas fa-chalkboard-teacher"></i> <b>마이페이지</b>
						</h4>
					</div>
				</div>				
			</div>
		</section>
	
	
			<div class="col-12">
				<div class="card card-outline card-info">
					<div class="card-header text-center">
						<h6 style="margin-bottom: 0px">
							<b>마이페이지</b>
						</h6>
					</div><br>
				
						<form id="updateForm" action="update.me" method="post" enctype="multipart/form-data">			
								<table  class="table table-bordered">
									<colgroup>
										<col width="140">
									</colgroup>										
										<tbody>
											<tr>
												<!-- 유저이미지 -->
												<td rowspan="6" >
																																
														<!-- 이미지파일 등록 -->
														<div>
															<input type="hidden" name="empOrgPic" value="${emp.empOrgPic}">																
																	<input type="hidden" name="empChgPic" value="${emp.empChgPic}">
															<!-- 이미지 들어오는 부분 -->
															<c:if test="${not empty emp.empOrgPic}">
																<div class="selectCover">
																	<img id="uploadImg" src="resources/idPhoto_files/${emp.empChgPic}"
																		style="width: 160px; height: 200px;" />
																																
																</div>
																		
															</c:if>
															
															<c:if test="${empty emp.empOrgPic}">																	
																<div class="selectCover">
																	<img id="cover" src="resources/empImg/defaultImg.jpg"
																		style="width: 160px; height: 200px;" />
																</div>
																
															</c:if>
														<div >
													
															<div class="fileRegiBtn">
																<label for="myFileUp"> 
																	사진 변경
																	<i class="fas fa-cloud-upload-alt"></i>
																</label> <input type="file" name="empOrgPicName" id="myFileUp">
																</div>														
															</div>
															
														</div>														
												</td>
														
												<th>사번</th>
												<td><input type="text" class="form-control" name="empNo" value="${ loginUser.empNo }" readonly></td>
										
												<th>이메일</th>								
												<td><input type="text" class="form-control" id="empEmail" name="empEmail" value="${ loginUser.empEmail }" readonly></td>
											</tr>											
											<tr>
												<th>성명</th>
												<td><input type="text" class="form-control" id="empName" name="empName" value="${ loginUser.empName }" readonly> </td>
												<th>영문이름</th>
												<td> <input type="text" class="form-control" id="empEn" name="empEn" value="${ loginUser.empEn }" readonly> </td>
											</tr>
											
											<tr>
												<th>주민번호</th>
												<td><input type="text" class="form-control" id="empPid" name="empPid" maxlength="6" value="${ loginUser.empPid }" readonly> </td>
												<th>핸드폰</th>
												<td><input type="text" class="form-control" id="empPhone" name="empPhone" value="${ emp.empPhone }"></td>
											</tr>	
														
											<tr>
												<th>주소</th>
												<td><input type="text" class="form-control" id="empAddress" name="empAddress" value="${ loginUser.empAddress }" readonly> </td>
												<th>내선번호</th>
												<td><input type="text" class="form-control" id="empEphone" name="empEphone" value="${ loginUser.empEphone }" readonly> </td>
											</tr>														
										</tbody>
												 
										<tfoot>
											<tr>
												<td rowspan="6">															
													
														<!-- 이미지파일 등록 -->
														<div >
														 	<input type="hidden" name="empOrgSign" value="${emp.empOrgSign}">
															<input type="hidden" name="empChgSign" value="${emp.empChgSign}">
															<!-- 이미지 들어오는 부분 -->
															<c:if test="${not empty emp.empOrgSign}">
															<div class="selectCover">
																<img id="uploadImg1" src="resources/idSign_files/${emp.empChgSign}"
																	style="width: 100px; height: 100px;" />
																
															</div>
														
															</c:if>
															<c:if test="${empty emp.empOrgSign}">
															
															
															<div class="selectCover">
																<img id="cover1" src="resources/empImg/defaultImg.jpg"
																	style="width: 100px; height: 100px;" />
															</div>
															</c:if>
														<div >
													
															<div class="fileRegiBtn1">
																<label for="myFileUp1">
																	 사인 변경
																	 <i class="fas fa-cloud-upload-alt"></i>
																</label> <input type="file" name="empOrgSignName" id="myFileUp1">
																</div>													
															</div>
														</div>		
														
														
												</td>	
											</tr>
											<tr>
												<th>소속</th>
												<td><input type="text" class="form-control" id="deptUname" name="deptUname" value="${ loginUser.deptUname }" readonly></td>
												<th >소속팀</th>
												<td> <input type="text" class="form-control" id="deptDname" name="deptDname" value="${ loginUser.deptDname }" readonly> </td>
											</tr>
											<tr>
												<th>직급</th>
												<td><input type="text" class="form-control" id="jobName" name="jobName" value="${ loginUser.jobName }" readonly> </td>
												<th >입사일</th>
												<td> <input type="text" class="form-control" id="empHire" name="empHire" value="${ loginUser.empHire }" readonly> </td>
											</tr>											
										</tfoot>																					
									</table>									
									
								<!-- 수정버튼 -->		
								<div class="selectBtn">									
									<button type="submit" class="btn btn-primary">수정</button>									
								</div><br>	
		
							</form>						
						</div>
					</div>
				</div>
		
			
			<jsp:include page="../common/footer.jsp" />
			
			<script>
				// 파일 URL 띄우기
				function readURL(input) {
					console.log("$$$$$$$$$$$$$$사진버튼클릭");
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(m) {
							$('#cover').attr('src', m.target.result); //cover src로 붙여지고
							$('#fileName').val(input.files[0].name); //파일선택 form으로 파일명이 들어온다
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				// 이미지 바꾸기
				$("#myFileUp").change(function() {
					readURL(this);
					console.log("$$$$$$$$$사진 이미지 바뀜");
				});
				
				// 사진파일 없을때 알림
				function imgValidate() {
					if (($('#myFileUp').val() == "")) {
						alert("사진파일을 등록해 주세요")
						return false;
					}
					return true;
				}
				
				//사인 변경
				function readURL1(input) {
					console.log("$$$$$$$$$$사인버튼클릭");
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(m) {
							$('#cover1').attr('src', m.target.result); //cover src로 붙여지고
							$('#fileName1').val(input.files[0].name); //파일선택 form으로 파일명이 들어온다
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				// 이미지 바꾸기
				$("#myFileUp1").change(function() {
					readURL1(this);
					console.log("$$$$$$$$$$$$$$$$$$$ 사인 이미지 바뀜");
				});
				
				// 사진파일 없을때 알림
				function signValidate1() {
					if (($('#myFileUp1').val() == "")) {
						alert("사인파일을 등록해 주세요")
						return false;
					}
					return true;
				}
			</script>

</body>
</html>