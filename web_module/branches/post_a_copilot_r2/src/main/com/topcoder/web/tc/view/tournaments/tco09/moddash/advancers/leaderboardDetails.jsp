<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows moddash track leaderboard details page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration 1.1
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.web.tc.controller.request.tournament.ModDashLeaderboardDetailsBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tc-webtag" uri="tc-webtags.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<%-- Setting up constants to use JSTL --%>
<c:set var="START_RANK" value="<%=DataAccessConstants.START_RANK%>" />
<c:set var="NUMBER_RECORDS" value="<%=DataAccessConstants.NUMBER_RECORDS%>" />
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>" />
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>" />
<c:set var="FULL_LIST" value="<%=ModDashLeaderboardDetailsBase.FULL_LIST%>" />
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" />
<c:set var="HANDLE" value="<%=Constants.HANDLE%>" />
<c:set var="ISSUE_KEY_COL" value="<%=ModDashLeaderboardDetailsBase.ISSUE_KEY_COL%>" />
<c:set var="POINTS_COL" value="<%=ModDashLeaderboardDetailsBase.POINTS_COL%>" />
<c:set var="CREATED_COL" value="<%=ModDashLeaderboardDetailsBase.CREATED_COL%>" />
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>
<c:set var="userHandle" value="${param[HANDLE]}"/>
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Mod Dash</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
        <script type="text/javascript">
            function next() {
                var myForm = document.advancersForm;
                myForm.${START_RANK}.value= parseInt(myForm.${START_RANK}.value) + 
                    parseInt(myForm.${NUMBER_RECORDS}.value);
                myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
                myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
                myForm.submit();
            }
        
            function previous() {
                var myForm = document.advancersForm;
                myForm.${START_RANK}.value-=parseInt(myForm.${NUMBER_RECORDS}.value);
                myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
                myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
                myForm.submit();
            }
        </script>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="moddash"/>
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
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                                <jsp:param name="tertiaryTab" value="leaderboard"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                            <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>   
                                                            <div class="pageContent">
                                                                <h2 class="title"> Mod Dash Competition Leaderboard Details</h2>
                                                                    <form name="advancersForm" action='${sessionInfo.servletPath}' method="get">
                                                                        <tc-webtag:hiddenInput name="${MODULE_KEY}" value="ModDashLeadersDetails"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                                                                        <tc-webtag:hiddenInput name="${FULL_LIST}"/>
                                                                        <tc-webtag:hiddenInput name="${HANDLE}" value="${userHandle}"/>
    
                                                                        <br />
                                                                        <div align="center">
                                                                            <a href="${sessionInfo.servletPath}?module=ModDashLeadersDetails&amp;${HANDLE}=${userHandle}">
                                                                                Reset sorting
                                                                            </a>
                                                            
                                                                            <c:choose>
                                                                                <c:when test="${full}">
                                                                                    | <a href="${sessionInfo.servletPath}?module=ModDashLeadersDetails&amp;full=false&amp;${HANDLE}=${userHandle}">
                                                                                        Pages
                                                                                      </a>
                                                                                    | Full view
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    | Page view
                                                                                    | <a href="${sessionInfo.servletPath}?module=ModDashLeadersDetails&amp;full=true&amp;${HANDLE}=${userHandle}">
                                                                                        Full view
                                                                                      </a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                            
                                                                            <br />
                                                                            <c:if test="${!full}">
                                                                                <div class="pagingBox">
                                                                                    <c:choose>
                                                                                        <c:when test="${croppedDataBefore}">
                                                                                            <a href="Javascript:previous()">
                                                                                                &lt;&lt; prev
                                                                                            </a>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            &lt;&lt; prev
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    |
                                                                                    <c:choose>
                                                                                        <c:when test="${croppedDataAfter}">
                                                                                            <a href="Javascript:next()">
                                                                                                next &gt;&gt;
                                                                                            </a>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            next &gt;&gt;
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </div>
                                                                            </c:if>
                                                                        </div>
    																<div><p>
    																	<table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr><th colspan="5">Leaderboard Details - ${userHandle}</th></tr>
                                                                                <tr>
                                                                                    <th class="first">&nbsp;</th>
                                                                                    <th>
                                                                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${ISSUE_KEY_COL}'/>">Issue Key</a>
                                                                                    </th>
                                                                                    <th>
                                                                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${POINTS_COL}'/>">Points</a>
                                                                                    </th>
                                                                                    <th>
                                                                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${CREATED_COL}'/>">Created</a>
                                                                                    </th>
                                                                                    <th class="last">&nbsp;</th>
                                                                                </tr>
                                                                                <c:forEach items="${results}" var="result">
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">
                                                                                            <a href="/bugs/browse/${result.issueKey}">
                                                                                                ${result.issueKey}
                                                                                             </a>
                                                                                        </td>
                                                                                        <td class="first last alignText">${result.points}</td>
                                                                                        <td class="first last alignText">
                                                                                            <fmt:formatDate value="${result.created}" pattern="MM.dd.yyyy HH:mm z"/>
                                                                                        </td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </c:forEach>
    																	</table></p>
                                                                            <br />
                                                                            <c:if test="${!full}">
                                                                                <div align="center">
                                                                                    <div class="pagingBox">
                                                                                        <c:choose>
                                                                                            <c:when test="${croppedDataBefore}">
                                                                                                <a href="Javascript:previous()">&lt;&lt; prev</a>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                &lt;&lt; prev
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                        |
                                                                                        <c:choose>
                                                                                            <c:when test="${croppedDataAfter}">
                                                                                                <a href="Javascript:next()">next &gt;&gt;</a>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                next &gt;&gt;
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    
                                                                                       <br />
                                                                                    
                                                                                       View &#160;
                                                                                       <tc-webtag:textInput name="${NUMBER_RECORDS}" size="4" maxlength="4"/>
                                                                                       &#160;at a time starting with &#160;
                                                                                       <tc-webtag:textInput name="${START_RANK}" size="4" maxlength="4"/>
                                                                                        <button name="nameSubmit" value="submit" type="submit">Go</button>
                                                                                    </div>
                                                                                </div>
                                                                            </c:if>
        																</div>
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
