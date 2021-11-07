<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
<style>
	#searchEmpTable>thead {
		border-bottom: 1px solid #DAE1E7;
	}
	#searchEmpTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchEmpTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	.content-wrapper {
		overflow: auto;
	}
	#accordion>.card{
		margin-bottom: 0px;
	}
	#employeeTable {
		text-align: center;
	}
	#detailEmployeeTable>tbody>tr>th {
		width: 15%;
	}
	#modalTitleDiv {
		background: #00909E;
		padding: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 사원 관리</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>사원 관리</b>
							</h6>
						</div>

						<div class="card-body">

							<div class="card">
								<div class="card-body">
									<form action="searchEmployee.hr">
									<div class="card" style="margin-bottom: 0px;">
									
										<table id="searchEmpTable" style="100%">
										
											<thead>
											<tr>
												<th>재직유형</th>
												<td>
												<div class="mt-1 mb-1" style="margin-left: 0px;">
													&nbsp;
													<input type="radio" name="hrType" value="Y" ${ checkY }> 재직
													&nbsp;
													<input type="radio" name="hrType" value="V" ${ checkV }> 휴직
													&nbsp;
													<input type="radio" name="hrType" value="N" ${ checkN }> 퇴사
												</div>
												</td>
											</tr>
											</thead>
											<tr>
												<th>검색 조건</th>
												<td>
												
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="location.href='empManageMain.hr'">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															<span id="deptTypeBlank"style="display:none">&nbsp;&nbsp;</span>
															<select id="deptTypeOption" name="deptTypeOption" class="custom-select custom-select-sm" style="width: 15%; display:none">
																<option value="A">경영지원본부</option>
																<option value="A1">인사팀</option>
																<option value="A2">총무팀</option>
																<option value="A3">재무회계팀</option>
																<option value="B">영업지원본부</option>
																<option value="B1">영업팀</option>
																<option value="B2">운영지원팀</option>
																<option value="C">사업본부</option>
																<option value="C1">디자인팀</option>
																<option value="C2">마케팅팀</option>
																<option value="C3">IT개발팀</option>
															</select>
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchEmployee"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
																<div class="input-group-append">
																	<button type="submit" class="btn btn-sm btn-default">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													
												</td>
											</tr>
											
										</table>
										
									</div>
									</form>
								</div>
							</div>


							<div class="row">
								<!-- /.col -->
								<div class="col-12" style="overflow:auto; height: 470px">
									<table id="employeeTable" class="table table-sm">
									<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
										<thead>
											<tr>
												<th style="width: 10%">사번</th>
												<th style="width: 10%">이름</th>
												<th style="width: 10%">영문 이름</th>
												<th style="width: 5%">직급</th>
												<th style="width: 10%">소속</th>
												<th style="width: 10%">팀</th>
												<th style="width: 10%">내선번호</th>
												<th style="width: 10%">이메일</th>
												<th style="width: 10%">입사일</th>
												<th style="width: 10%">퇴사일</th>
												<th style="width: 5%">수정</th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${ list }" var="employee">
							                    <tr>
							                        <td>${ employee.empNo }</td>
							                        <td>${ employee.empName}</td>
							                        <td>${employee.empEn}</td>
							                        <td>${ employee.jobName }</td>
							                        <td>${ employee.deptUname }</td>
							                        <td>${ employee.deptDname }</td>
							                        <td>${ employee.empEphone }</td>
							                        <td>${ employee.empEmail }</td>
							                        <td>${ employee.empHire }</td>
							                        <td>${ employee.empFire }</td>
							                        <th>
							                        	<button id='updateEmp' type='button' class='btn btn-danger btn-xs'>수정하기</button>&nbsp;
							                        </th>
							                    </tr>
						                    </c:forEach>
										
										</tbody>
									</table>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->


							<div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?hrType=${ hrType }&optionType=${optionType }&deptTypeOption=${deptTypeOption}&search=${search }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="${pageURL}?hrType=${ hrType }&optionType=${optionType }&deptTypeOption=${deptTypeOption}&search=${search }&currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?hrType=${ hrType }&optionType=${optionType }&deptTypeOption=${deptTypeOption}&search=${search }&currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>



						</div>

					<!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 검색 -->
	<script>
		$(function() {
			switch ('${ optionType }') {
			case "allType":
				$("#optionType>option").eq(0).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#optionType>option").eq(1).attr("selected", true);
				
				switch ('${ deptTypeOption }') {
					case "A" :
						$("#deptTypeOption>option").eq(0).attr("selected", true);
						break;
					case "A1" :
						$("#deptTypeOption>option").eq(1).attr("selected", true);
						break;
					case "A2" :
						$("#deptTypeOption>option").eq(2).attr("selected", true);
						break;
					case "A3" :
						$("#deptTypeOption>option").eq(3).attr("selected", true);
						break;
					case "B" :
						$("#deptTypeOption>option").eq(4).attr("selected", true);
						break;
					case "B1" :
						$("#deptTypeOption>option").eq(5).attr("selected", true);
						break;
					case "B2" :
						$("#deptTypeOption>option").eq(6).attr("selected", true);
						break;
					case "C" :
						$("#deptTypeOption>option").eq(7).attr("selected", true);
						break;
					case "C1" :
						$("#deptTypeOption>option").eq(8).attr("selected", true);
						break;
					case "C2" :
						$("#deptTypeOption>option").eq(9).attr("selected", true);
						break;
					case "C3" :
						$("#deptTypeOption>option").eq(10).attr("selected", true);
						break;
				}
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNoType":
				$("#optionType>option").eq(2).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNameType":
				$("#optionType>option").eq(3).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "ePhoneType":
				$("#optionType>option").eq(4).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "emailType":
				$("#optionType>option").eq(5).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			}
			
		})
	</script>
	
	<!-- select option 부서 선택시 -->
	<script>
		function deptSelect(selectOption){
			$("#searchInput").val("");
			
			switch (selectOption) {
			case "allType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","검색어를 입력하세요.");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "empNoType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","사번을 입력하세요.");
				break;
			case "empNameType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "ePhoneType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","내선번호를 입력하세요.");
				break;
			case "emailType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이메일을 입력하세요.");
				break;
			}
		}
	</script>
	
	<!-- 검색창 reset -->
	<script>
		function resetSearch(){
			$("#optionType>option").eq(0).attr("selected", true);
			$("#deptTypeBlank").hide();
			$("#deptTypeOption").hide();
			$("#searchInput").val("");
		}
	</script>
	
	<!-- 직원 상세 정보 -->
	<script>
		function detailEmployee(empNo){
			
			$.ajax({
				url:"searchEmployeeDetail.or",
				data:{empNo:empNo},
				type:"post",
				dataType:"json",
				success:function(emp){
					console.log(emp.empName+" 사원 직원정보 ajax 통신 성공")
					
					$("#empNoCol").text(emp.empNo)
					$("#empNameCol").text(emp.empName)
					$("#empEngNameCol").text(emp.empEn)
					$("#empUDeptCol").text(emp.deptUname)
					$("#empDDeptCol").text(emp.deptDname)
					$("#empJobCol").text(emp.jobName)
					$("#empStatusCol").text("출퇴근상태값")
					$("#empEphoneCol").text(emp.empEphone)
					$("#empEmailCol").text(emp.empEmail)
					
					$("#addEmpNo").val(emp.empNo)
				},
				error:function(){
					console.log("직원 부서별 검색 ajax 통신 실패")
				}
			})
		}
	</script>
	
	<!-- footer 사내 주소록 추가 버튼 -->
	<script>
		function addOfficeAddressBookBtn(){
			const checkList = [];
			
			$("input[name='plusAddressBook']:checked").each(function(){
				const checkEmpNo = $(this).val();
				checkList.push(checkEmpNo);
			});

			location.href="addOfficeAddressBookArr.adb?checkList="+checkList;
			
		}
	</script>
	
	<!-- 유형 선택 검사 -->
	<script>
		$("input:radio[name='hrType']").click(function(){
	        
			var type = $("input:radio[name=hrType]:checked").val();
			
		    if(type=="Y"){
		    	location.href="<%=request.getContextPath()%>/empManageMain.hr";
		    }else{
		    	location.href="<%=request.getContextPath()%>/empManageHrType.hr?hrType="+type;
		    }
		});
	</script>
</body>
</html>