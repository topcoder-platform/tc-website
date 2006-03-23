<!-- Nav Bar begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="topNav">
	<tr>
		<td width="20" class="adminTopNav"><img src="../images/clear.gif" alt="" width="20" height="21" border="0"></td>
		<td>

<% if (page_name == "catalog.jsp") { %>

			<table width="3%" border="0" cellpadding="0" cellspacing="0" class="adminTopNav">
				<tr valign="middle">
					<td width="46" align="center" class="adminTopNav"><a onmouseover="document.images['siteAdmin'].src = siteAdminon.src; window.status='Return to Regular Site'; return true;" onmouseout="document.images['siteAdmin'].src = siteAdminoff.src" class="topNavLinks" href="http://software.topcoder.com"><img src="/images/siteAdmin_off.gif" alt="RETURN TO SITE" name="siteAdmin" width="84" height="21" border="0" /></a></td>
					<td width="66" align="center" class="adminTopNav"><a href="catalog.jsp"><img src="/images/catalogAdmin_on.gif" alt="CATALOG ADMIN" name="catalogAdmin" width="97" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['categoryAdmin'].src = categoryAdminon.src; window.status='Category Administration'; return true;" onmouseout="document.images['categoryAdmin'].src = categoryAdminoff.src" class="topNavLinks" href="category_admin.jsp"><img src="/images/categoryAdmin_off.gif" alt="CATEGORY ADMIN" name="categoryAdmin" width="104" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a onmouseover="document.images['userAdmin'].src = userAdminon.src; window.status='User Administration'; return true;" onmouseout="document.images['userAdmin'].src = userAdminoff.src" class="topNavLinks" href="user_admin.jsp"><img src="/images/userAdmin_off.gif" alt="USER ADMIN" name="userAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['listsAdmin'].src = listsAdminon.src; window.status='Lists Administration'; return true;" onmouseout="document.images['listsAdmin'].src = listsAdminoff.src" class="topNavLinks" href="lists.jsp"><img src="/images/listAdmin_off.gif" alt="LISTS ADMIN" name="listsAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="window.status='Scorecard Administration'; return true;" class="topNavLinks" href="scorecard_admin.jsp">SCORECARD ADMIN</a></td>
<%--
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['scorecardAdmin'].src = scorecardAdminon.src; window.status='Scorecard Administration'; return true;" onmouseout="document.images['scorecardAdmin'].src = scorecardAdminoff.src" class="topNavLinks" href="scorecard_admin.jsp"><img src="/images/scorecardAdmin_off.gif" alt="SCORECARD ADMIN" name="scorecardAdmin" width="79" height="21" border="0" /></a></td>
--%>
				</tr>
			</table>
			
<% } else if (page_name == "category_admin.jsp") { %>

			<table width="3%" border="0" cellpadding="0" cellspacing="0" class="adminTopNav">
				<tr valign="middle">
					<td width="46" align="center" class="adminTopNav"><a onmouseover="document.images['siteAdmin'].src = siteAdminon.src; window.status='Return to Regular Site'; return true;" onmouseout="document.images['siteAdmin'].src = siteAdminoff.src" class="topNavLinks" href="http://software.topcoder.com"><img src="/images/siteAdmin_off.gif" alt="RETURN TO SITE" name="siteAdmin" width="84" height="21" border="0" /></a></td>
					<td width="66" align="center" class="adminTopNav"><a onmouseover="document.images['catalogAdmin'].src = catalogAdminon.src; window.status='Catalog Administration'; return true;" onmouseout="document.images['catalogAdmin'].src = catalogAdminoff.src" class="topNavLinks" href="catalog.jsp"><img src="/images/catalogAdmin_off.gif" alt="CATALOG ADMIN" name="catalogAdmin" width="97" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a href="category_admin.jsp"><img src="/images/categoryAdmin_on.gif" alt="CATEGORY ADMIN" name="categoryAdmin" width="104" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a onmouseover="document.images['userAdmin'].src = userAdminon.src; window.status='User Administration'; return true;" onmouseout="document.images['userAdmin'].src = userAdminoff.src" class="topNavLinks" href="user_admin.jsp"><img src="/images/userAdmin_off.gif" alt="USER ADMIN" name="userAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['listsAdmin'].src = listsAdminon.src; window.status='Lists Administration'; return true;" onmouseout="document.images['listsAdmin'].src = listsAdminoff.src" class="topNavLinks" href="lists.jsp"><img src="/images/listAdmin_off.gif" alt="LISTS ADMIN" name="listsAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="window.status='Scorecard Administration'; return true;" class="topNavLinks" href="scorecard_admin.jsp">SCORECARD ADMIN</a></td>
<%--
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['scorecardAdmin'].src = scorecardAdminon.src; window.status='Scorecard Administration'; return true;" onmouseout="document.images['scorecardAdmin'].src = scorecardAdminoff.src" class="topNavLinks" href="scorecard_admin.jsp"><img src="/images/scorecardAdmin_off.gif" alt="SCORECARD ADMIN" name="scorecardAdmin" width="79" height="21" border="0" /></a></td>
--%>
				</tr>
			</table>
			
<% } else if (page_name == "user_admin.jsp") { %>

			<table width="3%" border="0" cellpadding="0" cellspacing="0" class="adminTopNav">
				<tr valign="middle">
					<td width="46" align="center" class="adminTopNav"><a onmouseover="document.images['siteAdmin'].src = siteAdminon.src; window.status='Return to Regular Site'; return true;" onmouseout="document.images['siteAdmin'].src = siteAdminoff.src" class="topNavLinks" href="http://software.topcoder.com"><img src="/images/siteAdmin_off.gif" alt="RETURN TO SITE" name="siteAdmin" width="84" height="21" border="0" /></a></td>
					<td width="66" align="center" class="adminTopNav"><a onmouseover="document.images['catalogAdmin'].src = catalogAdminon.src; window.status='Catalog Administration'; return true;" onmouseout="document.images['catalogAdmin'].src = catalogAdminoff.src" class="topNavLinks" href="catalog.jsp"><img src="/images/catalogAdmin_off.gif" alt="CATALOG ADMIN" name="catalogAdmin" width="97" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['categoryAdmin'].src = categoryAdminon.src; window.status='Category Administration'; return true;" onmouseout="document.images['categoryAdmin'].src = categoryAdminoff.src" class="topNavLinks" href="category_admin.jsp"><img src="/images/categoryAdmin_off.gif" alt="CATEGORY ADMIN" name="categoryAdmin" width="104" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a href="user_admin.jsp"><img src="/images/userAdmin_on.gif" alt="USER ADMIN" name="userAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['listsAdmin'].src = listsAdminon.src; window.status='Lists Administration'; return true;" onmouseout="document.images['listsAdmin'].src = listsAdminoff.src" class="topNavLinks" href="lists.jsp"><img src="/images/listAdmin_off.gif" alt="LISTS ADMIN" name="listsAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="window.status='Scorecard Administration'; return true;" class="topNavLinks" href="scorecard_admin.jsp">SCORECARD ADMIN</a></td>
<%--
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['scorecardAdmin'].src = scorecardAdminon.src; window.status='Scorecard Administration'; return true;" onmouseout="document.images['scorecardAdmin'].src = scorecardAdminoff.src" class="topNavLinks" href="scorecard_admin.jsp"><img src="/images/scorecardAdmin_off.gif" alt="SCORECARD ADMIN" name="scorecardAdmin" width="79" height="21" border="0" /></a></td>
--%>
				</tr>
			</table>
			
<% } else if (page_name == "lists.jsp") { %>

			<table width="3%" border="0" cellpadding="0" cellspacing="0" class="adminTopNav">
				<tr valign="middle">
					<td width="46" align="center" class="adminTopNav"><a onmouseover="document.images['siteAdmin'].src = siteAdminon.src; window.status='Return to Regular Site'; return true;" onmouseout="document.images['siteAdmin'].src = siteAdminoff.src" class="topNavLinks" href="http://software.topcoder.com"><img src="/images/siteAdmin_off.gif" alt="RETURN TO SITE" name="siteAdmin" width="84" height="21" border="0" /></a></td>
					<td width="66" align="center" class="adminTopNav"><a onmouseover="document.images['catalogAdmin'].src = catalogAdminon.src; window.status='Catalog Administration'; return true;" onmouseout="document.images['catalogAdmin'].src = catalogAdminoff.src" class="topNavLinks" href="catalog.jsp"><img src="/images/catalogAdmin_off.gif" alt="CATALOG ADMIN" name="catalogAdmin" width="97" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['categoryAdmin'].src = categoryAdminon.src; window.status='Category Administration'; return true;" onmouseout="document.images['categoryAdmin'].src = categoryAdminoff.src" class="topNavLinks" href="category_admin.jsp"><img src="/images/categoryAdmin_off.gif" alt="CATEGORY ADMIN" name="categoryAdmin" width="104" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a onmouseover="document.images['userAdmin'].src = userAdminon.src; window.status='User Administration'; return true;" onmouseout="document.images['userAdmin'].src = userAdminoff.src" class="topNavLinks" href="user_admin.jsp"><img src="/images/userAdmin_off.gif" alt="USER ADMIN" name="userAdmin" width="79" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a href="lists.jsp"><img src="/images/listAdmin_off.gif" alt="LISTS ADMIN" name="listsAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="window.status='Scorecard Administration'; return true;" class="topNavLinks" href="scorecard_admin.jsp">SCORECARD ADMIN</a></td>
<%--
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['scorecardAdmin'].src = scorecardAdminon.src; window.status='Scorecard Administration'; return true;" onmouseout="document.images['scorecardAdmin'].src = scorecardAdminoff.src" class="topNavLinks" href="scorecard_admin.jsp"><img src="/images/scorecardAdmin_off.gif" alt="SCORECARD ADMIN" name="scorecardAdmin" width="79" height="21" border="0" /></a></td>
--%>
				</tr>
			</table>
			
<% } else { %>

			<table width="3%" border="0" cellpadding="0" cellspacing="0" class="adminTopNav">
				<tr valign="middle">
					<td width="46" align="center" class="adminTopNav"><a onmouseover="document.images['siteAdmin'].src = siteAdminon.src; window.status='Return to Regular Site'; return true;" onmouseout="document.images['siteAdmin'].src = siteAdminoff.src" class="topNavLinks" href="http://software.topcoder.com"><img src="/images/siteAdmin_off.gif" alt="RETURN TO SITE" name="siteAdmin" width="84" height="21" border="0" /></a></td>
					<td width="66" align="center" class="adminTopNav"><a onmouseover="document.images['catalogAdmin'].src = catalogAdminon.src; window.status='Catalog Administration'; return true;" onmouseout="document.images['catalogAdmin'].src = catalogAdminoff.src" class="topNavLinks" href="catalog.jsp"><img src="/images/catalogAdmin_off.gif" alt="CATALOG ADMIN" name="catalogAdmin" width="97" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['categoryAdmin'].src = categoryAdminon.src; window.status='Category Administration'; return true;" onmouseout="document.images['categoryAdmin'].src = categoryAdminoff.src" class="topNavLinks" href="category_admin.jsp"><img src="/images/categoryAdmin_off.gif" alt="CATEGORY ADMIN" name="categoryAdmin" width="104" height="21" border="0" /></a></td>
					<td width="156" align="center" class="adminTopNav"><a onmouseover="document.images['userAdmin'].src = userAdminon.src; window.status='User Administration'; return true;" onmouseout="document.images['userAdmin'].src = userAdminoff.src" class="topNavLinks" href="user_admin.jsp"><img src="/images/userAdmin_off.gif" alt="USER ADMIN" name="userAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['listsAdmin'].src = listsAdminon.src; window.status='Lists Administration'; return true;" onmouseout="document.images['listsAdmin'].src = listsAdminoff.src" class="topNavLinks" href="lists.jsp"><img src="/images/listAdmin_off.gif" alt="LISTS ADMIN" name="listsAdmin" width="79" height="21" border="0" /></a></td>
					<td width="106" align="center" class="adminTopNav"><a onmouseover="window.status='Scorecard Administration'; return true;" class="topNavLinks" href="scorecard_admin.jsp">SCORECARD ADMIN</a></td>
<%--
					<td width="106" align="center" class="adminTopNav"><a onmouseover="document.images['scorecardAdmin'].src = scorecardAdminon.src; window.status='Scorecard Administration'; return true;" onmouseout="document.images['scorecardAdmin'].src = scorecardAdminoff.src" class="topNavLinks" href="scorecard_admin.jsp"><img src="/images/scorecardAdmin_off.gif" alt="SCORECARD ADMIN" name="scorecardAdmin" width="79" height="21" border="0" /></a></td>
--%>
				</tr>
			</table>
			
<% } %>
			
		</td>
		<td width="97%" class="adminTopNav"><img src="../images/clear.gif" alt="" border="0"></td>
	</tr>
</table>
<!-- Nav Bar ends -->

