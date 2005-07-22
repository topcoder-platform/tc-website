<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<% ResultSetContainer rscDesData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Des_Data"); %>
<% ResultSetContainer rscJavaData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_Java"); %>
<% ResultSetContainer rscNETData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_NET"); %>
<% ResultSetContainer rscTotalData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Component_Submission_Details_Total"); %>
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
            <tr><td class="tableTitle" colspan="2">Design Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscDesData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscDesData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscDesData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="catNW" colspan="2"><A href='/stat?c=tcs_ratings_history&pi=112&cr=<%=request.getParameter("cr")%>'>[rating history]</A><br><br></td></tr>
            <tr><td class="catNW">Rank:</td><td class="statRNW"><rsc:item name="rank" set="<%=rscDesData%>" ifNull="not ranked" /><% if (rscDesData.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rscDesData%>"/><% } %></td></tr>
            <tr><td class="catNW">Country Rank:</td><td class="statRNW"><rsc:item name="country_rank" set="<%=rscDesData%>" ifNull="not ranked" /><% if (rscDesData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscDesData%>"/><% } %></td></tr>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                <tr><td class="catNW">School Rank:</td><td class="statRNW"><rsc:item name="school_rank" set="<%=rscDesData%>" ifNull="not ranked" /><% if (rscDesData.getStringItem(0, "school_rank")!=null) { %> of <rsc:item name="num_school_ranked" set="<%=rscDesData%>"/><% } %></td></tr>
            <% }%>
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
               <td class="statLt" align="right"><rsc:item name="review_percent" set="<%=rscJavaData%>" format="0.00%" ifNull="n/a" /></td>
               <td class="statLt" align="right"><rsc:item name="review_percent" set="<%=rscNETData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="review_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
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
               <td class="statLt" align="right"><rsc:item name="win_percent" set="<%=rscJavaData%>" format="0.00%" ifNull="n/a" /></td>
               <td class="statLt" align="right"><rsc:item name="win_percent" set="<%=rscNETData%>" format="0.00%" ifNull="n/a"/></td>
               <td class="statLt" align="right"><rsc:item name="win_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
            </tr>
         </table>
      </td>
   </tr>
<%--
   <tr>
      <td colspan="2" align="center" style="border-top: 1px solid #999999;">
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
document.write( '<object ');
document.write( 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.write( 'codebase="http://fpdownload.macromedia.com" ');
document.write( '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
document.write( 'width="100%" ');
document.write( 'height="400" ');
document.write( 'id="ratingHistory" ');
document.write( 'align="middle"> ');
document.write( '<param name="allowScriptAccess" value="sameDomain" /> ');
document.write( '<param name="movie" ');
document.write( 'value="/flash/ratingHistory.swf?competitionType=des&coderID=<%=request.getParameter("cr")%>" ');
document.write( '<param name="menu" value="true" /> ');
document.write( '<param name="quality" value="high" /> ');
document.write( '<param name="bgcolor" value="#EEEEEE" /> ');
document.write( '<embed ');
document.write( 'src="/flash/ratingHistory.swf?competitionType=des&coderID=<%=request.getParameter("cr")%>" ');
document.write( 'menu="true" ');
document.write( 'quality="high" ');
document.write( 'bgcolor="#EEEEEE" ');
document.write( 'width="100%" ');
document.write( 'height="400" ');
document.write( 'name="ratingHistory" ');
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
document.write( '<A href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank"> ');
document.write( '<img src="/i/interface/getFlash.gif" alt="Get Flash" border="0"></A> ');
}
// -->
</SCRIPT>
      </td>
   </tr>
--%>
</table>