<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String selectedTab2 = request.getParameter("selectedTab2")==null?"":request.getParameter("selectedTab2");
%>

<!--USDC Header-->
	<table align="center">
		<tr>
   			<td>
        		<A href="/tc?module=Static&d1=dev&d2=usdc_overview"><img src="/i/development/usdc/usdc_logo.gif" width="510" height="100" border="0" alt="Ultimate Software Development Contest"></A><br/>
            </td>
    	</tr>
		<tr>
   			<td align=center>
        		<img src="/i/development/usdc/usdc_tag.gif" width="280" height="25" border="0" alt="Ultimate Software Development Contest"><br/>
            	<img src="/i/clear.gif" width="10" height="10" border="0"/>
            </td>
    	</tr>
	</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Summary tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Prizes tab -->
            <% if (selectedTab.equals("prizes")) {%>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=dev&d2=usdc_prizes" class="statTextBig"><img src="/i/development/usdc/tab_prizes_on.gif" alt="Prizes" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=dev&d2=usdc_prizes" class="statTextBig"><img src="/i/development/usdc/tab_prizes_off.gif" alt="Prizes" width="88" height="22" border="0" /></A></td>
            <% } %>


<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_rules" class="statTextBig"><img src="/i/development/usdc/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_rules" class="statTextBig"><img src="/i/development/usdc/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_schedule" class="statTextBig"><img src="/i/development/usdc/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_schedule" class="statTextBig"><img src="/i/development/usdc/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Results tab -->
            <% if (selectedTab.equals("results")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=USDCResults&ph=112" class="statTextBig"><img src="/i/development/usdc/tab_results_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=USDCResults&ph=112" class="statTextBig"><img src="/i/development/usdc/tab_results_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="2" class="usdcSubNav">
    <tr>
        <td class="usdcSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
            <% if (selectedTab.equals("results")) {%>
                 <td class="<%=selectedTab2.equals("design")?"usdcSubNav_on":"usdcSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=USDCResults&ph=112" class="topLink">Design</a></td>
                 <td class="<%=selectedTab2.equals("development")?"usdcSubNav_on":"usdcSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=USDCResults&ph=113" class="topLink">Development</a></td>
            <% } else { %>
                <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
        <td class="usdcSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
    </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
    <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
</table>