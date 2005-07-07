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
    String page_name = "s_definition.jsp";
    String action = request.getParameter("a");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Software Components form the basis of the applications built by TopCoder Software</title>
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

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="applications"/>
            <jsp:param name="level2" value="overview"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <img src="/images/clear.gif" width="1" height="15" alt="" border="0"><br>
            <img src="/images/headApplications.gif" alt="Applications" width="510" height="32" border="0" /><br>
            <div>
            <img src="/images/apps_home_promo.gif" alt="Faster, Cheaper, Better" width="510" height="110" border="0" />
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td class="bodyText" align="left">
                        <img src="/images/clear.gif" width="1" height="10" alt="" border="0">
                        <p><strong>We know you've probably become conditioned to tune out the claims made by other software companies. TopCoder is on a mission to prove
                        that we can develop high-quality software applications differently from those companies. How do we do it?</strong></p>

                        <p>We utilize our member base of software developers who are differentiated by talent through
                        competition. Combining this talent with our competition-based methodology and our catalogs of re-usable components is what allows us to develop
                        faster, cheaper, and better.</p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" color="#666666" noshade>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="49%" class="bodyText">
                        <p><strong>No-Shore Development</strong><br>
                        TopCoder's member base is a distributed resource that spans over 150 countries. Unlike strictly off-shore development firms, it doesn't matter what
                        country our members call home, as long as they've proven that they can deliver a better
                        <a href="http://www.topcoder.com/?&t=development&c=components">solution</a> than their peers. Since our members work for
                        TopCoder as contractors, not employees, our fixed costs are much lower than our competition.</p>
                    </td>
                    <td width="49%" class="bodyText" align="center">
                        <a href="http://www.topcoder.com/?&t=development&c=components"><img src="/images/apps_home_map.gif" alt="No-Shore Development" width="266" height="125" border="0" /></a><br><br>
                    </td>
                </tr>
            </table>

             <hr width="100%" size="1" color="#666666" noshade>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="49%" class="bodyText">
                        <p><strong>Component Catalog</strong><br>
                        In 2001, we began developing substantial <a href="/catalog/c_showroom.jsp">catalogs</a> of re-usable Java and .NET components. Reusing these bits of 
                        software over and over on client projects allows us to substantially shorten timelines and decrease costs. We then pass these savings onto our clients.</p>
                    </td>
                    <td width="49%" class="bodyText" align="center">
                        <a href="/catalog/c_showroom.jsp"><img src="/images/apps_home_catalog.gif" alt="Component Catalog" width="216" height="152" border="0" /></a><br><br>
                    </td>
                </tr>
            </table>

             <hr width="100%" size="1" color="#666666" noshade>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="49%" class="bodyText">
                        <p><strong>Uncompromising Quality</strong><br>
                        Differentiating our members by talent through competition insures that only quality developers are working on our code. Each week, hundreds of
                        TopCoder members compete in programming <a href="http://www.topcoder.com">competitions,</a> where they are rated based on the results.
                        Only members with acceptable ratings are allowed to develop software for TopCoder Software.</p>

                        <p>Our Component Catalogs are made up of the extremely high quality components developed by our members. These components are of such high
                        quality due to the fact that they have been used and re-used in multiple applications. TopCoder strives to develop as many applications with
                        re-usable components as possible.</p>
                    </td>
                    <td width="49%" class="bodyText" align="center">
                        <a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=compDocumentation"><img src="/images/apps_home_scorecard.gif" alt="Uncompromising Quality" width="216" height="212" border="0" /></a><br><br>
                    </td>
                </tr>
            </table>

             <hr width="100%" size="1" color="#666666" noshade>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="49%" class="bodyText">
                        <p><strong>Application Methodology</strong><br>
                        The TopCoder Application Development Methodology is designed to deliver a repeatable and consistent solution to our customers.  The TopCoder methodology 
                        is comprised of phases and deliverables.  The six-step methodology is administered by a TopCoder Project Manager skilled in Component Based Development 
                        (CBD) techniques, requirements gathering, and project management.</p>
                        
						<p>During the specification phase, the Project Manager works hand-in-hand with our customers to develop specifications that satisfy all of our customers' 
						requirements.  In the component architecture phase, the Project Manager and TopCoder Component Architect identify and design the components required to 
						build the application.  Next, the component production phase uses TopCoder's unique <a href="/components/methodology.jsp">component methodology,</a> to create all of the components.  During the 
						application assembly phase, the Project Manager hand-selects only proven members to participate in the assembly of the application.  The application 
						assemblers must sign a non-disclosure agreement to protect our clients.  During this phase, the components are linked together to build the application.  
						Once assembled, the certification phase begins.  Prior to deployment at the customer's site, the application is rigorously tested at TopCoder.  After 
						certification, the application is delivered to our customers and deployed to their quality assurance environment, as part of the deployment phase.  Our 
						rigorous <a href="/applications/methodology.jsp">application methodology,</a> combined with our competition-tested members and our re-usable components, allow TopCoder to deliver applications of the 
						highest quality.</p>
                    </td>
                    <td width="49%" class="bodyText" align="center">
                        <a href="/applications/methodology.jsp"><img src="/images/apps_home_meth.gif" alt="Application Methodology" width="253" height="168" border="0" /></a>
                    </td>
                </tr>
            </table>

            <p><font size="3"><strong><a href="http://www.topcoder.com/?t=contacts&c=index">Contact us</a> today so we can get started developing your next application.</strong></font></p>

            <p><br></p>

            </div>
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
