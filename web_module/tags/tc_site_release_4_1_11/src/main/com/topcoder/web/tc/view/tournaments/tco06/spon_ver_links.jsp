<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td valign="middle" align="center" width="70%" style="padding: 20px 0px 20px 0px;"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_description"><img src="/i/tournament/tco06/verisign_logo.gif" alt="VeriSign" border="0"/></a></td>
      <td valign="top" align="right" width="30%"><a href="/"><img src="/i/tournament/tco06/tc_logo.gif" border="0"/></a></td>
   </tr>
<!-- LEVEL 2 TABS -->
   <tr>
      <td colspan="2">
      <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
              <td class="nav">&#160;&#160;&#160;</td>
              <td class="nav" align="right"><img src="/i/tournament/tco06/tabs/L2_sideDK.gif" border="0" /></td>
            <% if (tabLev2.equals("details")) {%>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_description"><img src="/i/tournament/tco06/tabs/ver_L2_detailsOn.gif" alt="" border="0" /></A></td>
            <% } else { %>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_description"><img src="/i/tournament/tco06/tabs/ver_L2_detailsOff.gif" alt="" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("registration")) {%>
               <td class="nav">
            <% if (sessionInfo.isAnonymous()) { %>
                   <A href="/tc?module=Login&nextpage=http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg"><img src="/i/tournament/tco06/tabs/ver_L2_registrationOn.gif" alt="" border="0" /></A>
            <% } else { %>
                           <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg"><img src="/i/tournament/tco06/tabs/ver_L2_registrationOn.gif" alt="" border="0" /></A>
            <% } %>
                   </td>
            <% } else { %>
               <td class="nav">
            <% if (sessionInfo.isAnonymous()) { %>
                   <A href="/tc?module=Login&nextpage=http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg"><img src="/i/tournament/tco06/tabs/ver_L2_registrationOff.gif" alt="" border="0" /></A>
            <% } else { %>
                           <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg"><img src="/i/tournament/tco06/tabs/ver_L2_registrationOff.gif" alt="" border="0" /></A>
            <% } %>
            </td>
            <% } %>
 <%--
           <% if (tabLev2.equals("registrants")) {%>
               <td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/tournament/tco06/tabs/L2_registrantsOn.gif" alt="" border="0" /></A></td>
            <% } else { %>
               <td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/tournament/tco06/tabs/L2_registrantsOff.gif" alt="" border="0" /></A></td>
            <% } %>
--%>
<%--
            <% if (tabLev2.equals("advancers")) {%>
               <td class="nav"><A href="/tc?module=SimpleStats&c=tco06_spon_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=spon_ver_adv_overview"><img src="/i/tournament/tco06/tabs/L2_advancersOn.gif" alt="" border="0" /></A></td>
            <% } else { %>
               <td class="nav"><A href="/tc?module=SimpleStats&c=tco06_spon_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=spon_ver_adv_overview"><img src="/i/tournament/tco06/tabs/L2_advancersOff.gif" alt="" border="0" /></A></td>
            <% } %>
--%>
<%--
            <% if (tabLev2.equals("summary")) {%>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_finals_analysis"><img src="/i/tournament/tco06/tabs/L2_summaryOn.gif" alt="" border="0" /></A></td>
            <% } else { %>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_finals_analysis"><img src="/i/tournament/tco06/tabs/L2_summaryOff.gif" alt="" border="0" /></A></td>
            <% } %>
--%>
            <% if (tabLev2.equals("competitionArena")) {%>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_arena"><img src="/i/tournament/tco06/tabs/ver_L2_ArenaOn.gif" alt="" border="0" /></A></td>
            <% } else { %>
               <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_arena"><img src="/i/tournament/tco06/tabs/ver_L2_ArenaOff.gif" alt="" border="0" /></A></td>
            <% } %>
              <td class="nav" align="left"><img src="/i/tournament/tco06/tabs/L2_sideLT.gif" border="0" /></td>
              <td class="nav" width="100%">&#160;</td>
         </tr>
      </table>
      </td>
   </tr>

<!-- LEVEL 3 TABS -->
   <tr><td class="tabL3Top" colspan="2"><img src="/i/clear.gif" width="1" height="7" border="0"/></td></tr>
   <tr>
      <td colspan="2">
      <table width="100%" border="0" cellspacing=0 cellpadding=0 class="subNav">
         <tr>
            <td class="subnavBG">&#160;&#160;&#160;</td>
               <% if (tabLev2.equals("details")) {%>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tco06/tabs/ver_L3_descriptionOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/ver_L3_descriptionOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tco06/tabs/ver_L3_scheduleOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/ver_L3_scheduleOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tco06/tabs/ver_L3_rulesOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/ver_L3_rulesOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_instructions"><% if (tabLev3.equals("instructions")) {%><img src="/i/tournament/tco06/tabs/ver_L3_instructionsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/ver_L3_instructionsOff.gif" border="0" /><% } %></a></td>
               <% } else if (tabLev2.equals("registration")) {%>
                  <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
               <% } else if (tabLev2.equals("registrants")) {%>
                  <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
               <% } else if (tabLev2.equals("competitionArena")) {%>
                  <td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
               <% } else if (tabLev2.equals("advancers")) {%>
                  <td class="subnav"><a href="/tc?module=SimpleStats&c=tco06_spon_qual&trans=true&d1=tournaments&d2=tco06&d3=spon_ver_qualification"><% if (tabLev3.equals("qualification")) {%><img src="/i/tournament/tco06/tabs/L3_qualificationOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_qualificationOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=SimpleStats&c=tco06_spon_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=spon_ver_adv_overview"><% if (tabLev3.equals("overview")) {%><img src="/i/tournament/tco06/tabs/L3_overviewOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_overviewOff.gif" border="0" /><% } %></a></td>
               <% } else if (tabLev2.equals("summary")) {%>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_sum_onlinerounds"><% if (tabLev3.equals("online")) {%><img src="/i/tournament/tco06/tabs/L3_onlineroundsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_onlineroundsOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room1_analysis"><% if (tabLev3.equals("room1")) {%><img src="/i/tournament/tco06/tabs/L3_room1On.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_room1Off.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room2_analysis"><% if (tabLev3.equals("room2")) {%><img src="/i/tournament/tco06/tabs/L3_room2On.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_room2Off.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room3_analysis"><% if (tabLev3.equals("room3")) {%><img src="/i/tournament/tco06/tabs/L3_room3On.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_room3Off.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_wildcard_analysis"><% if (tabLev3.equals("wildcard")) {%><img src="/i/tournament/tco06/tabs/L3_wildcardOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_wildcardOff.gif" border="0" /><% } %></a></td>
                  <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_finals_analysis"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tco06/tabs/L3_finalsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco06/tabs/L3_finalsOff.gif" border="0" /><% } %></a></td>
               <% } %>
            <td class="subnavBG" width="100%">&#160;</td>
         </tr>
      </table>
      </td>
   </tr>
</table>
