<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <STYLE TYPE="text/css">
        html.termsHTML, body.termsBody {
            color: #FFFFFF;
            background: #083A3A
            padding: 0px;
            margin: 0px;
        }
    </STYLE>
</head>

<body class="termsBody">

<c:import url="${sessionInfo.servletPath}">
    <c:param name="<%=Constants.MODULE_KEY%>" value="Terms"/>
    <c:param name="<%=Constants.TERMS_OF_USE_ID%>" value="<%=String.valueOf(Constants.TCCC06_SPONSOR_TERMS_ID)%>"/>
</c:import>


</body>
</html>
