<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.content-wrapper { 
	overflow: auto;
}
</style>
</head>
<body>
	<div id="cardMail" onclick="moveInbox();">
		<div class="card card-info card-outline"
			style="width: 95%; height: 355px;">
			<div class="card-header">
				<div class="float-left" id="headerTitle">받은메일</div>
			</div>
			<div class="card-body" style="padding-top: 5px;">
				<c:choose>
					<c:when test="${ empty mailList }">
						<div style="text-align: center" style="font-size: small;">
							<strong style="font-size: small;">새 메일이 없습니다.</strong>
						</div>
					</c:when>
					<c:when test="${ not empty mailList }">
						<div class="table-responsive p-0"
							style="height: 250px; text-align: center"
							style="font-size: small;">
							<table class="table table-head-fixed text-nowrap"
								id="mailListTable">
								<thead>
									<tr>
										<th width='40%'>보낸사람</th>
										<th width='30%'>제목</th>
										<th width='30%'>일시</th>
									</tr>
								</thead>
								<tbody>
									<!-- 테이블 -->
								</tbody>
							</table>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<script>
function moveInbox(){
	location.href = "inbox.ml";
}
	
</script>
</body>
</html>