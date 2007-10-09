<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<tac:taconiteRoot>
    <tac:replaceChildren contextNodeID="addedComponents" parseOnServer="true">
        <div id="addedComponents">
            <form name="f" action="${sessionInfo.servletPath}" method="post">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentConfirm"/>
                <tc-webtag:errorIterator id="err" name="actionError">
                    <font color="#FF0000"><%=err%></font><br/>
                </tc-webtag:errorIterator>
                <c:choose>
                    <c:when test="${fn:length(ea_assignment.components)==0}">
                        <span class="bigRed">You don't have components assigned.</span><br/><br/>
                    </c:when>
                    <c:otherwise>
                        <strong>Assigned problems</strong><br/>
                        <table border="1"> 
                        <tr><td>Name</td><td>Points</td><td><![CDATA["&nbsp;"]]></td></tr>
                        <c:forEach items="${ea_assignment.components}" var="component">
                            <tr><td><c:out value="${component.problemName}"/></td>
                            <td><tc-webtag:textInput name="points_${component.componentId}" value="${component.points}" size="5" editable="true" /></td>
                            <td><a href="javascript:removeComponent(${component.componentId});">Remove</a></td></tr>
                        </c:forEach>
                        </table>
                        
                        Note: if you leave points field empty, problem's default points will be used.
                    </c:otherwise>
                </c:choose>
                <br/>
                <p>
                    <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
                </p>
            </form>            
        </div>
    </tac:replaceChildren>
</tac:taconiteRoot>
