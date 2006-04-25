<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  ResultSetContainer leaderBoard = (ResultSetContainer) request.getAttribute(Constants.LEADER_LIST_KEY);
%>

<html>
    <head>
        <title>Digital Run - Leader Board</title>
    </head>
<body>
    <table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
        <rsc:iterator list="<%=leaderBoard%>" id="resultRow">
            <tr valign="top">
                <td>
                    <tc-webtag:handle 
                        coderId='<%= resultRow.getLongItem("user_id") %>'
                        context='algorithm'/>
                    <rsc:item name="user_id" row="<%=resultRow%>"/>
                </td>
                <td>
                    <rsc:item name="total_points" row="<%=resultRow%>"/>
                </td>
            </tr>
        </rsc:iterator>
    </table>
</body>
</html>
