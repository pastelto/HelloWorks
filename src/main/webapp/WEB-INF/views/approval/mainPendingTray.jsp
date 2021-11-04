<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  .pendingSimple{
 	ovarflow: auto;
 	padding-left:5px;
 	padding-top:5px;
 	font-familiy:함초롱바탕;
 	font-size:small;
 }
 .ap_progress{
 	color: navy;
 }
 .apTitle:hover{
 	background-color:ivory;
 }
 .div_comment{
 	background-color:#FCF8F7;
 }
	
</style>
</head>
<body>
	 <div class="card-body">
		<div class="tab-content" id="custom-tabs-pendingApproval-tab">
						
			<!-- 미결재함 탭 -->
				<div class="tab-pane fade show active" id="custom-tabs-pendingApproval-tab" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
					<div class="card" style="margin-bottom: 0px;">
						<table id="mainPendingApprovalTable">
							<tbody>
								<tr>
									<td>
										<c:choose>
											<c:when test="${ empty approvalList }">								
												<div style ="text-align: center">
													<strong style="font-size: small;" > 새로운 미결재 문서가 없습니다. </strong>
												</div>
											</c:when>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
		</div>
	</div>
	
<script>
	<!-- 오늘 올라온 결재 -->
	var arr = new Array();
	<c:forEach items="${ approvalList }" var="list">
		arr.push({apNo:"${list.apNo}", writer:"${list.writerName}", dept:"${list.deptName}", job:"${list.writerJob}",
				  apTitle:"${list.title}", create:"${list.createDate}", prgoress:"${list.progress}", detail:"${list.detailClass}"});
	</c:forEach>
	
	var addRow = "";
	
	if(arr.length != 0){
		
		for(var i=0; i<arr.length; i++){
				addRow += '<div class="pendingSimple">' + 
							'<div class="user-block">' +
							'<strong>['+ arr[i].create +']</strong>&nbsp;' +
							arr[i].dept +'&nbsp;'+ arr[i].writer +'&nbsp;'+arr[i].job + 
							'</div>'+ '<br>'+
							'<strong  style="color:gray;" class="apTitle" onclick="selectApDetail('+arr[i].apNo+",'"+arr[i].detail+"'"+');">'+ arr[i].apTitle + '</strong>'+ 
							'<hr color="gray">'+'</div>';
						
		}
		
		var trHtml = $("#mainPendingApprovalTable>tbody>tr>td");
		trHtml.html(addRow);
	}
</script>
<!-- detail view -->
	<script> 
		function selectApDetail(apNo, detailClass){
			
			switch(detailClass){
				case "기안" :
					location.href="<%=request.getContextPath()%>/normalDetail.ea?apNo="+ apNo;
					break;
				case "공문" :
					location.href="<%=request.getContextPath()%>/diplomaDetail.ea?apNo="+ apNo;
					break;
				case "인사" :
					location.href="<%=request.getContextPath()%>/hrDetail.ea?apNo="+ apNo;
					break;
				case "회의" :
					location.href="<%=request.getContextPath()%>/minutesDetail.ea?apNo="+ apNo;
					break;
				case "지출" :
					location.href="<%=request.getContextPath()%>/expenditureDetail.ea?apNo="+ apNo;
					break;
			}
			
		}
	</script>
</body>
</html>