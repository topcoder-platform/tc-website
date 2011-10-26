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

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
                <tr><td class="title" colspan="3">Marathon Matches</td></tr>
                
<c:choose>
<c:when test="${not empty row.map['rating']}" >
<c:set var="even" value="true"/>
                <tr class="${even? 'dark' : 'light'}">
                    <td class="valueC" colspan="2" style="border-top: none;">
                        <div class="ratingBox">
                        Rating:<br />
                        <tc-webtags:ratingColor rating='<%=rsc.getIntItem(0, "rating")%>'>
                            <rsc:item name="rating" set="<%=rsc%>" format="####"/>
                        </tc-webtags:ratingColor></div>
                     <br /><strong><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>">[competition history]</A></strong><br /><br /></td>
                    </td>
                    <td class="valueC" valign="top" rowspan="${inSchool? 17 : 16}" width="100%" style="border-left: 1px solid #999999; border-top: none;">
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
'<param name="movie" value="/flash/graphLoader.swf?competitionType=long&coderID=<rsc:item set="<%=rsc%>" name="coder_id"/>&myRating=<%=rsc.getIntItem(0, "rating")%>" /> ' +
'<param name="menu" value="true" /> ' +
'<param name="quality" value="high" /> ' +
'<param name="bgcolor" value="#eeeeee" /> ' +
'<embed src="/flash/graphLoader.swf?competitionType=long&coderID=<rsc:item set="<%=rsc%>" name="coder_id"/>&myRating=<%=rsc.getIntItem(0, "rating")%>" ' +
'menu="true"  ' +
'quality="high" ' +
'bgcolor="#eeeeee" ' +
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
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Percentile:</td>
                    <td class="valueR"><c:out value="${row.map['percentile']}" default="N/A"/></td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Rank:</td>
                    <td class="valueR" nowrap="nowrap">
                    <c:choose>
                        <c:when test="${empty row.map['rank']}" >not ranked</c:when>
                        <c:otherwise>${row.map['rank']} of ${row.map['num_ranked']} </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Country Rank:</td>
                    <td class="valueR" nowrap="nowrap">
                    <c:choose>
                        <c:when test="${empty row.map['country_rank']}" >not ranked</c:when>
                        <c:otherwise>${row.map['country_rank']} of ${row.map['num_country_ranked']} </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
                <c:if test="${inSchool}" >
                <c:set var="even" value="${not even}" />
                    <tr class="${even? 'dark' : 'light'}">
                        <td class="field">School Rank:</td>
                        <td class="valueR" nowrap="nowrap">
                        <c:choose>
                            <c:when test="${empty rowCoderData.map['school_name']}" >N/A</c:when>
                            <c:otherwise>${row.map['school_rank']} of ${row.map['num_school_ranked']} </c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
                </c:if>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Volatility:</td><td class="valueR">${row.map['vol']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Maximum Rating:</td><td class="valueR">${row.map['highest_rating']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Minimum Rating:</td><td class="valueR">${row.map['lowest_rating']}</td>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Best Rank:</td><td class="valueR">${row.map['best_rank']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Wins:</td><td class="valueR">${row.map['num_wins']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Top Five Finishes:</td><td class="valueR">${row.map['num_top_five']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Top Ten Finishes:</td><td class="valueR">${row.map['num_top_ten']}</td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Avg. Rank:</td><td class="valueR"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A" format="0.00"/></td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field" nowrap="nowrap">Avg. Num. Submissions:</td><td class="valueR"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A" format="0.00"/></td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Competitions:</td><td class="valueR"><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>"><rsc:item set="<%=rsc%>" name="num_competitions"/></A></td>
                </tr>
                <c:set var="even" value="${not even}" />
                <tr class="${even? 'dark' : 'light'}">
                    <td class="field">Most Recent Event:</td><td class="valueR" nowrap="nowrap">${row.map['last_round']}<br />
                                                <rsc:item name="last_round_date" set="<%=rsc%>" format="MM.dd.yy"/></td>
                </tr>
</c:when>
<c:otherwise>
                <tr class="dark">
                    <td class="valueC" colspan="2" style="border-top: none; padding: 20px;">
                     <strong><A HREF="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<rsc:item set="<%=rsc%>" name="coder_id"/>">[competition history]</A></strong></td>
                    </td>
                    <td class="valueC" valign="top" rowspan="7" width="100%" style="border-left: 1px solid #999999; border-top: none;">
                        <div style="margin: 80px;">
                            This member has not yet competed in a rated match.
                        </div>
                    </td>
                </tr>
                <tr class="light">
                    <td class="field">Best Rank:</td><td class="valueR">${row.map['best_rank']}</td>
                </tr>
                <tr class="dark">
                    <td class="field">Wins:</td><td class="valueR">${row.map['num_wins']}</td>
                </tr>
                <tr class="light">
                    <td class="field">Top Five Finishes:</td><td class="valueR">${row.map['num_top_five']}</td>
                </tr>
                <tr class="dark">
                    <td class="field">Top Ten Finishes:</td><td class="valueR">${row.map['num_top_ten']}</td>
                </tr>
                <tr class="light">
                    <td class="field">Avg. Rank:</td><td class="valueR"><rsc:item set="<%=rsc%>" name="avg_rank" ifNull="N/A" format="0.00"/></td>
                </tr>
                <tr class="dark">
                    <td class="field" nowrap="nowrap">Avg. Num. Submissions:</td><td class="valueR"><rsc:item set="<%=rsc%>" name="avg_submissions" ifNull="N/A" format="0.00"/></td>
                </tr>
</c:otherwise>                
</c:choose>                
                
</table>