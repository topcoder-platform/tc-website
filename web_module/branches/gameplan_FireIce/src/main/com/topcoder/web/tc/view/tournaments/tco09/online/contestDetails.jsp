<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows the consolidated leaderboard for the corresponding track type.
 * This same JSP is used for all project-based leaderboard pages. Project type is used to adapt
 * content for each track.
 *
 * Version 1.1 (2009 TopCoder Open Site Integration 1.1) changes: page content was implemented.
 *
 * Version 1.2 (2009 TopCoder Open Site Integration 1.1.1) changes: removed table header.
 *
 * Author TCSDEVELOPER
 * Version 1.2
 * Since 2009 TopCoder Open Site Integration
--%>

<%@ page language="java" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%-- Setting up constants to use JSTL --%>
<c:set var="contestDetails" value="${resultMap['contest_details']}"/>
<c:set var="contestDetailsRow" value="${contestDetails[0]}"/>
<c:set var="projectType" value="${contestDetailsRow.map['project_category_id']}"/>
<c:set var="DESIGN_PROJECT_TYPE" value="<%=Constants.DESIGN_PROJECT_TYPE%>"/>
<c:set var="DEVELOPMENT_PROJECT_TYPE" value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>"/>
<c:set var="ARCHITECTURE_PROJECT_TYPE" value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>"/>
<c:set var="ASSEMBLY_PROJECT_TYPE" value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>"/>
<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>"/>
<c:set var="incompleteProjects" value="false"/>

<c:choose>
    <c:when test="${projectType == DESIGN_PROJECT_TYPE}">
        <c:set var="tab" value="design"/>
        <c:set var="projectDesc" value="Design"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE}">
        <c:set var="tab" value="development"/>
        <c:set var="projectDesc" value="Development"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE}">
        <c:set var="tab" value="architecture"/>
        <c:set var="projectDesc" value="Architecture"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE}">
        <c:set var="tab" value="assembly"/>
        <c:set var="projectDesc" value="Assembly"/>
    </c:when>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="tab" value="specification"/>
        <c:set var="projectDesc" value="Specification"/>
    </c:when>
</c:choose>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>TCO 09 : Online Competitions</title>
        
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <!-- External CSS -->
        <link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
        
        <!-- External JavaScripts -->
        <script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
        <script type="text/javascript" src="/js/arena.js"></script> 
    </head>
    
    <body id="page">
        <div id="wrapper">
            <div id="wrapperInner">
                <div id="wrapperContent">
                    
                    <div id="wrapperContentInner">
                    
                        <jsp:include page="../header.jsp"/>
                        
                        <jsp:include page="../mainNav.jsp" >
                            <jsp:param name="mainTab" value="online"/>
                        </jsp:include>
                        
                        <div id="content">
                                <div class="contentTopLeft"><div class="contentTopRight">
                                    <div class="contentTopInner"></div>
                                </div></div>
                                
                                <div id="contentInner" class="contentInner">
                                
                                    <div id="contentInnerInner">
    
                                        <div class="bottomArea">
                                            <div class="bottomLeft"><div class="bottomRight">
                                                
                                                <jsp:include page="../secondaryNav.jsp" >
                                                    <jsp:param name="mainTab" value="online"/>
                                                    <jsp:param name="secondaryTab" value="${tab}"/>
                                                </jsp:include>
    
                                                <jsp:include page="../tertiaryNav.jsp" >
                                                    <jsp:param name="mainTab" value="online"/>
                                                    <jsp:param name="secondaryTab" value="${tab}"/>
                                                    <jsp:param name="tertiaryTab" value="leaderboard"/>
                                                </jsp:include>
                                                
                                                <div class="bottomAreaContent">
                                                    
                                                    <div class="mainContent">
                                                        <div id="mainContentInner">
                                                            <div>   
                                                                <div class="pageContent">
                                                                    <h2 class="title"> ${projectDesc} Competition Leaderboard</h2>
                                                                    <h2>${contestDetailsRow.map['contest_name']} - 
                                                                    <a href="${sessionInfo.servletPath}?module=ContestProjects&amp;eid=${event_id}&amp;ct=${contestDetailsRow.map['contest_id']}">View
                                                                    Components</a></h2>
                                                                    
    																<div><p>
    																	<table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <th class="first">&nbsp;</th>
                                                                                <th>Handle</th>
                                                                                <th>Placement Points</th>
                                                                                <th>Complete Projects</th>
                                                                                <th>Projects In Progess</th>
                                                                                <th>Projects Submitted</th>
                                                                                <th>Results</th>
                                                                                <th class="last">&nbsp;</th>
                                                                            </tr>
                                                                            <c:forEach items="${results}" var="result">
                                                                                <tr>
                                                                                    <td class="first">&nbsp;</td>
                                                                                    <td class="first last alignText">
                                                                                        <tc-webtag:handle context='${tab}' coderId='${result.userID}' darkBG='true' />
                                                                                        <c:if test="${result.incomplete > 0}">
                                                                                            *
                                                                                            <c:set var="incompleteProjects" value="true"/>
                                                                                        </c:if>
                                                                                    </td>
                                                                                    <td class="first last alignText">${result.points}</td>
                                                                                    <td class="first last alignText">${result.complete}</td>
                                                                                    <td class="first last alignText">${result.incomplete}</td>
                                                                                    <td class="first last alignText">${result.submissionCount}</td>
                                                                                    <td class="first last alignText">
                                                                                        <a href="${sessionInfo.servletPath}?module=MemberResults&amp;eid=${event_id}&amp;ct=${contestDetailsRow.map['contest_id']}&amp;cr=${result.userID}">results</a>
                                                                                    </td>
                                                                                    <td class="last">&nbsp;</td>
                                                                                </tr>
                                                                            </c:forEach>
    																	</table></p>
														                <br /><br />
                                                                        <c:if test="${incompleteProjects}">
                                                                            * Contains results from projects still in progress, results subject to change
                                                                            <br /><br />
                                                                        </c:if>
    																</div>
                                                                </div>
                                                            </div>
                                                            
                                                        </div><!-- End #mainContentInner -->
                                                        
                                                    </div><!-- End #mainContent --> 
                                                    <jsp:include page="../sponsors.jsp"/>
                                                    
                                                </div><!-- End .bottomAreaContent -->
                                            
                                            </div></div>
                                        </div><!-- End .bottomArea -->
                                        
                                    </div><!-- End #contentInnerInner -->
                                
                                </div><!-- End #contentInner -->
                                
                                <div class="contentBottomLeft"><div class="contentBottomRight">
                                    <div class="contentTopInner"></div>
                                </div></div>
                                
                        </div><!-- End #content -->
                    
                    </div><!-- End #wrapperContentInner -->
                    
                </div>
            </div><!-- End #wrapperInner -->
        </div><!-- End #wrapper -->
    
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
