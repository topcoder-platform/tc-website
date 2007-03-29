<%@ page contentType="text/html" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="EID" value="<%=Constants.COLLEGE_TOUR_EVENT_ID%>" />
<c:set var="eventId" value="<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>" />
<c:set var="active" value="${param.active}" />
<c:set var="forumId" value="<%=request.getParameter(Constants.FORUM_ID)%>" />
FORUM_ID = ${forumId }
<p align="center">
	<c:choose>	
        <c:when test="${cteid==41}">
			<c:choose>
				<c:when test="${active=='overview'}">Overview</c:when>
				<c:otherwise>
				        <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarus">Overview</A>
				</c:otherwise>
			</c:choose>
		    |
			<c:choose>
				<c:when test="${active=='instructions'}">Instructions</c:when>
				<c:otherwise>
				        <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarusInstructions">Instructions</A>
				</c:otherwise>
			</c:choose>
		    |
        </c:when>
        <c:otherwise>
			<c:choose>
				<c:when test="${active=='overview'}">Overview</c:when>
				<c:otherwise>
				        <A href="/tc?module=CollegeTourOverview&amp;${EID}=${eventId}">Overview</A>
				</c:otherwise>
			</c:choose>
		    |
			<c:choose>
				<c:when test="${active=='instructions'}">Instructions</c:when>
				<c:otherwise>
				        <A href="/tc?module=CollegeTourInfo&amp;${EID}=${eventId}">Instructions</A>
				</c:otherwise>
			</c:choose>
		    |
    </c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${active=='registration'}">Registration</c:when>
		<c:otherwise>
		        <A href="/tc?module=CollegeTourViewReg&amp;${EID}=${eventId}">Registration</A>
		</c:otherwise>
	</c:choose>
    |
	<c:choose>
		<c:when test="${active=='registrants'}">Registrants</c:when>
		<c:otherwise>
		        <A href="/tc?module=CollegeTourRegistrants&amp;${EID}=${eventId}">Registrants</A>
		</c:otherwise>
	</c:choose>
    <c:if test="${not forumId='null'}" >
	    | <tc-webtag:forumLink forumID="${forumId }" message="Discuss"/> 
	</c:if>
	<c:choose>
        <c:when test="${eventId==42}">        
		|	<c:choose>
				<c:when test="${active=='compinfo'}">Component Information</c:when>
				<c:otherwise>
				        <A href="/tc?module=Static&d1=collegetour&d2=belgradeCompInfo">Component Information</A>
				</c:otherwise>
			</c:choose>
		|	<c:choose>
				<c:when test="${active=='results'}">Results</c:when>
				<c:otherwise>
				        <a href="/tc?module=CollegeTourCompResults&amp;${EID}=${eventId}">Results</A> 
				</c:otherwise>
			</c:choose>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</p>
