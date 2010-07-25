<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page fragment is to be included to all pages from 2010 TCO WebSite application.
  - It defines the commonly used taglibs.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tco10" tagdir="/WEB-INF/tags/tco10" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<c:set var="SOFTWARE_SERVER_NAME" value="<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" scope="request"/>
<c:set var="SERVER_NAME" value="<%=ApplicationServer.SERVER_NAME%>" scope="request"/>
<c:set var="STUDIO_SERVER_NAME" value="<%=ApplicationServer.STUDIO_SERVER_NAME%>" scope="request"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" scope="request"/>
<c:set var="START_RANK" value="<%=DataAccessConstants.START_RANK%>"/>
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>"/>
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>"/>
<c:set var="NUMBER_RECORDS" value="<%=DataAccessConstants.NUMBER_RECORDS%>"/>
<c:set var="HANDLE" value="<%=Constants.HANDLE%>"/>
<c:set var="NUMBER_PAGE" value="<%=DataAccessConstants.NUMBER_PAGE%>" />
<c:set var="FULL_LIST" value="<%=AdvancersBase.FULL_LIST%>" />
<c:set var="EVENT_ID" value="<%=Constants.EVENT_ID%>" />
<c:set var="COMPLETE_KEY" value="<%=Constants.COMPLETE_KEY%>" />
<c:set var="USER_ID" value="<%=Constants.USER_ID%>" />
<c:set var="CONTEST_ID_KEY" value="<%=Constants.CONTEST_ID%>" />
<c:set var="sessionInfo" value="${requestScope.sessionInfo}" />