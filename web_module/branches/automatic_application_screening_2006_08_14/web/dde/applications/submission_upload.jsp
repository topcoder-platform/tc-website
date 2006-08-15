<%@ page language="java"%>
<jsp:useBean id="ViewUploadTask" scope="request" class="com.topcoder.web.tc.controller.request.resume.ViewUploadTask" />

<HTML>
<HEAD><TITLE>Resume Upload</TITLE></HEAD>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD class="statText">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>"/>
            <input type="hidden" name="module" value="ResumeUpload">
            <br/>Upload file: <input type=file name=file1>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
