<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.WebConstants" %>

<c:set value="<%=ApplicationServer.DISTRIBUTED_UI_SERVER_NAME%>" var="serverName"/>

<c:import url="http://${serverName}/distui/">
    <c:param name="<%=WebConstants.MODULE_KEY%>" value="LeftNav"/>
    <c:param name="node" value="${param['node']}"/>
</c:import>

