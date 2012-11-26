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
<tc-webtag:ifLink useLink="${mp != 5}" text="Top 5" link="/longcontest/stats/?module=Recordbook&c=marathon_most_top_finishes&mp=5"/> |
<tc-webtag:ifLink useLink="${mp != 10}" text="Top 10" link="/longcontest/stats/?module=Recordbook&c=marathon_most_top_finishes&mp=10"/> 


<br><br>
<strong>Record:</strong> Most career matches where a competitor finished in the top ${mp }.  Only contests where the competitor was rated are included.

</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="3">Most top ${mp} placed</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="100%">Coder</td>
        <td class="headerC">Top ${mp} Finishes</td>
    </tr>
</thead>
<tbody>
    <c:forEach items="${results}" var="row" varStatus="status">
       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
            <td class="valueC">${row.map['rank']}</td>
            <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>
            <td class="valueR" >${row.map['num_finishes'] }</td>
    </tr>
    </c:forEach>
</tbody>
</table>

        
</div>

</html>