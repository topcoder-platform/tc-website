<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>

    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>
    
    <script language="javascript" type="text/javascript">
        function showProcessing() {
            document.getElementById("submitButton").innerHTML='<img src="/i/events/openaim/interface/processing.gif" alt=""/>';
        }
    </script>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">


<div class="linkBox">
    <openaim:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt;
    ${contest.name}
</div>

<h1>Upload Your Final Submission</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" onSubmit="showProcessing()">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitFinalSubmission"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

            <br/>
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
                    <input type="image" src="/i/events/openaim/interface/btnSubmit.png" />
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

        <jsp:include page="tcFoot.jsp"/>

    </div>
</body>
</html>