<%@page session="false"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${not empty message}">
	<div class="row">
		<div class="col-xs-12">
			<p class="text-warning">${message}</p>
		</div>
	</div>
</c:if>
<c:if test="${fn:length(files) > 0}">
	<div class="row items-push js-gallery-advanced">
		<c:forEach items="${files}" var="f">
				<%-- <c:out value="${f.key}" /> --%>
				<%-- <c:out value="${f.value}" /> --%>
				<div class="col-sm-6 col-md-4 col-lg-3 animated fadeIn">
					<div class="img-container fx-img-rotate-r">
						<img class="img-responsive" src="${f.key}" alt="">
						<div class="img-options">
							<div class="img-options-content">
								<!-- <h3 class="font-w400 text-white push-5">Image Caption</h3> -->
								<!-- <h4 class="h6 font-w400 text-white-op push-15">Some Extra Info</h4> -->
								<a class="btn btn-sm btn-default img-lightbox" href="${f.value}"> <i class="fa fa-search-plus"></i> View</a>
								<div class="btn-group btn-group-sm">
									<a class="btn btn-default" href="javascript:void(0)"><i class="fa fa-pencil"></i> Edit</a>
									<a class="btn btn-default" href="javascript:void(0)"><i class="fa fa-times"></i> Delete</a>
								</div>
							</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
</c:if>
