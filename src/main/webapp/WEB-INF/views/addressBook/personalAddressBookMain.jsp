<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<style>
	.content-wrapper {
		overflow: auto;
	}
	#searchPersonalAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchPersonalAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 주소록</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-addressBook-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link" href="officeAddressBook.adb" role="tab" aria-selected="false">사내 주소록</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-personalAddressBook-tab" data-toggle="pill" href="/personalAddressBook.adb" role="tab" aria-controls="custom-tabs-personalAddressBook" aria-selected="true">외부주소록</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-four-tabContent">
						
		                  
		                  
		                  	<!-- 외부 주소록 탭 -->
		                  	<div class="tab-pane fade show active" id="custom-tabs-personalAddressBook" role="tabpanel" aria-labelledby="custom-tabs-personalAddressBook-tab">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchPersonalAddressBookTable">
										 <thead>
											<tr>
												<th>추가</th>
												<td>
													<form action="#">
														<div class="input-group mt-1 mb-1">
															&nbsp;&nbsp;
															  
															  <div class="input-group" style="width: 90%">
																<div class="input-group-prepend">
																      <span class="input-group-text input-group-xs form-control-sm badge-light">이름</span>
																   </div>
															 	<input type="text" id="pabName" class="form-control form-control-sm">
															 	
															 	<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">회사명</span>
																</div>
																<input type="text" id="pabEname" class="form-control form-control-sm">
															
																<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">직급</span>
																</div>
																<input type="text" id="pabJob" class="form-control form-control-sm">
																
																<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">전화번호</span>
																</div>
																<input type="text" id="pabPhone" class="form-control form-control-sm">
															 	<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">메일주소</span>
																</div>
																<input type="text" id="pabEmail" class="form-control form-control-sm">
																<!-- <div class="input-group-append">
																    <button class="btn btn-xs btn-default" type="button" onclick="addPersonalAddress();" style="width: 30px; font-size: 14px; important">
																	<i class="fa fa-search"></i></button>
																</div> -->
															  </div>
															  &nbsp;<button class="btn btn-xs btn-primary" type="button" onclick="addPersonalAddress();" >추가하기</button>
														</div>
													</form>
												</td>
											</tr>
											</thead>
										<tbody>
											<tr>
												<th>검색</th>
												<td>
												<form action="searcPerAddressBookEmployee.adb">
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allPersonSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllPeronalAddressBookEmployee();">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionTypePer" name="optionTypePer" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allPabType">전체</option>
																<option value="pabNameType">이름</option>
																<option value="empNameType">회사</option>
																<option value="ePhoneType">전화번호</option>
																<option value="emailType">이메일</option>
															</select>
															
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchPerson"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchPerson" value="${ searchPerson }">
																<div class="input-group-append">
																	<button type="submit" class="btn btn-sm btn-default">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													</form>
												</td>
											</tr>
											</tbody>
										</table>
									</div>
									
									
									<hr>
									<!-- 개인 주소록 리스트 -->
									<div class="col-12" >
									<div>
									<div style="height: 450px; overflow:auto;">
									<table id="personalAddressBookTable" class="table table-sm" >
									<caption style="caption-side:top">* 정렬 기준 : <span id="perSortOption">전체</span></caption>
										<thead>
											<tr>
												<th style="width: 10%"><input type='checkbox' name='checkPerAll' id='checkPerAll' onclick="checkPerAll();"></th>
												<th style="width: 20%">이름</th>
												<th style="width: 20%">회사</th>
												<th style="width: 20%">직급</th>
												<th style="width: 20%">전화번호</th>
												<th style="width: 20%">이메일</th>
												<th style="width: 10%"></th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${ personalAddresslist }" var="personalAddresslist" varStatus="status">
							                    <tr>
							                    	
							                    	<th>
							                    	<input type='checkbox' name='deletePerAddressBook' id='deletePerAddressBook' value="${ personalAddresslist.pabNo }">
							                    	</th>
							                        <td>${ personalAddresslist.pabName }</td>
							                        <td>${ personalAddresslist.pabEname}</td>
							                        <td>${ personalAddresslist.pabJob}</td>
							                        <td>${ personalAddresslist.pabPhone }</td>
							                        <td>${ personalAddresslist.pabEmail }</td>
							                        <th>
							                        	<button id='deletePersonalAddressBook' type='button' class='btn btn-default btn-xs'>삭제하기</button>&nbsp;
							                        </th>
							                    </tr>
						                    </c:forEach>
										</tbody>
									</table>
									</div>
									</div>
									
									
											<div id="pagingArea">
								                <ul class="pagination">
								                	<c:choose>
								                		<c:when test="${ piR.currentPage ne 1 }">
								                			<li class="page-item"><a class="page-link" href="${pagePerURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ piR.currentPage-1 }">Previous</a></li>
								                		</c:when>
								                		<c:otherwise>
								                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
								                		</c:otherwise>
								                	</c:choose>
								                	
								                    <c:forEach begin="${ piR.startPage }" end="${ piR.endPage }" var="p">
								                    	<c:choose>
									                		<c:when test="${ piR.currentPage ne p }">
								                    			<li class="page-item"><a class="page-link" href="${pagePerURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ p }">${ p }</a></li>
									                		</c:when>
									                		<c:otherwise>
									                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
									                		</c:otherwise>
									                	</c:choose>
								                    </c:forEach>
								                    
								                    <c:choose>
								                		<c:when test="${ piR.currentPage ne piR.maxPage }">
								                			<li class="page-item"><a class="page-link" href="${pagePerURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ piR.currentPage+1 }">Next</a></li>
								                		</c:when>
								                		<c:otherwise>
								                			<li class="page-item disabled"><a class="page-link" href="${pagePerURL}?currentPage=${ piR.currentPage+1 }">Next</a></li>
								                		</c:otherwise>
								                	</c:choose>
								                </ul>
								            </div>
								            </div>
												
									</div>
									
		                </div>
		              </div>
		              <!-- /.card -->
		              
		              
		              <!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
							<button id="deletePerAddressBookBtn" type="button" class="btn btn-danger btn-sm" onclick="deletePerAddressBookBtn();">주소록 삭제</button>
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
					
					$("#deleteEmpNo").val(emp.empNo)
				},
				error:function(){
					console.log("직원 부서별 검색 ajax 통신 실패")
				}
			})
		}
	</script>
	
	<!--  사내 주소록 삭제 버튼 -->
	<script>
		function deleteOfficeAddressBookBtn(){
			const checkList = [];
			
			$("input[name='deleteAddressBook']:checked").each(function(){
				const checkEmpNo = $(this).val();
				checkList.push(checkEmpNo);
			});

			location.href="deleteOfficeAddrressBookArr.adb?checkList="+checkList;
			
		}
	</script>
	
	<!-- 전체 제크 -->
	<script>
		function checkAll(){
			if($("input[name='checkAll']").prop("checked")){
				$("input[name='deleteAddressBook']").prop("checked", true)
			}else{
				$("input[name='deleteAddressBook']").prop("checked", false)
			}
		}
	</script>
	
	
	<!-- 검색 -->
	<script>
		$(function() {
			switch ('${ optionTypePer }') {
			case "allPabType":
				$("#optionTypePer>option").eq(0).attr("selected", true);
				$("#searchPerson").val("${ searchPerson }");
				$("#perSortOption").text("검색어 ( "+'${searchPerson}'+" )");
				break;
			case "pabNameType":
				$("#optionTypePer>option").eq(1).attr("selected", true);
				$("#searchInput").val("${ searchPerson }");
				$("#perSortOption").text("검색어 ( "+'${searchPerson}'+" )");
				break;
			case "empNameType":
				$("#optionTypePer>option").eq(2).attr("selected", true);
				$("#searchPerson").val("${ searchPerson }");
				$("#perSortOption").text("검색어 ( "+'${searchPerson}'+" )");
				break;
			case "ePhoneType":
				$("#optionTypePer>option").eq(3).attr("selected", true);
				$("#searchPerson").val("${ searchPerson }");
				$("#perSortOption").text("검색어 ( "+'${searchPerson}'+" )");
				break;
			case "emailType":
				$("#optionTypePer>option").eq(4).attr("selected", true);
				$("#searchPerson").val("${ searchPerson }");
				$("#perSortOption").text("검색어 ( "+'${searchPerson}'+" )");
				break;
			}
			
		})
	</script>
	
	<!-- 외부주소록 전체 제크 -->
	<script>
		function checkPerAll(){
			if($("input[name='checkPerAll']").prop("checked")){
				$("input[name='deletePerAddressBook']").prop("checked", true)
			}else{
				$("input[name='deletePerAddressBook']").prop("checked", false)
			}
		}
	</script>
</body>
</html>