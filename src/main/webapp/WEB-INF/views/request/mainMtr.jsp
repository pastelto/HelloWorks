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
	
</style>
</head>
<body>
	 <div class="card-body">
		<div class="tab-content" id="custom-tabs-mainRequestMtr-tab">
			
				<div class="tab-pane fade show active" id="custom-tabs-mainRequestMtr-tab" role="tabpanel" aria-labelledby="custom-tabs-requestMtrList-tab">
					<div class="card" style="margin-bottom: 0px;">
						<table id="mainRequestMtrTable">
							<tbody>
								<tr>
									<td>
										<c:choose>
											<c:when test="${ empty mtrRList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 신청한 회의실이 없습니다. </strong>
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
	<c:forEach items="${ mtrRList }" var="mtr">
		arr.push({mtrRNo:"${mtr.MRNo}", mtrName:"${mtr.MMName}", empNo: "${mtr.REmpNo}",
			empName: "${mtr.empName}", dept:"${mtr.deptDname}", job:"${mtr.jobName}",
				  rDate:"${mtr.MRDate}", rTime:"${mtr.MRTime}", usg:"${mtr.MRUsg}"});
	</c:forEach>
	
	var addRow = "";
	
	if(arr.length != 0){
		
		for(var i=0; i<arr.length; i++){

				addRow += '<div class="mtrTd style="font-size:small;">' 
							+ '<div class="user-block">' 
							+ '<strong style="color:gray;">['+ '&nbsp;'+arr[i].rDate +'/'+ '&nbsp;'+arr[i].rTime +'시'+']</strong>&nbsp;' 
							+'&nbsp; 회의실 명 : '+ arr[i].mtrName +'&nbsp;'+' / 용도: ' + '&nbsp;'+arr[i].usg 
							+ '<br>'+'<hr>'+ '</div>'
						    + '</div>';
						
		}
		
		var trHtml = $("#mainRequestMtrTable>tbody>tr>td");
		trHtml.html(addRow);
	}
</script>
</body>
</html>