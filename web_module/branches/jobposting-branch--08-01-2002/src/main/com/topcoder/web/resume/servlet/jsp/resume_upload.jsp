<%@ page language="java"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="com.topcoder.web.resume.servlet.*" %>


<HTML>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD>
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="<%=Controller.ALIAS%>">
            <input type="hidden" name="<%=Controller.TASK%>" value="<%=Controller.RESUME_UPLOAD_TASK%>">
            <input type=file name=file1>
            <select name="fileType" class="dropdown">
            <option value="AL">Alabama</option>
            </select>
            <input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
