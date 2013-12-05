<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the page displaying a form to reset password.
   - Version: 1.0
   - Author: leo_lol
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<s:include value="includes/html_head.jsp">
    <s:param name="pageTitle">Password Reset Page</s:param>
</s:include>

<body>
    <div style="color: red;">
	    <s:fielderror />
	    <s:actionerror />
    </div>
    
    <div style="display: none; color: red;" id="reset_password_warning"></div>
    <form action="resetPassword.action" method="post" id="reset_password_form">
        <input type="hidden" name="passwordRecoveryId" value="<%=request.getParameter("pr")%>">
        Password: <input type="password" name="password"> <br />
        Confirm Password: <input type="password" name="confirmPassword"> <br />
        <input type="button" value="Reset Password" onclick="javascript:resetPassword();">
    </form>
</body>
</html>