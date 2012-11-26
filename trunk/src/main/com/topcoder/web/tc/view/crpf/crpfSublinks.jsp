<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    String tab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String list = request.getParameter("selectedList")==null?"":request.getParameter("selectedList");
%>

    <% if (list.equals("rules")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="crpfSubNav">
                <tr>
                    <td class="crpfSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tab.equals("overview")?"crpfSubNav_on":"crpfSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_overview" class="topLink">Overview</a></td>
                    <td class="<%=tab.equals("eligibility")?"crpfSubNav_on":"crpfSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_eligibility" class="topLink">Eligibility</a></td>
                    <td class="<%=tab.equals("conditions")?"crpfSubNav_on":"crpfSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_conditions" class="topLink">Conditions of Participation</a></td>
                    <td class="<%=tab.equals("structure")?"crpfSubNav_on":"crpfSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_structure" class="topLink">Structure</a></td>
                    <td class="<%=tab.equals("prizes")?"crpfSubNav_on":"crpfSubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_prizes" class="topLink">Prizes</a></td>
                    <td class="crpfSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else { %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="crpfSubNav">
            <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
        </table>
    <% } %>