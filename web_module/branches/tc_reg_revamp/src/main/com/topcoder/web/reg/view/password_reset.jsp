<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Password Reset</s:param>
	</s:include>
	<body>
		<div>

			<h4>
				<span>Password Reset</span>
			</h4>
			<p>
				Please enter new password
			</p>
			<div>
				<s:actionerror />
				<s:fielderror />
			</div>
			<s:form action="resetPassword" namespace="/" method="post">
				<s:hidden name="pr" value="%{pr==null?#parameters['pr']:pr}">
				</s:hidden>
				<s:hidden name="hc" value="%{hc==null?#parameters['hc']:hc}" />
			Password: <s:password name="password" />
				<br />
		    Confirm Password: <s:password name="passwordConfirm" />
				<br />
				<s:submit value="submit" />
			</s:form>
		</div>
	</body>
</html>