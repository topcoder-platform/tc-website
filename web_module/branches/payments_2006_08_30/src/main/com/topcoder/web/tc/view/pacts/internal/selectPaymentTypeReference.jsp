<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tac:taconiteRoot>

<c:choose>
    <c:when test="${request.payment_type_id > 4}">
        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
                <div>test!</div>
        </tac:replaceChildren>
    </c:when>
    <c:otherwise>
        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
                <div>test2!</div>
        </tac:replaceChildren>
    </c:otherwise>
</c:choose>

</tac:taconiteRoot>