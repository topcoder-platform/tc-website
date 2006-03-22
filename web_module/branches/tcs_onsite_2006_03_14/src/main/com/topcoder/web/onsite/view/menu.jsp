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
        <title>TopCoder | Wager | Menu</title>
    </head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
                    <p>
                        <% if (sessionInfo.isAnonymous()) { %>
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Login&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Login<a/>
                        <% } else { %>
                            Logged in as: <jsp:getProperty name="sessionInfo" property="handle"/>
                        <% } %>
                    </p>
                    <p>
                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewCompetitions">View Competitions<a/>
                    </p>
                        <% if (!sessionInfo.isAnonymous()) { %>
                    <p>
                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Logout&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Logout<a/>
                    </p>
                    <% } %>
                </td>
            </tr>
        </table>
    </body>
</html>
