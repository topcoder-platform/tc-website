<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<script src="/js/tcscript.js" type="text/javascript"></script>
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Alg_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" style="background: #eeeeee;">
<tbody>
    <tr>
        <td valign="top">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr><td class="title" colspan="2">Algorithm Competitions</td></tr>
                <tr class="dark">
                    <td class="valueC" colspan="2">
                    <div class="ratingBox">
                    Rating:<br />
                    <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                        <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
                    <%} else {%>
                        not rated
                    <%}%>
                    </div>
                    <br />
                    <strong><a href='/tc?module=AlgoCompetitionHistory&cr=<%=request.getParameter("cr")%>'>[competition history]</a></strong>
                    </td>
                </tr>
                <%int i = 0;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Percentile:</td><td class="valueR"><rsc:item name="percentile" set="<%=rscAlgData%>" ifNull="N/A" /></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Rank:</td><td class="valueR"><rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Country Rank:</td><td class="valueR"><rsc:item name="country_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
                <%i++;%>
                <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">School Rank:</td><td class="valueR"><rsc:item name="school_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "school_rank")!=null) { %> of <rsc:item name="num_school_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
                <%i++;%>
                <% }%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Volatility:</td><td class="valueR"><rsc:item name="vol" set="<%=rscAlgData%>" format="####"/></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Maximum Rating:</td><td class="valueR"><rsc:item name="highest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Minimum Rating:</td><td class="valueR"><rsc:item name="lowest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Default Language:</td><td class="valueR"><rsc:item name="language_name" set="<%=rscAlgData%>" /></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Competitions:</td><td class="valueR"><a href='/tc?module=AlgoCompetitionHistory&cr=<%=request.getParameter("cr")%>'><rsc:item name="num_ratings" set="<%=rscAlgData%>" /></a></td></tr>
                <%i++;%>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>"><td class="field">Most Recent Event:</td><td class="valueR"><rsc:item name="last_round" set="<%=rscAlgData%>" /><br /><rsc:item name="last_round_date" set="<%=rscAlgData%>" format="MM.dd.yy"/></td></tr>
            </tbody>
            </table>
        </td>
        <td width="75%" valign="top">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
<%
ResultSetContainer rscSummaryDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_1");
ResultSetContainer rscTotalDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_1");
if(!rscSummaryDiv1.isEmpty()) {
%>
                <tr><td class="title" colspan="5">Division I Submissions</td></tr>
                <tr>
                    <td class="header">Problem</td>
                    <td class="header" align="right" width="25%">Submitted</td>
                    <td class="header" align="right" width="25%">Failed Challenge</td>
                    <td class="header" align="right" width="25%">Failed Sys. Test</td>
                    <td class="header" align="right" width="25%">Success %</td>
                </tr>
                <%i = 0;%>
                <rsc:iterator id="resultRow" list="<%=rscSummaryDiv1%>">
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                </tr>
                <%i++;%>
                </rsc:iterator>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap">Total</td>
                    <td class="valueR"><rsc:item name="problems_submitted" set="<%=rscTotalDiv1%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv1%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv1%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" set="<%=rscTotalDiv1%>" format="0.00%" /></td>
                </tr>
<%
}
ResultSetContainer rscSummaryDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_2");
ResultSetContainer rscTotalDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_2");
if(!rscSummaryDiv2.isEmpty()) {
%>
                <tr><td class="title" colspan="5">Division II Submissions</td></tr>
                <tr>
                    <td class="header">Problem</td>
                    <td class="header" align="right" width="25%">Submitted</td>
                    <td class="header" align="right" width="25%">Failed Challenge</td>
                    <td class="header" align="right" width="25%">Failed Sys. Test</td>
                    <td class="header" align="right" width="25%">Success %</td>
                </tr>
                <%i = 0;%>
                <rsc:iterator id="resultRow" list="<%=rscSummaryDiv2%>">
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                </tr>
                <%i++;%>
                </rsc:iterator>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap">Total</td>
                    <td class="valueR"><rsc:item name="problems_submitted" set="<%=rscTotalDiv2%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv2%>" /></td>
                    <td class="valueR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv2%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" set="<%=rscTotalDiv2%>" format="0.00%" /></td>
                </tr>
<%
}
ResultSetContainer rscSummaryChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Summary");
ResultSetContainer rscTotalChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Totals");
if(!rscSummaryChal.isEmpty()) {
%>
                <tr><td class="title" colspan="5">Challenges</td></tr>
                <tr>
                    <td class="header" colspan="2">Problem</td>
                    <td class="header" align="right" width="33%"># Failed Challenges</td>
                    <td class="header" align="right" width="33%"># Challenges</td>
                    <td class="header" align="right" width="33%">Success %      </td>
                </tr>
                <%i = 0;%>
                <rsc:iterator id="resultRow" list="<%=rscSummaryChal%>">
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap" colspan="2"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="challenges_made_failed" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                </tr>
                <%i++;%>
                </rsc:iterator>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="field" nowrap="nowrap" colspan="2">Total</td>
                    <td class="valueR"><rsc:item name="challenges_made_failed" set="<%=rscTotalChal%>" /></td>
                    <td class="valueR"><rsc:item name="challenge_attempts_made" set="<%=rscTotalChal%>" /></td>
                    <td class="valueR"><rsc:item name="success_percentage" set="<%=rscTotalChal%>" format="0.00%" /></td>
                </tr>
<%
}
%>
            </tbody>
            </table>

        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr class="dark">
                    <td class="valueC">
<script language="JavaScript">
var s='<object ' +
'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ' +
'codebase="http://fpdownload.macromedia.com" ' +
'/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ' +
'width="600" ' +
'height="400" ' +
'id="graphLoader" ' +
'align="middle"> ' +
'<param name="allowScriptAccess" value="sameDomain" /> ' +
'<param name="movie" value="/flash/graphLoader.swf?competitionType=alg&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" /> ' +
'<param name="menu" value="true" /> ' +
'<param name="quality" value="high" /> ' +
'<param name="bgcolor" value="#EEEEEE" /> ' +
'<embed src="/flash/graphLoader.swf?competitionType=alg&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" ' +
'menu="true"  ' +
'quality="high" ' +
'bgcolor="#EEEEEE" ' +
'width="600" ' +
'height="400" ' +
'name="graphLoader" ' +
'swLiveConnect="true" ' +
'align="middle" ' +
'allowScriptAccess="sameDomain" ' +
'type="application/x-shockwave-flash" ' +
'pluginspage="http://www.macromedia.com/go/getflashplayer" /> ' +
'</object> ';
doWrite(s);
</script>
                    </td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
</tbody>
</table>