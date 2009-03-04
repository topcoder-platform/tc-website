<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>

<c:set value="<%=request.getParameter("phase_id")%>" var="phaseId"/>
<c:set value="<%=request.getParameter("add_title_tag")%>" var="addTitleTag"/>
<c:set value="<%=request.getParameter("close_title_tag")%>" var="closeTitleTag"/>

<c:set var="mainTab" value="online" />
<c:set var="tertiaryNav" value="leaderboard" />

<c:choose>
  <c:when test="${phaseId == Constants.ARCHITECTURE_PHASE_ID}">
      <c:set  var="secondaryTab" value="architecture" />
      <c:set  var="title" value="Architecture Competition" />
  </c:when>
  <c:when test="${phaseId == Constants.ASSEMBLY_PHASE_ID}">
      <c:set var="secondaryTab" value="assembly" />
      <c:set var="title" value="Assembly Competition" />
  </c:when>
  <c:when test="${phaseId == Constants.DESIGN_PHASE_ID}">
      <c:set var="secondaryTab" value="design" />
      <c:set var="title" value="Component Design Competition" />
  </c:when>
  <c:when test="${phaseId == Constants.DEVELOPMENT_PHASE_ID}">
      <c:set var="secondaryTab" value="development" />
      <c:set var="title" value="Component Development Competition" />
  </c:when>
  <c:when test="${phaseId == Constants.SPECIFICATION_PHASE_ID}">
      <c:set var="secondaryTab" value="specification" />
      <c:set var="title" value="Specification Competition" />
  </c:when>
  <c:when test="${phaseId == Constants.ALGORITHM_QUALIFICATION_PHASE_ID}">
      <c:set var="mainTab" value="algorithm" />
      <c:set var="secondaryTab" value="advancers" />
      <c:set var="tertiaryNav" value="qualification" />
      <c:set var="title" value="Algorithm Competition" />
  </c:when>
</c:choose>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>TCO 09 : Online Competitions</title>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <!-- External CSS -->
        <link type="text/css" rel="stylesheet" href="/css/tournaments/tco09_coders.css"/>
        <link rel="stylesheet" href="/css/tournaments/tco09.css" media="all" type="text/css" />
        <!--[if IE 6]>
        <link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
        <![endif]-->

        <!-- External JavaScripts -->
        <script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
        <script type="text/javascript" src="/js/arena.js"></script>
        <style type="text/css">
            <!--
            .style2 {color: #FF0000}
            -->
        </style>
    </head>
    <body id="page">
        <div id="wrapper">
            <div id="wrapperInner">
                <div id="wrapperContent">
                    <div id="wrapperContentInner">
                        <jsp:include page="header.jsp"/>
                        <jsp:include page="mainNav.jsp" >
                            <jsp:param name="mainTab" value="${mainTab}"/>
                        </jsp:include>
                        <div id="content">
                            <div class="contentTopLeft">
                                <div class="contentTopRight">
                                    <div class="contentTopInner"></div>
                                </div>
                            </div>
                            <div id="contentInner" class="contentInner">
                                <div id="contentInnerInner">
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            <jsp:include page="secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="${mainTab}"/>
                                                <jsp:param name="secondaryTab" value="${secondaryTab}"/>
                                            </jsp:include>
                                            <jsp:include page="tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="${mainTab}"/>
                                                <jsp:param name="secondaryTab" value="${secondaryTab}"/>
                                                <jsp:param name="tertiaryTab" value="${tertiaryNav}"/>
                                            </jsp:include>
                                            <div class="bottomAreaContent">             
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <c:if test="${addTitleTag == true}">
                                                                    <h2 class="title"><c:out value="${title}"/>
                                                                    <c:if test="${closeTitleTag == true}">
                                                                        </h2>
                                                                    </c:if>
                                                                </c:if>
                                                            