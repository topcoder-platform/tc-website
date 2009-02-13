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
                <tr><td class="normal"><img src="/images/headApplications.gif" alt="Applications" width="510" height="32" border="0" /></td></tr>
                <tr><td class="subhead">Competition-Based Methodology</td></tr>
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            </table>

            <div align="center">
                <img src="/images/apps_meth_promo.gif" alt="Application Methodology" width="510" height="158" border="0" />
            </div>

             <hr width="100%" size="1px" noshade>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
<!-- Collaboration begins -->
                        <p><strong>Specification</strong><br>
                        The TopCoder Software Project Manager (PM) works with the customer team to create an Application Specification,
                        high-level Use Cases, Activity Diagrams, a Deployment Diagram and a working prototype for the application.  The
                        Application Specification defines the functional requirements and scope of the project.  Use Cases and Activity Diagrams
                        combine to describe the business processes involved in the application.  The Deployment Diagram begins to identify
                        potential components necessary to create the application.  The Project Manager also works with the customer team
                        and a TopCoder Software Information Architect to create a working prototype of all GUIs necessary for Development
                        of the application. </p>
<!-- Collaboration ends -->

<!-- Design begins -->
                        <p><strong>Architecture and Design</strong><br>
                        The TopCoder Software Project Manager decomposes the Application Specification into multiple application
                        Design and Development Projects.  These projects are completed through a combination of competition and peer review.
                        For each Design Project, two Application Architects from the TopCoder member base are contracted to submit designs.
                        Each of these designs are reviewed and scored by an Architecture Review Board made up of the best TopCoder Architects.
                        The review process is iterative, allowing designers to incorporate review board suggestions in final design submissions.
                        One design is selected from this process to move on to Development.</p>
<!-- Design ends -->

<!-- Development begins -->
                        <p><strong>Development and Testing</strong><br>
                        Two TopCoder Developers are contracted to deliver development submissions.  Each of the submissions are tested and
                        scored by a Development Review Board made up of the best TopCoder Developers.  This review process is also iterative,
                        incorporating stress testing, accuracy testing and boundary testing to score the solutions.  One development solution is
                        selected to move on to Integration.</p>
<!-- Development ends -->

<!-- Complete begins -->
                        <p><strong>Integration</strong><br>
                        All solutions are brought together and system tested in either TopCoder's or the customer's development environment.
                        The Designers, Developers and Review Boards all collaborate to integrate and test the application.  The application is
                        deployed in the customer QA environment once TopCoder has approved it internally.  When it has been deployed at the
                        customer site, it is again system tested and approved by the customer.</li>
<!-- Complete ends -->
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
