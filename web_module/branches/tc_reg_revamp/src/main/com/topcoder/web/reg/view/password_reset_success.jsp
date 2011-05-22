<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Reset Password</s:param>
	</s:include>
	<body>
		<div>
			Password reset is successful, please
			<a href='<s:url value="/login.jsp"/>'>Click here</a> to
			login.
		</div>

	</body>
</html>