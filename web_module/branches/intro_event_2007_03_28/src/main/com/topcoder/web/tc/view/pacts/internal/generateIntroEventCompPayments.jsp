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
       <tr>
       		<td>
           		${contest.name}
           	</td>
        </tr>
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
