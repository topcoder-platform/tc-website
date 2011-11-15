<html>

<head>
    <meta http-equiv="Content-Language" content="en-us">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
    <meta name="ProgId" content="FrontPage.Editor.Document">
    <title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.NoteHeader" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.Payment"%><%@ page import="java.text.DecimalFormat"%>
<%
    Payment[] payments = (Payment[])
            request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
    NoteHeader[] notes = (NoteHeader[])
            request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
    if (payments == null) {
        out.println("no payments!!!<br>");
        payments = new Payment[0];
    }
    DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>

<h2>View Payment Audit Trail</h2>

<% if (payments.length != 0) {
%>
<table border="0" cellpadding="5" cellspacing="5">
    <tr><td><b>ID:</b></td><td>
        <% out.print(payments[0].getHeader().getId()); %>
    </td></tr><tr>
    <td><b>User:</b></td>
    <% out.print("<td><a href=\"");
        out.print(PactsConstants.INTERNAL_SERVLET_URL);
        out.print("?" + PactsConstants.TASK_STRING + "=");
        out.print(PactsConstants.VIEW_TASK + "&");
        out.print(PactsConstants.CMD_STRING + "=");
        out.print(PactsConstants.USER_CMD + "&");
        out.print(PactsConstants.USER_ID + "=");
        out.print(payments[0].getHeader().getUser().getId());
        out.print("\">" + payments[0].getHeader().getUser().getHandle() + "</a></td>\n");
    %>
</tr>
<%--    <tr>
        <td><b>Reviewed:</b></td>
        <%
            if (payments.length >= 1 && payments[0].getHeader().isReviewed()) out.print("<td>Yes</td>\n");
            else out.print("<td>No</td>\n");
        %>
    </tr>--%>
</table>
<% } else out.print("payments was empty!\n");
%>
<p>
<table border="0" cellpadding="5" cellspacing="5">
    <tr>
        <td><b>Description</b></td>
        <td><b>Status</b></td>
        <td><b>Type</b></td>
        <td><b>Method</b></td>
        <td><b>Net Amount</b></td>
        <td><b>Gross Amount</b></td>
        <td><b>Date Modified</b></td>
        <td><b>Date Due</b></td>
        <td><b>Date Paid</b></td>
        <td><b>Modification Rationale</b></td>
        <td><b>Modification User</b></td>
    </tr>

    <% for (int n = 0; n < payments.length; n++) {
        out.print("<tr>\n");
        out.print("<td>" + payments[n].getDescription() + "</td>\n");
        out.print("<td>" + payments[n].getCurrentStatus().getDesc() + "</td>\n");
        out.print("<td>" + payments[n].getType() + "</td>\n");
        out.print("<td>" + payments[n].getMethod() + "</td>\n");
        out.print("<td>" + df.format(payments[n].getNetAmount()) + "</td>\n");
        out.print("<td>" + df.format(payments[n].getGrossAmount()) + "</td>\n");
        out.print("<td>" + payments[n].getModifiedDate() + "</td>\n");
        out.print("<td>" + payments[n].getDueDate() + "</td>\n");
        out.print("<td>" + payments[n].getPayDate() + "</td>\n");
        out.print("<td>" + payments[n].getRationale() + "</td>\n");
        if (payments[n].getCreateUserHandle()!=null) {
            out.print("<td>" + payments[n].getCreateUserHandle() + "</td>\n");
        } else {
            out.print("<td>" + "&nbsp;" + "</td>\n");
        }
    }
    %>

</table>

<% if (notes.length > 0) {
    out.println("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL + "\" method=\"post\">");
    out.println("<input type=\"hidden\" name=\"" + PactsConstants.TASK_STRING + "\" value=\"" + PactsConstants.VIEW_TASK + "\">");
    out.println("<input type=\"hidden\" name=\"" + PactsConstants.CMD_STRING + "\" value=\"" + PactsConstants.NOTE_CMD + "\">");
    out.println("<input type=\"submit\" value=\"View Note\">");
    out.println("<select name=\"" + PactsConstants.NOTE_ID + "\">");
    for (int n = 0; n < notes.length; n++) {
        out.println("<option value=\"" + notes[n].getId() + "\">" + notes[n].getCreationDate() + " by " + notes[n].getUser().getHandle() + "</option>");
    }
    out.println("</select></form>");
}
%>
<p>

    <%

       out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
       out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&");
       out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
       out.println(PactsConstants.PAYMENT_ID+"="+payments[0].getHeader().getId());
       out.println("\">View Payment</a><br>");

       out.print("<br>");

       out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
       out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
       out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
       out.println("object_id="+request.getParameter(PactsConstants.PAYMENT_ID)+"&");
       out.println("user_id="+payments[0].getHeader().getUser().getId()+"&");
       out.println("object_type="+PactsConstants.PAYMENT_OBJ);
       out.println("\">Add Note</a><br>");

       out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
       out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
       out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
       out.println(PactsConstants.PAYMENT_ID+"="+request.getParameter(PactsConstants.PAYMENT_ID));
       out.println("\">Update Payment</a><br>");

       //out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
       //out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
       //out.println(PactsConstants.CMD_STRING+"="+PactsConstants.REVIEW_CMD+"&");
       //out.println(PactsConstants.PAYMENT_ID+"="+request.getParameter(PactsConstants.PAYMENT_ID)+"&");
       //out.print("query="+PactsConstants.INTERNAL_SERVLET_URL+"%3F");
       //out.print(PactsConstants.TASK_STRING+"%3D"+PactsConstants.VIEW_TASK+"%26");
       //out.print(PactsConstants.CMD_STRING+"%3D"+PactsConstants.PAYMENT_AUDIT_TRAIL_CMD+"%26");
       //out.print(PactsConstants.PAYMENT_ID+"%3D"+request.getParameter(PactsConstants.PAYMENT_ID)+"%26");
       //out.print("individual_payment%3D1");
       //out.println("\">Review Payment</a><br>");
       
    %>

    <jsp:include page="InternalFooter.jsp" flush="true"/>

</body>

</html>
