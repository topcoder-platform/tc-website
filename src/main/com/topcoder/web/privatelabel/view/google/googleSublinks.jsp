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
                    <td width="49%" bgcolor="#3366cc"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"tourney_subnav_blue_on":"tourney_subnav_blue"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview" class="topLink">Overview</a></td>
                    <td class="<%=tab.equals("eligibility")?"tourney_subnav_blue_on":"tourney_subnav_blue"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=google&d2=google_rules_eligibility" class="topLink">Eligibility</a></td>
                    <td class="<%=tab.equals("conditions")?"tourney_subnav_blue_on":"tourney_subnav_blue"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=google&d2=google_rules_conditions" class="topLink">Conditions of Participation</a></td>
                    <td class="<%=tab.equals("structure")?"tourney_subnav_blue_on":"tourney_subnav_blue"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=google&d2=google_rules_structure" class="topLink">Structure</a></td>
                    <td class="<%=tab.equals("prizes")?"tourney_subnav_blue_on":"tourney_subnav_blue"%>" width="1" nowrap="nowrap"><a href="/pl/?&module=Static&d1=google&d2=google_rules_prizes" class="topLink">Prizes</a></td>
                    <td width="49%" bgcolor="#3366cc"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    <% } else { %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav_blue_blue">
            <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
        </table>
    <% } %>