<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Alg_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" rowspan="3">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="2">Algorithm Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="tableCatNW" colspan="2"><A HREF='/stat?c=ratings_history&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="tableCatNW">Ranking:</td><td class="tableStatRNW"><rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /></td></tr>
            <tr><td class="tableCatNW">Volatility:</td><td class="tableStatRNW"><rsc:item name="vol" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="tableCatNW">Maximum Rating:</td><td class="tableStatRNW"><rsc:item name="highest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="tableCatNW">Minimum Rating:</td><td class="tableStatRNW"><rsc:item name="lowest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="tableCatNW">Default Language:</td><td class="tableStatRNW"><rsc:item name="language_name" set="<%=rscAlgData%>" /></td></tr>
            <tr><td class="tableCatNW">Competitions:</td><td class="tableStatRNW"><rsc:item name="num_ratings" set="<%=rscAlgData%>" /></td></tr>
            <tr><td class="tableCatNW">Most Recent Event:</td><td class="tableStatRNW"><rsc:item name="last_round" set="<%=rscAlgData%>" /><br><rsc:item name="last_round_date" set="<%=rscAlgData%>" format="MM.dd.yy"/></td></tr>
            <tr><td class="tableCatNW">Earnings:</td><td class="tableStatRNW"><rsc:item name="earnings" set="<%=rscAlgData%>" format="$#,##0.00"/></td></tr>
            <tr><td class="tableCatNW" colspan="2"><A href='/stat?c=earnings_history&cr=<%=request.getParameter("cr")%>'>[earnings history]</A></td></tr>
         </table>
      </td>
      <td width="75%" valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
<%

ResultSetContainer rscSummaryDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_1");
ResultSetContainer rscTotalDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_1");
if(!rscTotalDiv1.isEmpty()) {
%>
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
               <td class="tableCat" nowrap="nowrap"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
               <td class="tableStatR"><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
               <td class="tableStatR"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
               <td class="tableStatR"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
               <td class="tableStatR"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
            </tr>
            </rsc:iterator>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR"><rsc:item name="problems_submitted" set="<%=rscTotalDiv1%>" /></td>
               <td class="tableStatR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv1%>" /></td>
               <td class="tableStatR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv1%>" /></td>
               <td class="tableStatR"><rsc:item name="success_percentage" set="<%=rscTotalDiv1%>" format="0.00%" /></td>
            </tr>
         </table>
      </td>
   </tr>
<%
}
%>
   <tr>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Division II Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%"># Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%"># Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%"># Submitted</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level One</td>
               <td class="tableStatR">4</td>
               <td class="tableStatR">1</td>
               <td class="tableStatR">23</td>
               <td class="tableStatR">78.26%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Two</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">8</td>
               <td class="tableStatR">15</td>
               <td class="tableStatR">33.33%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Three</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0.00%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR">6</td>
               <td class="tableStatR">11</td>
               <td class="tableStatR">40</td>
               <td class="tableStatR">57.50%</td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Challenges</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="33%"># Failed Challenges</td>
               <td class="tableHeader" align="right" width="33%"># Challenges</td>
               <td class="tableHeader" align="right" width="33%">Success %  	</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level One</td>
               <td class="tableStatR">4</td>
               <td class="tableStatR">1</td>
               <td class="tableStatR">78.26%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Two</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">8</td>
               <td class="tableStatR">33.33%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Three</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0.00%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR">6</td>
               <td class="tableStatR">11</td>
               <td class="tableStatR">57.50%</td>
            </tr>
         </table>
      </td>
   </tr>
</table>