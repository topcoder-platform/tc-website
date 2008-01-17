<%@ attribute name="roundTypeId" required="true" type="java.lang.Integer" %>
<%@ attribute name="roundName" required="true"  %>
<%@ attribute name="contestName" required="true"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="rt" value="${roundTypeId}" scope="request"/>
<c:set var="rn" value="${roundName}" scope="request"/>
<c:set var="cn" value="${contestName}" scope="request"/>

<%= com.topcoder.web.codinginterface.longcontest.Helper.displayName(((Integer) request.getAttribute("rt")).intValue(), (String) request.getAttribute("cn"), (String) request.getAttribute("rn")) %>
