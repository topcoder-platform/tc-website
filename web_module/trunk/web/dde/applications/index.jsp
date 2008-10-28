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
    <title>Software Components form the basis of the applications built by TopCoder</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
    <jsp:include page="/includes/header-files.jsp" />
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp">
<jsp:param name="TCDlevel" value="software" />
</jsp:include>
<jsp:include page="/includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true" />
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
<tr valign="top">

<!-- Left Column begins -->
<td width="165" class="leftColumn">
    <jsp:include page="/includes/left.jsp">
        <jsp:param name="level1" value="applications" />
        <jsp:param name="level2" value="overview" />
    </jsp:include>
</td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
<td width="25"><img src="/images/clear.gif" alt="" width="25" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
<td width="99%">
    <div align="left">
    <img src="/images/clear.gif" width="1" height="15" alt="" border="0" /><br />
    <img src="/images/hd_app_over.png" alt="Application Overview" border="0" /><br />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="bodyText" width="75%">
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0" />

                <p><strong>We know you've probably become conditioned to tune out the claims made by other software companies. TopCoder is on a mission to prove that we can develop high-quality software applications differently from those companies. How do we do it?</strong></p>
                <br />
                <p>We utilize our member base of software developers who are differentiated by talent through competition. 
                Combining this talent with our competition-based methodology and our catalogs of re-usable components is what allows us to develop faster, cheaper, and better.</p>
                <br />
            </td>
            <td width="25%" class="bodyText" align="center">&nbsp;</td>
        </tr>
    </table>


    <div id="platform" align="left" style="margin-bottom:10px;">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td width="100%" class="bodyText">
                <div class="platform_row_dark">
                    <div style="float:left;">
                        <a href="http://software.topcoder.com/catalog/index.jsp"><img src="/i/component_catalog.png" alt="Component Catalog" class="platform_img" /></a>
                        <h3 style="margin-top:-15px;"><a href="http://software.topcoder.com/catalog/index.jsp"><img src="/i/component_catalog_text.png" alt="Component Catalog" width="204" height="29" /></a></h3>
                        <p>In 2001, we began developing substantial catalogs of re-usable Java and .NET components. Reusing these bits of software over and over on client projects allows us to substantially shorten timelines and decrease costs. We then pass these savings onto our clients.</p>
                    </div>
                </div><%-- platform_row_dark ends--%>
            </td>
        </tr>
    </table>



    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td width="100%" class="bodyText">
                <div class="platform_row">
                    <div style="float:left; padding-left:50px;">
                      <span style="float:right;"><img src="/i/no_shore.png" alt="No-Shore Development" class="platform_img" /></span>
                      <h3 style="margin-top:-15px;"><img src="/i/no_shore_text.png" alt="No-Shore Development" /></h3>
                      <p>TopCoder's member base is a distributed resource that spans over 150 countries. Unlike strictly off-shore development firms, it doesn't matter what country our members call home, as long as they've proven that they can deliver a better solution than their peers. Since our members work for TopCoder as contractors, not employees, our fixed costs are much lower than our competition.</p>
                    </div>
                </div><%-- platform_row ends--%>
            </td>
        </tr>
    </table>



    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td width="100%" class="bodyText">
                <div class="platform_row_dark">
                    <div style="float:left;">
                        <img src="/i/uncompromising_quality.png" alt="Uncompromising Quality" class="platform_img" />
                        <h3 style="margin-top:-15px;"><img src="/i/uncompromising_quality_text.png" alt="Uncompromising Quality" /></a></h3>
                        <p>Differentiating our members by talent through competition insures that only quality developers are working on our code. Each week, hundreds of TopCoder members compete in programming competitions, where they are rated based on the results. Only members with acceptable ratings are allowed to develop software for TopCoder.</p>
                        <p>Our Component Catalogs are made up of the extremely high quality components developed by our members. These components are of such high quality due to the fact that they have been used and re-used in multiple applications. TopCoder strives to develop as many applications with re-usable components as possible.</p>
                    </div>
                </div><%-- platform_row_dark ends--%>
            </td>
        </tr>
    </table>    
    


    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td width="100%" class="bodyText">
                <div class="platform_row">
            <div style="float:left; padding-left:50px; margin-bottom:50px;">
                <span style="float:right;"><img src="/i/app_methodology.png" alt="Application Methodology" class="platform_img" /></span>
                <h3 style="margin-top:-15px;"><img src="/i/app_methodology_text.png" alt="Application Methodology" /></a></h3>                
                <p>The TopCoder Application Development Methodology is designed to deliver a repeatable and consistent 
                solution to our customers. The TopCoder methodology is comprised of phases and deliverables. The 
                six-step methodology is administered by a TopCoder Project Manager skilled in Component Based 
                Development (CBD) techniques, requirements gathering, and project management. During the specification 
                phase, the Project Manager works hand-in-hand with our customers to develop specifications that satisfy 
                all of our customers' requirements. In the component architecture phase, the Project Manager and 
                TopCoder Component Architect identify and design the components required to build the application. Next, 
                the component production phase uses TopCoder's unique component methodology, to create all of the components. During the application assembly phase, the Project Manager hand-selects only proven members to participate in the assembly of the application. The application assemblers must sign a non-disclosure agreement to protect our clients. During this phase, the components are linked together to build the application. Once assembled, the certification phase begins. Prior to deployment at the customer's site, the application is rigorously tested at TopCoder. After certification, the application is delivered to our customers and deployed to their quality assurance environment, as part of the deployment phase. Our rigorous application methodology, combined with our competition-tested members and our re-usable components, allow TopCoder to deliver applications of the highest quality.</p>
                </div>
            </div><%-- platform_row ends--%>
            </td>
        </tr>
    </table>
    </div><%-- platform ends --%>
<%--
    <div style="height:20px; margin-top:20px;">&nbsp;<br />&nbsp;<br /></div>
    --%>
</div>
</td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
<td width="170">
    <jsp:include page="/includes/right.jsp">
        <jsp:param name="level1" value="index" />
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
