<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.tc.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Password Recovery</title>
</head>

<body>
An email has been sent to <%= request.getAttribute(Constants.EMAIL) %>.  Please check your email and follow the link to reset your password.
You must do that in the next <%= Constants.PASSWORD_RECOVERY_EXPIRE %> minutes or your key will expire.

</body>
</html>