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
                    <td class="<%=tab.equals("bracket")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_bracket_interact#bracket" class="topLink">Bracket</a></td>
                    <td class="<%=tab.equals("radeye")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_finals" target="_blank" class="topLink">radeye's Odds</a></td>
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

    <% } else if (list.equals("summary")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("reception")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=reception" class="topLink">Reception</a></td>
                    <td class="<%=tab.equals("room1")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room1" class="topLink">Room 1</a></td>
                    <td class="<%=tab.equals("room2")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2" class="topLink">Room 2</a></td>
                    <td class="<%=tab.equals("room3")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3" class="topLink">Room 3</a></td>
                    <td class="<%=tab.equals("room4")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room4" class="topLink">Room 4</a></td>
                    <td class="<%=tab.equals("final")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final" class="topLink">Final Round</a></td>
                    <td class="<%=tab.equals("slide_show")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=slide_show" class="topLink">Slide Show</a></td>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr> 
            </table>

    <% } else if (list.equals("comp_summary")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>

                    <td class="<%=tab.equals("comp_final")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=comp_final" class="topLink">Component Final Round</a></td>
                    <td class="<%=tab.equals("awards")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=awards" class="topLink">Awards Dinner</a></td>

                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr> 
            </table>

    <% } else if (list.equals("onsite")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("joinus")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=overview" class="topLink">Join Us</a></td>
                    <td class="<%=tab.equals("directions")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=directions" class="topLink">Directions</a></td>
                    <td class="<%=tab.equals("transportation")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=transportation" class="topLink">Transportation</a></td>
                    <td class="<%=tab.equals("hotels")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=hotels" class="topLink">Hotels</a></td>
                    <td class="<%=tab.equals("casino")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=casino" class="topLink">Mohegan Sun</a></td>
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
                    <td class="<%=tab.equals("bracket")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_bracket_interact#bracket" class="topLink">Bracket</a></td>
                    <td class="<%=tab.equals("design")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd2" class="topLink">Design Details</a></td>
                    <td class="<%=tab.equals("development")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_dev_rd2" class="topLink">Development Details</a></td>
                    <td class="<%=tab.equals("finals")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_finals" class="topLink">Finals</a></td>
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