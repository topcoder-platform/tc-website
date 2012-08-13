<%--
  - Author: TCSASSEMBLER
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the member profile marathon match page.
  -
  - Version 1.0 The old version.
  - Version 1.1 (Release Assembly - TopCoder Software Profile Update v1.0) changes: Update to match new prototype.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="java.util.Map"%>
<%@ page language="java"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Long_Data"); %>
<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>

<c:set value="<%=rsc.get(0)%>" var="row"/>
<c:set value="<%=rscCoderData.get(0)%>" var="rowCoderData"/>
<c:set value="${not empty row.map['school_rank']}" var="inSchool" />
<script src="/js/tcscript.js" type="text/javascript"></script>


<div id="dataBox" class="dataBox longMatchDiv">
    <table>
        <tr>
            <td width="28%">
                <div class="dataMain">
                    <div id="left" class="left equal-height">
                        <div class="left">
                            <h2>Marathon Matches Competitions</h2>
                            <h3>Rating</h3>
                            
                            <c:choose>
                            <c:when test="${not empty row.map['rating']}" >
                            
                                <h1>
                                    <tc-webtags:ratingColor rating='<%=rsc.getIntItem(0, "rating")%>'>
                                        <rsc:item name="rating" set="<%=rsc%>" format="####"/>
                                    </tc-webtags:ratingColor>
                                </h1>
                                <ul class="masterLink">
                                    <li><a href='/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>'>Competition History</a></li>
                                </ul>
                                <!--End masterLink-->
                                <div class="masterContent">
                                    <ul>
                                        <li><strong>Percentile</strong><span class="gray"><c:out value="${row.map['percentile']}" default="N/A"/></span></li>
                                        <li><strong>Rank</strong><span class="gray">
                                            <c:choose>
                                                <c:when test="${empty row.map['rank']}" >not ranked</c:when>
                                                <c:otherwise>${row.map['rank']} of ${row.map['num_ranked']} </c:otherwise>
                                            </c:choose>
                                        </span></li>
                                        <li><strong>Country Rank</strong><span class="gray">
                                            <c:choose>
                                                <c:when test="${empty row.map['country_rank']}" >not ranked</c:when>
                                                <c:otherwise>${row.map['country_rank']} of ${row.map['num_country_ranked']} </c:otherwise>
                                            </c:choose>
                                        </span></li>             
                                        <li><strong>School Rank</strong><span class="gray">
                                            <c:choose>
                                                <c:when test="${empty rowCoderData.map['school_name']}" >N/A</c:when>
                                                <c:otherwise>${row.map['school_rank']} of ${row.map['num_school_ranked']} </c:otherwise>
                                            </c:choose>                                            
                                        </span></li>    
                                        <li><strong>Volatility</strong><span class="gray">
                                            ${row.map['vol']}
                                        </span></li>
                                        <li><strong>Maximum Rating</strong><span class="gray">
                                            ${row.map['highest_rating']}
                                        </span></li>
                                        <li><strong>Minimum Rating</strong><span class="gray">
                                            ${row.map['lowest_rating']}
                                        </span></li>
                                    </ul>
                                </div>
                                <!--End masterContent-->
                            
                            </c:when>
                            <c:otherwise>

                                <h1>
                                    unrated
                                </h1>
                                <ul class="masterLink">
                                    <li><a href='/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>'>Competition History</a></li>
                                </ul>
                                <!--End masterLink-->
                                <div class="masterContent">
                                    <ul>
                                        <li><strong>Percentile</strong><span class="gray"><c:out value="${row.map['percentile']}" default="N/A"/></span></li>
                                        <li><strong>Rank</strong><span class="gray">
                                            not ranked
                                        </span></li>
                                        <li><strong>Country Rank</strong><span class="gray">
                                            not ranked
                                        </span></li>             
                                        <li><strong>School Rank</strong><span class="gray">
                                            N/A                                            
                                        </span></li>    
                                        <li><strong>Volatility</strong><span class="gray">
                                            N/A    
                                        </span></li>
                                        <li><strong>Maximum Rating</strong><span class="gray">
                                            N/A    
                                        </span></li>
                                        <li><strong>Minimum Rating</strong><span class="gray">
                                            N/A    
                                        </span></li>
                                    </ul>
                                </div>
                                <!--End masterContent-->                                
                            
                            </c:otherwise>                
                            </c:choose>   
                            
                        </div>
                        <!--End left--> 
                    </div>
                    <!--End left-->     
                </div>
            </td>
            
            <td width="5">                       
            </td>
            
            <td style="text-align:right;">
                <div id="right" class="right equal-height">
                    <table cellpadding="0" cellspacing="0" class="dataTable">
                        <colgroup>
                            <col width="250" />
                            <col />
                        </colgroup>
                        <thead>
                            <tr class="title">
                                <th colspan="2" class="textLeft leftSpacing"></th>
                            </tr>
                            <tr class="subTitle">
                                <th class="textLeft"><span class="leftBorder"></span>Details</th>
                                <th class="textRight"><span class="rightBorder rightBorderSpacing"></span>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Best Rank</td>
                                <td class="textRight rightSpacing rightBorder">${row.map['best_rank']}</td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Wins</td>
                                <td class="textRight rightSpacing rightBorder">${row.map['num_wins']}</td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Top Five Finishes</td>
                                <td class="textRight rightSpacing rightBorder">${row.map['num_top_five']}</td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Top Ten Finishes</td>
                                <td class="textRight rightSpacing rightBorder">${row.map['num_top_ten']}</td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Avg.Rank</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A" format="0.00"/></td>
                            </tr>
                            <tr>
                                <td class="textLeft leftSpacing leftBorder">Avg.Num.Submissions</td>
                                <td class="textRight rightSpacing rightBorder"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A" format="0.00"/></td>
                            </tr>
                            <c:if test="${not empty row.map['rating']}" >
                                <tr>
                                    <td class="textLeft leftSpacing leftBorder">Competitions</td>
                                    <td class="textRight rightSpacing rightBorder">
                                        <a class="redlink" href='/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>'>
                                            <rsc:item set="<%=rsc%>" name="num_competitions"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="textLeft leftSpacing leftBorder">Most Recent Event</td>
                                    <td class="textRight rightSpacing rightBorder">
                                    ${row.map['last_round']}<br />
                                    <rsc:item name="last_round_date" set="<%=rsc%>" format="MM.dd.yy"/>
                                    </td>
                                </tr>
                            </c:if>    
                            
                        </tbody>
                    </table>
                </div>
                <!--End right--> 
            </td>
        </tr>
    </table>
    
    <div class="chartBox"> 
        <c:choose>
        <c:when test="${not empty row.map['rating']}" >            
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
                    '<param name="movie" value="/flash/graphLoader.swf?competitionType=long&coderID=<rsc:item set="<%=rsc%>" name="coder_id"/>&myRating=<%=rsc.getIntItem(0, "rating")%>" /> ' +
                    '<param name="menu" value="true" /> ' +
                    '<param name="quality" value="high" /> ' +
                    '<param name="bgcolor" value="#eeeeee" /> ' +
                    '<embed src="/flash/graphLoader.swf?competitionType=long&coderID=<rsc:item set="<%=rsc%>" name="coder_id"/>&myRating=<%=rsc.getIntItem(0, "rating")%>" ' +
                    'menu="true"  ' +
                    'quality="high" ' +
                    'bgcolor="#eeeeee" ' +
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
        </c:when>
        <c:otherwise>
            This member has not yet competed in a rated match.
        </c:otherwise>                
        </c:choose>              
    </div>
    <!--End chartBox-->
</div>   

