<%@ page import="com.topcoder.web.studio.Constants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<head>
    <jsp:include page="../script.jsp"/>

    <title>Assignment Document Text</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <STYLE TYPE="text/css">
        html.termsHTML, body.termsBody {
            color: #333333;
            background: #FFFFFF;
        }
        h1 {
            color: #666666;
            background: none;
            position: static;
            width: auto;
        }
        h1 div {
            margin: 0px 0px 20px 0px;
        }

    </STYLE>
</head>

<body class="termsBody" style="margin:5px;">
<c:import url="${sessionInfo.servletPath}">
    <c:param name="<%=Constants.MODULE_KEY%>" value="ViewAssignmentDocumentText"/>
    <c:param name="<%=Constants.ASSIGNMENT_DOCUMENT_ID%>" value="<%=request.getParameter(Constants.ASSIGNMENT_DOCUMENT_ID)%>"/>
</c:import>

</body>

</html>



