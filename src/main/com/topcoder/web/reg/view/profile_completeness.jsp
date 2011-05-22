<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Profile Completeness</s:param>
	</s:include>
	<body>

		<h3>
			<span>Profile Completeness</span>
		</h3>
		<div>
			<s:form namespace="/" action="profileUpdateAction" method="post">
				<s:submit action="displayProfileAction" value="Remind Me Later" />
			&nbsp;&nbsp;&nbsp;
				<s:submit action="profileUpdateAction" value="Submit" />
			</s:form>
		</div>
	</body>
</html>