<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
    <jsp:include page="/script.jsp"/>

    <title>Assignment Document Text</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <STYLE TYPE="text/css">
        html.termsHTML, body.termsBody {
            color: #333333;
            background: #FFFFFF;
        }
        h1 {
            color: #666666;
            background: none;
            position: static;
        }
        h1 div {
            margin: 0px 0px 20px 0px;
        }

    </STYLE>
</head>

<body class="termsBody" style="margin:5px;">
<c:import url="/PactsMemberServlet">
    <c:param name="<%=Constants.MODULE_KEY%>" value="ViewAssignmentDocumentText"/>
    <c:param name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="<%=request.getParameter(PactsConstants.ASSIGNMENT_DOCUMENT_ID)%>"/>
</c:import>
</body>

</html>



