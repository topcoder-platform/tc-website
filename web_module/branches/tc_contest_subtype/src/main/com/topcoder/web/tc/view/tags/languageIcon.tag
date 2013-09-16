<%@ tag body-content="empty" %>
<%@ tag description="This tag translates a catalog name to an icon representation" %>
<%@ attribute name="catalogName" required="true" type="java.lang.String"%>
<%@ attribute name="aolBrand" type="java.lang.Boolean" %>
<%@ attribute name="paypalBrand" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${paypalBrand}"><img src="/i/development/smPayPalX.gif" alt="PayPal X" /></c:when>
    <c:when test="${aolBrand}"><img src="/i/development/smAOL.gif" alt="AOL" /></c:when>
    <c:when test="${catalogName == 'Java'}"><img src="/i/development/smJava.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Java Custom'}"><img src="/i/development/smJavaCustom.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == '.NET'}"><img src="/i/development/netSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == '.NET Custom'}"><img src="/i/development/smNetCustom.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Flash'}"><img src="/i/development/flashSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Flash Custom'}"><img src="/i/development/flashCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'C++'}"><img src="/i/development/smCpp.png" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'C++ Custom'}"><img src="/i/development/smCustomCpp.png" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Application'}"><img src="/i/development/smApp.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Action Script'}"><img src="/i/development/actionScriptSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Action Script Custom'}"><img src="/i/development/actionScriptCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'PHP'}"><img src="/i/development/phpSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'PHP Custom'}"><img src="/i/development/phpCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Ruby'}"><img src="/i/development/rubySm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Ruby Custom'}"><img src="/i/development/rubyCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Objective C'}"><img src="/i/development/objectivecSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Objective C Custom'}"><img src="/i/development/objectivecCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Flex'}"><img src="/i/development/flexSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Flex Custom'}"><img src="/i/development/flexCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Javascript'}"><img src="/i/development/javascriptSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Javascript Custom'}"><img src="/i/development/javascriptCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Python'}"><img src="/i/development/pythonSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Python Custom'}"><img src="/i/development/pythonCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Other'}"><img src="/i/development/otherSm.gif" alt="${catalogName}" /></c:when>
    <c:when test="${catalogName == 'Other Custom'}"><img src="/i/development/otherCustomSm.gif" alt="${catalogName}" /></c:when>
    <c:otherwise>${catalogName}</c:otherwise>
</c:choose>
