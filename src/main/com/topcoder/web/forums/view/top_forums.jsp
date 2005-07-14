<%@  page
  language="java"
  import="java.text.DecimalFormat,
          java.util.HashMap,
          com.topcoder.web.common.model.CoderSessionInfo,
          com.topcoder.web.common.BaseServlet,
          com.jivesoftware.base.AuthToken,
          com.jivesoftware.base.User,
          com.topcoder.shared.util.ApplicationServer" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>

<%  CoderSessionInfo sessionInfo = (CoderSessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    User user = (User)request.getAttribute("user");
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
%>

<a name="top"/>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class=homeTopBar>
        <span class="time">Current Member Count</span>&#160;:&#160;<%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> -
        <span class="time"><jsp:include page="date_time.jsp" /></span>
        <a href="Javascript:tcTime()" class="time">&#160;<strong>[Get Time]</strong></a>
        </td>

        <td class=homeTopBar width="100%" align=right>
<% if ( !authToken.isAnonymous() ) { %>
            <strong>Hello, </strong>

            <tc-webtag:handle darkBG="true" coderId="<%=user.getID()%>"/>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout" class=loginLinks>Logout</a>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/Registration" class=loginLinks>Update Profile</a>
<% } else { %>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Login" class=loginLinks>Login</a>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/Registration" class=loginLinks>Register</a>
<%}%>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/" class=loginLinks>Home</a>
        </td>
    </tr>
</table>

<!-- Logo Bar Include Begins -->
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
<% if (level1.equals("development")) {%>
        <td class=homeLogo><a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="/i/logo.gif" border="0"/></a></td>
<% } else { %>
        <td class=homeLogo><a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="/i/logo_r.gif" border="0"/></a></td>
<% } %>
    </tr>
</table>

<jsp:include page="menu.jsp">
    <jsp:param name="level1" value="<%=level1%>"/>
</jsp:include>