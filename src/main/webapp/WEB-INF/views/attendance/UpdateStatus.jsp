<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="hiddenDiv" style="display:none">
	<jsp:include page="../common/menubar.jsp" />
	</div>
	<br>
	 <div class="col-md-6">
       
            
            
            
            
	<div class="card card-info card-outline">
             <div class="card-header" >            
               <div class="text-center"><b>상태 변경</b></div>
             </div>
			  
			      <div class="card">       
		              <div class="card-body p-0">
		                <table class="table">
		                  <thead>
		                    <tr class="text-center">
		                      <th><h6  class="text-center">${update.deptName} <b>${update.name}</b> ${update.jobName}</h6></th>                     
		                    </tr>
		                  </thead>
		                  <tbody class="text-center">
		                    <tr>
		                      <td><h6>현재상태 : ${update.psStatus}</h6>
		                      	  <h6>해당날짜 : ${update.psCreateDate}</h6>
		                      	  <h6>출근시간 : ${update.inTime}</h6>
		                      	  <h6>퇴근시간 : ${update.outTime}</h6>
		                      </td>                     
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		            <form action="changeStatus.ps"  id="updateForm" > 
		            <div class="text-center">
		            	<input type="hidden" name="psaNo" value="${update.psaNo}">
		            	<input type="hidden" name="empNo" value="${update.empNo}">
		            	<div>
		            	  변경할 상태 :
		            	 <select id="changeStatus" name="changeStatus" class="custom-select custom-select-sm" style="width: 30%;" >                               
                               <option value="정상출근">정상출근</option>
                               <option value="출근전">출근전</option>
                               <option value="결근">결근</option>
                            </select> &nbsp; 
                         </div>
                         <br>
                         <div>
                                             변경할 출근시간 :
                            <select id="changeIntime"name="changeIntime" class="custom-select custom-select-sm" style="width: 30%;" >
                               <option value="09:00:00">09:00</option>
                               <option value="10:00:00">10:00</option>
                               <option value="11:00:00">11:00</option>
                               <option value="12:00:00">12:00</option>
                               <option value="13:00:00">13:00</option>
                               <option value="14:00:00">14:00</option>  
                               <option value="00:00:00">00:00</option>                                
                            </select> 
                          </div>  
                         <br>  
                         <div>
                                                변경할 퇴근시간 :
                            <select id="changeOuttime"name="changeOuttime" class="custom-select custom-select-sm" style="width: 30%;" >
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
                            </select> 
                          </div>  
                         <br>
                         <div class="float-middle">
                           <button type="button" id="updateBtn" class="btn btn-block btn-outline-warning" style="width : 30%" onclick="updateStatus();" >상태 수정</button>              
		            	 </div>
		            </div>
		            </form>
    
	           
              <!-- card body -->
              <div class="card-body">
	              
             </div>
             <!-- card body -->
      		  
              				
                          
        </div>
        
        
        <script>
        function updateStatus(){

        		var params = $("#updateForm").serialize();
        		$.ajax(
        		{
        			url : 'changeStatus.ps',
        			type: 'POST',
        			data : params,
        			contentType: 'application/json; charset=utf-8',
        			success : function(result)
        					{			
        						if(result){
        							alert("성공적으로 수정하였습니다.");
        							opener.parent.location='checkDeptTimeAll.ps'; //페이지 새로고침
            						window.close();
        							
        						}
        						
        					}
        		});

        }

        
        </script>
</body>
</html>