<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>

        <td class="topNav" nowrap><A href="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="topLink">Competition Home</A></td>

        <td class="topNav" nowrap><A href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=index" class="topLink">Development</A></td>

        <td class="topNav" nowrap><A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=contracting&d2=index" class="topLink">Employment Opportunities</A></td>

        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
