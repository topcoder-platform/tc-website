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


<tc-webtag:ifLink useLink="${allTypes}" text="Non-tournament" link="/longcontest/stats/?module=Recordbook&c=marathon_most_wins"/> |
<tc-webtag:ifLink useLink="${not allTypes}" text="All" link="/longcontest/stats/?module=Recordbook&c=marathon_most_wins&amp;all=true"/> 
<br><br>
<strong>Record:</strong> Most times a competitor has won a match.  A tie for first place is considered a win.
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
    <tr><td class="title" colspan="3">Most Wins</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="100%">Coder</td>
        <td class="headerC">Wins</td>
    </tr>
</thead>
<tbody>
    <c:forEach items="${results}" var="row" varStatus="status">
       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
            <td class="valueC">${row.map['rank']}</td>
            <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>
            <td class="valueR" >${row.map['num_wins'] }</td>
    </tr>
    </c:forEach>
</tbody>
</table>

<div class="popUp" id="emblemPopup"><div>And climbing</div></div>
        
</div>

</html>