<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="termsHTML">
<head>
    <jsp:include page="/script.jsp"/>

    <title>TopCoder High School 2007</title>
    <link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" href="/css/tchs07.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <STYLE TYPE="text/css">
        html.termsHTML, body.termsBody {
            color: #333333;
            background: #FFFFFF;
        }
    </STYLE>
</head>

<body class="termsBody" style="margin:5px;">
<c:import url="${sessionInfo.servletPath}">
    <c:param name="<%=Constants.MODULE_KEY%>" value="Terms"/>
    <c:param name="<%=Constants.TERMS_OF_USE_ID%>" value="<%=request.getParameter(Constants.TERMS_OF_USE_ID)%>"/>
</c:import>


</body>

</html>



