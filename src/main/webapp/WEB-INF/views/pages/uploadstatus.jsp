<%@page session="false"%>
<%@page isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="block">
	<div class="block-header">
		<h3 class="block-title">Upload Status</h3>
	</div>
	<div class="block-content">
		<c:if test="${not empty message}">
			<div class="row">
				<div class="col-xs-12">
					<p class="text-warning">Message : ${message}</p>
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="col-xs-12">
				<%-- <c:if test="${not empty files}"> --%>
				<c:if test="${fn:length(files) > 0}">
					<p class="text-success">Following files are uploaded successfully.</p>
					<%-- 	<c:forTokens var="i" items="${files}" delims=",">
						<c:out value="${i}"></c:out>
					</c:forTokens> --%>
					<ol>
						<c:forEach items="${files}" var="file">
							<p class="text-info">- ${file}</p>
						</c:forEach>
					</ol>

					<%-- 	<c:forEach items="${files}" var="file">
						<li>${image.originalFilename}<img width="100"
							src="<c:url value="/image/"/>${image.originalFilename}" />
						</li>
					</c:forEach> --%>
				</c:if>
			</div>
		</div>
	</div>
</div>
