<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 메일함</title>
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
							<i class="nav-icon fas fa-envelope"><b> 보낸 메일함</b></i>
						</h4>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main.mi">Home</a></li>
							<li class="breadcrumb-item active">보낸 메일함</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
					<a href="compose.ml" class="btn btn-primary btn-block mb-3">메일쓰기</a>

					<div class="card card-outline card-info">
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
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="card card-outline card-info">
						<div class="card-header">
							<h3 class="card-title">보낸 메일함</h3>
							<div class="card-tools">
								<div class="input-group input-group-sm">
									<input type="text" class="form-control"
										placeholder="Search Mail">
									<div class="input-group-append">
										<div class="btn btn-primary">
											<i class="fas fa-search"></i>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button"
									class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									1-50/200
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped" id="sentList">
									<tbody>
										<c:forEach items="${ sentMailList }" var="sMail"
											varStatus="status">
											<tr>
												<td onclick="event.cancelBubble=true;"><!-- 클릭하고싶지 않은 td!! -->
													<div class="icheck-primary">
														<input type="checkbox" value="${ sMail.mailNo }">
													</div>
												</td>
												<td>${ sMail.mailNo }</td>
												<td class="mailbox-name">
												<c:forEach var="i" begin="0" end="${fn:length(rcvrList)}" step="1" varStatus="in">
														<c:if
															test="${ (sentMailList[status.index].mailNo eq rcvrList[i].mailNo) }">
														<span class="badge badge-info"> <b>${ rcvrList[i].mailRcvrName }</b></span> 
													</c:if>
													</c:forEach></td>
												<td class="mailbox-subject"><b>${ sMail.mailTitle }</b></td>
												<td class="mailbox-date float-right">${ sMail.mailDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
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
		$(function() {
			$("#sentList tbody tr").click(function() {
				var mailNo = $(this).children().eq(1).text();
				//console.log("mailNo : " + mailNo);
				//alert(mailNo);
				location.href = "read.ml?mailNo=" + mailNo;

			});
		});
	</script>
</body>
</html>