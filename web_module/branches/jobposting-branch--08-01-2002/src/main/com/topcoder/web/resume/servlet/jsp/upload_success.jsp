<%@ page import="com.topcoder.web.resume.servlet.Controller"%>
<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>

<HTML>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD class="statText">
         Upload successful!<br/><a href="<%= Controller.ALIAS %>?<%= Controller.TASK %>=<%= Controller.RESUME_DOWNLOAD_TASK %>">Click here to download your resume</a>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
