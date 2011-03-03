<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Pacts</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Language" content="en-us">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
    <meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    TaxForm taxForm = (TaxForm)
        request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
    NoteHeader[] notes = (NoteHeader[])
        request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
    if (taxForm == null) {
        out.println("no taxForm!!!<br>");
        taxForm = new TaxForm();
    }
    if (notes == null) {
        notes = new NoteHeader[0];
    }
    DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="&nbsp;"/>
</jsp:include>

<h2>View User Tax Form</h2>

        <table border="0" cellpadding="5" cellspacing="5">
        <tr>
        <td><b>User:</b></td><td>
<%            out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
            out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK);
            out.print("&"+PactsConstants.CMD_STRING+"="+PactsConstants.USER_CMD);
            out.print("&"+PactsConstants.USER_ID+"="+taxForm.getHeader().getUser().getId());
            out.print("\">"+taxForm.getHeader().getUser().getHandle()+"</a>");
%>
        </td></tr>
        <tr>
        <td><b>Name:</b></td><td>
<%            out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
            out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK);
            out.print("&"+PactsConstants.CMD_STRING+"="+PactsConstants.TAX_FORM_CMD);
            out.print("&"+PactsConstants.TAX_FORM_ID+"="+taxForm.getHeader().getId());
            out.print("\">"+taxForm.getHeader().getName()+"</a>");
%>
        </td></tr>
        <tr>
        <td><b>Status:</b></td>
<%            out.print("<td>"+taxForm.getHeader().getStatus()+"</td>\n");
%>
        </tr>

        <tr>
        <td><b>Generic Tax Form Status:</b></td>
<%            out.print("<td>"+taxForm.getGenericFormStatus()+"</td>\n");
%>
        </tr>
        <tr>
        <td><b>Date Filed:</b></td>
        <td>
<%        out.print(taxForm.getHeader().getDateFiled()); %>
        </td>
        </tr>
        <tr>
        <td><b>Description:</b></td><td>
<%            out.print(taxForm.getDescription());
%>
        </td></tr>
<!--
        <tr>
        <td><b>Withholding Amount <% if (!taxForm.isUsePercentage()) out.print("(Used)"); %>:</b></td><td>
<%            out.print(df.format(taxForm.getWithholdingAmount())+"</td><td>(Default: ");
            out.print(df.format(taxForm.getDefaultWithholdingAmount())+")");
%>
        </td></tr>
-->
        <tr>
        <td><b>Withholding Percentage <% if (taxForm.isUsePercentage()) out.print("(Used)"); %>:</b></td>
<%            out.print("<td>"+taxForm.getWithholdingPercentage()+"</td><td>(Default: ");
            out.print(taxForm.getDefaultWithholdingPercentage()+")</td>\n");
%>
        </tr>
</table>

<%  if (notes.length > 0) {
    out.println("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
    out.println("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.VIEW_TASK+"\">");
    out.println("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\">");
    out.println("<input type=\"submit\" value=\"View Note\">");
    out.println("<select name=\""+PactsConstants.NOTE_ID+"\">");
    for (int n = 0; n < notes.length; n++) {
        out.println("<option value=\""+notes[n].getId()+"\">"+notes[n].getCreationDate()+" by "+notes[n].getUser().getHandle()+"</option>");
    }
    out.println("</select></form>");
    }
%>
<p>
<%
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.TEXT_CMD+"&");
   out.println("object_id="+taxForm.getHeader().getId()+"&object_type="+PactsConstants.TAX_FORM_OBJ);
   out.println("\">View General Tax Form Text</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+taxForm.getHeader().getId()+"&");
   out.println("object_type="+PactsConstants.USER_TAX_FORM_OBJ+"&");
   out.println(PactsConstants.TAX_FORM_USER_ID+"="+taxForm.getHeader().getUser().getId()+"&");
   out.println(PactsConstants.USER_ID+"="+taxForm.getHeader().getUser().getId()+"\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"&");
   out.println(PactsConstants.TAX_FORM_ID+"="+taxForm.getHeader().getId()+"&");
   out.println(PactsConstants.USER_ID+"="+taxForm.getHeader().getUser().getId()+"\">Update User Tax Form</a><br>");
%>

<jsp:include page="InternalFooter.jsp" flush="true" />

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>