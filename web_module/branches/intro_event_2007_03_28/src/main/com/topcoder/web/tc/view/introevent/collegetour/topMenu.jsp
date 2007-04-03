<%@ page contentType="text/html" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="active" value="${param.active}" />

<p align="center">
<c:if test="${not empty algoEventId}" >
	<b>Algorithms:</b>
	<tc-webtag:ifLink useLink="${active=='algo_overview'}" text="Overview" link="/tc?module=IntroEventAlgoOverview&eid=${algoEventId}"/>
	<br>
	
</c:if>

<c:if test="${not empty compEventId}" >
	<b>Components:</b>
	<a href="/tc?module=IntroEventCompOverview&eid=${compEventId}">Overview</a>
	<br>
</c:if>

<c:if test="${not empty mainEvent.forumId}" >
	<tc-webtag:forumLink forumID="${mainEvent.forumId }" message="Discuss"/>
</c:if>
</p>
