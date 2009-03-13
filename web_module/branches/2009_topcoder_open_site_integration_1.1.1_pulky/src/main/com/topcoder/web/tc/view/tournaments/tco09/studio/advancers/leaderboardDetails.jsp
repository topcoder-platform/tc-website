<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows studio track leaderboard page.
 * Todo: fix format, add custom tags.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase,
                 com.topcoder.shared.util.ApplicationServer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tc-webtag" uri="tc-webtags.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Setting up constants to use JSTL --%>
<c:set var="CONTEST_NAME_COL" value="<%=StudioUserContestsBase.CONTEST_NAME_COL%>" />
<c:set var="START_DATE_COL" value="<%=StudioUserContestsBase.START_DATE_COL%>" />
<c:set var="END_DATE_COL" value="<%=StudioUserContestsBase.END_DATE_COL%>" />
<c:set var="REGISTRANTS_COL" value="<%=StudioUserContestsBase.REGISTRANTS_COL%>" />
<c:set var="SUBMISSIONS_COL" value="<%=StudioUserContestsBase.SUBMISSIONS_COL%>" />
<c:set var="PLACED_COL" value="<%=StudioUserContestsBase.PLACED_COL%>" />
<c:set var="POINTS_COL" value="<%=StudioUserContestsBase.POINTS_COL%>" />
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>" />
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>" />
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" />
<c:set var="EVENT_ID" value="<%=Constants.EVENT_ID%>" />
<c:set var="USER_ID" value="<%=Constants.USER_ID%>" />
<c:set var="eventId" value="${param[EVENT_ID]}" />
<c:set var="userId" value="${param[USER_ID]}" />
<c:set var="STUDIO_SERVER_URL" value="<%="http://"+ApplicationServer.STUDIO_SERVER_NAME + "/"%>" />

<c:set var="TOP_WINNERS_RANK" value="10" />  <!-- ToDo: take out-->
<c:set var="CONTEST_ID_KEY" value="ct" />  <!-- ToDo: take out-->
<c:set var="COMPLETE" value="complete" />  <!-- ToDo: take out-->
<c:set var="complete" value="${param[COMPLETE] == 1}" />

         
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Studio Competition</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="studio"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                                <jsp:param name="tertiaryTab" value="leaderboard"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                            <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>   
                                                            <div class="pageContent">
                                                                <h2 class="title">Studio Design Competition Leaderboard</h2>
                                                                <br/>
                                                                    <form name="advancersForm" action='${sessionInfo.servletPath}' method="get">
                                                                        <tc-webtag:hiddenInput name="${MODULE_KEY}" value="StudioContests"/>
                                                                        <tc-webtag:hiddenInput name="${EVENT_ID}" value="${eventId}"/>
                                                                        <tc-webtag:hiddenInput name="${USER_ID}" value="${userId}"/>
                                                                        <tc-webtag:hiddenInput name="${COMPLETE}" value="${complete}"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>

    																	<table class="data" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th colspan="${complete ? '8' : '5'}">
                                        <span class="coderText"> ${handle}</span> &gt;
                                        ${complete ? "Completed" : "In Progress"}
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${CONTEST_NAME_COL}'/>">Contest</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${START_DATE_COL}'/>">Start Date</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${END_DATE_COL}'/>">End Date</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${REGISTRANTS_COL}'/>">Registrants</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${SUBMISSIONS_COL}'/>">Sub.</a>
                                    </th>
                                    <c:if test="${complete}">
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${PLACED_COL}'/>">Placed</a>
                                        </th>
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${POINTS_COL}'/>">Points</a>
                                        </th>
                                        <th>
                                            Submission
                                        </th>
                                    </c:if>
                                </tr>
                                                                                <c:forEach items="${result}" var="resultRow">
                                                                                    <tr>

                                        <td class="first last alignText">
                                            <a href="${STUDIO_SERVER_URL}?${MODULE_KEY}=${complete ? 'ViewContestResults' : 'ViewContestDetails'}&amp;${CONTEST_ID_KEY}=${resultRow.contestId}">
                                                ${resultRow.contestName}
                                            </a>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${resultRow.startDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${resultRow.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="first last alignText">
                                            ${resultRow.registrants}
                                        </td>
                                        <td class="first last alignText">
                                            ${resultRow.submissions}
                                        </td>
                                        <c:if test="${complete}">
                                            <td class="first last alignText">
                                                <c:choose>
                                                    <c:when test="${resultRow.points > 0}">
                                                        ${resultRow.placed}
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="first last alignText">
                                                ${resultRow.points}
                                            </td>
                                            <td class="first last alignText">
                                                <c:choose>
                                                    <c:when test="${(not empty resultRow.submissionId) and (resultRow.submissionId > 0)}">
                                                        <a href="${STUDIO_SERVER_URL}?${MODULE_KEY}=DownloadSubmission&amp;sbmid=${resultRow.submissionId}">
                                                            <img src="/i/tournament/tco09/magnify.png" alt="View submission" title="View submission" />
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>&nbsp;</c:otherwise>
                                                </c:choose>
                                            </td>
                                        </c:if>

                                                                                    </tr>
                                                                                </c:forEach>
    																	   </table>
                                                                        </form>
      																
                                                                </div>
                                                            </div>
                                                        
                                                    </div><!-- End #mainContentInner -->
                                                    
                                                </div><!-- End #mainContent --> 

                                                <jsp:include page="../../sponsors.jsp"/>
                                                
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

<jsp:include page="../../footer.jsp"/>
</body>
</html>
