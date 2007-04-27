<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>


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
<form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
    <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateIntroEventCompPayments"/>

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
			   			<c:when test="${not empty prize.paymentId}"><font color="#FF0000"><a href="${pacts:viewPayment(payment.id)}">paid</a></font>(view)</c:when>
			   			<c:when test="${empty prize.points}"><font color="#FF0000"> Vacant</font></c:when>
			   			<c:otherwise><input type="checkbox" name="pay" value="${contest.id}:${prize.place}:${prize.winnerId}:${prize.amount}"></c:otherwise>
			   		</c:choose>
			   	</td>
				<td> ${cf:ordinal(prize.place)} place	</td>
				<td>$ ${prize.amount} </td>
				<td> <c:if test="${not empty prize.winnerId}">
						<tc-webtag:handle coderId="${prize.winnerId}" context='component'/> 
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			&nbsp;
			</td>
		</tr>
   </c:forEach>
</table>       

<br>
<input type="submit" value="Generate Payments">
<br>
</form>   

<br>
<b>Contests that are not yet completed:</b><br>
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
