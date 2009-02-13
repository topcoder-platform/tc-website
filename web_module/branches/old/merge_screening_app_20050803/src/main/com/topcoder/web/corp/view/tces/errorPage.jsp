<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ page language="java"
session="true"
isErrorPage="true"
%>
<% if (exception!=null) exception.printStackTrace();
    String message = (String)request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String)request.getAttribute(BaseServlet.URL_KEY);
 %>
<html>
<head>
   <TITLE>TopCoder</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="script.jsp" />
</HEAD>

<body>

<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr>
        <td width="100%" class="login" nowrap="0">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr><td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>
</table>

<!-- Logo Bar Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206"><a href="/?amp;t=home&amp;c=public_home" target="_parent"><img src="/i/logo.gif" width="206" height="49" border="0" vspace="5"/></a></td>
        <td width="99%"><img src="/i/clear.gif" width="1" height="75" border="0" hspace="15"/></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="100%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="100%" height="99%">
    <tr valign="top">
        <td width="180"><img src="/i/clear.gif" alt="" border="0" height="1" width="170"></td>
        <td width="10"><img border="0" height="1" width="10" src="/i/clear.gif"></td>
        <td width="100%" class="bodytext">
            <img border="0" vspace="5" height="1" width="400" src="/i/clear.gif"><br>
            <div class="header"><%=message==null?"Sorry, there was an error in your request.":message%></div>
            <div class="header"><a href="<%=url==null?"javascript:history.back();":url%>">go back</a></div>
        </td>
        <td width="10"><img border="0" height="1" width="10" src="/i/clear.gif"></td>
        <td width="170"><img border="0" height="1" width="170" src="/i/clear.gif"></td>
        <td width="10"><img height="1" width="10" src="/i/clear.gif"></td>
 </tr>
 </table>

<jsp:include page="../foot.jsp" />

</body>
</html>
