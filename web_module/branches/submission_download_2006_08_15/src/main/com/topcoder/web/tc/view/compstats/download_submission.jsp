<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="termsHTML">
<head>
    <jsp:include page="/script.jsp"/>
    <title>Submission Download</title>
</head>

<body style="margin:5px;">
<center>

		<form name="frmDownload" action="/tc">
		    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY %>" value="DownloadSubmission"/>
			<tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID %>" value="<%= request.getAttribute(Constants.PROJECT_ID).toString() %>" />
			<tc-webtag:hiddenInput name="<%=Constants.CODER_ID %>" value="<%= request.getAttribute(Constants.CODER_ID).toString() %>" />	
			<tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_TYPE %>" value="1" />	
			<input type="submit" value="Download Submission">	
		</form>

<a href="/tc?module=CompContestDetails&pj=<%= request.getAttribute(Constants.PROJECT_ID).toString() %>">Back to Contest Detail page</a>
</center>
</body>

</html>



