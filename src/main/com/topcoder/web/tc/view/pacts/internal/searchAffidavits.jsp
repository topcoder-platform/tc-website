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

<% ResultSetContainer status = (ResultSetContainer) request.getAttribute(PactsConstants.STATUS_CODE_LIST);
   int statusRowCount = 0;
   int affidavitTypeRowCount = 0;
   int roundRowCount = 0;
   if (status == null) {
      out.println("No Status List!");
      //status = new ResultSetContainer();
   }
   else statusRowCount = status.getRowCount();
   ResultSetContainer affidavitType = (ResultSetContainer) request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST);
   if (affidavitType == null) {
      out.println("No Affidavit Type List!");
      //affidavitType = new ResultSetContainer();
   }
   else affidavitTypeRowCount = affidavitType.getRowCount();
   ResultSetContainer round = (ResultSetContainer) request.getAttribute(PactsConstants.ROUND_LIST);
   if (round == null) {
      out.println("No Round List!");
      //round = new ResultSetContainer();
   }
   else roundRowCount = round.getRowCount();
   ResultSetContainer.ResultSetRow rsr;
%>
<h1 align="center">PACTS</h1>
<h2 align="center">Search Affidavits</h2>

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
            <td>Creation Date:</td>
<% out.println("            <td>Between <input type=\"text\" name=\""+PactsConstants.EARLIEST_CREATION_DATE+"\" size=\"10\"> and <input type=\"text\" name=\""+PactsConstants.LATEST_CREATION_DATE+"\" size=\"10\"></td>"); %>
          </tr>
          <tr>
            <td>Is Affirmed:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.IS_AFFIRMED+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_AFFIRMED+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_AFFIRMED+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          <tr>
            <td>Is Notarized:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.IS_NOTARIZED+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          <tr>
            <td>Status:</td>
<% out.println("            <td><select name=\""+PactsConstants.STATUS_CODE+"\">");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < statusRowCount; n++) {
      rsr = status.getRow(n);
      out.println("              <option value=\""+TCData.getTCInt(rsr,"status_id",0,true)+"\">"+TCData.getTCString(rsr,"status_desc","default status",true)+"</option>");
   } %>
              </select></td>
          </tr>
          <tr>
            <td>Type:</td>
<% out.println("            <td><select name=\""+PactsConstants.TYPE_CODE+"\">");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < affidavitTypeRowCount; n++) {
      rsr = affidavitType.getRow(n);
      out.println("              <option value=\""+TCData.getTCInt(rsr,"affidavit_type_id",0,true)+"\">"+TCData.getTCString(rsr,"affidavit_type_desc","default type",true)+"</option>");
   } %>
              </select></td>
          </tr>
          <tr>
            <td>Round:</td>
<% out.println("            <td><select name=\""+PactsConstants.ROUND_ID+"\">");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < roundRowCount; n++) {
      rsr = round.getRow(n);
      out.println("              <option value=\""+TCData.getTCLong(rsr,"round_id",0,true)+"\">"+TCData.getTCString(rsr,"name","default round",true)+"</option>");
   } %>
              </select></td>
          </tr>
        </table>
        <p><br>
        <input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2">
        </p>
<% out.println("        <input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.AFFIDAVIT_CMD+"\"><input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.LIST_TASK+"\">"); %>
      </form>
    </td>
  </tr>
</table>
</center>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>

