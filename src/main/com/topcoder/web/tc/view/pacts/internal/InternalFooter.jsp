<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<br><b>Date Format:
<% out.print(PactsConstants.DATE_FORMAT_STRING); %>
</b>
<br><br><br>
<center>
Searches<br>
<%
   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.USER_CMD+"\">");
   out.print("Users</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"\">");
   out.print("Payments</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.AFFIDAVIT_CMD+"\">");
   out.print("Affidavits</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.CONTRACT_CMD+"\">");
   out.print("Contracts</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.MODULE_KEY+"=SearchAssignmentDocument\">");
   out.print("Assignment Documents</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.TAX_FORM_CMD+"\">");
   out.print("General Tax Forms</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"\">");
   out.print("User Tax Forms</a> | ");

   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.SEARCH_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"\">");
   out.print("Notes</a>");
%>
<br><br>
<%--
   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.VERIFY_CMD+"\">");
   out.print("Verify Owed Payments</a><br>");
%>
<%
   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.PRINT_CMD+"\">");
   out.print("Print Payments</a><br>");
--%>
<!--<br><br> -->
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=Static&d1=pacts&d2=internal&d3=generatePayments">Generate Algorithm Affidavits/Payments</a><br>
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=ViewGenerateComponentPayments">Generate Software Contest Payments</a><br>
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=ViewGenerateIntroEventCompPayments">Generate Intro Event Payments</a><br>
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=ViewGenerateDRPayments">Generate DR Payments</a><br>
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=ViewCreateAffidavitTemplate">Create an Affidavit Template</a><br>
<a href="<%=PactsConstants.INTERNAL_SERVLET_URL%>?<%=PactsConstants.MODULE_KEY%>=ViewCreateAssignmentDocumentTemplate">Create an Assignment Document Template</a><br>


<br><br>
<a href="PactsInternalServlet?module=Login">Login</a>&nbsp;&nbsp;
<a href="PactsInternalServlet?module=Logout">Logout</a><br>
</center>