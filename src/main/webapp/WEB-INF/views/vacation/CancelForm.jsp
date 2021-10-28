<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.statusTitle1, .statusTitle2, .statusTitle3{
		margin-left : 15px;
		color : gray;
		margin-top : 7px;
	
	}
</style>
</head>
<body>
			
							<div class="card card-outline card-info" id="humanr_div">
								<div class="card-header" >
									<h3 class="card-title" >근태조정계</h3>
								</div>
								<div class="card-body">
									<table width="400px" style="font-size:0.8em;" height="50px" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
															<colgroup>
																<col width="15%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
															</colgroup>
														<tbody>
															<tr>															
																<th rowspan="2"  scope="col">결재</th>
																<th class="table emp_level" scope="col">
																	<input type="text" class="border_none" id="emp_level0" value="${loginUser.jobName}" disabled/>
																</th>
																<th class="table emp_level" scope="col">
																	<input type="text" class="border_none" id="emp_level4_1" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level4_2" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level4_3" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level4_4" disabled/>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name0" value="${loginUser.empName}" disabled/>
																	<input type="hidden" id="writer" name="writer" value="${loginUser.empNo}">
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name4_1" disabled/>
																	<input type="hidden" id="line4_1" name="line1" >
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name4_2" disabled/>
																	<input type="hidden" id="line4_2" name="line2" >
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name4_3" disabled/>
																	<input type="hidden" id="line4_3" name="line3" >
																</td>
																<td class="table emp_name"scope="col" >
																	<input type="text" class="border_none" id="emp_name4_4" disabled/>
																	<input type="hidden" id="line4_4" name="line4" >
																</td>											
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<colgroup>
																<col width="15%" />
																<col width="22%" />
																<col width="22%" />
																<col width="22%" />
																<col width="22%" />
															</colgroup>
														<tbody>
															<tr>
																<th rowspan="2"  scop="col">협조</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level4_1" id="coo_level4_1" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level4_2" id="coo_level4_2" disabled/>
																</th>
																<th class="table coo_level"  scop="col">
																	<input type="text" class="coo_level4_3" id="coo_level4_3" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level4_4" id="coo_level4_4" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name4_1" id="coo_name4_1" disabled/>
																	<input type="hidden" id="cooperator4_1" name="cooperator0">
																</td>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name4_2" id="coo_name4_2" disabled/>
																	<input type="hidden" id="cooperator4_2" name="cooperator1" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name4_3" id="coo_name4_3" disabled/>
																	<input type="hidden" id="cooperator4_3" name="cooperator2" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name4_4" id="coo_name4_4" disabled/>
																	<input type="hidden" id="cooperator4_4" name="cooperator3" >
																</td>										
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>
											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusLine(4);">+ 결재라인 추가</button>
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusCoo(4);">+ 협조 추가</button>
												</td>
											</tr>										
										</tbody>
									</table>							
									<table width="100%" style="font-size:0.8rem" vertical-align="middle" >
										<tr>
											<td>
												<table class="table table-bordered" id="detail_table">
													<tbody>
													<tr height="30px">
														<td width="10%" colspan="4">
															<span>수신참조 </span>												
														</td>
														<td colspan="8">											
															<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName4" class="form-control" name="ccName" width="30%"/>	
															<input type="hidden" id="ccCode4" name="ccCode"/>
															<div class="input-group-append">															
																<button type="button" class="btn btn-default" style="font-size:0.8rem" onclick="plusCC(4)">수신자등록</button>																				
															</div>
														</div>	
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>제목</span>
														</td>
														<td colspan="8">
															<input type=text class="form-control" id="ap_title" name="ap_title">
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>신청날짜</span>
														</td>
														<td colspan="8">
															<div class="row" >
																
																 <input type="date" class="form-control datetimepicker-input col-2"  id="cancleDate" name="cancleDate" style="font-size:0.8rem">														
																
																<div id="statusDiv">
																
																</div>
															<!-- 	<div class="statusTitle1">신청상태: </div>
																<div class="statusTitle2">출근시간: </div>
																<div class="statusTitle3">퇴근시간: </div> -->
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>변경상태</span>
														</td>
														<td colspan="8">								
															<select id="changeType" name="changeType" class="custom-select custom-select-sm col-1" style="width: 20%;" >
																<option value="">선택하세요</option>
																<option value="정상출근">정상출근</option>
																<option value="결근">결근</option>
																<option value="휴가">휴가</option>
															</select>&nbsp;&nbsp;&nbsp;
															<select id="changeIntime"name="changeIntime" class="custom-select custom-select-sm col-1" style="width: 30%;" >
								                                <option value="">출근시간선택</option> 
								                               <option value="09:00:00">09:00</option>
								                               <option value="10:00:00">10:00</option>
								                               <option value="11:00:00">11:00</option>
								                               <option value="12:00:00">12:00</option>
								                               <option value="13:00:00">13:00</option>
								                               <option value="14:00:00">14:00</option>  
								                               <option value="00:00:00">00:00</option>                                
								                            </select> &nbsp;&nbsp;&nbsp;
															         <select id="changeOuttime"name="changeOuttime" class="custom-select custom-select-sm col-1" style="width: 30%;" >
										                               <option value="">퇴근시간선택</option> 
										                               <option value="09:00:00">09:00</option>
										                               <option value="10:00:00">10:00</option>
										                               <option value="11:00:00">11:00</option>
										                               <option value="12:00:00">12:00</option>
										                               <option value="13:00:00">13:00</option>
										                               <option value="14:00:00">14:00</option>
										                               <option value="15:00:00">15:00</option>
										                               <option value="16:00:00">16:00</option>
										                               <option value="17:00:00">17:00</option>
										                               <option value="18:00:00">18:00</option>
										                               <option value="19:00:00">19:00</option>
										                               <option value="20:00:00">20:00</option>
										                               <option value="00:00:00">00:00</option> 
										                            </select> &nbsp;&nbsp;&nbsp; 
														</td>
													</tr>
											
											
											
											
											
													<tr>
														<td colspan="12">
															<textarea id="summernote4" name="apContent"></textarea>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>부서공유</span>
														</td>
														<td colspan="8">													
															<input type="checkbox" id="deptShare" name="deptShare" value='Y'/> 
															<input type="hidden" id="deptShare_hidden" name="deptShare" value='N'/> 														
														</td>
													</tr>
													<tr>
														<td colspan="12">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" class="normalAttach" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div> 
														</td>
													</tr>
													<tr>
														<td width="60%" colspan="6">
															<span>파일명</span>
														</td>
														<td colspan="3">
															<span>크기</span>
														</td>
														<td colspan="3">
															<span>삭제</span>
														</td>
													<tr>
													<tr id="fileRow">
														<td colspan="6">
															 <span class="normalAttachName"></span>
														</td >
														<td colspan="3">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="3">
															<button type="button" class="btn btn-danger" style="font-size:1em">삭제</button>
														</td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</table>
									
									
									<!-- footer -->
									<div class="card-footer">
										<div class="float-right">
											<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm" onclick="insertTemp();">임시저장</button>
											&nbsp;
											<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="insertApp();">등록</button>
											&nbsp;
											<button type="reset" class="btn btn-danger btn-sm" >취소</button>
											&nbsp;
										</div>
									</div>
			
								</div>
							</div>																
						</div>
					</div>	
				</div>
				
				
				
