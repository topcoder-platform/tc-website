<%@ page language="java"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="com.topcoder.web.resume.servlet.Controller" %>

<HTML>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD>
          <form name="upload_form" method="POST" action="<%="/resume/resume"%>">
            <input type="hidden" name="<%="task"%>" value="<%="ResumeUploadTask"%>">
            <input type=file name=file1>
            <input type="submit" value="Upload"> 
          </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
