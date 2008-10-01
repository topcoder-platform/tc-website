<%@ tag body-content="empty" %>
<%@ tag description="This tag translates a catalog name to an icon representation" %>
<%@ attribute name="catalogName" required="true" type="java.lang.String"%>
<%@ attribute name="aolBrand" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${aolBrand}"><img src="/i/development/smAOL.gif" alt="AOL" /></c:when>
    <c:when test="${catalogName == 'Java'}"><img src="/i/development/smJava.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Java Custom'}"><img src="/i/development/smJavaCustom.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == '.NET'}"><img src="/i/development/netSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == '.NET Custom'}"><img src="/i/development/smNetCustom.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Flash'}"><img src="/i/development/flashSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'C++'}"><img src="/i/development/smCpp.png" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Application'}"><img src="/i/development/smApp.gif" alt="${catalogName}" /></c:when>
    <c:otherwise>${catalogName}</c:otherwise>
</c:choose>
