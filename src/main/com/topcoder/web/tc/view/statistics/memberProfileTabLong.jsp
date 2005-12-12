<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="java.util.Map"%>
<%@ page language="java"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Long_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                <tr><td class="tableTitle" colspan="2">Long Competitions</td></tr>
                <tr>
                    <td class="catNW" colspan="2"><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>">[history]</A><br><br></td>
                </tr>
                <tr><td class="catNW">Competitions:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="num_competitions"/></td></tr>
                <tr><td class="catNW">Avg. Rank:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A"/></td></tr>
                <tr><td class="catNW">Avg. Num. Submissions:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A"/></td></tr>
            </table>
        </td>
    </tr>
</table>