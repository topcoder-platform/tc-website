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
   int contractTypeRowCount = 0;
   if (status == null) {
      out.println("No Status List!");
      //status = new ResultSetContainer();
   }
   else statusRowCount = status.getRowCount();
   ResultSetContainer contractType = (ResultSetContainer) request.getAttribute(PactsConstants.CONTRACT_TYPE_LIST);
   if (contractType == null) {
      out.println("No Contract Type List!");
      //contractType = new ResultSetContainer();
   }
   else contractTypeRowCount = contractType.getRowCount();
   ResultSetContainer.ResultSetRow rsr;
%>
<h1 align="center">PACTS</h1>
<h2 align="center">Search Contracts</h2>

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
            <td>Contract Name:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.CONTRACT_NAME+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Creation Date:</td>
<% out.println("            <td>Between <input type=\"text\" name=\""+PactsConstants.EARLIEST_CREATION_DATE+"\" size=\"10\"> and <input type=\"text\" name=\""+PactsConstants.LATEST_CREATION_DATE+"\" size=\"10\"></td>"); %>
          </tr>
          <tr>
            <td>Start Date:</td>
<% out.println("            <td>Between <input type=\"text\" name=\""+PactsConstants.EARLIEST_START_DATE+"\" size=\"10\"> and <input type=\"text\" name=\""+PactsConstants.LATEST_START_DATE+"\" size=\"10\"></td>"); %>
          </tr>
          <tr>
            <td>End Date:</td>
<% out.println("            <td>Between <input type=\"text\" name=\""+PactsConstants.EARLIEST_END_DATE+"\" size=\"10\"> and <input type=\"text\" name=\""+PactsConstants.LATEST_END_DATE+"\" size=\"10\"></td>"); %>
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
   for (int n = 0; n < contractTypeRowCount; n++) {
      rsr = contractType.getRow(n);
      out.println("              <option value=\""+TCData.getTCInt(rsr,"contract_type_id",0,true)+"\">"+TCData.getTCString(rsr,"contract_type_desc","default type",true)+"</option>");
   } %>
              </select></td>
          </tr>
        </table>
        <p><br>
        <input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2">
        </p>
<% out.println("        <input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.CONTRACT_CMD+"\"><input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.LIST_TASK+"\">"); %>
      </form>
    </td>
  </tr>
</table>
</center>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>

