<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="termsHTML">
<head>
    <jsp:include page="/script.jsp"/>

    <title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        html.termsHTML, body.termsBody {
            color: #ffffff;
            background: #000000;
        }
        h1 {
            color: #ffffff;
            background: none;
            position: static;
            width: auto;
        }
        h1 div {
            margin: 0px 0px 20px 0px;
        }

    </style>
</head>

<body class="termsBody" style="margin:5px;">
<c:import url="${sessionInfo.servletPath}">
    <c:param name="<%=Constants.MODULE_KEY%>" value="Terms"/>
    <c:param name="<%=Constants.TERMS_OF_USE_ID%>" value="<%=request.getParameter(Constants.TERMS_OF_USE_ID)%>"/>
</c:import>

</body>

</html>



