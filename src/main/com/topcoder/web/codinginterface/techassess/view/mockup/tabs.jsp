`<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
%>

<%--
<div class=pbtcBox><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></div>
--%>
<table cellspacing=0 cellpadding=0 class=tabTable>
   <tr>
      <td class=logoBox rowspan=2><img src="/i/corp/screening/clientLogo.gif" alt=""/></td>
      <%-- colspan must equal # of tabs --%>
      <td class=titleBar colspan=3><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></td>
      <td class=tabBarEnd align=right rowspan=2><img src="/i/corp/screening/tabBarEnd.gif" alt=""/></td>
   </tr>
   <tr>
      <td class=tabBar><a href="/mockup/directions.jsp"><img src="/i/corp/screening/mainTab.gif" alt=""/></a></td>
      <td class=tabBar><a href="?module=Static&d1=help&d2=index"><img src="/i/corp/screening/helpTab.gif" alt=""/></a></td>
      <td class=tabBar><a href="/mockup/login.jsp"><img src="/i/corp/screening/logoutTab.gif" alt=""/></a></td>
   </tr>
</table>
