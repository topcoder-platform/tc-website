<%@ page contentType="text/html;charset=utf-8" %>
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<font size="-1">
<%-- Overview tab --%>
<% if (selectedTab.equals("overview")) {%>
	 <font color="006633">竞赛概述</font> &nbsp;|&nbsp;
<% } else { %>
	  <a href="/pl/?module=Static&d1=gccj05&d2=ZH_overview_temp">竞赛概述</a> &nbsp;|&nbsp;
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

<% if (selectedTab.equals("registration")) {%>
	 <font color="006633">竞赛注册</font> &nbsp;|&nbsp;
<% } else { %>
	  <a href="/pl/?module=Static&d1=gccj05&d2=ZH_reg_closed">竞赛注册</a> &nbsp;|&nbsp;
<% } %>

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
<% if (selectedTab.equals("晋级")) {%>
	 <font color="006633">Advancers</font> &nbsp;|&nbsp;
<% } else { %>
	  <a href="/pl/?module=Static&d1=gccj05&d2=ZH_advancers">晋级</a> &nbsp;|&nbsp;
<% } %>
--%>
<%-- Practice Arena  tab --%>
<% if (selectedTab.equals("arena")) {%>
	 <font color="006633">竞技场</font>
<% } else { %>
	  <a href="/pl/?module=Static&d1=gccj05&d2=ZH_arena">竞技场</a>
<% } %>
</font>
