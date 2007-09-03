<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="problemId" required="true"%>
<%@ attribute name="problemName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>
<%@ attribute name="isLink" required="false" type="java.lang.Boolean" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
<c:when test="${isLink or empty isLink}">
<a href="/longcontest/?module=ViewProblemStatement&amp;rd=${roundId}&amp;pm=${problemId}" class='${empty styleClass? "bcLink" : styleClass } '>
    ${problemName }
</a>
</c:when>
<c:otherwise>
    ${problemName }
</c:otherwise>
</c:choose>

