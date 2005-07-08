<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ include file="/includes/formclasses.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "s_methodology.jsp";
    String action = request.getParameter("a");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Component Development Methodology at TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="165" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="applications"/>
            <jsp:param name="level2" value="methodology"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
                <tr><td class="normal"><img src="/images/apps/apps_title.gif" alt="Applications" width="530" height="30" border="0" /></td></tr>
                <tr><td class="subhead">Competition-Based Methodology</td></tr>
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            </table>

            <div align="center">
                <img src="/images/apps/apps_meth_graph.gif" alt="Application Methodology" width="530" height="200" border="0" />
            </div>

             <hr width="100%" size="1px" noshade>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
<!-- Specification begins -->
                        <p><strong>Specification</strong><br>
                        A TopCoder Software Project Manager works hand-in-hand with all appropriate client resources to create a series of 
                        detailed deliverables outlining the business requirements.</p>
<!-- Specification ends -->

<!-- Architecture begins -->
                        <p><strong>Application Architecture</strong><br>
                        A TopCoder Project Manager and Component Architect design the application using Component Based Development (CBD) 
                        techniques that result in the division of the application into the most granular components.  At the completion of the 
                        application architecture phase, a fixed price is provided for the component production, application assembly, and 
                        certification phases.</p>
<!-- Architecture ends -->

<!-- Component Production begins -->
                        <p><strong>Component Production</strong><br>
                        Component Production uses the TopCoder Software Component Development Methodology to create the components comprising the application.</p>
<!-- Component Production ends -->

<!-- Application begins -->
                        <p><strong>Application Assembly</strong><br>
                        TopCoder hand-selects only proven members to participate in the assembly of the application.  The application assemblers 
                        must sign a non-disclosure agreement to protect our clients.  During this phase, the components are linked together 
                        to build the application.</p>
<!-- Application ends -->

<!-- Certification begins -->
                        <p><strong>Certification</strong><br>
                        The purpose of this phase is to perform system testing of the application on a replicated environment at TopCoder.  
                        The individual components are rigorously tested as part of the component production process. Thus, certification testing 
                        occurs at the application level and consists of stress testing, accuracy testing, boundary testing, and integration testing.</p>
<!-- Certification ends -->

<!-- Deployment begins -->
                        <p><strong>Deployment</strong><br>
                        In this phase the fully functioning solution and all associated deliverables are turned over to the client.  
                        A TopCoder Project Manager and Deployment Engineer visit the client site to deploy the application on the client's 
                        quality assurance servers.</p>
<!-- Deployment ends -->
                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2" class="bodyText" align="center">
                        <p><font size="3"><strong><a href="http://www.topcoder.com/?t=development&c=app_meth">Learn more</a> about the TopCoder Application Methodology.</strong></font></p>

                        <p><font size="3"><strong><a href="http://www.topcoder.com/?t=contacts&c=index">Contact us</a> today so we can get started developing your next application.</strong></font></p>
                    </td>
                </tr>
            </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
