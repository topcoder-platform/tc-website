<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders the HTML A elements for paginated data view.
  -
--%>
<%@ tag language="java" body-content="scriptless" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="previousAvailable" required="true" type="java.lang.Boolean" %>
<%@ attribute name="nextAvailable" required="true" type="java.lang.Boolean" %>

<c:choose>
    <c:when test="${requestScope.full}">&nbsp;</c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${previousAvailable}">
                <a href="javascript:previous();" class="button2">&lt;&lt; Prev</a>
            </c:when>
            <c:otherwise>
                <a href="javascript:;" class="button2 off">&lt;&lt; Prev</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${nextAvailable}">
                <a href="javascript:next();" class="button2">Next &gt;&gt;</a>
            </c:when>
            <c:otherwise>
                <a href="javascript:;" class="button2 off">Next &gt;&gt;</a>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
