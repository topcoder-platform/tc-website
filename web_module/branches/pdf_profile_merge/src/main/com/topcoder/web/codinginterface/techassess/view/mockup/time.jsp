<%
    String timer = request.getParameter("timer")==null?"":request.getParameter("timer");
%>

<table cellspacing=0 cellpadding=0 class=timeTable>
   <tr>
      <td class=timeCellLeft><img src="/i/corp/screening/techAssTitle.gif" alt="" /></td>

<% if (timer.equals("current")) {%>

      <td class=timeCellRight>Current Time<br />3:43:50 PM</td>

<% } else if (timer.equals("remaining")) { %>

      <td class=timeCellRight>Time Remaining<br />37:01</td>

<% } else if (timer.equals("off")) { %>

      <td class=timeCellRight>&#160;<br />&#160;</td>

<% } %>

   </tr>
</table>
