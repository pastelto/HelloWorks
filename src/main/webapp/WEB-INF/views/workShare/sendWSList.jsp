<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무공유</title>
</head>
<body>

    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
			    <!-- 업무 목록 검색 -->			
			   	<div class="card" style="margin-bottom: 0px;">
					<table id="searchTable">
						<tr>
							<th>검색 조건</th>
							<td>
							<form action="searchUnchecked.ws">
							<div class="row" style="margin-left: 0px;">
									&nbsp;&nbsp;
									<button id="allSendWS" type="button" class="btn btn-default btn-sm" onclick="selectAllSend();">전체보기</button>
									&nbsp;&nbsp;
									
										<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="searchSelect(this.value);">
											<option value="searchTitle">제목</option>
											<option value="searchContent" >내용</option>
											<option value="searchWriter">작성자</option>
										</select>
										&nbsp;&nbsp;
										<div class="input-group" style="width: 30%;">
											<input type="search" id="searchInput"
												class="form-control form-control-sm"
												placeholder="검색어를 입력하세요." name="searchWorkShare" value="${ search }">
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
					</table>
				</div>
            </div>
            <!-- /.card-header -->
            
    	<div class="card-body">

    	
	<!-- 업무 목록 리스트 테이블 -->
	<div class="row">
          <div class="col-12" id="WorkShareTable">
            <div class="card">
               <div class="card-body table-responsive p-0"> 
                <table class="table table-hover text-nowrap" id="workShareTable">
                  <thead align="center">
                    <tr>
                      <th width="10px;">No.</th>
                      <th width="10px;"><i class="fas fa-star text-warning"></i></th>
                      <th width="40%;">제목</th>
                      <th width="10%;">발신인</th>
                      <th width="10%;">수신인원</th>
                      <th width="10%;">회신인원</th>
                      <th width="15%;">등록일</th>
                    </tr>
                  </thead>
                <tbody align="center">
                	<c:forEach items="${ list }" var="ws" varStatus="status">
	                    <tr>
	                        <td>${ ws.ws_no }</td>
	                        <c:if test="${ ws_favb eq Y }">
	                        	<td id="${ ws_no }"><a href="#"><i class="fas fa-star text-warning"></i></a></td>
	                        </c:if>
	                        <c:if test="${ ws_favb ne Y }">
	                        	<td width="10px;">&nbsp;</td>
	                        </c:if>
	                        <td>${ ws.ws_title }</td>
	                        <td>${ ws.ws_senderName } ${ ws.ws_senderJobName }</td>
	                        <td> ${cRead[status.index]}/${totalCount[status.index]} </td>
		                    <td> ${refRead[status.index]}/${totalCount[status.index]} </td>
	                        <td>${ ws.createDate }</td>
	                    </tr>
                    </c:forEach>	
                </tbody>
                </table>
               </div>
             
            </div>
            <!-- /.card -->
          </div>
        </div>
            </div>
             <!-- /.card-body -->
            <div class="card-footer">
             				<button id="sendBtn" type="button" class="btn btn-primary btn-sm float-right" onClick="location.href='sendFormView.ws'">보내기</button>

     		<div id="pagingArea">
               <ul class="pagination pagination-sm m-0 justify-content-center">
               	<c:choose>
               		<c:when test="${ pi.currentPage ne 1 }">
               			<li class="page-item"><a class="page-link" href="${pageURL}?reportType=${ reportType }&termType=${ termType }&startDate=${startDate }&endDate=${ endDate }&optionType=${optionType }&search=${search }&currentPage=${ pi.currentPage-1 }"><i class="fas fa-chevron-left"></i></a></li>
               		</c:when>
               		<c:otherwise>
               			<li class="page-item disabled"><a class="page-link" href=""><i class="fas fa-chevron-left"></i></a></li>
               		</c:otherwise>
               	</c:choose>
               	
                   <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                   	<c:choose>
                		<c:when test="${ pi.currentPage ne p }">
                   			<li class="page-item"><a class="page-link" href="${pageURL}?reportType=${ reportType }&termType=${ termType }&startDate=${startDate }&endDate=${ endDate }&optionType=${optionType }&search=${search }&currentPage=${ p }">${ p }</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
                		</c:otherwise>
                	</c:choose>
                   </c:forEach>
                   
                   
                   <c:choose>
               		<c:when test="${ pi.currentPage ne pi.maxPage }">
               			<li class="page-item"><a class="page-link" href="${pageURL}?reportType=${ reportType }&termType=${ termType }&startDate=${startDate }&endDate=${ endDate }&optionType=${optionType }&search=${search }&currentPage=${ pi.currentPage+1 }"><i class="fas fa-chevron-right"></i></a></li>
               		</c:when>
               		<c:otherwise>
               			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }"><i class="fas fa-chevron-right"></i></a></li>
               		</c:otherwise>
               	</c:choose>
               </ul>
               
           </div>           
            </div>
          </div>
        </div>
	  </div>
    </section>

	<!-- 검색창 reset -->
	<script>
		function resetSearch(){
			$("#optionType>option").eq(0).attr("selected", true);
			$("#searchInput").val("");
		}
	</script>

	<script>		
	
	function selectAllSend(){
	
	resetSearch();
	
	$.ajax({
		url: "selectAllEmployee.or",
		type: "post",
		success:function(list){
			
			var value="";
			
			$.each(list, function(i, obj){
				
				value +="<tr>"+
				"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+obj.empNo+"></th>" +
				"<td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("+obj.empNo+");'>" + obj.empNo + "</td>" + 
				"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
				"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.jobName + "</td>" +
				"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.deptDname + "</td>" +
				"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEphone + "</td>" +
				"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEmail + "</td>" +
				"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button>&nbsp;&nbsp;<button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button></th>"+
				"</tr>";
			});
			
			$("#employeeTable>tbody").html(value);
			$("#sortOption").text("전체");
		},
		error:function(){
			console.log("직원 전체 검색 ajax 통신 실패")
		}
	})
} 
</script>
</body>
</html>