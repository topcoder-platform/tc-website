<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<tac:taconiteRoot>
    <tac:replaceChildren contextNodeID="results" parseOnServer="true">
        <div id="addedComponents">
            <tc-webtag:errorIterator id="err" name="actionError">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
            <c:choose>
                <c:when test="${fn:length(assignment.components)==0}">
                    <span class="bigRed">You don't have components assigned.</span><br/><br/>
                </c:when>
                <c:otherwise>
                    <strong>Assigned components</strong><br/>
                    <table>
                    <tr><td>Id</td><td>&nbsp;</td></tr>
                    <c:forEach items="${assignment.components}" var="component">
                        <tr><td><c:out value="${component}"/></td>
                        <td><A href="javascript:removeComponent(${component});">Remove</A></td></tr>
                    </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </tac:replaceChildren>
</tac:taconiteRoot>
