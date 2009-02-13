<%@  page
  language="java"
  import="java.text.DecimalFormat,
          com.topcoder.shared.util.ApplicationServer,
          com.topcoder.common.web.data.Navigation" %>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    if (sessionInfo==null) {
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        if (nav==null) nav = new Navigation(request, response);
        request.getSession(true).setAttribute("navigation", nav);
        sessionInfo = nav.getSessionInfo();
    }

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

        <td class=homeTopBar width="100%" align=right valign="bottom">
<% if ( !sessionInfo.isAnonymous() ) { %>
    <strong>Hello,</strong>&#160;<span class="smallText"><tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>'/></span>
   <% if (level1.equals("long")) { %>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Logout" class=loginLinks>Logout</a>
   <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout" class=loginLinks>Logout</a>
   <% } %>           
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/Registration" class=loginLinks>Update Profile</a>
<% } else {
    if (level1.equals("long")) {%>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login" class=loginLinks>Login</a>
   <% } else { %>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=Login" class=loginLinks>Login</a>
   <% } %>
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