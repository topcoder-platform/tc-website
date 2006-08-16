<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%
    String filename = (String)request.getAttribute("file_nanme");
%>

<HTML>
<HEAD><TITLE>Upload results</TITLE></HEAD>
  <BODY>
    <TABLE WIDTH="100%" HEIGHT="100%">
      <TR>
        <TD class="statTextBig">
         Upload successful:
         <br/>
         <br/>
         <%=filename%>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
