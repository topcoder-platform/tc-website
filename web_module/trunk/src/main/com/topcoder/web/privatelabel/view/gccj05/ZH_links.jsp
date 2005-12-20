<%@ page contentType="text/html;charset=utf-8" %>
<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<font size="-1">
    <%-- Overview tab --%>
    <% if (selectedTab.equals("overview")) {%>
    <font color="006633">竞赛概述</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_overview">竞赛概述</a> &nbsp;|&nbsp;
    <% } %>

    <%-- Schedule tab --%>
    <% if (selectedTab.equals("schedule")) {%>
    <font color="006633">日程安排</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_schedule">日程安排</a> &nbsp;|&nbsp;
    <% } %>

    <%-- Rules tab --%>
    <% if (selectedTab.equals("rules")) {%>
    <font color="006633">竞赛规则</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">竞赛规则</a> &nbsp;|&nbsp;
    <% } %>

    <%-- Registration tab --%>
<%--

    <% if (selectedTab.equals("registration")) {%>
    <font color="006633">竞赛注册</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_login">竞赛注册</a> &nbsp;|&nbsp;
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_reg_closed">竞赛注册</a> &nbsp;|&nbsp;
    <% } %>
--%>

    <%-- Instructions tab --%>
    <% if (selectedTab.equals("instructions")) {%>
    <font color="006633">竞赛指南</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_instructions">竞赛指南</a> &nbsp;|&nbsp;
    <% } %>

    <%-- FAQ tab --%>
    <% if (selectedTab.equals("faq")) {%>
    <font color="006633">竞赛问答</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_faq">竞赛问答</a> &nbsp;|&nbsp;
    <% } %>

    <%-- Advancers tab --%>
    <%--
    --%>
    <% if (selectedTab.equals("advancers")) {%>
         <font color="006633">晋级</font> &nbsp;|&nbsp;
    <% } else { %>
          <a href="/pl/?module=Static&d1=gccj05&d2=ZH_advancers">晋级</a> &nbsp;|&nbsp;
    <% } %>
    <%-- Practice Arena  tab --%>
    <% if (selectedTab.equals("arena")) {%>
    <font color="006633">竞技场</font> &nbsp;|&nbsp;
    <% } else { %>
    <a href="/pl/?module=Static&d1=gccj05&d2=ZH_arena">竞技场</a> &nbsp;|&nbsp;
    <% } %>

<!-- Google Groups  tab -->
            <% if (selectedTab.equals("forum")) {%>
               <font color="006633">中国编程挑战赛讨论社区</font>
            <% } else { %>
               <a href="/?t=sponsor&c=link&link=http://groups.google.com/group/China-Code-Jam" target="_blank">中国编程挑战赛讨论社区</a>
            <% } %>
</font>
<br><br>
<span class="bigRed">第一轮比赛已经结束。<A href="/pl/?module=Static&d1=gccj05&d2=ZH_advRound1" class="bigRed">点击这里</A>查看晋级的参赛者！</span>