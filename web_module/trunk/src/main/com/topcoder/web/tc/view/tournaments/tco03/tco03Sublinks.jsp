<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    String tab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String list = request.getParameter("selectedList")==null?"":request.getParameter("selectedList");
%>

    <% if (list.equals("coding_rules")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_overview" class="topLink">Overview</a></td>
                    <td class="<%=tab.equals("eligibility")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_eligibility" class="topLink">Eligibility</a></td>
                    <td class="<%=tab.equals("conditions")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                    <td class="<%=tab.equals("structure")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_structure" class="topLink">Structure</a></td>
                    <td class="<%=tab.equals("prizes")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_prizes" class="topLink">Prizes</a></td>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else if (list.equals("coding_advancers")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("details")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tco03_bracket&trans=true" class="topLink">Details</a></td>
                    <td class="<%=tab.equals("qualification")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_qualification" class="topLink">Qualification</a></td>
                    <td class="<%=tab.equals("bracket")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_bracket_interact" class="topLink">Bracket</a></td>
                    <td class="<%=tab.equals("radeye")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_semi','radeyesemi',900,600);" class="topLink">radeye's Odds</a></td>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr> 
            </table>

    <% } else if (list.equals("component_rules")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_overview" class="topLink">Overview</a></td>
                    <td class="<%=tab.equals("eligibility")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_eligibility" class="topLink">Eligibility</a></td>
                    <td class="<%=tab.equals("conditions")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_conditions" class="topLink">Conditions of Participation</a></td>
                    <td class="<%=tab.equals("structure")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_structure" class="topLink">Structure</a></td>
                    <td class="<%=tab.equals("prizes")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_prizes" class="topLink">Prizes</a></td>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr> 
            </table>

    <% } else if (list.equals("component_advancers")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("design")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd2" class="topLink">Design</a></td>
                    <td class="<%=tab.equals("development")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_dev_rd2" class="topLink">Development</a></td>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr> 
            </table>

    <% } else { %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tcoSubNav">
            <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
        </table>
    <% } %>