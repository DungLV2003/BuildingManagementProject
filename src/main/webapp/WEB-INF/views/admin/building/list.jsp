<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
	<title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="/admin/building-list">Home</a>
					</li>
				</ul><!-- /.breadcrumb -->

			</div>

			<div class="page-content">

				<div class="page-header">
					<h1>
						Danh sách tòa nhà
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							Quản lý tòa nhà
						</small>
					</h1>
				</div><!-- /.page-header -->

				<div class="row" style="font-family: 'Times New Roman', Times, serif;">
					<div class="col-xs-12">
						<div class="widget-box ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title">Tìm kiếm</h5>

								<div class="widget-toolbar">

									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>

								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<form:form modelAttribute="modelSearch" action="${buildingListURL}" id="listForm" method="GET">
										<div class="row">
											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<label class="name">Tên tòa nhà</label>
														<form:input type="text" class="form-control" path="name"/>
													</div>

													<div class="col-xs-6">
														<label class="name">Diện tích sàn</label>
														<form:input type="number" class="form-control" path="floorArea"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-2">
														<label class="name">Quận</label>
														<form:select class="form-control" path="district">
															<option value="">---Chọn Quận---</option>
															<form:options items="${districts}"/>
														</form:select>
													</div>
													<div class="col-xs-5">
														<label class="name">Phường</label>
														<form:input type="text" class="form-control" path="ward"/>
													</div>
													<div class="col-xs-5">
														<label class="name">Đường</label>
														<form:input type="text" class="form-control" path="street"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-4">
														<label class="name">Số tầng hầm</label>
														<form:input type="number" class="form-control" path="numberOfBasement"/>
													</div>
													<div class="col-xs-4">
														<label class="name">Hướng</label>
														<form:input type="text" class="form-control" path="direction"/>
													</div>
													<div class="col-xs-4">
														<label class="name">Hạng</label>
														<form:input type="text" class="form-control" path="level" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-3">
														<label class="name">Diện tích từ</label>
														<form:input type="number" class="form-control" path="areaFrom"/>
													</div>
													<div class="col-xs-3">
														<label class="name">Diện tích đến</label>
														<form:input type="number" class="form-control" path="areaTo"/>
													</div>
													<div class="col-xs-3">
														<label class="name">Giá thuê từ</label>
														<form:input type="number" class="form-control" path="rentPriceFrom" />
													</div>
													<div class="col-xs-3">
														<label class="name">Giá thuê đến</label>
														<form:input type="number" class="form-control" path="rentPriceTo"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-4">
														<label class="name">Tên quản lý</label>
														<form:input type="text" class="form-control" path="managerName" />
													</div>
													<div class="col-xs-4">
														<label class="name">SĐT quản lý</label>
														<form:input type="text" class="form-control" path="managerPhone"/>
													</div>
													<div class="col-xs-4">
														<label class="name">Chọn nhân viên</label>
														<form:select class="form-control" path="staffId">
															<option value="">---Chọn nhân viên---</option>
															<form:options items="${listStaff}"/>
														</form:select>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<form:checkboxes items="${typeCodes}" path="typeCode" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<button type="submit" class="btn btn-xs btn-danger" id="btnSearchBuilding">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
																<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
															</svg>
															Tìm kiếm
														</button>
													</div>
												</div>
											</div>
										</div>
									</form:form>
								</div>
							</div>

							<div class="pull-right">
								<a href="/admin/building-edit">
									<button class="btn-info" title="Thêm tòa nhà">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
											<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
											<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
											<path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
										</svg>
									</button>
								</a>
								<button class="btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
										<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
										<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
										<path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
									</svg>
								</button>
							</div>

						</div>

					</div>
				</div>

				<!-- Bảng danh sách -->
				<div class="row">
					<div class="col-xs-12">
						<table id="tableList" style="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<th class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</th>
								<th>Tên tòa nhà</th>
								<th>Địa chỉ</th>
								<th>Số tầng hầm</th>
								<th>Tên quản lý</th>
								<th>SĐT quản lý</th>
								<th>DT sàn</th>
								<th>DT trống</th>
								<th>DT thuê</th>
								<th>Giá thuê</th>
								<th>Phí môi giới</th>
								<th>Phí dịch vụ</th>
								<th>Thao tác</th>
							</tr>
							</thead>

							<tbody>
							<c:forEach var="item" items="${buildingList}">
								<tr>
									<td class="center">
										<label class="pos-rel">
											<input type="checkbox" id="checkList" class="ace" value="${item.id}">
											<span class="lbl"></span>
										</label>
									</td>

									<td>${item.name}</td>
									<td>${item.address}</td>
									<td>${item.numberOfBasement}</td>
									<td>${item.managerName}</td>
									<td>${item.managerPhone}</td>
									<td>${item.floorArea}</td>
									<td>${item.emptyArea}</td>
									<td>${item.rentArea}</td>
									<td>${item.rentPrice}</td>
									<td>${item.brokerageFee}</td>
									<td>${item.serviceFee}</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="13" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
													<path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
													<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z"/>
												</svg>
											</button>

											<a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</a>

											<button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
																<span class="blue">
																	<i class="ace-icon fa fa-search-plus bigger-120"></i>
																</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
																<span class="green">
																	<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
																<span class="red">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div><!-- /.page-content -->
		</div>
	</div><!-- /.main-content -->

