<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ page import="com.topcoder.shared.problem.Problem"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<head>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<tc-webtag:problemStatement problem="<%=(Problem)request.getAttribute(Constants.PROBLEM_STATEMENT_KEY)%>" language="<%=request.getAttribute(Constants.LANGUAGE_ID)%>"/>

