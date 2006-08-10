<%@ page contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Password Recovery</title>
</head>

<body>
An email has been sent to <%= request.getAttribute("email") %>.  Please check your email and follow the link to reset your password.
YOur must do that in the next 10 minutes or your key will expire.

</body>
</html>