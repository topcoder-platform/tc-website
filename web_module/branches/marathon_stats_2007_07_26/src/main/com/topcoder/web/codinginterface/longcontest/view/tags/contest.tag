<%@ attribute name="roundTypeId" required="true" type="java.lang.Integer" %>
<%@ attribute name="roundName" required="true"  %>
<%@ attribute name="contestName" required="true"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="rt" value="TEST" scope="request"/>

rt: <%= request.getAttribute("rt") %>
rn: <%= request.getAttribute("roundName") %>
<c:choose>
	<c:when test="${roundTypeId == 19}">${contestName} ${roundName}</c:when>
	<c:otherwise>${roundName}</c:otherwise>
</c:choose>
