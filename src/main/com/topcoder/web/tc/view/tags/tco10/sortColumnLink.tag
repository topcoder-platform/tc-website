<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders the HTML A element providing the header for sortable table column.
  -
--%>
<%@ tag language="java" body-content="scriptless" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ attribute name="text" required="true" type="java.lang.String" %>
<%@ attribute name="columnIndex" required="true" type="java.lang.Integer" %>

<a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${columnIndex}"/>">
   <c:out value="${text}"/></a>

