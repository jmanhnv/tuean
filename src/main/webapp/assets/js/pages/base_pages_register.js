/*
 *  Document   : base_pages_register.js
 *  Author     : pixelcave
 */
var BasePagesRegister = function() {
	var e = function() {
		jQuery(".js-validation-register")
				.validate(
						{
							errorClass : "help-block text-right animated fadeInDown",
							errorElement : "div",
							errorPlacement : function(e, r) {
								jQuery(r).parents(".form-group > div")
										.append(e)
							},
							highlight : function(e) {
								jQuery(e).closest(".form-group").removeClass(
										"has-error").addClass("has-error"),
										jQuery(e).closest(".help-block")
												.remove()
							},
							success : function(e) {
								jQuery(e).closest(".form-group").removeClass(
										"has-error"), jQuery(e).closest(
										".help-block").remove()
							},
							rules : {
								"register-username" : {
									required : !0,
									minlength : 3
								},
								"register-email" : {
									required : !0,
									email : !0
								},
								"register-password" : {
									required : !0,
									minlength : 5
								},
								"register-password2" : {
									required : !0,
									equalTo : "#register-password"
								},
								"register-terms" : {
									required : !0
								},
								"mobile" : {
									required : !0
								},
								"cardno" : {
									required : !0
								},
								"address" : {
									required : !0
								}
							},
							messages : {
								"register-username" : {
									required : "Please enter a username",
									minlength : "Your username must consist of at least 3 characters"
								},
								"register-email" : "Please enter a valid email address",
								"register-password" : {
									required : "Please provide a password",
									minlength : "Your password must be at least 5 characters long"
								},
								"register-password2" : {
									required : "Please provide a password",
									minlength : "Your password must be at least 5 characters long",
									equalTo : "Please enter the same password as above"
								},
								"register-terms" : "You must agree to the service terms!",
								"mobile" : "Please provide your mobile",
								"cardno" : "Please provide your card number",
								"address" : "Please provide your address"
							}
						})
	};
	return {
		init : function() {
			e()
		}
	}
}();
jQuery(function() {
	BasePagesRegister.init()
});