<%
    String probTimer = request.getParameter("timer")==null?"":request.getParameter("timer");
%>

<table cellspacing=0 cellpadding=0 class=timeTable>
   <tr>
      <td class=timeCellLeft><img src="/i/corp/screening/techAssTitle.gif" alt="" /></td>
      <%if(probTimer.equals("current")){%>
      <td class=timeCellRight>Current Time<br />
        <span id=currentTime>Initializing</span></td>
      <%} else { %>
      <td class=timeCellRight>Time Remaining<br />
        <span id="<%=probTimer%>">Initializing</span></td>
      <% } %>
   </tr>
</table>
