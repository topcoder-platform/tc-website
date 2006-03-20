<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.controller.request.SubmitWager,
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
<title>TopCoder | Wager | Result</title>


</head>

<body>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td>
            Wager result:
            <p><%= message %></p>
            <p>
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewCompetitions">Go back to Competitions<a/>
            </p>
        </td>
    </tr>
</table>s


</body>
</html>

