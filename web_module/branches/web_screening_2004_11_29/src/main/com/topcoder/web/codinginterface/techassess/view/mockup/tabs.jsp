<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
%>

<div class=pbtcBox><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></div>

<table cellspacing=0 cellpadding=0 class=tabTable>
	<tr>
		<td class=logoBox rowspan=2><img src="/i/corp/screening/clientLogo.gif" alt=""/></td>
		<%-- colspan must equal # of tabs --%>
		<td class=titleBar colspan=4><img src="/i/corp/screening/techAssTitle.gif" alt=""/></td>
		<td class=tabBarEnd align=right rowspan=2><img src="/i/corp/screening/tabBarEnd.gif" alt=""/></td>
	</tr>
	<tr>
		<td class=tabBar><img src="/i/corp/screening/mainTab.gif" alt=""/></td>
		<td class=tabBar><img src="/i/corp/screening/mainTab.gif" alt=""/></td>
		<td class=tabBar><img src="/i/corp/screening/mainTab.gif" alt=""/></td>
	</tr>
</table>
