<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows project details for assembly competitions.
  - 
  - Version 1.1 (BUGR-2979) changes:
  -    * Removed Requirements Specification section if existed.
  -    * Renamed the existing "Documentation" section to "Forum". Changed attached wording.
  -    * Added support for multiple documentation downloads.
--%>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail");%>
<% ResultSetContainer technologies = (ResultSetContainer) request.getAttribute("technologies");%>
<% String projectId = (String) request.getAttribute("projectId");
   // whether to hide certain sections based on project id
   boolean hide = projectId.equals("30014419") || projectId.equals("30014961");

%>
<head>
<title>TopCoder Assembly Competitions</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>
<%
        String redirectURL = "http://www.topcoder.com/challenge-details/";
        String projectId = request.getParameter("pj");
        response.sendRedirect(redirectURL + projectId);
    %>

</body>

</html>

