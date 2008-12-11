<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Marathon Competition Record Book"/>
</jsp:include>

<div style="float:right;"><A href="/longcontest/?module=Static&d1=stats&d2=recordbook_home">back to table of contents</A></div>
<span class="bodyText">

<c:set var="allTypes" value="${wst == 9 }" />

<tc-webtag:ifLink useLink="${allTypes}" text="Non-tournament" link="/longcontest/stats/?module=Recordbook&c=marathon_consecutive_rating_increases&amp;wst=8"/> |
<tc-webtag:ifLink useLink="${not allTypes}" text="All" link="/longcontest/stats/?module=Recordbook&c=marathon_consecutive_rating_increases&amp;wst=9"/> 
<br><br>
<strong>Record:</strong> Longest streak of matches which resulted in a rating increase.  If a competitor's rating does not change following a match, the streak ends.
<c:choose>
    <c:when test="${allTypes}">Both tournament and non-tournament rounds are included.
    </c:when>
    <c:otherwise>Only non tournament rounds are included.
    </c:otherwise>
</c:choose>

</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="6">Most Consecutive Marathon Rating Increases</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="100%">Coder</td>
        <td class="headerC" width="100px" nowrap>Consecutive<br>Rating<br>Increases</td>
        <td class="headerC" colspan="3">Duration</td>
    </tr>
</thead>
<tbody>
    <c:forEach items="${results}" var="row" varStatus="status">
       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
            <td class="valueC">${row.map['rank']}</td>
            <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>
            <td class="valueC" width="100px" nowrap="nowrap">
                <c:choose>
                    <c:when test="${row.map['is_current'] == 1 }">
                        <div style="float: left; width: 30px;">
                            &nbsp;
                        </div>
                        <div style="float: right; width: 30px;">                                    
                            <img src="/i/interface/emblem/andclimbing.png" alt="" align="absmiddle" onmouseover="popUp(this,'emblemPopup')" onMouseOut="popHide()" />
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div style="float: left; width: 30px;">
                            &nbsp;
                        </div>
                        <div style="float: right; width: 30px;">                                    
                            &nbsp;
                        </div>
                    </c:otherwise>                  
                </c:choose>
                ${row.map['length']}
        </td>
        <td class="valueR" nowrap="nowrap">
            <strong>${row.map['start_contest_name']}</strong><br>
            <fmt:formatDate value="${row.map['start_date']}" pattern="MM.dd.yy"/> 
        </td>
        <td class="valueC">-</td>
        <td class="valueR" nowrap="nowrap">
            <strong>${row.map['end_contest_name']}</strong><br>
            <fmt:formatDate value="${row.map['end_date']}" pattern="MM.dd.yy"/> 
        </td>
    </tr>
    </c:forEach>
</tbody>
</table>

<div class="popUp" id="emblemPopup"><div>And climbing</div></div>
        
</div>

</html>