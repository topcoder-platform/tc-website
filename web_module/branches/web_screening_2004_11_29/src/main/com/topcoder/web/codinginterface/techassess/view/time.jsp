<%
    String probTimer = request.getParameter("probTimer")==null?"":request.getParameter("probTimer");
%>

<table cellspacing=0 cellpadding=0 class=timeTable>
   <tr>
      <td class=timeCellLeft><img src="/i/corp/screening/techAssTitle.gif" alt="" /></td>
      <td class=timeCellRight>Current Time<br />
        <span id=currentTimer>Initializing</span></td>
   </tr>
</table>
