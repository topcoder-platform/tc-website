<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>

<% int noteTypeRowCount = 0;
   ResultSetContainer noteType = (ResultSetContainer) request.getAttribute(PactsConstants.NOTE_TYPE_LIST);
   if (noteType == null) {
      out.println("No Note Type List!");
      //noteType = new ResultSetContainer();
   }
   else noteTypeRowCount = noteType.getRowCount();
   ResultSetContainer.ResultSetRow rsr;
%>
<h1 align="center">PACTS</h1>
<h2 align="center">Search Notes</h2>

<center>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center">
<% out.println("      <form method=\"GET\" action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\">"); %>
        <table border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td>Handle:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Submitted by:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.SUBMITTING_HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Creation Date:</td>
<% out.println("            <td>Between <input type=\"text\" name=\""+PactsConstants.EARLIEST_CREATION_DATE+"\" size=\"10\"> and <input type=\"text\" name=\""+PactsConstants.LATEST_CREATION_DATE+"\" size=\"10\"></td>"); %>
          </tr>
          <tr>
            <td>In-Depth Search by Handle:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.IN_DEPTH_HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Type:</td>
<% out.println("            <td><select name=\""+PactsConstants.TYPE_CODE+"\">");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < noteTypeRowCount; n++) {
      rsr = noteType.getRow(n);
      out.println("              <option value=\""+TCData.getTCInt(rsr,"note_type_id",0,true)+"\">"+TCData.getTCString(rsr,"note_type_desc","default status",true)+"</option>");
   } %>
              </select></td>
          </tr>
        </table>
        <p><br>
        <input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2">
        </p>
<% out.println("        <input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\"><input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.LIST_TASK+"\">"); %>
      </form>
    </td>
  </tr>
</table>
</center>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>