<script>
      $(function() {             
        
      
         $("input[name=cancleDate]").change(function() {
          
        	 var test = $('#cancleDate').val();
         
    		$.ajax(
    		{
    			url : 'selectStatus.ps',
    			type: 'POST',
    			data :{
    				cancleVDate : test
    			},
    			dataType: 'json',
    			
    			success : function(list)
    					{	var value="";	
    						
    							if(list.psStatus == 'A'){
    								value+= '<div class="statusTitle1">"출근전"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;  	
        						}else if (list.psStatus == 'B'){
        							value+= '<div class="statusTitle1">"정상출근"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;     
    	   	                      }else if (list.psStatus == 'C'){
    	   	                    	value+= '<div class="statusTitle1">"반차"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;  
    	   	                      }else if (list.psStatus == 'D'){
    	   	                    	value+= '<div class="statusTitle1">"지각"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;  
    	   	                      }else if (list.psStatus == 'E'){
    	   	                    	value+= '<div class="statusTitle1">"결근"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;   
    	   	                      }else if (list.psStatus == 'F'){
    	   	                    	value+= '<div class="statusTitle1">"휴가"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;   
    	   	                      }else if (list.psStatus == 'G'){
    	   	                    	value+= '<div class="statusTitle1">"조퇴"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;  
    	   	                      }else if (list.psStatus == 'H'){
    	   	                    	value+= '<div class="statusTitle1">"연차"&nbsp;  출근: ' + list.inTime + ' &nbsp;&nbsp;퇴근: ' + list.outTime +'</div>' ;   
    	   	                      }
    							
    							
    						
    						
		    				$("#statusDiv").html(value);
    					},
    			error: function(e){
    				console.log("에러다" + e)
    			}
    		}); 

    		
      });
   })
	</script>

</body>
</html>