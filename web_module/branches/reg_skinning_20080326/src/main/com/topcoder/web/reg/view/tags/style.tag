<%@ tag import="com.topcoder.web.common.model.RegistrationType" %>
<%@ tag import="com.topcoder.web.reg.Constants" %>
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=RegistrationType.TC_DIRECT_ID%>" var="direct"/>
<c:set value="<%=Constants.REG_TYPES%>" var="regTypes"/>
<c:choose>
    <c:when test="${cf:contains(requestScope[regTypes], direct)}">
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="cockpit_reg"/>
        </jsp:include>
    </c:when>
    <c:otherwise>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </c:otherwise>
</c:choose>


