<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
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

        <td class="<%=level1.equals("competition")?"topNavOn":"topNav"%>" nowrap><A href="/" class="topLink">Competition</A></td>

        <td class="topNav" nowrap><A href="/?t=development&c=index" class="topLink" target="_parent">Development</A></td>

        <td class="topNav" nowrap><A href="/?t=tces&c=index" class="topLink" target="_parent">Job Listing</A></td>

        <td class="topNav" nowrap><A href="http://software.topcoder.com" class="topLink" target="_parent">Software</A></td>

        <td class="<%=level1.equals("employment_services")?"topNavOn":"topNav"%>" nowrap><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=tces_home" class="topLink" target="_parent">Employment Services</A></td>

        <td class="<%=level1.equals("sponsorship")?"topNavOn":"topNav"%>" nowrap><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=index" class="topLink" target="_parent">Sponsorship</A></td>

        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
