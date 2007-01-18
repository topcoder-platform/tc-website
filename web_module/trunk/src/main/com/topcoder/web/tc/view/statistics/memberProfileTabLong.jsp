<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="java.util.Map"%>
<%@ page language="java"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Long_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                <tr><td class="tableTitle" colspan="2">Marathon Matches</td></tr>
                <%if (rsc.getIntItem(0, "rating") != 0) {%>
                <tr>
                    <td class="ratingBox" width="25%">Rating:<br>
                        <tc-webtags:ratingColor rating='<%=rsc.getIntItem(0, "rating")%>'>
                            <rsc:item name="rating" set="<%=rsc%>" format="####"/>
                        </tc-webtags:ratingColor>
                    </td>
                    <td class="cat" width="75%">&nbsp;</td>
                </tr>
                <%}%>
                <tr>
                    <td class="catNW">
                     <A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>">[competition history]</A><br><br></td>
                    <td class="cat">&nbsp;</td>
                </tr>
                <tr><td class="catNW">Competitions:</td><td class="statRNW"><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>"><rsc:item set="<%=rsc%>" name="num_competitions"/></A></td></tr>
<%--                <tr><td class="catNW">Best Rank:</td><td class="statRNW">#</td></tr>--%>
                <tr><td class="catNW">Avg. Rank:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A" format="0.00"/></td></tr>
                <tr><td class="catNW">Avg. Num. Submissions:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A" format="0.00"/></td></tr>
            </table>
        </td>
    </tr>
</table>