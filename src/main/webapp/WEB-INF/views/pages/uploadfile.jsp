<form class="form-horizontal" method="post" enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/savefiles">
	<div class="form-group">
		<label class="col-xs-12" for="example-file-multiple-input">Multiple File Input</label>
		<div class="col-xs-12">
			<input type="file" id="example-file-multiple-input" name="files" multiple>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12">
			<input type="submit" value="Upload" />
		</div>
	</div>
</form>