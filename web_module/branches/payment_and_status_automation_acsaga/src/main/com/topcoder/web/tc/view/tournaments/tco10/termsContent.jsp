<%--
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 *
  JSP imports term of use content to be shown in the tournament registration.
 *
 * Author TCSDEVELOPER
 * Version 1.0 (2010 TCO WebSite Release assembly v1.0)
--%>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Registration" area="overview"/>

<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>TCO 10 : Register Now!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <jsp:include page="includes/htmlhead.jsp"/>
    </head>

    <body>
        <c:import url="${sessionInfo.servletPath}">
            <c:param name="${requestScope.MODULE_KEY}" value="Terms"/>
            <c:param name="${TERMS_OF_USE_ID}" value="${param[TERMS_OF_USE_ID]}"/>
        </c:import>
    </body>
</html>



