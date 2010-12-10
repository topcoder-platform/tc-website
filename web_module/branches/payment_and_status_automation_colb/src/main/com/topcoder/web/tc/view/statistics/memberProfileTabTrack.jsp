<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 java.util.Map" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<script src="/js/tcscript.js" type="text/javascript"></script>

<% ResultSetContainer rscTrackData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Coder_Track_Data"); %>
<% ResultSetContainer rscTotalData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Component_Submission_Details_Total"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Coder_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
<tr>
<td class="divider">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
        <tr>
            <td class="tableTitle" colspan="2"><%=request.getParameter("track")%> Competitions</td>
        </tr>
        <tr>
            <td class="ratingBox" colspan="2">Rating:<br>
                <%if (rscTrackData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscTrackData.getIntItem(0, "rating")%>'>
                    <rsc:item name="rating" set="<%=rscTrackData%>" format="####"/>
                </tc-webtags:ratingColor>
                <%} else {%>
                not rated
                <%}%>
            </td>
        </tr>
        <tr>
            <td class="catNW" colspan="2">
                <A href='/tc?module=CompetitionHistory&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>[competition
                    history]</A><br>
                <A href='/tc?module=OutstandingProjects&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>[current
                    contests]</A><br>
                <A href="/tc?module=ReliabilityDetail&ph=<%=request.getParameter("phase_id")%>&uid=<%=request.getParameter("cr")%>">[reliability
                    detail]</A><br><br>
            </td>
        </tr>
        <tr>
            <td class="catNW">Percentile:</td>
            <td class="statRNW">
                <rsc:item name="percentile" set="<%=rscTrackData%>" ifNull="N/A"/>
            </td>
        </tr>
        <tr>
            <td class="catNW">Rank:</td>
            <td class="statRNW">
                <rsc:item name="rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                <% if (rscTrackData.getStringItem(0, "rank") != null) { %> of
                <rsc:item name="num_ranked" set="<%=rscTrackData%>"/>
                <% } %></td>
        </tr>
        <tr>
            <td class="catNW">Country Rank:</td>
            <td class="statRNW">
                <rsc:item name="country_rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                <% if (rscTrackData.getStringItem(0, "country_rank") != null) { %> of
                <rsc:item name="num_country_ranked" set="<%=rscTrackData%>"/>
                <% } %></td>
        </tr>
        <% if (rscCoderData.getStringItem(0, "school_name") != null) { %>
        <tr>
            <td class="catNW">School Rank:</td>
            <td class="statRNW">
                <rsc:item name="school_rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                <% if (rscTrackData.getStringItem(0, "school_rank") != null) { %> of
                <rsc:item name="num_school_ranked" set="<%=rscTrackData%>"/>
                <% } %></td>
        </tr>
        <% }%>
        <tr>
            <td class="catNW">Volatility:</td>
            <td class="statRNW">
                <rsc:item name="vol" set="<%=rscTrackData%>" format="####"/>
            </td>
        </tr>
        <tr>
            <td class="catNW">Competitions:</td>
            <td class="statRNW">
                <A href='/tc?module=CompetitionHistory&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>
                    <rsc:item name="num_ratings" set="<%=rscTrackData%>" format="####"/>
                </A></td>
        </tr>
        <tr>
            <td class="catNW">Reliability:</td>
            <td class="statRNW"><A href="/tc?module=ReliabilityDetail&ph=<%=request.getParameter("phase_id")%>&uid=<%=request.getParameter("cr")%>">
                <rsc:item name="reliability" set="<%=rscTrackData%>" format="#.##%" ifNull="n/a"/>
            </A></td>
        </tr>
        <tr>
            <td class="catNW">Maximum Rating:</td>
            <td class="statRNW">
                <rsc:item name="max_rating" set="<%=rscTrackData%>" format="####"/>
            </td>
        </tr>
        <tr>
            <td class="catNW">Minimum Rating:</td>
            <td class="statRNW">
                <rsc:item name="min_rating" set="<%=rscTrackData%>" format="####"/>
            </td>
        </tr>
    </table>
</td>
<td width="75%" valign="top">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
<tr>
    <td class="tableTitle" colspan="6">Submission Details</td>
</tr>
<tr>
    <td class="tableHeader">&#160;</td>
    <td class="tableHeader" align="right" width="33%">Total</td>
    <td class="tableHeader" width="33%">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Inquiries</td>
    <td class="statLt" align="right">
        <rsc:item name="inquiry_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Submissions</td>
    <td class="statDk" align="right">
        <rsc:item name="submit_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Submission Rate</td>
    <td class="statLt" align="right">
        <rsc:item name="submit_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Passed Screening</td>
    <td class="statDk" align="right">
        <rsc:item name="passed_screening_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Screening Success Rate</td>
    <td class="statLt" align="right">
        <rsc:item name="passed_screening_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Passed Review</td>
    <td class="statDk" align="right">
        <rsc:item name="passed_review_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Review Success Rate</td>
    <td class="statLt" align="right">
        <rsc:item name="review_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Appeals*</td>
    <td class="statDk" align="right">
        <rsc:item name="num_appeals" set="<%=rscTotalData%>" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Appeal Success Rate*</td>
    <td class="statLt" align="right">
        <rsc:item name="successful_appeal_percentage" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Maximum Score</td>
    <td class="statDk" align="right">
        <rsc:item name="max_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Minimum Score</td>
    <td class="statLt" align="right">
        <rsc:item name="min_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Average Score</td>
    <td class="statDk" align="right">
        <rsc:item name="avg_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Average Placement</td>
    <td class="statLt" align="right">
        <rsc:item name="avg_placement" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catDk" nowrap="nowrap">Wins</td>
    <td class="statDk" align="right">
        <rsc:item name="wins" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/>
    </td>
    <td class="statDk" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="catLt" nowrap="nowrap">Win Percentage</td>
    <td class="statLt" align="right">
        <rsc:item name="win_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/>
    </td>
    <td class="statLt" align="right">&nbsp;</td>
</tr>
<tr>
    <td class="statDk" colspan="5">* only includes appeals from projects posted on or after March 16, 2006 (TopCoder did
        not previously collect the relevant data)
    </td>
</tr>

</table>
</td>
</tr>
<tr>
    <td colspan="2" align="center" style="border-top: 1px solid #999999;">
        <script language="JavaScript">
            var s = '<object ' +
                    'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ' +
                    'codebase="http://fpdownload.macromedia.com" ' +
                    '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ' +
                    'width="600" ' +
                    'height="400" ' +
                    'id="ratingHistory" ' +
                    'align="middle"> ' +
                    '<param name="allowScriptAccess" value="sameDomain" /> ' +
                    '<param name="movie" value="/flash/graphLoader.swf?competitionType=<%= request.getParameter("competition_type") %>&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscTrackData.getIntItem(0, "rating")%>" />' +
                    '<param name="menu" value="true" /> ' +
                    '<param name="quality" value="high" /> ' +
                    '<param name="bgcolor" value="#EEEEEE" /> ' +
                    '<embed ' +
                    'src="/flash/graphLoader.swf?competitionType=<%= request.getParameter("competition_type") %>&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscTrackData.getIntItem(0, "rating")%>" ' +
                    'menu="true" ' +
                    'quality="high" ' +
                    'bgcolor="#EEEEEE" ' +
                    'width="600" ' +
                    'height="400" ' +
                    'name="ratingHistory" ' +
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