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
</head>

<body>

<jsp:include page="/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<TD WIDTH="180">
    <!-- Left nav begins -->
   <%-- automate des or dev --%>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node"
                   value='<%="112".equals(request.getAttribute(Constants.PHASE_ID))?"des_stats":"dev_stats"%>'/>
    </jsp:include>

    
    <!-- Left nav ends -->
</TD>
<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Contest Details"/>
</jsp:include>


You must agree to the terms below in order to download this submission.
<br><br>
<form name="terms" method="POST" action="${sessionInfo.servletPath}<%= "?module=DownloadSubmissionAgreeTerms&" +  
		Constants.PROJECT_ID + "=" + request.getAttribute(Constants.PROJECT_ID).toString() + "&" + 
		Constants.CODER_ID + "=" + request.getAttribute(Constants.CODER_ID).toString() + "&" +		
		Constants.PHASE_ID + "=" + request.getAttribute(Constants.PHASE_ID).toString() %>">
        
    <div align="center">
        <IFRAME width="590" height="150" SRC="/tc?<%=Constants.MODULE_KEY%>=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID%>" ></IFRAME>
            <p align="center">
            <span class="bigRed">
                <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}<br>
                </tc-webtag:errorIterator>
            </span>
            <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>I agree</p>

            <button name="submit" value="submit" type="submit">Submit</button>
         </div>
    
</form>




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