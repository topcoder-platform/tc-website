<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    String tab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String list = request.getParameter("selectedList")==null?"":request.getParameter("selectedList");
%>

    <% if (list.equals("rules")) { %>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>                
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"tourney_subnav_on":"tourney_subnav"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="topLink">Overview</a></td>
                    <td class="<%=tab.equals("registration")?"tourney_subnav_on":"tourney_subnav"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_registration" class="topLink">Registration</a></td>
                    <td class="<%=tab.equals("conditions")?"tourney_subnav_on":"tourney_subnav"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                    <td class="<%=tab.equals("structure")?"tourney_subnav_on":"tourney_subnav"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_structure" class="topLink">Structure</a></td>
                    <td class="<%=tab.equals("prizes")?"tourney_subnav_on":"tourney_subnav"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_prizes" class="topLink">Prizes</a></td>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    <% } else { %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
            <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
        </table>
    <% } %>