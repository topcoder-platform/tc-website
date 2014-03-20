<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag setups current request with various attributes which affect the rendering
  - of the current view. It must be included at the beginning of any page from 2010 TCO WebSite
  -
--%>
<%@ tag language="java" body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="title" required="false" type="java.lang.String" %>
<%@ attribute name="area" required="true" type="java.lang.String" %>
<%@ attribute name="menu" required="false" type="java.lang.String" %>
<%@ attribute name="subMenu" required="false" type="java.lang.String" %>

<c:set var="PAGE_TITLE" value="${title}" scope="request"/>
<c:set var="SITE_AREA" value="${area}" scope="request"/>
<c:set var="MENU" value="${menu}" scope="request"/>
<c:set var="SUB_MENU" value="${subMenu}" scope="request"/>
