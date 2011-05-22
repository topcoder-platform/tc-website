$(document).ready(function() {
			$('#tryAnotherCode').click(function() {
						$('#captcha').load('loadCaptchaAction.action');
						$('#captchaWord').val('');
						return false;
					});
			$('#captchaWord').val('');

			$('#forgotPasswordCancel').click(function() {
						location.href = "login.jsp";
						return false;
					});
			$('#loginPassword').pstrength();
		});