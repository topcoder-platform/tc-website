<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<%
    String probTimer = request.getParameter("timer")==null?"":request.getParameter("timer");
%>

<table cellspacing=0 cellpadding=0 class=timeTable>
   <tr>
      <td class=timeCellLeft><img src="/i/corp/screening/techAssTitle.gif" alt="" /></td>
      <%if(probTimer.equals("current")){%>
      <td class=timeCellRight>Current Time<br />
        <span id=currentTime>Initializing</span></td>
      <%} else if (probTimer.equals("remaining")) { %>
      <td class=timeCellRight>Time Remaining<br />
        <tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
        <span id="problemTimer<jsp:getProperty name="problemInfo" property="componentId"/>">Initializing</span></td>
      <% } %>
   </tr>
</table>
