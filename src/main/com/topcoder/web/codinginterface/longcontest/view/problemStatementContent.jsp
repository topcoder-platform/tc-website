<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ page import="com.topcoder.shared.problem.Problem"%>
<%@ page import="com.topcoder.shared.language.Language"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<head>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<tc-webtag:problemStatement problem="<%=(Problem)request.getAttribute(Constants.PROBLEM_STATEMENT_KEY)%>" language="<%=((Language)request.getAttribute(Constants.LANGUAGE_ID)).getName()%>"/>

