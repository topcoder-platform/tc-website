<%
   boolean isRatedAlg = ((Boolean)request.getAttribute("hasAlg")).booleanValue();
   boolean isRatedDes = ((Boolean)request.getAttribute("hasDes")).booleanValue();
   boolean isRatedDev = ((Boolean)request.getAttribute("hasDev")).booleanValue();
   String selectedTab = (String) request.getAttribute("tab");
   String coderId = request.getParameter("cr");
%>

<table cellpadding="0" cellspacing="0" border="0" class="tabTable">
  <tr>

<%--------------ALG TAB------------%>

<% if (isRatedAlg) {%>
  <% if (selectedTab.equals("alg")) {%>
      <td class="tabLeftOn">&#160;</td>
      <td class="tabIconOn"><img src="/i/stats/icons/alg.gif" alt="Algorithm Statistics" border="0" /></td>
      <td width="33%" class="tabTextOn"><A href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>" class="tabLink">Algorithm Statistics</A></td>
    <% if (isRatedDes) {%>
      <td valign="top"><img src="/i/stats/tabs/midOnOff.gif" alt="" border="0" /></td>
    <% } else { %>
      <td valign="top"><img src="/i/stats/tabs/midOnNA.gif" alt="" border="0" /></td>
    <% } %>
  <% } else { %>
    <% if (isRatedDes) {%>
      <td class="tabLeftOff">&#160;</td>
      <td class="tabIconOff"><img src="/i/stats/icons/alg.gif" alt="Algorithm Statistics" border="0" /></td>
      <td width="33%" class="tabTextOff"><A href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>" class="tabLink">Algorithm Statistics</A></td>
      <% if (selectedTab.equals("des")) {%>
      <td valign="top"><img src="/i/stats/tabs/midOffOn.gif" alt="" border="0" /></td>
      <% } else { %>
      <td valign="top"><img src="/i/stats/tabs/midOffOff.gif" alt="" border="0" /></td>
      <% } %>
    <% } else { %>
      <td class="tabLeftOff">&#160;</td>
      <td class="tabIconOff"><img src="/i/stats/icons/alg.gif" alt="Algorithm Statistics" border="0" /></td>
      <td width="33%" class="tabTextOff"><A href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>" class="tabLink">Algorithm Statistics</A></td>
      <td valign="top"><img src="/i/stats/tabs/midOffNA.gif" alt="" border="0" /></td>
    <% } %>
  <% } %>
<% } else { %>
  <% if (isRatedDes) {%>
    <% if (selectedTab.equals("des")) {%>
      <td class="tabLeftNA">&#160;</td>
      <td class="tabIconNA"><img src="/i/stats/icons/algNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Algorithm Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNAOn.gif" alt="" border="0" /></td>
    <% } else { %>
      <td class="tabLeftNA">&#160;</td>
      <td class="tabIconNA"><img src="/i/stats/icons/algNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Algorithm Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNAOff.gif" alt="" border="0" /></td>
    <% } %>
  <% } else { %>
      <td class="tabLeftNA">&#160;</td>
      <td class="tabIconNA"><img src="/i/stats/icons/algNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Algorithm Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNANA.gif" alt="" border="0" /></td>
  <% } %>
<% } %>

<%--------------DES TAB------------%>

<% if (isRatedDes) {%>
  <% if (selectedTab.equals("des")) {%>
      <td class="tabIconOn"><img src="/i/stats/icons/des.gif" alt="Design Statistics" border="0" /></td>
      <td width="33%" class="tabTextOn"><A href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>" class="tabLink">Design Statistics</A></td>
    <% if (isRatedDev) {%>
      <td valign="top"><img src="/i/stats/tabs/midOnOff.gif" alt="" border="0" /></td>
    <% } else { %>
      <td valign="top"><img src="/i/stats/tabs/midOnNA.gif" alt="" border="0" /></td>
    <% } %>
  <% } else { %>
    <% if (isRatedDev) {%>
      <td class="tabIconOff"><img src="/i/stats/icons/des.gif" alt="Design Statistics" border="0" /></td>
      <td width="33%" class="tabTextOff"><A href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>" class="tabLink">Design Statistics</A></td>
      <% if (selectedTab.equals("dev")) {%>
      <td valign="top"><img src="/i/stats/tabs/midOffOn.gif" alt="" border="0" /></td>
      <% } else { %>
      <td valign="top"><img src="/i/stats/tabs/midOffOff.gif" alt="" border="0" /></td>
      <% } %>
    <% } else { %>
      <td class="tabIconOff"><img src="/i/stats/icons/des.gif" alt="Design Statistics" border="0" /></td>
      <td width="33%" class="tabTextOff"><A href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>" class="tabLink">Design Statistics</A></td>
      <td valign="top"><img src="/i/stats/tabs/midOffNA.gif" alt="" border="0" /></td>
    <% } %>
  <% } %>
<% } else { %>
  <% if (isRatedDev) {%>
    <% if (selectedTab.equals("dev")) {%>
      <td class="tabIconNA"><img src="/i/stats/icons/desNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Design Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNAOn.gif" alt="" border="0" /></td>
    <% } else { %>
      <td class="tabIconNA"><img src="/i/stats/icons/desNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Design Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNAOff.gif" alt="" border="0" /></td>
    <% } %>
  <% } else { %>
      <td class="tabIconNA"><img src="/i/stats/icons/desNA.gif" alt="Des" border="0" /></td>
      <td width="33%" class="tabTextNA">Design Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/midNANA.gif" alt="" border="0" /></td>
  <% } %>
<% } %>

<%--------------DEV TAB------------%>

<% if (isRatedDev) {%>
  <% if (selectedTab.equals("dev")) {%>
      <td class="tabIconOn"><img src="/i/stats/icons/dev.gif" alt="Development Statistics" border="0" /></td>
      <td width="33%" class="tabTextOn"><A href="/tc?module=MemberProfile&tab=dev&cr=<%=coderId%>" class="tabLink">Development Statistics</A></td>
      <td valign="top"><img src="/i/stats/tabs/rightOn.gif" alt="" border="0" /></td>
  <% } else { %>
      <td class="tabIconOff"><img src="/i/stats/icons/dev.gif" alt="Development Statistics" border="0" /></td>
      <td width="33%" class="tabTextOff"><A href="/tc?module=MemberProfile&tab=dev&cr=<%=coderId%>" class="tabLink">Development Statistics</A></td>
      <td valign="top"><img src="/i/stats/tabs/rightOff.gif" alt="" border="0" /></td>
  <% } %>
<% } else { %>
      <td class="tabIconNA"><img src="/i/stats/icons/devNA.gif" alt="Dev" border="0" /></td>
      <td width="33%" class="tabTextNA">Development Statistics</td>
      <td valign="top"><img src="/i/stats/tabs/rightNA.gif" alt="" border="0" /></td>
<% } %>