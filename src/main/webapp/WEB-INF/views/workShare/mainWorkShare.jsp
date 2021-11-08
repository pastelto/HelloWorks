<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div id="cardWorkShare">

				
		  	      <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-mainWorkShare-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link " id="custom-tabs-unCheckedWorkShare-tab" href="" role="tab" aria-controls="custom-tabs-unCheckedWorkShare" aria-selected="true" style="font-size: small">미확인 업무</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-mainApproval-tabContent">
						
							<div class="tab-pane fade " id="custom-tabs-unCheckedWorkShare" role="tabpanel" aria-labelledby="custom-tabs-unCheckedWorkShare-tab">
									<table id="mainMyApprovalTable">
							<tbody>
								<tr>
									<td>
										<c:choose>
											<c:when test="${ empty unCheckedList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 모든 업무를 확인하였습니다. </strong>
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
		              <!-- /.card -->
		          	  </div>
		          	  
		          	  <c:choose>
						<c:when test = "${ mainWSpage == 1 }">
							<script>
							$('#custom-tabs-unCheckedWorkShare').addClass('show active');
							$('#custom-tabs-sendWorkShare').removeClass('show active');		
							
							$('#custom-tabs-unCheckedWorkShare-tab').addClass('active');
							$('#custom-tabs-sendWorkShare-tab').removeClass('active');
							
							$('#custom-tabs-unCheckedWorkShare-tab').attr('aria-selected', 'true');
							$('#custom-tabs-sendWorkShare-tab').attr('aria-selected', 'false');			
							</script>
						</c:when>
					</c:choose>
		     </div>				
	
	
	
	
</body>
</html>