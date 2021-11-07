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
		                    <a class="nav-link active" id="custom-tabs-officeAddressBook-tab" data-toggle="pill" href="#custom-tabs-officeAddressBook" role="tab" aria-controls="custom-tabs-officeAddressBook" aria-selected="true">사내 주소록</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-personalAddressBook-tab" data-toggle="pill" href="#custom-tabs-personalAddressBook" role="tab" aria-controls="custom-tabs-personalAddressBook" aria-selected="false">외부주소록</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-four-tabContent">
						
							<jsp:include page="../addressBook/addressBook.jsp"/>
						</div>
					
		                  
	                  	<!-- 외부 주소록 탭 -->
	                  	<div class="tab-pane fade" id="custom-tabs-personalAddressBook" role="tabpanel" aria-labelledby="custom-tabs-personalAddressBook-tab">
	                  	</div>
	                  </div>	
	                  
	                 		              <!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
							<button id="deleteOfficeAddressBookBtn" type="button" class="btn btn-danger btn-sm" onclick="deleteOfficeAddressBookBtn();">주소록 삭제</button>
						</div>
					</div>
		              
		              
		              
		            </div>
		          </div>
			
			</div>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>