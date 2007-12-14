<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" class="termsHTML">
<head>
    <jsp:include page="/script.jsp"/>
    
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <STYLE TYPE="text/css">
        html.termsHTML, body.termsBody {
            color: #ffffff;
            background: #333333;
        }
        #content P {
            margin-bottom: 1em;
            text-align: justify;
        }
    </STYLE>
</head>
<body class="termsBody" style="margin:5px;">

<c:import url="/tc">
    <c:param name="<%=Constants.MODULE_KEY%>" value="Terms"/>
    <c:param name="<%=Constants.TERMS_OF_USE_ID%>" value="<%=request.getParameter(Constants.TERMS_OF_USE_ID)%>"/>
</c:import>


</body>
</html>