<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<html>
<head>
<title>TopCoder | Private Label Registration</title>
</head>
<body>
this is the default index page for the private label site.<br/>
it should remain generic for any company that might to private label stuff.<br/>
for company specific content we'll need a different page/backend<br/>
<br/>
<br/>
<a href="?&<%=Constants.MODULE_KEY+"="+Constants.SIMPLE_REG_MAIN+"&"+Constants.COMPANY_ID+"=1"%>">Register</a>
<br/>
<a href="?&<%=Constants.MODULE_KEY+"="+Constants.FULL_REG_MAIN+"&"+Constants.COMPANY_ID+"=1&"+Constants.EVENT_ID+"=1"%>">Register Verizon</a>
</body>