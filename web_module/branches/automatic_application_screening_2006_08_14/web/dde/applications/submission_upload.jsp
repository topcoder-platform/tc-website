<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD><TITLE>Upload</TITLE></HEAD>
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
