<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.mystudio.AssignmentDocumentHistory" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=AssignmentDocumentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>
<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="AFFIRMED_STATUS_ID" value="<%= AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "" %>" />
<c:set var="show_asterix" value="false" />

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
    <script type="text/javascript" src="/js/popup.js"></script>

<script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;

        function next() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.submit();
        }
        function previous() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
            myForm.submit();
        }
</script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="my_studio" />
            </jsp:include>
        <br />
        <!-- container -->
        
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">


<h1>Assignment Document</h1>
    <div align="right">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/assignment-document-and-terms/">What is an Assignment Document?</a><br /><br />
    </div>
    
    <c:if test="${not empty has_global_ad}">
        <div>
            <div class="statHolder" style="clear: both;">
            <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
            <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
            <div align="right">
                <span class="bigRed"><a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/The+Assignment+Document">Download Assignment Document</a></span><br />
            </div>
            <table class="stat" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr><td class="title" colspan="4">Assignment Document Status</td></tr>
                <tr class="light">
                    <td class="valueW"><div>&nbsp;</div></td>
                    <td class="value"><strong>Assignment Document Received</strong></td>
                    <td class="valueC">
                        <c:choose>
                            <c:when test="${has_global_ad}">
                                <img src="/i/v2/interface/iconYes.png" alt="Assignment Document - Yes" /> | <a href="${sessionInfo.servletPath}?module=AssignmentDocumentDetails&amp;assignment_document_id=${global_ad_id}">View Submitted Assignment Document</a>
                            </c:when>
                            <c:otherwise>
                                <img src="/i/v2/interface/iconNo.png" alt="Assignment Document - No" />
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="valueE"><div>&nbsp;</div></td>
                </tr>
            </tbody>
            </table>
            <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
            <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
            </div>
        </div><br /><br />
    </c:if>
    
    <c:if test="${empty has_global_ad}">
        <c:if test="${full_list}" >
            <div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory&amp;full_list=false">Current</a></div>
            <div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory&amp;full_list=true">All</a></div>
        </c:if>
        <c:if test="${not full_list}" >
            <div class="tableTabOn" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory&amp;full_list=false">Current</a></div>
            <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory&amp;full_list=true">All</a></div>
        </c:if>

        <br clear="all"/>
        <div class="statHolder" style="clear: both;">
            <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
            <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
            <table class="stat" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
            
                <form name="f" action="${sessionInfo.servletPath}" method="get">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AssignmentDocumentHistory"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
                <input type="hidden" name="<%= AssignmentDocumentHistory.FULL_LIST %>" value="<c:out value="${full_list}"/>" />
                <tr><td class="title" colspan="6">Assignment Documents</td></tr>
                <tr>
                    <td class="headerW">
                        <div>&nbsp;</div>
                    </td>
                    <td class="header">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Description</a>
                    </td>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Affirmation</a>
                    </td>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Time Left</a>
                   </td>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Status</a>
                    </td>
                    <td class="headerE">
                        <div>&nbsp;</div>
                    </td>
                </tr>
                <c:choose>
                    <c:when test="${empty assignment_documents}">
                        <tr><td class="space" colspan="6">&nbsp;</td></tr>
                        <tr class="light">
                            <td class="valueW">
                                <div>&nbsp;</div>
                            </td>
                            <td class="valueC" colspan="4">
                                <div align="center" style="margin: 40px 0px;">
                                    There are currently no assignment documents.
                                </div>
                            </td>
                            <td class="valueE">
                                <div>&nbsp;</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>    
                        <form name="f" action="${sessionInfo.servletPath}" method="get">
                        <%int i = 0;%>
                        <c:forEach items="${assignment_documents}" var="ad">
                            <tr><td class="space" colspan="6">&nbsp;</td></tr>
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="valueW">
                                    <div>&nbsp;</div>
                                </td>
                                <td class="value">
                                    <c:out value="${ad.submissionTitle}"/>                
                                </td>
                                <c:choose>
                                    <c:when test="${ad.status.id == AFFIRMED_STATUS_ID}">
                                        <td class="valueC">
                                            <a href="${sessionInfo.servletPath}?module=AssignmentDocumentDetails&amp;assignment_document_id=${ad.id}">
                                                Affirmed on<br /><fmt:formatDate value="${ad.affirmedDate}" pattern="MM.dd.yyyy"/>
                                            </a>                
                                        </td>
                                        <td class="valueC">&nbsp;</td>
                                        <td class="valueC">
                                            <c:out value="${ad.status.description}"/>
                                        </td>
                                    </c:when>
                                    <c:when test="${ad.status.id == PENDING_STATUS_ID}">
                                        <c:choose>
                                            <c:when test="${not empty has_global_ad && has_global_ad}">
                                                <td class="valueC">
                                                    <strong>
                                                        No need to Affirm *
                                                    </strong>
                                                </td>
                                                <td class="valueC">
                                                    &nbsp;
                                                </td>
                                                <td class="valueC">
                                                    No need to Affirm *
                                                </td>
                                                <c:set var="show_asterix" value="true" />
                                            </c:when>
                                            <c:otherwise>
                                                <td class="valueC">
                                                    <strong><a href="${sessionInfo.servletPath}?module=AssignmentDocumentDetails&amp;assignment_document_id=${ad.id}">
                                                        Affirm now
                                                    </a></strong>
                                                </td>
                                                <td class="valueC">
                                                    <strong><a href="${sessionInfo.servletPath}?module=AssignmentDocumentDetails&amp;assignment_document_id=${ad.id}">
                                                         <c:out value="${ad.daysLeftToExpire}"/> days
                                                    </a></strong>            
                                                </td>
                                                <td class="valueC">
                                                    <c:out value="${ad.status.description}"/>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="valueC">
                                            <a href="${sessionInfo.servletPath}?module=AssignmentDocumentDetails&amp;assignment_document_id=${ad.id}" class="bigRed">
                                                Expired
                                            </a>
                                        </td>
                                        <td class="valueC">
                                            &nbsp;
                                        </td>
                                        <td class="valueC">
                                            <c:out value="${ad.status.description}"/>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
            
                                <td class="valueE">
                                    <div>&nbsp;</div>
                                </td>
                            </tr>
                            <%i++;%>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </form>
            </tbody>
            </table>
            
            <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
            <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
        </div>
        <c:if test="${not empty assignment_documents}" >
            <c:if test="${croppedDataBefore or croppedDataAfter}" >
                <div class="pagingBox">
                    <c:choose>
                        <c:when test="${croppedDataBefore}">
                            <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                        </c:when>
                        <c:otherwise>
                            &lt;&lt; prev
                        </c:otherwise>
                    </c:choose>
                    
                    <c:choose>
                        <c:when test="${croppedDataAfter}">
                            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                        </c:when>
                        <c:otherwise>
                            next &gt;&gt;
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
        </c:if>
    </c:if>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
