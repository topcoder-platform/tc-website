<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Intro Event Component Payments</h2>
        <center>

<br>
<br>
<table>
	<c:forEach items="${completeContests}" var="contest">  
		<c:forEach items="${contest.prizes}" var="prize" varStatus="status">
			<tr>
				<td>
			   		<c:if test="${status.first }">
			   			<b>${contest.name}</b>
			   		</c:if>
			   	</td>
			   	<td>
			   		<c:choose>
			   			<c:when test="${prize.paid}"><font color="#FF0000"> paid</font></c:when>
			   			<c:otherwise><input type="checkbox" name="pay" value="${contest.id},${prize.place}"></c:otherwise>
			   		</c:choose>
			   	</td>
				<td> ${prize.place}	</td>
				<td> ${prize.amount} </td>
				<td> <tc-webtag:handle coderId="${prize.winnerId}" context='component'/> </td>
			</tr>
		</c:forEach>
   </c:forEach>
</table>       

<br>
<br>
Contests that are not yet completed:<br>
<table>
	<c:forEach items="${incompleteContests}" var="contest">  
       <tr>
       		<td>
           		${contest.name} (${contest.activeProjects } active projects <c:if test="${not contest.timeOver}">, time not over</c:if>)
           	</td>
        </tr>
   </c:forEach>
</table>       



        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
