<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-12">
		<div class="block block-themed animated fadeIn">
			<div class="block-header bg-success">
				<h3 class="block-title">Register</h3>
			</div>
			<div class="block-content block-content-full block-content-narrow">
				<p>Please fill the following details to create a new account.</p>
				<c:url var="addUser" value="/addUser" />
				<form:form class="js-validation-register form-horizontal push-50-t push-50" action="${addUser}" method="post"
					modelAttribute="userForm">
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="text" id="register-username" name="register-username"
									placeholder="Please enter a username"> <label for="register-username">Username</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="email" id="register-email" name="register-email"
									placeholder="Please provide your email"> <label for="register-email">Email</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="password" id="register-password" name="register-password"
									placeholder="Choose a strong password.."> <label for="register-password">Password</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="password" id="register-password2" name="register-password2"
									placeholder="..and confirm it"> <label for="register-password2">Confirm Password</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<label>Roles </label> <label class="css-input css-radio css-radio-primary"> <input type="radio"
								name="role"><span></span> Admin
							</label> <label class="css-input css-radio css-radio-primary"> <input type="radio" name="role"><span></span>
								User
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<label>Active </label> <label class="css-input css-checkbox css-checkbox-primary" for="active-checkbox">
								<input type="checkbox" id="active-checkbox" name="active-checkbox"><span></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="text" id="mobile" name="mobile" placeholder="Please provide your mobile">
								<label for="mobile">Mobile</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="password" id="cardno" name="cardno"
									placeholder="Please provide your card number"> <label for="cardno">Identity Card</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<div class="form-material form-material-success">
								<input class="form-control" type="text" id="address" name="address" placeholder="Please provide your address">
								<label for="address">Address</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6 col-sm-6 col-md-5">
							<button class="btn btn-success" type="submit">
								<i class="fa fa-save pull-right"></i> Save
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
