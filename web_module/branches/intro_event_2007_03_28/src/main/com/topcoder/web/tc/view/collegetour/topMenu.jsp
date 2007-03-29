<%@ page contentType="text/html" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="EID" value="<%=Constants.COLLEGE_TOUR_EVENT_ID%>" />
<c:set var="eventId" value="<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>" />
ACTIVE = ${active }
<p align="center">
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
    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registration</A>
    |
    <a href="/tc?module=CollegeTourRegistrants&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registrants</A>
    |
    <% if (request.getAttribute(Constants.FORUM_ID) != null) {%>
    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>" message="Discuss"/>
    <% } %>
    <c:choose>
        <c:when test="${eventId==42}">
            | <A href="/tc?module=Static&d1=collegetour&d2=belgradeCompInfo">Component Information</A>
            | <a href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Results</A> 
            
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

</p>
