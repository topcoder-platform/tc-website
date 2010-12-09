<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders the status for the round result for single coder.
  -
--%>
<%@ tag language="java" body-content="scriptless" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="roundId" required="true" type="java.lang.String" %>
<%@ attribute name="roundResult" required="true" type="java.lang.String" %>
<%@ attribute name="prevRoundResult" required="true" type="java.lang.String" %>
<%@ attribute name="index" required="true" type="java.lang.Integer" %>

<c:choose>
    <c:when test="${empty roundId}">&nbsp;</c:when>
    <c:when test="${not empty roundResult}">
        <c:choose>
            <c:when test="${fn:trim(roundResult) eq 'Champion'}">
                <img src="/i/tournament/tco10/prize.gif"/>
            </c:when>
            <c:when test="${index mod 2 == 0}">
                <img src="/i/tournament/tco10/${fn:trim(fn:toLowerCase(roundResult))}_odd_ico.png" alt="${roundResult}"/>
            </c:when>
            <c:otherwise>
                <img src="/i/tournament/tco10/${fn:trim(fn:toLowerCase(roundResult))}_even_ico.png" alt="${roundResult}"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${empty prevRoundResult or (prevRoundResult eq 'Eliminated')}">&nbsp;</c:when>
    <c:otherwise>
        <img src="/i/tournament/tco10/not_compete_ico.png" alt="Did not compete"/>
    </c:otherwise>
</c:choose>
