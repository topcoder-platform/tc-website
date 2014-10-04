<%--
  - Author: isv, winsty, Blues
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the Landing page for TC Direct application.
  -
  - Version 1.0.1 (Direct Release 6 assembly) changes: pressing Enter on Login form input fields submits the form.
  - Version 1.0.2 (Direct Improvements Assembly Release 1 ) Change notes: Add a hidden field forwarUrl to support redirecting
  - Version 1.0.3 (TC Direct UI Improvement Assembly 1 ) Change notes: Solve "404 not found when click "Projects Available for Conpilots" link in Copilots section in home page."
  - to the latest URL after user login in.
  - Version 1.1 (Release Assembly - TC Cockpit Sidebar Header and Footer Update) changes:
  - 1) Updated the video area of the home page right sidebar.
  - 2) Added a help center widget to the home page right sibebar.
  - 3) Updated the footer of the home page.
  - 4) Added a link to topcoder community in the home page.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccess" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessInt" %>
<%@ page import="com.topcoder.shared.dataAccess.Request" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.security.SimpleResource" %>
<%@ page import="com.topcoder.shared.security.SimpleUser" %>
<%@ page import="com.topcoder.shared.util.DBMS" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.PermissionException" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.common.model.Question" %>
<%@ page import="com.topcoder.web.common.voting.*" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.model.Survey" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.common.TCRequest" %>
<%@ page import="com.topcoder.web.common.TCResponse" %>
<%@ page import="com.topcoder.web.common.HttpObjectFactory" %>
<%@  page
        language="java"
        import="com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.BaseServlet,
                com.topcoder.web.common.StringUtils,
                com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.common.security.WebAuthentication" %>
<%@ page import="com.topcoder.web.common.security.SessionPersistor" %>
<%@ page import="com.topcoder.web.common.security.BasicAuthentication" %>


<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Survey</title>

    <link rel="stylesheet" href="/css/direct/screen.css?v=214495" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/homepage.css?v=203310" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/jquery.jcarousel.css?v=176771" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/thickbox.css?v=192822" media="all" type="text/css"/>

    <script type="text/javascript" src="/scripts/jquery-1.4.1.min.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/jquery.jcarousel.pack.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/thickbox-compressed.js?v=186145"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js?v=179836"></script>
    <script type="text/javascript" src="/scripts/scripts.js?v=203345"></script>
    <script type="text/javascript" src="/scripts/AJAXProcessor.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/RSSProcessor.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/FeedLoader.js?v=213163"></script>
    <script type="text/javascript" src="/scripts/loadHelps.js?v=215005"></script>

    <style>
        .logo {
            width: 330px !important;
            height: 58px !important;
            margin: 25px auto !important;
            background: url(/i/reskin/logo.png) 0 0 no-repeat !important;
        }

        .logo a {
            display: block !important;
            height: 52px !important;
            -moz-transition-duration: 0s;
            -webkit-transition-duration: 0s;
            transition-duration: 0s;
        }
    </style>

</head>

<body class="homePage" id="page">


<% String qdl = request.getParameter("SID");
    String tcid = request.getParameter("tcid");
    String linksrc = request.getParameter("linksrc");


    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
    WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(request.getSession()), tcRequest,
                                                               tcResponse);

    // if user not logged in
    if (authentication.getActiveUser().isAnonymous()) {
        response.sendRedirect("http://" + ApplicationServer.SERVER_NAME + "/tc?module=Login");
        return;
    }

    long uid = authentication.getActiveUser().getId();


    Request r = new Request();
    r.setContentHandle("first_reg");
    r.setProperty("uid", String.valueOf(uid));

    String year = "";
    String month = "";
    String day = "";

    DataAccessInt dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
    Map map = dataAccess.getData(r);
    ResultSetContainer rsc = (ResultSetContainer) map.get("first_reg");

    if (rsc != null && !rsc.isEmpty()) {
        year = rsc.getRow(0).getStringItem("reg_year");
        month = rsc.getRow(0).getStringItem("reg_month");
        day = rsc.getRow(0).getStringItem("reg_day");
    }

%>

<div>

    <h1 class="logo">
        <a href="http://www.topcoder.com" title="topcoder"></a>
    </h1>
    <!-- End .headerInner -->

</div>

<div id="landingPage" style="margin:30px auto; width:1005px">

    <!-- End #header -->

    <div>
        <div class="wrapperTop">

            <div class="content">

                <iframe src="https://harvard.qualtrics.com/SE/?SID=<%=qdl%>&tcid=<%=uid%>&join-month=<%=month%>&join-year=<%=year%>&join-day=<%=day%>&linksrc=<%=linksrc%>"
                        height="700px" width="1000px" frameBorder="0"></iframe>

            </div>
            <!-- end .content -->
        </div>
    </div>

</div>
<!-- End #landingPage -->

<div style="text-align:center;font-size:13px;margin-bottom:20px">
    Brought to you by the Harvard-NASA Tournament Lab
</div>


</body>
<!-- End #page -->

</html>
