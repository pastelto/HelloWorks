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
	#personalAddressBookTable{
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
													<form id="enrollForm">
														<div class="input-group mt-1 mb-1">
															&nbsp;&nbsp;
															  
															  <div class="input-group" style="width: 90%">
																<div class="input-group-prepend">
																      <span class="input-group-text input-group-xs form-control-sm badge-light">이름</span>
																   </div>
															 	<input type="text" id="pabName" name="pabName" class="form-control form-control-sm">
															 	
															 	<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">회사명</span>
																</div>
																<input type="text" id="pabEname" name="pabEname" class="form-control form-control-sm">
															
																<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">직급</span>
																</div>
																<input type="text" id="pabJob" name="pabJob" class="form-control form-control-sm">
																
																<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">전화번호</span>
																</div>
																<input type="text" id="pabPhone" name="pabPhone" class="form-control form-control-sm">
															 	<div class="input-group-append">
																    <span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">메일주소</span>
																</div>
																<input type="text" id="pabEmail" name="pabEmail" class="form-control form-control-sm">
															  </div>
															  &nbsp;<button class="btn btn-xs btn-primary" type="button" onclick="addPersonalAddress();">추가하기</button>
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
												<th style="width: 5%"><input type='checkbox' name='checkPerAll' id='checkPerAll' onclick="checkPerAll();"></th>
												<th style="width: 15%">이름</th>
												<th style="width: 15%">회사</th>
												<th style="width: 15%">직급</th>
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
							                        	<button onclick="deletePerson(${ personalAddresslist.pabNo })" id='deletePersonalAddressBook' type='button' class='btn btn-default btn-xs'>삭제하기</button>&nbsp;
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
								                			<li class="page-item"><a class="page-link" href="${pageURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ piR.currentPage-1 }">Previous</a></li>
								                		</c:when>
								                		<c:otherwise>
								                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
								                		</c:otherwise>
								                	</c:choose>
								                	
								                    <c:forEach begin="${ piR.startPage }" end="${ piR.endPage }" var="p">
								                    	<c:choose>
									                		<c:when test="${ piR.currentPage ne p }">
								                    			<li class="page-item"><a class="page-link" href="${pageURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ p }">${ p }</a></li>
									                		</c:when>
									                		<c:otherwise>
									                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
									                		</c:otherwise>
									                	</c:choose>
								                    </c:forEach>
								                    
								                    <c:choose>
								                		<c:when test="${ piR.currentPage ne piR.maxPage }">
								                			<li class="page-item"><a class="page-link" href="${pageURL}?optionTypePer=${ optionTypePer }&searchPerson=${ searchPerson }&currentPage=${ piR.currentPage+1 }">Next</a></li>
								                		</c:when>
								                		<c:otherwise>
								                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ piR.currentPage+1 }">Next</a></li>
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
	
	
	
	<!-- 개별 삭제 -->
	<script>
		function deletePerson(pabNo) {
			location.href="deletePerson.adb?pabNo="+pabNo;
		}
	</script>
	
	<!-- 사내 주소록 전체 삭제 버튼 -->
	<script>
		function deletePerAddressBookBtn(){
			const checkList = [];
			
			$("input[name='deletePerAddressBook']:checked").each(function(){
				const checkEmpNo = $(this).val();
				checkList.push(checkEmpNo);
			});

			location.href="deletePerAddrressBookArr.adb?checkList="+checkList;
			
		}
	</script>
	
	<!-- 전체 제크 -->
	<script>
		function checkAll(){
			if($("input[name='checkAll']").prop("checked")){
				$("input[name='deletePerAddressBook']").prop("checked", true)
			}else{
				$("input[name='deletePerAddressBook']").prop("checked", false)
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
	
	<script>
		function addPersonalAddress(){
			var pabName =  $("input[name='pabName']").val()
			var pabEname = $("input[name=pabEname]").val()
			var pabJob = $("input[name=pabJob]").val()
			var pabPhone = $("input[name=pabPhone]").val()
			var pabEmail = $("input[name=pabEmail]").val()

			if(pabName == ""){
				alert("이름을 입력해주세요.")
				return false;
			}else if(pabEname == ""){
				alert("회사명을 입력해주세요.")
				return false;
			}else if(pabJob == ""){
				alert("직급을 입력해주세요.")
				return false;
			}else if(pabPhone == ""){
				alert("전화번호를 입력해주세요.")
				return false;
			}else if(pabEmail == ""){
				alert("이메일을 입력해주세요.")
				return false;
			}
			
			$("#enrollForm").attr("action", "<%=request.getContextPath()%>/insertPersonalAddress.adb");
			$("#enrollForm").submit();
		}
	</script>
</body>
</html>