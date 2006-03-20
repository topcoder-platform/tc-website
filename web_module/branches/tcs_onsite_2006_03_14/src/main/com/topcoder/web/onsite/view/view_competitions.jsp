<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.controller.request.Wager,
                 com.topcoder.web.onsite.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
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
    <% ResultSetContainer currentCompetitions = (ResultSetContainer) request.getAttribute("result");%>
    <head>
        <title>TopCoder | View Competitions</title>
    </head>
    
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    View Competitions
                </td>
            </tr>
            <tr>
                <td>
                    <p>
                        <%= currentCompetitions.getStringItem(0, "contest_name") %>
                    </p>
                </td>
            </tr>
        </table>
    </body>
</html>

