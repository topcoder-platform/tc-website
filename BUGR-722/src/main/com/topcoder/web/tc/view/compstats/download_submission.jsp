<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<META HTTP-EQUIV="refresh" content="10;url= <%= "/tc?module=DownloadSubmission&" +  
				Constants.PROJECT_ID + "=" + request.getAttribute(Constants.PROJECT_ID).toString() + "&" + 
				Constants.CODER_ID + "=" + request.getAttribute(Constants.CODER_ID).toString() + "&" +		
				Constants.SUBMISSION_TYPE + "=1" %>">


</head>

<body>
<jsp:include page="/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<TD WIDTH="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value='<%="112".equals(request.getAttribute(Constants.PHASE_ID))?"des_stats":"dev_stats"%>'/>
    </jsp:include>
</TD>

<td width="100%" align="center" class="bodyColumn">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Contest Details"/>
</jsp:include>

<div class="fixedWidth">

Thank you for accepting the terms.
<br><br>
Your download will begin in 10 seconds.

If it doesn't start, please click here:
        <form name="frmDownload" action="/tc">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY %>" value="DownloadSubmission"/>
            <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID %>" value="<%= request.getAttribute(Constants.PROJECT_ID).toString() %>" />
            <tc-webtag:hiddenInput name="<%=Constants.CODER_ID %>" value="<%= request.getAttribute(Constants.CODER_ID).toString() %>" />    
            <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_TYPE %>" value="1" />    
            <input type="submit" value="Download Submission">    
        </form>

<a href="/tc?module=CompContestDetails&pj=<%= request.getAttribute(Constants.PROJECT_ID).toString() %>">Back to Contest Details</a>
</div>
</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="/foot.jsp"/>
</BODY>
</HTML>