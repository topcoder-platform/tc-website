<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<script src="/js/tcscript.js" type="text/javascript"></script>

<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_hs_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="2">Algorithm Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="catNW" colspan="2"><A HREF='tc?module=HSRatingHistory&&ratid=2&cr=<%=request.getParameter("cr")%>'>[competition history]</A><br><br></td></tr>
<% if (rscAlgData.getStringItem(0, "team_name") != null) { %>            
            <tr><td class="catNW">Team:</td><td class="statRNW"><rsc:item name="team_name" set="<%=rscAlgData%>" ifNull="N/A" /></td></tr>
<% } %>            
            <tr><td class="catNW">Percentile:</td><td class="statRNW"><rsc:item name="percentile" set="<%=rscAlgData%>" ifNull="N/A" /></td></tr>
            <tr><td class="catNW">Rank:</td><td class="statRNW"><rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <tr><td class="catNW">Country Rank:</td><td class="statRNW"><rsc:item name="country_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <tr><td class="catNW">Volatility:</td><td class="statRNW"><rsc:item name="vol" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Maximum Rating:</td><td class="statRNW"><rsc:item name="highest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Minimum Rating:</td><td class="statRNW"><rsc:item name="lowest_rating" set="<%=rscAlgData%>" format="####"/></td></tr>
            <tr><td class="catNW">Default Language:</td><td class="statRNW"><rsc:item name="language_name" set="<%=rscAlgData%>" /></td></tr>
            <tr><td class="catNW">Competitions:</td><td class="statRNW"><A HREF='tc?module=HSRatingHistory&&ratid=2&cr=<%=request.getParameter("cr")%>'><rsc:item name="num_ratings" set="<%=rscAlgData%>" /></A></td></tr>
            <tr><td class="catNW">Most Recent Event:</td><td class="statRNW"><rsc:item name="last_round" set="<%=rscAlgData%>" /><br><rsc:item name="last_round_date" set="<%=rscAlgData%>" format="MM.dd.yy"/></td></tr>
         </table>
      </td>
      <td width="75%" valign="top">
<%
ResultSetContainer rscSummary = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary");
ResultSetContainer rscTotal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals");
if(!rscSummary.isEmpty()) {
%>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%">Submitted</td>
               <td class="tableHeader" align="right" width="25%">Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%">Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <rsc:iterator id="resultRow" list="<%=rscSummary%>">
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
               <td class="statR"><rsc:item name="problems_submitted" set="<%=rscTotal%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_challenge" set="<%=rscTotal%>" /></td>
               <td class="statR"><rsc:item name="problems_failed_by_system_test" set="<%=rscTotal%>" /></td>
               <td class="statR"><rsc:item name="success_percentage" set="<%=rscTotal%>" format="0.00%" /></td>
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
   <tr>
      <td colspan="2" align="center" style="border-top: 1px solid #999999;">
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
'<param name="movie" value="/flash/graphLoader.swf?competitionType=hs&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" />' + 
'<param name="menu" value="true" /> ' + 
'<param name="quality" value="high" /> ' + 
'<param name="bgcolor" value="#EEEEEE" /> ' + 
'<embed ' + 
'src="/flash/graphLoader.swf?competitionType=hs&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" ' + 
'menu="true" ' + 
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
</table>