<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<!--USDC Header-->
	<table align="center">
		<tr>
   			<td>
        		<A href="/tc?module=Static&d1=dev&d2=usdc_overview"><img src="/i/development/usdc/usdc_logo.gif" width="510" height="100" border="0" alt="Ultimate Software Development Contest"></A><br/>
            	<img src="/i/clear.gif" width="10" height="15" border="0"/></td>
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
            
<%--
<!-- Design tab -->
            <% if (selectedTab.equals("design")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_design_on.gif" alt="Design" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_design_off.gif" alt="Design" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Development tab -->
            <% if (selectedTab.equals("development")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_development_on.gif" alt="Development" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=dev&d2=usdc_overview" class="statTextBig"><img src="/i/development/usdc/tab_development_off.gif" alt="Development" width="88" height="22" border="0" /></A></td>
            <% } %>
--%>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="003399">
    <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
</table>
