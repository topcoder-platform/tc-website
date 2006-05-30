<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_hs_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>
<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes
    && navigator.mimeTypes["application/x-shockwave-flash"])
    ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
  var words = navigator.plugins["Shockwave Flash"].description.split(" ");
  for (var i = 0; i < words.length; ++i) {
    if (isNaN(parseInt(words[i])))
        continue;
    var MM_PluginVersion = words[i];
  }
  MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
        && (navigator.appVersion.indexOf("Win") != -1)) {
  document.write( '<SCR' + 'IPT LANGUAGE=VBScript\> \n ');
  document.write( 'on error resume next \n ');
  document.write( 'MM_FlashCanPlay = ( IsObject(CreateObject ');
  document.write( '("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n ');
  document.write( '</SCR' + 'IPT\> \n ');
}
//-->
</SCRIPT>
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
            <tr><td class="catNW" colspan="2"><A HREF='tc?module=HSRatingHistory&&ratid=2&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="catNW">Team:</td><td class="statRNW"><rsc:item name="team_name" set="<%=rscAlgData%>" ifNull="N/A" /></td></tr>
            <tr><td class="catNW">Percentile:</td><td class="statRNW"><rsc:item name="percentile" set="<%=rscAlgData%>" ifNull="N/A" /></td></tr>
            <tr><td class="catNW">Rank:</td><td class="statRNW"><rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <tr><td class="catNW">Country Rank:</td><td class="statRNW"><rsc:item name="country_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                <tr><td class="catNW">School Rank:</td><td class="statRNW"><rsc:item name="school_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "school_rank")!=null) { %> of <rsc:item name="num_school_ranked" set="<%=rscAlgData%>"/><% } %></td></tr>
            <% }%>
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
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
document.write( '<object ');
document.write( 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.write( 'codebase="http://fpdownload.macromedia.com" ');
document.write( '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
document.write( 'width="600" ');
document.write( 'height="400" ');
document.write( 'id="graphLoader" ');
document.write( 'align="middle"> ');
document.write( '<param name="allowScriptAccess" value="sameDomain" /> ');
document.write( '<param name="movie" ');
document.write( 'value="/flash/graphLoader.swf?competitionType=hs&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" ');
document.write( '<param name="menu" value="true" /> ');
document.write( '<param name="quality" value="high" /> ');
document.write( '<param name="bgcolor" value="#EEEEEE" /> ');
document.write( '<embed ');
document.write( 'src="/flash/graphLoader.swf?competitionType=hs&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscAlgData.getIntItem(0, "rating")%>" ');
document.write( 'menu="true" ');
document.write( 'quality="high" ');
document.write( 'bgcolor="#EEEEEE" ');
document.write( 'width="600" ');
document.write( 'height="400" ');
document.write( 'name="graphLoader" ');
document.write( 'swLiveConnect="true" ');
document.write( 'align="middle" ');
document.write( 'allowScriptAccess="sameDomain" ');
document.write( 'type="application/x-shockwave-flash" ');
document.write( 'pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
document.write( '</object> ');
}
// -->
</SCRIPT>
<SCRIPT language="JavaScript">
<!--
if (!MM_FlashCanPlay){
document.write( '<br><span class="bodySubtitle">Member Profile Graphs</span><br> ');
document.write( '<A href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank"> ');
document.write( '<img src="/i/interface/getFlash.gif" alt="Get Flash" border="0"></A> ');
}
// -->
</SCRIPT>
      </td>
   </tr>
</table>