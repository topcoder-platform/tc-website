<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.shared.language.Language"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
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

<%--
jomcat doesn't seem to like this, not gonna spend anymore time trying to figure it out
but this would be the right way IMO
<tc-webtag:problemStatement problem="prob" language="lang"/>
--%>
<tc-webtag:problemStatement problem="prob" language="<%=lang%>"/>

</body>
</html>