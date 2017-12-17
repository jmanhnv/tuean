<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-12">
		<div class="block block-themed animated fadeIn">
			<div class="block-header bg-success">
				<h3 class="block-title">Register</h3>
			</div>
			<div class="block-content block-content-full block-content-narrow">
				<p>Please fill the following details to create a new account.</p>
				<form class="js-validation-register form-horizontal push-50-t push-50" action="base_pages_register.php"
					method="post">
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
							<label class="css-input switch switch-sm switch-success"> <input type="checkbox" id="register-terms"
								name="register-terms"><span></span> I agree with terms &amp; conditions
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6 col-sm-6 col-md-5">
							<button class="btn btn-success" type="submit"><i class="fa fa-save pull-right"></i> Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
