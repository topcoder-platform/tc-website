<%@ page import="com.topcoder.web.resume.common.Constants"%>
<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>

<HTML>
<HEAD><TITLE>Resume Uploaded Successfully</TITLE></HEAD>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD class="statTextBig">
         Upload successful!<br/><a href="/Resume?&<%=Constants.TASK_KEY%>=DownloadTask" class="statTextBig">Click here to download your resume</a>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