</div><!-- /.main-container -->

<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Danh sách nhân viên</h4>
			</div>
			<div class="modal-body">
				<table class="table table-striped table-bordered table-hover" id="staffList">
					<thead>
					<tr>
						<th class="center">Chọn</th>
						<th class="center">Tên nhân viên</th>
					</tr>
					</thead>

					<tbody class="center">

					</tbody>
				</table>

				<input type="hidden" name="buildingId" id="buildingIdModal">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success" id="btnAssignmentBuilding">Giao tòa nhà</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
			</div>
		</div>

	</div>
</div>

<script>
	function assignmentBuilding(buildingId){
		$('#assignmentBuildingModal').modal();
		$('#buildingIdModal').val(buildingId);
		loadStaff(buildingId);
	}

	function loadStaff(buildingId){
		$.ajax({
			type: "GET",
			url: "${buildingAPI}/" + buildingId + "/staffs",
			dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				var row = "";

				$.each(response.data, function (index, item){
					row += '<tr>'
					row += '<td> <input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element"' + item.checked + '/></td>';
					row += '<td>' + item.fullName + '</td>'
					row += '</tr>'
				});

				$('#staffList tbody').html(row);

				console.log("Success");
			},
			error: function(response){
				console.log("Fail");
				window.location.href = "<c:url value="/admin/building-list?message=error" />";
				console.log(response);
			}
		});
	}


	$('#btnAssignmentBuilding').click(function(e){
		e.preventDefault();
		var data = {};
		data['buildingId'] = $('#buildingIdModal').val();

		var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
			return $(this).val();
		}).get();

		data['staffs'] = staffs;

		if(data['buildingId'] != '') assignmentBuildingFromModal(data);
		else window.location.href = "<c:url value="/admin/building-list?message=error" />";

		console.log("ok");
	});

	function assignmentBuildingFromModal(data){
		$.ajax({
			type: "POST",
			url: "${buildingAPI}/assignment",
			data: JSON.stringify(data), // Chuyen data -> JSON
			contentType: "application/json", // Gui toi server voi dang JSON
			// dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				console.info("Giao thành công");
				window.location.href = "http://localhost:8081/admin/building-list";
			},
			error: function(response){
				console.info("Giao không thành công");
				console.log(response);
				window.location.href = "<c:url value="/admin/building-list?message=error" />";
			}
		});
	}

	$('#btnSearchBuilding').click(function(e){
		e.preventDefault();
		$('#listForm').submit();
	});

	function deleteBuilding(id){
		var buildingId = [id];
		deleteBuildings(buildingId);
	}

	$('#btnDeleteBuilding').click(function(e){
		e.preventDefault();

		var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
			return $(this).val();
		}).get();

		deleteBuildings(buildingIds);
	});

	function deleteBuildings(data){
		$.ajax({
			type: "DELETE",
			url: "${buildingAPI}/" + data,
			data: JSON.stringify(data), // Chuyen data -> JSON
			contentType: "application/json", // Gui toi server voi dang JSON
			// dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				window.location.reload();
				console.log("Success");
			},
			error: function(response){
				console.log("Fail");
				console.log(response);
			}
		});
	}
</script>
</body>
</html>
