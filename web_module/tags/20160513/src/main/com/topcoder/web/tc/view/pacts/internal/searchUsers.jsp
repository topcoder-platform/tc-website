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

<% int paymentMethodRowCount = 0;
   ResultSetContainer paymentMethod = (ResultSetContainer) request.getAttribute(PactsConstants.PAYMENT_METHOD_LIST);
   if (paymentMethod == null) {
      out.println("No Payment Method List!");
   }
   else paymentMethodRowCount = paymentMethod.getRowCount();
%>


<h1 align="center">PACTS</h1>
<h2 align="center">Search Users</h2>

<center>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center">
<% out.println("      <form name=\"searchForm\" method=\"GET\" action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\">"); %>
        <table border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td>Handle:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>First Name:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.FIRST_NAME+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Middle Name:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.MIDDLE_NAME+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Last Name:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.LAST_NAME+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Has Active Contracts:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.HAS_ACTIVE_CONTRACTS+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_ACTIVE_CONTRACTS+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_ACTIVE_CONTRACTS+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          <tr>
            <td>Has Pending Affidavits:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.HAS_PENDING_AFFIDAVITS+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_PENDING_AFFIDAVITS+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_PENDING_AFFIDAVITS+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          <tr>
            <td>Has Tax Forms On-File:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.HAS_TAX_FORMS_ON_FILE+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_TAX_FORMS_ON_FILE+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_TAX_FORMS_ON_FILE+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          <tr>
            <td>Is Owed Money:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.IS_OWED_MONEY+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_OWED_MONEY+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.IS_OWED_MONEY+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
          
<% if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {%>
          <tr>
            <td>Has Assignment Document v2.0:</td>
<% out.println("            <td><input type=\"radio\" value=\"true\" name=\""+PactsConstants.HAS_GLOBAL_AD+"\">Yes<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_GLOBAL_AD+"\" value=\"false\">No<br>");
   out.println("              <input type=\"radio\" name=\""+PactsConstants.HAS_GLOBAL_AD+"\" value=\"\" checked>Don't"); %>
              Care</td>
          </tr>
<%}%>

          <tr>
            <td>Payment Method:</td>
<% out.println("            <td><select name=\""+PactsConstants.METHOD_CODE+"\" multiple size=4>");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < paymentMethodRowCount; n++) {
       ResultSetContainer.ResultSetRow rsr = paymentMethod.getRow(n);
       out.println("<option value=\""+TCData.getTCInt(rsr,"payment_method_id",0,true)+"\">"+TCData.getTCString(rsr,"payment_method_desc","method",true)+"</option>");
   } %>
              </select></td>
          </tr>

   <script language="javascript">
   <!--
   document.searchForm.<%=PactsConstants.HANDLE %>.focus();
   -->
   </script>

        </table>
        <p><br>
        <input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2">
        </p>
<% out.println("        <input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.USER_CMD+"\"><input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.LIST_TASK+"\">"); %>


      </form>
    </td>
  </tr>
</table>
</center>


<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>

