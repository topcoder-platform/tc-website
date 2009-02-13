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
<%
   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.PRINT_CMD+"\">");
   out.print("Print Payments</a><br>");
%>
<br><br>
<%
   out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LOGOUT_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.LOGOUT_TASK+"\">");
   out.print("Logout</a><br>");
%>
</center>