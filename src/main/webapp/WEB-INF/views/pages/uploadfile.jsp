<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<div class="block block-themed animated fadeIn">
	<div class="block-header bg-success">
		<h3 class="block-title">Upload File</h3>
	</div>
	<div class="block-content block-content-full block-content-narrow">
		<form class="form-horizontal" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/savefiles">
			<div class="form-group">
				<div class="col-sm-6">
					<div class="form-material">
						<select class="form-control" id="category" name="category" size="1">
							<option value="1" selected="selected">Ban công</option>
							<option value="2">Cấu thang</option>
							<option value="3">Mái kính</option>
							<option value="4">Cổng, cửa</option>
							<option value="5">Hàng rào</option>
						</select> <label for="category">Please Category</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="form-material">
					<label class="col-sm-6" for="multiple-file-input">Multiple File Input</label>
					<div class="col-sm-6">
						<input type="file" id="multiple-file-input" name="files" multiple="multiple">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<button class="btn btn-sm btn-primary pull-right" type="submit">
						<i class="fa fa-cloud-upload pull-right"></i> Upload
					</button>
				</div>
			</div>
		</form>
	</div>
</div>