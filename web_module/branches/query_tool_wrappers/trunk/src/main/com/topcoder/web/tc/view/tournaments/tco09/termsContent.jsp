<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP imports term of use content to be shown in the tournament registration.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>TCO 09 : Register Now!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    </head>

    <body>
        <c:import url="${sessionInfo.servletPath}">
            <c:param name="<%=Constants.MODULE_KEY%>" value="Terms"/>
            <c:param name="<%=Constants.TERMS_OF_USE_ID%>" value="<%=request.getParameter(Constants.TERMS_OF_USE_ID)%>"/>
        </c:import>

    </body>

</html>



