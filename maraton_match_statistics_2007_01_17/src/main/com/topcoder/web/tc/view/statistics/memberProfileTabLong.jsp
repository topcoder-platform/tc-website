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
                <tr>
                    <td class="ratingBox" width="25%">Rating:<br>
                        <%if (rsc.getIntItem(0, "rating") != 0) {%>
                        <tc-webtags:ratingColor rating='<%=rsc.getIntItem(0, "rating")%>'>
                            <rsc:item name="rating" set="<%=rsc%>" format="####"/>
                        </tc-webtags:ratingColor>
                        <%} else {%>
                        not rated
                        <%}%>
                    </td>
                    <td class="cat" width="75%">&nbsp;</td>
                </tr>
                <tr>
                    <td class="catNW">
                     <A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>">[competition history]</A><br><br></td>
                    <td class="cat">&nbsp;</td>
                </tr>
	            <tr><td class="catNW">Percentile:</td><td class="statRNW"><rsc:item name="percentile" set="<%=rsc%>" ifNull="N/A" /></td></tr>
	            <tr><td class="catNW">Rank:</td><td class="statRNW"><rsc:item name="rank" set="<%=rsc%>" ifNull="not ranked" /><% if (rsc.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rsc%>"/><% } %></td></tr>
	            <tr><td class="catNW">Country Rank:</td><td class="statRNW"><rsc:item name="country_rank" set="<%=rsc%>" ifNull="not ranked" /><% if (rsc.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rsc%>"/><% } %></td></tr>
	            <tr><td class="catNW">Volatility:</td><td class="statRNW"><rsc:item name="vol" set="<%=rsc%>" format="####"/></td></tr>
	            <tr><td class="catNW">Maximum Rating:</td><td class="statRNW"><rsc:item name="highest_rating" set="<%=rsc%>" format="####"/></td></tr>
	            <tr><td class="catNW">Minimum Rating:</td><td class="statRNW"><rsc:item name="lowest_rating" set="<%=rsc%>" format="####"/></td></tr>
	            <tr><td class="catNW">Competitions:</td><td class="statRNW"><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>"><rsc:item set="<%=rsc%>" name="num_competitions"/></A></td></tr>
	            <tr><td class="catNW">Avg. Rank:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A" format="0.00"/></td></tr>
	            <tr><td class="catNW">Avg. Num. Submissions:</td><td class="statRNW"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A" format="0.00"/></td></tr>
	            <tr><td class="catNW">Most Recent Event:</td><td class="statRNW"><rsc:item name="last_round" set="<%=rsc%>" /><br><rsc:item name="last_round_date" set="<%=rsc%>" format="MM.dd.yy"/></td></tr>
            </table>
        </td>
    </tr>
</table>