<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content overflow-hidden">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<div class="block block-themed animated fadeIn">
				<div class="block-header bg-primary">
					<ul class="block-options">
						<li><a href="javascript:void(0)"><spring:message code="login.forgot.password" /></a></li>
						<li><a href="javascript:void(0)" data-toggle="tooltip" data-placement="left" title="New Account"><i
								class="si si-plus"></i></a></li>
					</ul>
					<h3 class="block-title">
						<spring:message code="login.subject" />
					</h3>
				</div>
				<div class="block-content block-content-full block-content-narrow">
					<h1 class="h2 font-w600 push-30-t push-5">
						<spring:message code="sys.company" />
					</h1>
					<p>
						<spring:message code="login.welcome" />
					</p>
					<c:url var="loginUrl" value="/login" />
					<form:form class="js-validation-login form-horizontal push-30-t push-50" action="${loginUrl}" method="post"
						modelAttribute="loginBean">
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
								<div class="form-material form-material-primary floating">
									<form:input path="email" name="email" id="login-username" cssClass="form-control" />
									<form:label path="login-username">
										<spring:message code="login.email" />
									</form:label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<div class="form-material form-material-primary floating">
									<input class="form-control" type="password" id="login-password" name="password"> <label
										for="login-password"><spring:message code="login.password" /></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<label class="css-input switch switch-sm switch-primary"> <input type="checkbox" id="login-remember-me"
									name="remember"><span></span> <spring:message code="login.remember" />?
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-6 col-md-5">
								<button class="btn btn-block btn-primary" type="submit">
									<i class="si si-login pull-right"></i>
									<spring:message code="login.submit" />
								</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="push-10-t text-center animated fadeInUp">
	<small class="text-muted font-w600"><span class="js-year-copy"></span> &copy; <spring:message
			code="sys.company" /> <spring:message code="sys.version" /></small>
</div>