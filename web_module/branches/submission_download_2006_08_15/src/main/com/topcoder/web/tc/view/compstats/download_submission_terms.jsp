<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="termsHTML">
<head>
    <jsp:include page="/script.jsp"/>
    <title>Submission Download - Terms of Use</title>
</head>

<body style="margin:5px;">
<center>
<form name="terms" method="POST" action="${sessionInfo.servletPath}">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY %>" value="DownloadSubmissionAgreeTerms"/>
	<tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID %>" value="<%= request.getAttribute(Constants.PROJECT_ID).toString() %>" />
	<tc-webtag:hiddenInput name="<%=Constants.CODER_ID %>" value="<%= request.getAttribute(Constants.CODER_ID).toString() %>" />	
	
     <div align="center">
         <IFRAME width="590" height="300" SRC="/tc?<%=Constants.MODULE_KEY%>=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID%>" ></IFRAME>         
     </div>
    
<a href="javascript:document.terms.submit()">I Agree</a>    
</form>
</center>
</body>

</html>



