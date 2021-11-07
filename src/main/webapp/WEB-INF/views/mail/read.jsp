<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 읽기</title>
</head>
<style>
.content-wrapper {
	overflow: auto;
}
</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4>
							<i class="nav-icon fas fa-envelope"><b> 메일 읽기</b></i>
						</h4>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main.mi">Home</a></li>
							<li class="breadcrumb-item active">메일 읽기</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<a href="compose.ml" class="btn btn-primary btn-block mb-3">
							메일쓰기</a>
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Folders</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body p-0">
								<ul class="nav nav-pills flex-column">
									<li class="nav-item active"><a href="inbox.ml"
										class="nav-link"> <i class="fas fa-inbox"></i> 받은 메일함 <span
											class="badge bg-primary float-right">12</span>
									</a></li>
									<li class="nav-item"><a href="sent.ml" class="nav-link">
											<i class="far fa-envelope"></i> 보낸 메일함
									</a></li>
									<li class="nav-item"><a href="draft.ml" class="nav-link">
											<i class="far fa-file-alt"></i> 임시 보관함
									</a></li>
									<li class="nav-item"><a href="trash.ml" class="nav-link">
											<i class="far fa-trash-alt"></i> 휴지통
									</a></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-outline card-info">
							<div class="card-header">
								<h3 class="card-title">메일 읽기</h3>

								<div class="card-tools">
									<a href="#" class="btn btn-tool" title="Previous"><i
										class="fas fa-chevron-left"></i></a> <a href="#"
										class="btn btn-tool" title="Next"><i
										class="fas fa-chevron-right"></i></a>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0">
								<div class="mailbox-read-info">
									<h5>${ inbox.mailTitle }</h5>
									<br> <br>
									<h6>
										발신자 : ${ inbox.mailSndrDept } ${ inbox.mailSndrName } ${ inbox.mailSndrJobName }
										<span class="mailbox-read-time float-right">${ inbox.mailDate }</span>
									</h6>
								</div>
								<div class="mailbox-read-message">${ inbox.mailContent }</div>
								<!-- /.mailbox-read-message -->
							</div>
							<!-- /.card-body -->
							<div class="card-footer bg-white">
								<ul
									class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:forEach items="${ mailAttachment }" var="mailAttachment">
										<li><span class="mailbox-attachment-icon"> <i
												class="far fa-file-pdf"></i>
										</span>
											<div class="mailbox-attachment-info"
												style="width: 198px; height: 120px;">
												<a
													href="resources/mail_Attachment/${mailAttachment.mailAtChg}"
													class="mailbox-attachment-name"
													download="${ mailAttachment.mailAtChg }"><i
													class="fas fa-paperclip"></i>${ mailAttachment.mailAtOrg }
												</a>
											</div></li>
									</c:forEach>
								</ul>
							</div>
							<!-- /.card-footer -->
							<div class="card-footer">
								<div class="float-right">
									<button type="button" class="btn btn-default">
										<i class="fas fa-reply"></i> 답장쓰기
									</button>
								</div>
								<button type="button" class="btn btn-default">
									<i class="far fa-trash-alt"></i> 삭제하기
								</button>
							</div>
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<jsp:include page="../common/footer.jsp" />
	<script>
		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
					function() {
						var clicks = $(this).data('clicks')
						if (clicks) {
							//Uncheck all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', false)
							$('.checkbox-toggle .far.fa-check-square')
									.removeClass('fa-check-square').addClass(
											'fa-square')
						} else {
							//Check all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', true)
							$('.checkbox-toggle .far.fa-square').removeClass(
									'fa-square').addClass('fa-check-square')
						}
						$(this).data('clicks', !clicks)
					})
		})
	</script>
</body>
</html>