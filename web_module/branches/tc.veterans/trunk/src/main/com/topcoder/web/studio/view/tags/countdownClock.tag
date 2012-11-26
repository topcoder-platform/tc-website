<%--
  - Author: pulky, duxiaoyang
  - Version: 1.1
  - Since: BUGR-1829
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a custom tag to show active contests countdown clock.
  -
  - Required attributes:
  -     * end: the date the contest ends
  -     * mode: short or long
  - Optional attribute:
  -     * start: the date the contest starts, if not given, current time will be used
  -
  - Version 1.1 (TopCoder Studio Contest Listings) change notes: added start attribute.
--%>

<%@ tag import="java.sql.Timestamp" %>
<%@ tag body-content="empty" %>

<%@ attribute name="begin" required="false" type="java.sql.Timestamp" %>
<%@ attribute name="end" required="true" type="java.sql.Timestamp" %>
<%@ attribute name="mode" required="true" type="java.lang.String" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${begin eq null}">
<c:set var="begin" value="<%=new Timestamp(System.currentTimeMillis())%>"/>
</c:if>
<c:set var="minutes" value="${((end.time - begin.time) - ((end.time - begin.time) % 300000)) / 60000}"/>
<c:set var="hours" value="${((minutes) - ((minutes) % 60)) / 60}"/>
<c:set var="days" value="${((hours) - ((hours) % 24)) / 24}"/>

<c:set var="minutes" value="${minutes - hours * 60}"/>
<c:set var="hours" value="${hours - days * 24}"/>

<c:set var="minDesc" value="minute"/>
<c:if test="${mode == 'short'}">
    <c:set var="minDesc" value="min"/>
</c:if>

<c:set var="divClass" value="softRed"/>
<c:if test="${days == 0 && hours < 12}">
    <c:set var="divClass" value="strongRed"/>
</c:if>


<div class="${divClass}">
<c:choose>
    <c:when test="${days == 1}">
        1 day
    </c:when>
    <c:when test="${days > 1}">
        <fmt:formatNumber value="${days}" maxFractionDigits="0"/> days
    </c:when>
    <c:otherwise>
        
        <c:choose>
            <c:when test="${hours > 0}">
                <c:choose>
                    <c:when test="${hours == 1}">
                        1 hour
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${hours}" maxFractionDigits="0"/> hours 
                    </c:otherwise>
                </c:choose>
                <c:if test="${mode == 'short'}">
                    <br/>    
                </c:if>
                <c:choose>
                    <c:when test="${minutes == 1}">
                        1 ${minDesc}
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${minutes}" maxFractionDigits="0"/> ${minDesc}s
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${minutes > 0}">
                        <fmt:formatNumber value="${minutes}" maxFractionDigits="0"/> ${minDesc}s
                    </c:when>
                    <c:otherwise>
                        < 5 ${minDesc}s
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
</div>