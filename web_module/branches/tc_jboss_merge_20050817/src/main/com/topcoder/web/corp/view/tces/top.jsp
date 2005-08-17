<%@  page
    language="java"
    import="com.topcoder.common.web.data.CoderRegistration,
        com.topcoder.ejb.DataCache.*,
        com.topcoder.common.web.util.*,
        java.text.DecimalFormat,
        com.topcoder.common.web.data.Navigation,
            com.topcoder.shared.util.ApplicationServer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<a name="top"/>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>

        <td class="login" nowrap>
            <strong>Hello, <jsp:getProperty name="sessionInfo" property="handle" />.</strong>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Logout" class="loginLinks" target="_parent">Logout</a>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/" class="loginLinks">Corporate Services Home</a>
        </td>
        <td class="login" width="10">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr>
        <td width="15"><img src="/i/corp/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206"><screen:servletLink target="_top"><img src="/i/corp/logo_recruiting.gif" width="206" height="49" border="0" vspace="5"/></screen:servletLink></td>
        <td width="99%"><img src="/i/corp/clear.gif" width="1" height="1" border="0"/></td>
   </tr>
</table>

<!-- Header ends -->

<!-- Main Navigation bar begins -->
<jsp:include page="../corpMenu.jsp"/>
<!-- Main Navigation bar ends -->
