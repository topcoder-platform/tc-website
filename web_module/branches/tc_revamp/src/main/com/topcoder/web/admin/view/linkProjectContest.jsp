<%@page contentType="text/xml;charset=utf-8"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<fmt:requestEncoding value="utf-8"/>



<taconite-root xml:space="preserve">
	<c:forEach items="${updatedProjects}" var="project">
	    <taconite-replace contextNodeID="ct${project.id}" parseInBrowser="true">
	    	<td id="ct${project.id}">
   				<c:forEach items="${project.contests }" var="contest" varStatus="status">	        				
   				    <input type="checkbox" name="rmv" value="${project.id}:${contest.id}"/>   				
   					${contest.name }
   					<c:if test="${not status.last }"><br/></c:if>
   				</c:forEach>
	    	</td>
	    </taconite-replace>
	</c:forEach>
</taconite-root>
 