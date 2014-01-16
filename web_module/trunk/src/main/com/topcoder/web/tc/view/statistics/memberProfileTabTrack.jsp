<%--
  - Author: TCSASSEMBLER
  - Version: 1.1
  - Copyright (C) 2012-2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the member profile track contest page.
  -
  - Version 1.0 The old version.
  - Version 1.1 (Release Assembly - TopCoder Software Profile Update v1.0) changes: Update to match new prototype.
--%>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 java.util.Map" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<script src="/js/tcscript.js" type="text/javascript"></script>

<% ResultSetContainer rscTrackData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Coder_Track_Data");
   ResultSetContainer rscTotalData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Component_Submission_Details_Total");
   ResultSetContainer rscCoderData = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("Coder_Data");
   String reviewerRating = (String) request.getAttribute("reviewer_rating");
%>

<div id="dataBox" class="dataBox">
    <table>
        <tr>
            <td width="28%">
                <div class="dataMain">
                    <div id="left" class="left">
                        <h2><%=request.getParameter("track")%> Competitions</h2>
                        <h3>Rating</h3>
                        
                        <!--<h1 class="green">968</h1>-->

                        <h1>
                        <%if (rscTrackData.getIntItem(0, "rating") != 0) {%>
                            <tc-webtags:ratingColor rating='<%=rscTrackData.getIntItem(0, "rating")%>'>
                                <rsc:item name="rating" set="<%=rscTrackData%>" format="####"/>
                            </tc-webtags:ratingColor>
                        <%} else {%>
                            not rated
                        <%}%>                        
                        </h1>
                        
                        <ul class="masterLink">
                            <li><a href='/tc?module=CompetitionHistory&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>Competition History</a></li>
                            <li><a href='/tc?module=OutstandingProjects&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>Current Challenges</a></li>
                            <li><a href='/tc?module=ReliabilityDetail&ph=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>'>Reliability Detail</a></li>
                        </ul>
                        <!--End masterLink-->
                        <div class="masterContent">
                            <ul>
                                <li><strong>Percentile</strong><span class="gray">
                                    <rsc:item name="percentile" set="<%=rscTrackData%>" ifNull="N/A"/>
                                </span></li>
                                
                                <li><strong>Rank</strong><span class="gray">
                                    <rsc:item name="rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                                    <% if (rscTrackData.getStringItem(0, "rank") != null) { %> of
                                    <rsc:item name="num_ranked" set="<%=rscTrackData%>"/>
                                    <% } %>
                                </span></li>
                                
                                <li><strong>Country Rank</strong><span class="gray">
                                    <rsc:item name="country_rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                                    <% if (rscTrackData.getStringItem(0, "country_rank") != null) { %> of
                                    <rsc:item name="num_country_ranked" set="<%=rscTrackData%>"/>
                                    <% } %>
                                </span></li>
                                
                                <% if (rscCoderData.getStringItem(0, "school_name") != null) { %>
                                <li><strong>School Rank</strong><span class="gray">
                                    <rsc:item name="school_rank" set="<%=rscTrackData%>" ifNull="not ranked"/>
                                    <% if (rscTrackData.getStringItem(0, "school_rank") != null) { %> of
                                    <rsc:item name="num_school_ranked" set="<%=rscTrackData%>"/>
                                    <% } %>
                                </span></li>                                      
                                <% }%>
                                
                                <li><strong>Volatility</strong><span class="gray">
                                    <rsc:item name="vol" set="<%=rscTrackData%>" format="####"/>
                                </span></li>
                                
                                <li><strong>Competitions</strong><span class="red">
                                    <a href='/tc?module=CompetitionHistory&<%=Constants.PHASE_ID%>=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>' class="redlink">
                                        <rsc:item name="num_ratings" set="<%=rscTrackData%>" format="####"/>
                                    </a>
                                </span></li>
                                
                                <li><strong>Reliability</strong><span class="red">
                                    <a href='/tc?module=ReliabilityDetail&ph=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>' class="redlink">
                                        <rsc:item name="reliability" set="<%=rscTrackData%>" format="#.##%" ifNull="n/a"/>
                                    </a>
                                </span></li>
                                
                                <li><strong>Maximum Rating</strong><span class="gray">
                                    <rsc:item name="max_rating" set="<%=rscTrackData%>" format="####"/>
                                </span></li>
                                
                                <li><strong>Minimum Rating</strong><span class="gray">
                                    <rsc:item name="min_rating" set="<%=rscTrackData%>" format="####"/>
                                </span></li>

                                <li><strong>Reviewer Rating</strong><span class="gray">
                                    <% if (reviewerRating != null) { %>
                                        <a href='/tc?module=ReviewerRatingHistory&ph=<%=request.getParameter("phase_id")%>&cr=<%=request.getParameter("cr")%>' class="redlink">
                                            <%=reviewerRating%>
                                        </a>
                                    <% } else { %>not rated<% } %> 
                                </span></li>
                            </ul>
                        </div>
                        <!--End masterContent-->
                    </div>
                    <!--End left-->   
                </div>
            </td>
            
            <td width="5">                       
            </td>
            
            <td style="text-align:right;">
                <div id="right" class="right">
                    <table cellpadding="0" cellspacing="0" class="dataTable">
                        <colgroup>
                            <col width="260" />
                            <col />
                        </colgroup>
                        <thead>
                            <tr class="title">
                                <th colspan="2" class="textLeft leftSpacing">Submissions</th>
                            </tr>
                            <tr class="subTitle">
                                <th class="textLeft"><span class="leftBorder"></span>Details</th>
                                <th class="textRight"><span class="rightBorder rightBorderSpacing"></span>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Inquiries</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="inquiry_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Submissions</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="submit_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Submission Rate</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="submit_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Passed Screening</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="passed_screening_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Screening Success Rate</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="passed_screening_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Passed Review</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="passed_review_count" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Review Success Rate</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="review_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Appeals*</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="num_appeals" set="<%=rscTotalData%>" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Appeal Success Rate*</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="successful_appeal_percentage" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Maximum Score</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="max_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Minimum Score</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="min_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Average Score</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="avg_score" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Average Placement</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="avg_placement" set="<%=rscTotalData%>" format="###0.00" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Wins</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="wins" set="<%=rscTotalData%>" format="###0" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Win Percentage</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item name="win_percent" set="<%=rscTotalData%>" format="0.00%" ifNull="n/a"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="texts textLeft">
                                    <p>* only includes appeals from projects posted on or after March 16, 2006 
                                    (TopCoder did not previously collect the relevant data)</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
              </div>
              <!--End right--> 
            </td>
        </tr>
    </table>
    
    <div class="chartBox"> 
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
                    '<param name="bgcolor" value="#FFFFFF" /> ' +
                    '<embed ' +
                    'src="/flash/graphLoader.swf?competitionType=<%= request.getParameter("competition_type") %>&coderID=<%=request.getParameter("cr")%>&myRating=<%=rscTrackData.getIntItem(0, "rating")%>" ' +
                    'menu="true" ' +
                    'quality="high" ' +
                    'bgcolor="#FFFFFF" ' +
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
    </div>
    <!--End chartBox-->
      
</div>