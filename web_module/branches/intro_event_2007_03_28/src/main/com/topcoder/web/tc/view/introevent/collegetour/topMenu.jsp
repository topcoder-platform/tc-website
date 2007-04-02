<%@ page contentType="text/html" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<p align="center">
<c:if test="${not empty algoEventId}" >
	<b>Algorithms</b>
	<a href="/tc?module=IntroEventAlgoOverview&eid=${eid}">Overview</a>
	
	<br>
	
</c:if>

<c:if test="${not empty compEventId}" >
	<br>
</c:if>

<c:if test="${not empty mainEvent.forumId}" >
	<tc-webtag:forumLink forumID="${mainEvent.forumId }" message="Discuss"/>
</c:if>
</p>
