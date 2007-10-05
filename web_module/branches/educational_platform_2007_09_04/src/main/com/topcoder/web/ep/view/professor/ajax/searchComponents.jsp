<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<tac:taconiteRoot>
    <tac:replaceChildren contextNodeID="results" parseOnServer="true">
        <div id="results">
            <c:choose>
                <c:when test="${fn:length(results)==0}">
                    <span class="bigRed">Your search returned no records.</span><br/><br/>
                </c:when>
                <c:otherwise>
                    <strong>Results</strong><br/>
                    Lists includes only up to the first <strong><%=Constants.MAX_COMPONENT_RESULTS%></strong> components. 
                    <br/><br/>
                    Please <strong>select</strong> components from list below.<br />
                    <span id="submitMessage"></span><br/>
                    <span class="small">
                        <c:forEach items="${results}" var="result">
                            <c:out value="${result.problem.name}"/><br/>
                            <A class="small" href="javascript:addComponent(${result.id});">Add</A>
                            <br/><br/>
                        </c:forEach>
                    </span>
                </c:otherwise>
            </c:choose>
        </div>
    </tac:replaceChildren>
</tac:taconiteRoot>
