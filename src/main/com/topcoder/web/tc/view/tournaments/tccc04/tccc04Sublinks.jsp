<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    String tab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String list = request.getParameter("selectedList")==null?"":request.getParameter("selectedList");
%>

    <% if (list.equals("overview")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tco_overview" class="topLink">Participate</a></td>
                    <td class="<%=tab.equals("eligibility")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tco_overview" class="topLink">Onsite</a></td>
                    <td class="<%=tab.equals("conditions")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tco_overview" class="topLink">Directions</a></td>
                    <td class="<%=tab.equals("structure")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tco_overview" class="topLink">Transportation</a></td>
                    <td class="<%=tab.equals("prizes")?"tcoSubNav_on":"tcoSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tco_overview" class="topLink">Hotels</a></td>
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