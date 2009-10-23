<%--
  - Author: pulky
  - Version: 1.0
  - Since: Studio Submission Viewer Upgrade Integration v1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a custom tag to handle pagination for the view submissions page.
  -
  - Required attributes:
  -     * baseUrl: the base url for building the links included in this tag.
  -     * itemsNumber: the total items to be paginated.
  -     * pageNumber: the current page number.
  -     * pageSize: the current size of the page.
  -
  - Note: this tag will get page number and page size from the request.
--%>

<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag body-content="empty" %>

<%@ attribute name="baseUrl" required="true" type="java.lang.String" %>
<%@ attribute name="itemsNumber" required="true" type="java.lang.Integer" %>
<%@ attribute name="pageNumber" required="true" type="java.lang.Integer" %>
<%@ attribute name="pageSize" required="true" type="java.lang.Integer" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="PAGE_NUMBER" value="<%=Constants.PAGE_NUMBER_KEY%>"/>
<c:set var="PAGE_SIZE" value="<%=Constants.PAGE_SIZE_KEY%>"/>

<%-- First thing is to process parameters so that the pagination and thumbnails can be rendered afterwards --%>
<c:set var="fullSize" value="false"/>
<c:if test="${pageSize == 0}">
    <c:set var="fullSize" value="true"/>
    <c:set var="pageSize" value="${itemsNumber}"/>
    <c:set var="pageNumber" value="1"/>
</c:if>

<%-- This integer division had to be done using the reminder since fmt:parseNumber was failing under Chrome. --%>
<c:choose>
    <c:when test="${itemsNumber % pageSize == 0}">
        <c:set var="totalPages" value="${itemsNumber / pageSize}"/>
    </c:when>
    <c:otherwise>
        <c:set var="totalPages" value="${(itemsNumber - (itemsNumber % pageSize)) / pageSize + 1}"/>
    </c:otherwise>
</c:choose>

<c:set var="startRank" value="${(pageNumber - 1) * pageSize + 1}"/>

<c:choose>
    <c:when test="${pageNumber * pageSize > itemsNumber}">
        <c:set var="endRank" value="${itemsNumber}"/>
    </c:when>
    <c:otherwise>
        <c:set var="endRank" value="${pageNumber * pageSize}"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${pageNumber <= 3}">
        <c:set var="pageStart" value="${1}"/>
    </c:when>
    <c:when test="${totalPages > 5 && totalPages - pageNumber < 3}">
        <c:set var="pageStart" value="${totalPages - 4}"/>
    </c:when>
    <c:otherwise>
        <c:set var="pageStart" value="${pageNumber - 2}"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${totalPages - pageNumber < 3}">
        <c:set var="pageEnd" value="${totalPages}"/>
    </c:when>
    <c:when test="${totalPages > 5 && pageNumber < 3}">
        <c:set var="pageEnd" value="${5}"/>
    </c:when>
    <c:otherwise>
        <c:set var="pageEnd" value="${pageNumber + 2}"/>
    </c:otherwise>
</c:choose>

<%-- Now that all parameters are cleared, render paging box and page thumbnails --%>

<div class="pagingBox">
    <div class="pageNav">
        <span>
            Pages:&nbsp;&nbsp;
        </span>
        <ul>
            <c:choose>
                <c:when test="${pageNumber > 1}">
                    <li>
                        <a href="${baseUrl}&amp;${PAGE_NUMBER}=${pageNumber-1}&amp;${PAGE_SIZE}=${pageSize}">
                            &lt;&lt;
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        &nbsp;
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${pageStart}" end="${pageEnd}" step="${1}" var="i">
                <li>
                    <c:choose>
                        <c:when test="${i == pageNumber}">
                            <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER}=${i}&amp;${PAGE_SIZE}=${pageSize}">
                                ${i}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${baseUrl}&amp;${PAGE_NUMBER}=${i}&amp;${PAGE_SIZE}=${pageSize}">
                                ${i}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>
            <c:choose>
                <c:when test="${pageNumber < totalPages}">
                    <li>
                        <a href="${baseUrl}&amp;${PAGE_NUMBER}=${pageNumber+1}&amp;${PAGE_SIZE}=${pageSize}">
                            &gt;&gt;
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        &nbsp;
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
        <span>
            (${startRank}-${endRank} of ${itemsNumber} Submissions)
        </span>
    </div>
    <div class="pageThumbnails">
        <span>
            Thumbnails per page:&nbsp;&nbsp;
        </span>
        <ul>
            <c:forEach begin="12" end="48" step="12" var="i">
                <li>
                    <c:choose>
                        <c:when test="${i == pageSize}">
                            <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER}=1&amp;${PAGE_SIZE}=${i}">
                                ${i}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${baseUrl}&amp;${PAGE_NUMBER}=1&amp;${PAGE_SIZE}=${i}">
                                ${i}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>
            <li>
                <c:choose>
                    <c:when test="${fullSize}">
                        <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER}=1&amp;${PAGE_SIZE}=0">
                            All
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${baseUrl}&amp;${PAGE_NUMBER}=1&amp;${PAGE_SIZE}=0">
                            All
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</div>
