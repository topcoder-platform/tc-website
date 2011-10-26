<%@ page contentType="text/html;charset=utf-8" %>
<%
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td width="80%" valign="middle" align="left" style="padding: 10px 0px 15px 45px;">
        <a href="/pl/?module=Static&d1=verisign06&d2=description"><img src="/i/events/verisign06/verisign_logo.gif" alt="VeriSign" border="0"/></a>
    </td>
    <td width="20%" valign="top" align="right" style="padding: 0px 20px 0px 0px;">
        <a href="/"><img src="/i/events/verisign06/ver_pbtc_logo.gif" border="0"/></a></td>
</tr>
<!-- LEVEL 2 TABS -->
<tr>
    <td colspan="2">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="nav">&#160;&#160;&#160;</td>
                <td class="nav" align="right"><img src="/i/events/verisign06/tabs/L2_sideDK.gif" border="0"/></td>
                <% if (tabLev2.equals("details")) {%>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=description"><img src="/i/events/verisign06/tabs/ver_L2_detailsOn.gif" alt="" border="0"/></A>
                </td>
                <% } else { %>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=description"><img src="/i/events/verisign06/tabs/ver_L2_detailsOff.gif" alt="" border="0"/></A>
                </td>
                <% } %>
                <% if (tabLev2.equals("registration")) {%>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=login"><img src="/i/events/verisign06/tabs/ver_L2_registrationOn.gif" alt="" border="0"/></A>
                </td>
                <% } else { %>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=login"><img src="/i/events/verisign06/tabs/ver_L2_registrationOff.gif" alt="" border="0"/></A>
                </td>
                <% } %>
                <% if (tabLev2.equals("results")) {%>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=resultsFinals"><img src="/i/events/verisign06/tabs/ver_L2_resultsOn.gif" alt="" border="0"/></A>
                </td>
                <% } else { %>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=resultsFinals"><img src="/i/events/verisign06/tabs/ver_L2_resultsOff.gif" alt="" border="0"/></A>
                </td>
                <% } %>
                <%--
                           <% if (tabLev2.equals("registrants")) {%>
                               <td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/events/verisign06/tabs/L2_registrantsOn.gif" alt="" border="0" /></A></td>
                            <% } else { %>
                               <td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/events/verisign06/tabs/L2_registrantsOff.gif" alt="" border="0" /></A></td>
                            <% } %>
                --%>
                <%--
                            <% if (tabLev2.equals("summary")) {%>
                               <td class="nav"><A href="/pl/?module=Static&d1=verisign06&d2=alg_finals_analysis"><img src="/i/events/verisign06/tabs/L2_summaryOn.gif" alt="" border="0" /></A></td>
                            <% } else { %>
                               <td class="nav"><A href="/pl/?module=Static&d1=verisign06&d2=alg_finals_analysis"><img src="/i/events/verisign06/tabs/L2_summaryOff.gif" alt="" border="0" /></A></td>
                            <% } %>
                --%>
                <% if (tabLev2.equals("competitionArena")) {%>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=arena"><img src="/i/events/verisign06/tabs/ver_L2_arenaOn.gif" alt="" border="0"/></A>
                </td>
                <% } else { %>
                <td class="nav">
                    <A href="/pl/?module=Static&d1=verisign06&d2=arena"><img src="/i/events/verisign06/tabs/ver_L2_arenaOff.gif" alt="" border="0"/></A>
                </td>
                <% } %>
                <td class="nav" align="left"><img src="/i/events/verisign06/tabs/L2_sideLT.gif" border="0"/></td>
                <td class="nav" width="100%">&#160;</td>
            </tr>
        </table>
    </td>
</tr>

<!-- LEVEL 3 TABS -->
<tr><td class="tabL3Top" colspan="2"><img src="/i/clear.gif" width="1" height="7" border="0"/></td></tr>
<tr>
    <td colspan="2">
        <table width="100%" border="0" height="35" cellspacing="0" cellpadding="0" class="subNav">
            <tr><td class="subnavBG">&#160;&#160;&#160;</td>
                <% if (tabLev2.equals("details")) {%>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=description"><% if (tabLev3.equals("description")) {%><img src="/i/events/verisign06/tabs/ver_L3_descriptionOn.gif" border="0" width="90" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_descriptionOff.gif" border="0" width="90" /><% } %></a></td>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/events/verisign06/tabs/ver_L3_scheduleOn.gif" border="0" width="70" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_scheduleOff.gif" border="0" width="70" /><% } %></a></td>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=rules"><% if (tabLev3.equals("rules")) {%><img src="/i/events/verisign06/tabs/ver_L3_rulesOn.gif" border="0" width="52" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_rulesOff.gif" border="0" width="52" /><% } %></a></td>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=instructions"><% if (tabLev3.equals("instructions")) {%><img src="/i/events/verisign06/tabs/ver_L3_instructionsOn.gif" border="0" width="80" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_instructionsOff.gif" border="0" width="80" /><% } %></a></td>
                <% } else if (tabLev2.equals("registration")) {%>
                <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
                <%--
                <% } else if (tabLev2.equals("registrants")) {%>
                <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
                --%>
                <% } else if (tabLev2.equals("results")) {%>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=resultsSrm1"><% if (tabLev3.equals("srm1")) {%><img src="/i/events/verisign06/tabs/ver_L3_srm1On.gif" border="0" width="52" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_srm1Off.gif" border="0" width="52" /><% } %></a></td>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=resultsSrm2"><% if (tabLev3.equals("srm2")) {%><img src="/i/events/verisign06/tabs/ver_L3_srm2On.gif" border="0" width="52" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_srm2Off.gif" border="0" width="52" /><% } %></a></td>
                <td class="subnav">
                    <a href="/pl/?module=Static&d1=verisign06&d2=resultsFinals"><% if (tabLev3.equals("finals")) {%><img src="/i/events/verisign06/tabs/ver_L3_finalsOn.gif" border="0" width="52" /><% } else { %><img src="/i/events/verisign06/tabs/ver_L3_finalsOff.gif" border="0" width="52" /><% } %></a></td>
                <% } else if (tabLev2.equals("competitionArena")) {%>
                <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
                <% } %>
                
                <td class="subnavBG" width="100%">&#160;</td>
            </tr>
        </table>
    </td>
</tr>
</table>
