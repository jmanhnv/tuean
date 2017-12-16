<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Login Content -->
<div class="content overflow-hidden">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<!-- Login Block -->
			<div class="block block-themed animated fadeIn">
				<div class="block-header bg-primary">
					<ul class="block-options">
						<li><a href="#"><spring:message code="login.forgot_password" /></a></li>
					</ul>
					<h3 class="block-title">
						<spring:message code="login.subject" />
					</h3>
				</div>
				<div class="block-content block-content-full block-content-narrow">
					<!-- Login Title -->
					<%--
						<h1 class="h2 font-w600 push-30-t push-5">
							<spring:message code="login.block_title" />
						</h1>
					--%>
					<!-- END Login Title -->

					<!-- Login Form -->
					<c:url var="loginUrl" value="/login" />
					<form:form id="login-form" action="${loginUrl}" method="post" modelAttribute="loginBean"
						class="form-horizontal js-validation-material push-30-t">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<c:if test="${not empty error}">
							<div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<p>${error}</p>
							</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="alert alert-success alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<p>${msg}</p>
							</div>
						</c:if>
						<div class="form-group">
							<div class="col-xs-12">
								<div class="form-material form-material-primary">
									<%-- <form:input path="email" /> --%>
									<input class="form-control" type="email" id="email" name="email" maxlength="50"
										placeholder="Enter your email.." required> <label for="email"><spring:message
											code="login.email" /></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<div class="form-material form-material-primary">
									<%-- <form:password path="password" /> --%>
									<input class="form-control" type="password" id="password" name="password" maxlength="60"
										placeholder="Enter your password.." required> <label for="password"><spring:message
											code="login.password" /></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<label class="css-input switch switch-sm switch-primary"> <input type="checkbox" name="remember"><span></span>
									<spring:message code="login.remember" />
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-6 col-md-5 pull-right">
								<button class="btn btn-block btn-primary" type="submit">
									<i class="si si-login pull-right"></i>
									<spring:message code="login.submit" />
								</button>
							</div>
						</div>
					</form:form>
					<!-- END Login Form -->
				</div>
			</div>
			<!-- END Login Block -->
		</div>
	</div>
</div>
<!-- END Login Content -->

<!-- Login Footer -->
<div class="push-10-t text-center animated fadeInUp">
	<small class="text-muted font-w600"><spring:message code="sys.trademark" /> <spring:message code="sys.version" /></small>
</div>
<!-- END Login Footer -->