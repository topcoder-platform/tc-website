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
    <title>TopCoder Software Site Changelog</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css"/>
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

        <!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp">
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
        <!-- Left Column ends -->

        <!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"/></td>
        <!-- Gutter 1 ends -->

        <!-- Middle Column begins -->
        <td width="99%">
            <div align="center">
                <img src="/images/clear.gif" width="1" height="15" alt="" border="0"><br>
                <img src="/images/about_title.gif" alt="About TopCoder Software" width="530" height="30" border="0"/>
                <table width="530" border="0" cellspacing="0" cellpadding="0">
                    <tr><td align="left" colspan="2" class="bodyText">
                        <H3>TopCoder Software Web Site Change Log</H3>

                        <p>
                            1.0.5 - 2006.xx.xx
                            <ul>
                                <li>Tweak to my open projects page to speed it up</li>
                                <li>Fixed admins review scorecards overview page</li>
                                <li>Fixed issue for submitters that become reviewers</li>
                                <li>Admin application specification screening was added</li>
                            </ul>
                        </p>

                        <p>
                            1.0.4 - 2006.08.14
                            <ul>
                                <li>Review Board automatic disqualification and activation added.</li>
                            </ul>
                        </p>

                        <p>
                            1.0.3 - 2006.08.03
                            <ul>
                                <li>Review Board registration bug fixed</li>
                                <li>Added default responsibilities for design project's reviewers roles</li>
                                <li>Fixed component version admin page to load the public forum flag</li>
                            </ul>
                        </p>

                        <p>
                            1.0.2 - 2006.07.31
                            <ul>
                                <li>AOL logo added to TCS pages</li>
                                <li>Reviewers automatic payment population fixed</li>
                            </ul>
                        </p>

                        <p>
                            1.0.1 - 2006.07.26
                            <ul>
                                <li>Component version admin page was fixed to admit changes for public-non public
                                    forums.</li>
                            </ul>
                        </p>
                        <br/><br/></td></tr>

                    <tr><td colspan="2">&#160;</td></tr>
                </table>

            </div>
        </td>
        <!-- Middle Column ends -->

        <!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"/></td>
        <!-- Gutter 2 ends -->

        <!-- Right Column begins -->
        <td width="170">
            <jsp:include page="/includes/right.jsp">
                <jsp:param name="level1" value="index"/>
            </jsp:include>
        </td>
        <!--Right Column ends -->

        <!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0"/></td>
        <!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true"/>
<!-- Footer ends -->

</body>
</html>
