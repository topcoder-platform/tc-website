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


<br><br>
<strong>Record:</strong> Best average placement per match.  A lower average is better.  
Only matches where the competitor was rated are included.  Coders with less than 5 rated matches are not included.

</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="4">Best Average Placement</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header">Coder</td>
        <td class="headerC">Events</td>
        <td class="headerC">Avg. Placed</td>
    </tr>
</thead>
<tbody>
    <c:forEach items="${results}" var="row" varStatus="status">
       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
            <td class="valueC">${row.map['rank']}</td>
            <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>
            <td class="valueR">${row.map['events'] }</td>
            <td class="valueR"><fmt:formatNumber value="${row.map['average']}" minFractionDigits="2" maxFractionDigits="2"/></td> 
    </tr>
    </c:forEach>
</tbody>
</table>

        
</div>

</html>
