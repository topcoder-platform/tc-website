<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscDesData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Des_Data"); %>
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
            <tr><td class="tableCatNW" colspan="2"><A href='/stat?c=tcs_ratings_history&pi=112&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="tableCatNW">Ranking:</td><td class="tableStatRNW"><rsc:item name="rank" set="<%=rscDesData%>" ifNull="not ranked" /></td></tr>
            <tr><td class="tableCatNW">Volatility:</td><td class="tableStatRNW"><rsc:item name="vol" set="<%=rscDesData%>" /></td></tr>
            <tr><td class="tableCatNW">Competitions:</td><td class="tableStatRNW"><rsc:item name="num_ratings" set="<%=rscDesData%>" /></td></tr>
            <tr><td class="tableCatNW">Reliability:</td><td class="tableStatRNW"><rsc:item name="reliability" set="<%=rscDesData%>" format="#.##%" ifNull="n/a"/></td></tr>
            <tr><td class="tableCatNW">Maximum Rating:</td><td class="tableStatRNW"><rsc:item name="max_rating" set="<%=rscDesData%>" format="####"/></td></tr>
            <tr><td class="tableCatNW">Minimum Rating:</td><td class="tableStatRNW"><rsc:item name="min_rating" set="<%=rscDesData%>" format="####"/></td></tr>
            <tr><td class="tableCatNW">Earnings:</td><td class="tableStatRNW"><rsc:item name="earnings" set="<%=rscDesData%>" format="$#,##0.00"/></td></tr>
            <tr><td class="tableCatNW" colspan="2"><A href='/stat?pi=112&c=component_history&cr=<%=request.getParameter("cr")%>'>[earnings history]</A></td></tr>
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
               <td class="tableCat" nowrap="nowrap">Inquiries</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Submissions</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Submission Rate</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Passed Screening</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Screening Success Rate</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Passed Review</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Maximum Score</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Minimum Score</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Average Score</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Average Placement</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Wins</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">0</td>
            </tr>
         </table>
      </td>
   </tr>
</table>