<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
%>

<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/coders.css"/>
</head>
<body>

<div style="float:right;">
<a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tc_logo.gif" border=0/></a>
</div>
<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco06&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tco06_logo_AMDgrn.gif" border=0/></A>

<div style="padding: 20px 40px 200px 40px;" align="center">
   <div style="width: 500px;" align="center" class="bodyText">

   <span class="bigTitle">Component Competition Wager System</span>
   <br><br>
   
   <table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
      <tr>
         <td class="sidebarTitle">
            <% if (!sessionInfo.isAnonymous()) { %>
            <div style="float:right;">
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Logout&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Logout</a>
            </div>
            <% } %>
            <% if (sessionInfo.isAnonymous()) { %>
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Login&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Login</a>
            <% } else { %>
             Logged in as: <tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true"/>
            <% } %>
         </td>
      </tr>
      <tr>
         <td class="sidebarText" align="center" style="padding:20px;">
            <span class="bigTitle">
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewCompetitions">View Competitions</a>
            </span>
         </td>
      </tr>
   </table>

   </div>
</div>

</body>
</html>
