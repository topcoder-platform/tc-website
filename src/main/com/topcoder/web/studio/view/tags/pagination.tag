<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag body-content="empty" %>

<%@ attribute name="baseUrl" required="true" type="java.lang.String" %>
<%@ attribute name="itemsNumber" required="true" type="java.lang.Integer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="PAGE_NUMBER_KEY" value="<%=Constants.PAGE_NUMBER_KEY%>"/>
<c:set var="PAGE_SIZE_KEY" value="<%=Constants.PAGE_SIZE_KEY%>"/>
<c:set var="pageNumber" value="${requestScope[PAGE_NUMBER_KEY]}" />
<c:set var="pageSize" value="${requestScope[PAGE_SIZE_KEY]}" />

<c:if test="${pageSize == 0}">
    <c:set var="pageSize" value="${itemsNumber}"/>
    <c:set var="pageNumber" value="1"/>
</c:if>

<c:choose>
    <c:when test="${itemsNumber % pageSize == 0}">
        <fmt:parseNumber var="totalPages" value="${itemsNumber / pageSize}" integerOnly="true"/>
    </c:when>
    <c:otherwise>
        <fmt:parseNumber var="totalPages" value="${itemsNumber / pageSize + 1}" integerOnly="true"/>
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

<div class="pagingBox">
    <div class="pageNav">
        <span>Pages:&nbsp;&nbsp;</span>
        <ul>
            <c:choose>
                <c:when test="${pageNumber > 1}">
                    <li><a href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber-1}&amp;${PAGE_SIZE_KEY}=${pageSize}">&lt;&lt;</a></li>
                </c:when>
                <c:otherwise>
                    <li>&nbsp;</li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${pageStart}" end="${pageEnd}" step="${1}" var="i"> 
                <li>
                    <c:choose>
                        <c:when test="${i == pageNumber}">
                            <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${i}&amp;${PAGE_SIZE_KEY}=${pageSize}">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${i}&amp;${PAGE_SIZE_KEY}=${pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>
            <c:choose>
                <c:when test="${pageNumber < totalPages}">
                    <li><a href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber+1}&amp;${PAGE_SIZE_KEY}=${pageSize}">&gt;&gt;</a></li>
                </c:when>
                <c:otherwise>
                    <li>&nbsp;</li>
                </c:otherwise>
            </c:choose>
        </ul>
        <span>(${startRank}-${endRank} of ${itemsNumber} Submissions)</span>
    </div>
    <div class="pageThumbnails">
        <span>Thumbnails per page:&nbsp;&nbsp;</span>
        <ul>
            <c:forEach begin="12" end="48" step="12" var="i"> 
                <li>
                    <c:choose>
                        <c:when test="${i == pageSize && totalPages >= 2}">
                            <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber}&amp;${PAGE_SIZE_KEY}=${i}">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber}&amp;${PAGE_SIZE_KEY}=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>
            <li>
                <c:choose>
                    <c:when test="${totalPages < 2}">
                        <a class="active" href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber}&amp;${PAGE_SIZE_KEY}=0">All</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${baseUrl}&amp;${PAGE_NUMBER_KEY}=${pageNumber}&amp;${PAGE_SIZE_KEY}=0">All</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</div><!-- .pagingBox block ends -->