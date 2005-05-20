<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Alg_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" >
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="2">Algorithm Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="catNW" colspan="2"><A HREF='/stat?c=ratings_history&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="catNW">Rank:</td><td class="statRNW"><rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "rank")!=null) { %> of  of <rsc:item name="num_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <tr><td class="catNW">Country Rank:</td><td class="statRNW"><rsc:item name="country_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                <tr><td class="catNW">School Rank:</td><td class="statRNW"><rsc:item name="school_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "school_rank")!=null) { %> of <rsc:item name="num_school_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <% }%>
            <tr><td class="catNW">Volatility:</td><td class="statRNW"><rsc:item name="vol" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Maximum Rating:</td><td class="statRNW"><rsc:item name="highest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Minimum Rating:</td><td class="statRNW"><rsc:item name="lowest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Default Language:</td><td class="statRNW"><rsc:item name="language_name" set="<%=rscAlgData%>" /></td></tr>
            <tr><td class="catNW">Competitions:</td><td class="statRNW"><rsc:item name="num_ratings" set="<%=rscAlgData%>" /></td></tr>
            <tr><td class="catNW">Most Recent Event:</td><td class="statRNW"><rsc:item name="last_round" set="<%=rscAlgData%>" /><br><rsc:item name="last_round_date" set="<%=rscAlgData%>" format="MM.dd.yy"/></td></tr>
            <tr><td class="catNW">Earnings:</td><td class="statRNW"><rsc:item name="earnings" set="<%=rscAlgData%>" format="$#,##0.00" ifNull="$0.00"/></td></tr>
            <tr><td class="catNW" colspan="2"><A href='/stat?c=earnings_history&cr=<%=request.getParameter("cr")%>'>[earnings history]</A></td></tr>
         </table>
      </td>
      <td width="75%" valign="top">
<%
ResultSetContainer rscSummaryDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_1");
ResultSetContainer rscTotalDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_1");
if(!rscSummaryDiv1.isEmpty()) {
%>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Division I Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%">Submitted</td>
               <td class="tableHeader" align="right" width="25%">Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%">Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <rsc:iterator id="resultRow" list="<%=rscSummaryDiv1%>">
            <tr>
               <td class="cat" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
            </tr>
            </rsc:iterator>
            <tr>
               <td class="cat" nowrap="nowrap">Total</td>
               <td class="statR"><rsc:item name="problems_submitted" set="<%=rscTotalDiv1%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv1%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv1%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" set="<%=rscTotalDiv1%>" format="0.00%" /></td>
            </tr>
         </table>
<%
}
ResultSetContainer rscSummaryDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_2");
ResultSetContainer rscTotalDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_2");
if(!rscSummaryDiv2.isEmpty()) {
%>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Division II Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%">Submitted</td>
               <td class="tableHeader" align="right" width="25%">Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%">Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <rsc:iterator id="resultRow" list="<%=rscSummaryDiv2%>">
            <tr>
               <td class="cat" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
            </tr>
            </rsc:iterator>
            <tr>
               <td class="cat" nowrap="nowrap">Total</td>
               <td class="statR"><rsc:item name="problems_submitted" set="<%=rscTotalDiv2%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv2%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv2%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" set="<%=rscTotalDiv2%>" format="0.00%" /></td>
            </tr>
         </table>
<%
}
ResultSetContainer rscSummaryChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Summary");
ResultSetContainer rscTotalChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Totals");
if(!rscSummaryChal.isEmpty()) {
%>
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Challenges</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="33%"># Failed Challenges</td>
               <td class="tableHeader" align="right" width="33%"># Challenges</td>
               <td class="tableHeader" align="right" width="33%">Success %  	</td>
            </tr>
            <rsc:iterator id="resultRow" list="<%=rscSummaryChal%>">
            <tr>
               <td class="cat" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="challenges_made_failed" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
            </tr>
            </rsc:iterator>
            <tr>
               <td class="cat" nowrap="nowrap">Total</td>
               <td class="statR"><rsc:item name="challenges_made_failed" set="<%=rscTotalChal%>" /></td>
               <td class="statR"><rsc:item name="challenge_attempts_made" set="<%=rscTotalChal%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" set="<%=rscTotalChal%>" format="0.00%" /></td>
            </tr>
         </table>
<%
}
%>
      </td>
   </tr>
</table>