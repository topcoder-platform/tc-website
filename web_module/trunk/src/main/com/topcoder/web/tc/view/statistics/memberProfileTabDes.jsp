<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscDesData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Des_Data"); %>
<% ResultSetContainer rscJavaData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_Java"); %>
<% ResultSetContainer rscNETData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_NET"); %>
<% ResultSetContainer rscTotalData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_Total"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" rowspan="3">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="2">Design Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscDesData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscDesData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscDesData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="catNW" colspan="2"><A href='/stat?c=tcs_ratings_history&pi=112&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="catNW">Ranking:</td><td class="statRNW"><rsc:item name="rank" set="<%=rscDesData%>" ifNull="not ranked" /></td></tr>
            <tr><td class="catNW">Volatility:</td><td class="statRNW"><rsc:item name="vol" set="<%=rscDesData%>" format="####" /></td></tr>
            <tr><td class="catNW">Competitions:</td><td class="statRNW"><rsc:item name="num_ratings" set="<%=rscDesData%>" format="####" /></td></tr>
            <tr><td class="catNW">Reliability:</td><td class="statRNW"><rsc:item name="reliability" set="<%=rscDesData%>" format="#.##%" ifNull="n/a"/></td></tr>
            <tr><td class="catNW">Maximum Rating:</td><td class="statRNW"><rsc:item name="max_rating" set="<%=rscDesData%>" format="####"/></td></tr>
            <tr><td class="catNW">Minimum Rating:</td><td class="statRNW"><rsc:item name="min_rating" set="<%=rscDesData%>" format="####"/></td></tr>
            <tr><td class="catNW">Earnings:</td><td class="statRNW"><rsc:item name="earnings" set="<%=rscDesData%>" format="$#,##0.00"/></td></tr>
            <tr><td class="catNW" colspan="2"><A href='/stat?pi=112&c=component_history&cr=<%=request.getParameter("cr")%>'>[earnings history]</A></td></tr>
         </table>
      </td>
      <td width="75%" valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Submission Details</td></tr>
            <tr>
               <td class="tableHeader">&#160;</td>
               <td class="tableHeader" align="right" width="33%">Java</td>
               <td class="tableHeader" align="right" width="33%">.NET</td>
               <td class="tableHeader" align="right" width="33%">Total</td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Inquiries</td>
               <td class="statLt" align="right"><rsc:item name="inquiry_count" set="<%=rscJavaData%>" format="###0" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="inquiry_count" set="<%=rscNETData%>" format="###0" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="inquiry_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Submissions</td>
               <td class="statDk" align="right"><rsc:item name="submit_count" set="<%=rscJavaData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="submit_count" set="<%=rscNETData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="submit_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Submission Rate</td>
               <td class="statLt" align="right"><rsc:item name="submit_percent" set="<%=rscJavaData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="submit_percent" set="<%=rscNETData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="submit_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Passed Screening</td>
               <td class="statDk" align="right"><rsc:item name="passed_screening_count" set="<%=rscJavaData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="passed_screening_count" set="<%=rscNETData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="passed_screening_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Screening Success Rate</td>
               <td class="statLt" align="right"><rsc:item name="passed_screening_percent" set="<%=rscJavaData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="passed_screening_percent" set="<%=rscNETData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="passed_screening_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Passed Review</td>
               <td class="statDk" align="right"><rsc:item name="passed_review_count" set="<%=rscJavaData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="passed_review_count" set="<%=rscNETData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="passed_review_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Review Success Rate</td>
               <td class="statLt" align="right"></td>
               <td class="statLt" align="right"></td>
               <td class="statLt" align="right"></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Maximum Score</td>
               <td class="statDk" align="right"><rsc:item name="max_score" set="<%=rscJavaData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="max_score" set="<%=rscNETData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="max_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Minimum Score</td>
               <td class="statLt" align="right"><rsc:item name="min_score" set="<%=rscJavaData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="min_score" set="<%=rscNETData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="min_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Average Score</td>
               <td class="statDk" align="right"><rsc:item name="avg_score" set="<%=rscJavaData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="avg_score" set="<%=rscNETData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="avg_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Average Placement</td>
               <td class="statLt" align="right"><rsc:item name="avg_placement" set="<%=rscJavaData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="avg_placement" set="<%=rscNETData%>" format="###0.00" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="avg_placement" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catDk" nowrap="nowrap">Wins</td>
               <td class="statDk" align="right"><rsc:item name="wins" set="<%=rscJavaData%>" format="###0" ifNull="n/a" /></td>
               <td class="statDk" align="right"><rsc:item name="wins" set="<%=rscNETData%>" format="###0" ifNull="n/a"/></td>
               <td class="statDk" align="right"><rsc:item name="wins" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
            </tr>
            <tr>
               <td class="catLt" nowrap="nowrap">Win Percentage</td>
               <td class="statLt" align="right"></td>
               <td class="statLt" align="right"></td>
               <td class="statLt" align="right"></td>
            </tr>
         </table>
      </td>
   </tr>
</table>