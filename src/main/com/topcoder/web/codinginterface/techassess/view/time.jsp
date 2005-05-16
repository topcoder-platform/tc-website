<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo"%>
<%
    String probTimer = request.getParameter("timer")==null?"":request.getParameter("timer");
%>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<table cellspacing=0 cellpadding=0 class=timeTable>
   <tr>
      <td class=timeCellLeft><img src="/i/corp/screening/techAssTitle.gif" alt="" /></td>
      <%if(probTimer.equals("current")){%>
      <td class=timeCellRight>Current Time<br />
        <span id=currentTime>Initializing</span></td>
      <%} else if (probTimer.equals("remaining")) { %>
      <td class=timeCellRight>Time Remaining<br />
        <tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
        <span id="problemTimer<%=problemInfo.getComponentId()%>">Initializing</span></td>
      <% } else if (probTimer.equals("set_remaining")) { %>
        <tc-webtag:useBean id="problemSets" name="<%=Constants.PROBLEM_SETS%>" type="java.util.List" toScope="page" />
      <td class=timeCellRight>Time Remaining<br />
        <span id="problemSetTimerCID<%=((ProblemSetInfo)problemSets.get(0)).getProblems()[0].getComponentID()%>PTID<%=((ProblemSetInfo)problems.get(0)).getTypeId()%>">Initializing</span></td>
      <% } %>
   </tr>
</table>



