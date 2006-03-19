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


<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>

View Competitions

        </td>
        
    <rsc:iterator list="<%=currentCompetitions%>" id="contest_name">
        <tr>
            <td class="value">
                    <rsc:item name="contest_name"/>
            </td>
        </tr>
    </rsc:iterator>        
        
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>


</body>
</html>

