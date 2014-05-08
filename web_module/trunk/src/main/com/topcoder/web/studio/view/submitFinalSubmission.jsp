<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID" value="assignment_document_id" />

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <jsp:include page="style.jsp">
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
    
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script language="javascript" type="text/javascript">
        function showProcessing() {
            document.getElementById("submitButton").innerHTML='<img src="/i/layout/processing.gif" alt=""/>';
        }
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">


<div class="linkBox">
    <studio:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Challenges</a> &gt;
    ${contest.name}
</div>

<h1>Upload Your Final Submission</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" onSubmit="showProcessing()">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitFinalSubmission"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

            <p>Please use the form below to upload your submission:</p>
    
<%--
            <p>The maximum file size per submission is 2MB.</p>
--%>

            <p>Only ZIP Archive file type will be accepted:</p>

            <div align="center">
                <p>
                    <b>My design:</b><br/>
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>"><span class="bigRed">${err}</span>
                                        <br /></tc-webtag:errorIterator>
                    <input type="file" name="<%=Constants.SUBMISSION%>">
                </p>
                <p id="submitButton">
                    <input type="image" src="/i/v2/interface/btnSubmit.png" />
                </p>
            </div>
        </form>
    </div>
</div>



                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
