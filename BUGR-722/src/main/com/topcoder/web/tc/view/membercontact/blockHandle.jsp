<%@ page import="com.topcoder.web.tc.controller.request.membercontact.BlockHandle" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tac:taconiteRoot>

<c:set value="<%=BlockHandle.ID%>" var="id"/>
<c:choose>

    <c:when test="${cf:containsMapKey(requestScope, id)}" >
       <tac:replaceChildren contextNodeID="blockHandleResult" parseOnServer="true">
	       <div>
            <input type="hidden" name="handleFound" id="handleFound" value="true" />
            <input type="hidden" name="blockId" id="blockId" value='<c:out value="${requestScope.id}" />' />
            <input type="hidden" name="blockHandle" id="blockHandle" value='<c:out value="${requestScope.handle}" />' />            
            </div>
        </tac:replaceChildren>
    </c:when>
    <c:otherwise>
        <tac:replaceChildren contextNodeID="blockHandleResult" parseOnServer="true">
            <div style="font-weight:bold;color:red;">
               User not found.
                <input type="hidden" name="handleFound" id="handleFound" value="false" />
            </div>
            
        </tac:replaceChildren>
    </c:otherwise>
</c:choose>

</tac:taconiteRoot>