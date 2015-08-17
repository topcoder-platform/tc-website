<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus"%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="assignment_document"
    value="<%= request.getAttribute(Constants.RESULT_KEY) %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID"
    value="<%= Constants.ASSIGNMENT_DOCUMENT_ID + "" %>" />

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<html>
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
                        
                        <p align="right"><a href="${sessionInfo.servletPath}?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">Printer friendly version</a></p>
                        <div align="center">
                        
                        <iframe  width="100%" height="400" marginWidth="5" style="margin-bottom: 10px;"
                            src="${sessionInfo.servletPath}?module=Static&d1=mystudio&d2=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                        
                        <c:if test="${assignment_document.status.id == PENDING_STATUS_ID}">
                            <form action="${sessionInfo.servletPath}" method="post">
                                <input type="hidden" name="<%=Constants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                                <input type="submit" value="Affirm"/>
                            </form>
                            <p>If the personal information in this document is incorrect,<br />please <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">update your profile</a> before affirming.</p>
                            <c:choose>
                                <c:when test="${has_hard_copy}">
                                    <p>
                                        You have already sent a signed hard copy of the Assignment Document.
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <%--
                                    <p>
                                        You will need to send a signed hard copy of the Assignment Document Document in order to be able to affirm it in the future with the system. You can get a printer friendly version <a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">here</a>.
                                    </p>
                                    --%>
                                    <p>You will need to send a signed hard copy of the Assignment Document before you can submit your entry. You can get a printer friendly version <a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">here</a>.</p>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
