<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" toScope="page" property="problem"/>
<tc-webtag:useBean id="lang" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" toScope="page" property="language"/>

<%
    System.out.println("class: " + lang.getClass().getName());
%>

<tc-webtag:problemStatement problem="prob" language="lang"/>


</body>
</html>