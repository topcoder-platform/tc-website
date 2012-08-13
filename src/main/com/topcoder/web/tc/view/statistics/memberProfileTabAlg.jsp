<%--
  - Author: TCSASSEMBLER
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the member profile algorithm page.
  -
  - Version 1.0 The old version.
  - Version 1.1 (Release Assembly - TopCoder Software Profile Update v1.0) changes: Update to match new prototype.
--%>
<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<script src="/js/tcscript.js" type="text/javascript"></script>
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Alg_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>

<div id="dataBox" class="dataBox">
    <table><tr>
        <td width="28%">
            <div class="dataMain">
                <div id="left" class="left equal-height">
                    <div class="clr"></div> 
                    <h2>Algorithm Competitions</h2>
                    <h3><a id="linkrat" href="javascript:">Rating</a></h3>
                    <h1>                    
                        <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                            <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
                        <%} else {%>
                            not rated
                        <%}%>
                    </h1>
                    <ul class="masterLink">
                        <li><a href='/tc?module=AlgoCompetitionHistory&cr=<%=request.getParameter("cr")%>'>Competition History</a></li>
                    </ul>
                    <!--End masterLink-->
                    
                    <div class="masterContent">
                        <ul>
                            <li><strong>Percentile</strong><span class="gray">
                                <rsc:item name="percentile" set="<%=rscAlgData%>" ifNull="N/A" />
                            </span></li>
                            
                            <li><strong>Rank</strong><span class="gray">
                                <rsc:item name="rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "rank")!=null) { %> of <rsc:item name="num_ranked" set="<%=rscAlgData%>"/><% } %>
                            </span></li>
                            
                            <li><strong>Country Rank</strong><span class="gray">
                                <rsc:item name="country_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "country_rank")!=null) { %> of <rsc:item name="num_country_ranked" set="<%=rscAlgData%>"/><% } %>
                            </span></li>
                            
                            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                            <li><strong>School Rank</strong><span class="gray">
                                <rsc:item name="school_rank" set="<%=rscAlgData%>" ifNull="not ranked" /><% if (rscAlgData.getStringItem(0, "school_rank")!=null) { %> of <rsc:item name="num_school_ranked" set="<%=rscAlgData%>"/><% } %>
                            </span></li>                                      
                            <% } %>
                            
                            <li><strong>Volatility</strong><span class="gray">
                                <rsc:item name="vol" set="<%=rscAlgData%>" format="####"/>
                            </span></li>
                            
                            <li><strong>Maximum Rating</strong><span class="gray">
                                <rsc:item name="highest_rating" set="<%=rscAlgData%>" format="####"/>
                            </span></li>
                            
                            <li><strong>Minimum Rating</strong><span class="gray">
                                <rsc:item name="lowest_rating" set="<%=rscAlgData%>" format="####"/>
                            </span></li>
                            
                            <li><strong>Default Language</strong><span class="gray">
                                <rsc:item name="language_name" set="<%=rscAlgData%>" />
                            </span></li>
                            
                            <li>
                                <strong>Competitions</strong><span class="red">
                                <a href='/tc?module=AlgoCompetitionHistory&cr=<%=request.getParameter("cr")%>' class="redlink">
                                    <rsc:item name="num_ratings" set="<%=rscAlgData%>" />
                                </a>
                            </span></li>
                            
                            <li>
                                <strong>Most Recent Event</strong><span class="gray">
                                <rsc:item name="last_round" set="<%=rscAlgData%>" />
                                <br />
                                <rsc:item name="last_round_date" set="<%=rscAlgData%>" format="MM.dd.yy"/>
                            </span></li>
                        </ul>
                    </div>
                    <!--End masterContent-->
                </div>
                <!--End left-->
            </div>
            <!--End dataMain-->     
        </td>
        <td width="5"></td>
        <td style="text-align:right;">
            <div id="right" class="right equal-height">
                <div class="clr"></div>
                
                <%
                ResultSetContainer rscSummaryDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_1");
                ResultSetContainer rscTotalDiv1 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_1");
                if(!rscSummaryDiv1.isEmpty()) {
                %>                
                
                <table cellpadding="0" cellspacing="0" class="dataTable">
                    <colgroup>
                        <col width="66" />
                        <col/>
                        <col/>
                        <col/>
                        <col width="66" />
                    </colgroup>
                    <thead>
                        <tr class="title">
                            <th colspan="5" class="textLeft leftSpacing">Division I Submission</th>
                        </tr>
                        <tr class="subTitle">
                            <th class="textLeft"><span class="leftBorder"></span>Problem</th>
                            <th>Submitted</th>
                            <th>Failed Challenge</th>
                            <th>Failed Sys.Test</th>
                            <th>Success %</th>
                        </tr>
                    </thead>
                    <tbody>
                        <rsc:iterator id="resultRow" list="<%=rscSummaryDiv1%>">
                        <tr>
                            <td class="textLeft leftSpacing leftBorder"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                        </tr>
                        </rsc:iterator>
                        
                        <tr>
                            <td class="textLeft leftSpacing leftBorder">Total</td>
                            <td><rsc:item name="problems_submitted" set="<%=rscTotalDiv1%>" /></td>
                            <td><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv1%>" /></td>
                            <td><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv1%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" set="<%=rscTotalDiv1%>" format="0.00%" /></td>
                        </tr>
                    </tbody>
                </table>
                
                <%
                }
                ResultSetContainer rscSummaryDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Summary_Div_2");
                ResultSetContainer rscTotalDiv2 = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Submission_Totals_Div_2");
                if(!rscSummaryDiv2.isEmpty()) {
                %>

                <table cellpadding="0" cellspacing="0" class="dataTable">
                    <colgroup>
                        <col width="66" />
                        <col  />
                        <col/>
                        <col />
                        <col width="65" />
                    </colgroup>
                    <thead>
                        <tr class="title">
                            <th colspan="5" class="textLeft leftSpacing">Division II Submission</th>
                        </tr>
                        <tr class="subTitle">
                            <th class="textLeft"><span class="leftBorder"></span>Problem</th>
                            <th>Submitted</th>
                            <th>Failed Challenge</th>
                            <th>Failed Sys.Test</th>
                            <th>Success %</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <rsc:iterator id="resultRow" list="<%=rscSummaryDiv2%>">
                        <tr>
                            <td class="textLeft leftSpacing leftBorder"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_submitted" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                        </tr>
                        </rsc:iterator>
                    
                        <tr>
                            <td class="textLeft leftSpacing leftBorder">Total</td>
                            <td><rsc:item name="problems_submitted" set="<%=rscTotalDiv2%>" /></td>
                            <td><rsc:item name="problems_failed_by_challenge" set="<%=rscTotalDiv2%>" /></td>
                            <td><rsc:item name="problems_failed_by_system_test" set="<%=rscTotalDiv2%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" set="<%=rscTotalDiv2%>" format="0.00%" /></td>
                        </tr>
                    </tbody>
                </table>
                
                <%
                }
                ResultSetContainer rscSummaryChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Summary");
                ResultSetContainer rscTotalChal = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Challenge_Totals");
                if(!rscSummaryChal.isEmpty()) {
                %>                
                
                <table cellpadding="0" cellspacing="0" class="dataTable">
                    <colgroup>
                        <col width="78" />
                        <col  />
                        <col />
                        <col width="65" />
                    </colgroup>
                    <thead>
                        <tr class="title">
                            <th colspan="5" class="textLeft leftSpacing">Challanges</th>
                        </tr>
                        <tr class="subTitle">
                            <th class="textLeft"><span class="leftBorder"></span>Problem</th>
                            <th>#Failed Challenge</th>
                            <th>#Challenges</th>
                            <th>Success %</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <rsc:iterator id="resultRow" list="<%=rscSummaryChal%>">
                        <tr>
                            <td class="textLeft leftSpacing leftBorder"><rsc:item name="level_desc" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="challenges_made_failed" row="<%=resultRow%>" /></td>
                            <td><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" row="<%=resultRow%>" format="0.00%"/></td>
                        </tr>
                        </rsc:iterator>                    
                    
                        <tr>
                            <td class="textLeft leftSpacing leftBorder">Total</td>
                            <td><rsc:item name="challenges_made_failed" set="<%=rscTotalChal%>" /></td>
                            <td><rsc:item name="challenge_attempts_made" set="<%=rscTotalChal%>" /></td>
                            <td class="rightBorder"><rsc:item name="success_percentage" set="<%=rscTotalChal%>" format="0.00%" /></td>
                        </tr>
                    </tbody>
                </table>
                
                <%
                }
                %>
                <div class="clr"></div>
            </div>
            <!--End right--> 
        </td>
    </tr></table>
    
    <div class="chartBox"> 
        <script language="JavaScript">
            var s='<object ' +
                'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ' +
                'codebase="http://fpdownload.macromedia.com" ' +
                '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ' +
                'width="540" ' +
                'height="240" ' +
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
                'width="540" ' +
                'height="240" ' +
                'name="graphLoader" ' +
                'swLiveConnect="true" ' +
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
