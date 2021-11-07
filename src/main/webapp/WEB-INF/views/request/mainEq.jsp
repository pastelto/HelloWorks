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
  .eqTd{
 	ovarflow: auto;
 	padding-left:5px;
 	padding-top:5px;
 	font-familiy:함초롱바탕;
 	font-size:small;
 }
</style>
</head>
<body>
	 <div class="card-body">
		<div class="tab-content" id="custom-tabs-mainRequestEq-tab">
						
			<!-- 미결재함 탭 -->
				<div class="tab-pane fade show active" id="custom-tabs-mainRequestEq-tab" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
					<div class="card" style="margin-bottom: 0px;">
						<table id="mainRequestEqTable">
							<tbody>
								<tr>
									<td>
										<c:choose>
											<c:when test="${ empty eqRList }">								
												<div style ="text-align: center">
													<strong style="font-size: small;" > 비품신청 내역이 없습니다. </strong>
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
	var arr = new Array();
	<c:forEach items="${ eqRList }" var="eList">
		arr.push({erCondition:"${eList.erCondition}", eqName:"${eList.eqName}", SDate:"${eList.SDate}", EDate:"${eList.EDate}"});
	</c:forEach>
	
	var addRow = "";
	
	if(arr.length != 0){

		for(var i=0; i<arr.length; i++){
				addRow += '<div class="eqTd style="font-size:small;">' 
							+ '<div class="user-block">' 
							+ '<strong style="color:gray;">['+ '처리상태: &nbsp;'+arr[i].erCondition +']</strong>&nbsp;' 
							+ arr[i].eqName +'&nbsp;'+' / 사용기간 : ' + '&nbsp;'+arr[i].SDate + '~' +  '&nbsp;'+arr[i].EDate
							+ '</div>'
						    + '</div>'; 
						    
		}
		
		var trHtml = $("#mainRequestEqTable>tbody>tr>td");
		trHtml.html(addRow);
	}
</script>
</body>
</html>