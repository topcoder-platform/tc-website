<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="roundTypeId" required="true" type="java.lang.Integer" %>
<%@ attribute name="roundName" required="true"  %>
<%@ attribute name="contestName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="?module=ViewStandings&rd="${roundId}" class="bcLink">
<c:choose>
	<c:when test="${roundTypeId == 19}">${contestName} ${roundName}</c:when>
	<c:otherwise>${roundName}</c:otherwise>
</c:choose>
</a>
