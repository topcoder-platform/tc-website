<%@ page import="com.topcoder.web.resume.servlet.Controller"%>
<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>

<HTML>
<HEAD><TITLE>Resume Uploaded Successfully</TITLE>
    <%@ include file="../script.jsp" %>
    </HEAD>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD class="statTextBig">
         Upload successful!<br/><a href="<%= Controller.ALIAS %>?<%= Controller.TASK %>=<%= Controller.RESUME_DOWNLOAD_TASK %>" class="statTextBig">Click here to download your resume</a>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
