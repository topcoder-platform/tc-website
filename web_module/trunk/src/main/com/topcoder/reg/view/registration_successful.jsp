<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the home page of registration app.
   - Version: 1.0
   - Author: leo_lol
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<s:include value="includes/html_head.jsp">
		<s:param name="pageTitle">Registration Successful</s:param>
	</s:include>
	<body>
		<s:include value="includes/head.jsp"></s:include>
        <div id="heading" class="registrationSuccessfulHedading">	
            <div class="inner">
                <h1>Registration Successful</h1>
            </div><!-- END .inner -->
        </div>

		<div id="content" class="registrationSuccessful">	
        	<p>Welcome to Topcoder! An email has been sent to <%=request.getParameter("email")%>  with details on how to activate your account.</p>
            <p>Check your spam folder if you don't see it. You MUST activate your account by following the link in that email before you can login.</p>
            <p>Need help with activation? Please email <a href="mailto:support@topcoder.com">support@topcoder.com</a>.</p>

        </div><!-- End #content -->
		<div class="clear"></div>
        <s:include value="includes/footer.jsp"></s:include>
		<s:include value="includes/modal.jsp"></s:include>
	</body>
</html>
