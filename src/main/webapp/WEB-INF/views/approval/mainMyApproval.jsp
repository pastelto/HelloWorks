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
 .approvalSimple{
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
		<div class="tab-content" id="custom-tabs-myApproval-tab">
						
			<!-- 내결재함 탭 -->
				<div class="tab-pane fade show active" id="custom-tabs-myApproval-tab" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
					<div class="card" style="margin-bottom: 0px;">
						<!--<table id="mainMyApprovalTable">
							<tbody>
								<tr>
									<td>-->
										<c:choose>
											<c:when test="${ empty acList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 새로운 comment가 없습니다. </strong>
												</div>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${ not empty acList }">
												<div style ="text-align: center" style="font-size: small;">
													<table id="mainMyApprovalTable">
														<tbody>
														</tbody>
													</table>
												</div>
											</c:when>
										</c:choose>
									<!--</td>
								</tr>
							</tbody>
						</table>-->
					</div>
				</div>
		</div>
	</div>
	
<script>
	<!--최근에 업데이트된 결재 코멘트 3개 -->
	var arr = new Array();
	<c:forEach items="${ acList }" var="ac">
		arr.push({apNo:"${ac.apNo}", commenter:"${ac.cmName}", dept:"${ac.cmDept}", job:"${ac.cmJob}",
				  apTitle:"${ac.title}", cmDate:"${ac.commentDate}", progress:"${ac.progress}", comment:"${ac.comment}",
				  detail:"${ac.detailClass}"});
	</c:forEach>
	
	var addRow = "";
	
	if(arr.length != 0){
		
		for(var i=0; i<arr.length; i++){
				addRow += '<div class="approvalSimple style="font-size:small;">' + 
							'<div class="user-block">' +
							'<strong style="color:gray;">['+ arr[i].cmDate +']</strong>&nbsp;' +
							arr[i].dept +'&nbsp;'+ arr[i].commenter +'&nbsp;'+arr[i].job + 
							'</div>'+ '<br>'+
							'<strong style="color:gray;" class="apTitle" onclick="selectApDetail('+arr[i].apNo+",'"+arr[i].detail+"'"+');">'+ arr[i].apTitle +'&nbsp;'+'</strong>'+ '<strong class="ap_progress">'+'[' + arr[i].progress +"]"+'</strong>'+
							'<div class="div_comment">'+
							'<p>'+
								arr[i].comment+
							'</p>'+ '</div>' +'<hr color="gray">'+
						   '</div>';
						
		}
		
		var trHtml = $("#mainMyApprovalTable>tbody>tr>td");
		trHtml.html(addRow);
	}
</script>
<!-- detail view -->
	<script> 
		function selectApDetail(apNo, detailClass){
			
			console.log("apNo : " + apNo);
			console.log("detailClass : " + detailClass)
			
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