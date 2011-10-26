<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<html>
<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Marathon Competition Record Book"/>
</jsp:include>

<div style="float:right;"><A href="/longcontest/?module=Static&d1=stats&d2=recordbook_home">back to table of contents</A></div>
<span class="bodyText">


<br><br>
<strong>Record:</strong> The competitors who have achieved the highest ratings based on the results of their first match.
</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="5">Impressive Debuts</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header">Coder</td>
        <td class="headerC">Initial Rating</td>
        <td class="headerC">Round</td>
        <td class="headerC">Date</td>
    </tr>
</thead>
<tbody>
    <c:forEach items="${results}" var="row" varStatus="status">
       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
            <td class="valueC">${row.map['rank']}</td>
            <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>
            <td class="valueC" >${row.map['new_rating'] }</td>            
            <td class="value" nowrap="nowrap">
                    <mm:contest roundTypeId="${row.map['round_type_id']}" contestName="${row.map['contest_name']}" roundName="${row.map['round_name']}" />                            
             </td>
            <td class="valueC" ><fmt:formatDate value="${row.map['date']}" pattern="MM/dd/yyyy"/> </td>
    </tr>
    </c:forEach>
</tbody>
</table>

        
</div>

</html>