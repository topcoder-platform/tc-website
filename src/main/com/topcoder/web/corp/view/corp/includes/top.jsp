<%@ page contentType="text/html; charset=ISO-8859-1"
    import="com.topcoder.web.corp.controller.request.Login,
        com.topcoder.ejb.DataCache.*,
        java.text.DecimalFormat,
        com.topcoder.web.corp.Constants,
        com.topcoder.shared.security.User,
        com.topcoder.web.common.security.SessionPersistor,
        com.topcoder.web.common.security.BasicAuthentication,
        com.topcoder.web.corp.model.SessionInfo,
        com.topcoder.shared.util.ApplicationServer" 
    %>
<%
    String isHomePage = request.getParameter("isHomePage")==null?"":request.getParameter("isHomePage");
%>
<%
   DataCache dcHome = com.topcoder.common.web.util.Cache.get();
%>

<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<a name="top"/>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
        <td nowrap="0" class="registerToday"><span class="time">Current Member Count</span>&#160;:&#160; <%=new DecimalFormat("#,##0").format(dcHome.getMemberCount())%> - <span class="time"><jsp:include page="../../date_time.jsp" /></span><a href="Javascript:tcTime()" class="statText"><strong>[Get Time]</strong></a></span></td>
        <td width="99%" align="right" class="login" nowrap="0">

<% if (sessionInfo.isAnonymous()) {  // no logged user %>
            <a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=LoginPage" class="loginLinks" target="_parent">Login</a>
            &#160;&#160;|&#160;&#160;<a href="https://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Registration" class="loginLinks">Register</a>
<% } else { %>
            <strong>Hello, <jsp:getProperty name="sessionInfo" property="Handle" /></strong>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Logout" class="loginLinks" target="_parent">Logout</a>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Registration" class="loginLinks">Update Profile</a>
<% } %>

            &#160;&#160;|&#160;&#160;<a href="/" class="loginLinks" target="_parent">Home</a>
        </td>
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">    
    <tr><td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>                
</table> 

<table width="100%" border=0 cellpadding=0 cellspacing=0>
	<tr>
		<td class=homeLogo><img src="http://www.topcoder.com/i/logo_r.gif" border=0 /></td>
	</tr>
</table>

<!-- Header ends -->

<!-- Main Navigation bar begins -->
<% if (isHomePage.equals("true")) {%>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeRedBar>&#160;</td>
			</tr>
		</table>
<% } else { %>
	<jsp:include page="../../menu.jsp"/>
<% } %>
<!-- Main Navigation bar ends -->
