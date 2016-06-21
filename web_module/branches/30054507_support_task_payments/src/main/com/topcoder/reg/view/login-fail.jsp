<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the login fail page when using social account login way.
   -
   - Version: 1.0 (Release Assembly - TopCoder Website Social Login)
   - Author: ecnu_haozi
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<s:include value="includes/html_head.jsp">
		<s:param name="pageTitle">Login Failed</s:param>
	</s:include>
    <body>
		<s:include value="includes/head.jsp"></s:include>
        <div id="heading" class="registrationSuccessfulHedading">	
            <div class="inner">
                <h1>Login Failed</h1>
            </div><!-- END .inner -->
        </div>

		<div id="content" class="registrationSuccessful">	
			<p><s:property value="message"/></p>
            <div class="clear"></div>

        </div><!-- End #content -->
		<div class="clear"></div>
        <s:include value="includes/footer.jsp"></s:include>
		<s:include value="includes/modal.jsp"></s:include>
    </body>
</html>