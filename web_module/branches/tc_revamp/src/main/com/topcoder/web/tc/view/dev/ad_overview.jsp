<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder Software Development Opportunities</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_des_competitions"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td class="bodyText" WIDTH="100%" align="center">
            <img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br/>

            <table width="600" border="0" cellpadding="0" cellspacing="1" bgcolor="#666666">
                <tr>
                    <td bgcolor="#FFFFFF">
                        <table width="600" border="0" cellpadding="10" cellspacing="0">
                            <tr>
                                <td class="smallText">
                                    <span class=bodySubtitle>Leverage your Skills to Earn Cash and Recognition</span>
                                    <br><br>
                                    If you're a TopCoder member, you can submit
                                    <a href="/tc?module=ViewActiveContests&amp;ph=112">design</a> and
                                    <a href="/tc?module=ViewActiveContests&amp;ph=113">development</a> solutions for
                                    these projects. You will
                                    be paid cash for each winning solution you submit. Every solution becomes part of a
                                    TopCoder Software Catalog,
                                    now available for sale online. For every commercial sale of a catalog, TopCoder will
                                    pay the members who designed
                                    and developed the components in that catalog a percentage of the sale.<br/>
                                    Click
                                    <a href="/tc?module=Static&amp;d1=dev&&amp;d2=support&&amp;d3=desGettingStarted">here</a>
                                    for help getting started.
                                    <br><br>
                                    Highly rated and experienced TopCoder members fill the ranks of the
                                    <a href="/tc?module=ViewReviewProjects">Architecture and Development Review
                                        Board</a>. The Architecture Review Board members screen and review all design
                                    submissions to ensure the components
                                    meet the functional requirements, are documented properly and contain the
                                    appropriate sequence, use case and class
                                    diagrams. The Development Review Board members verify that each development
                                    submission meets the required functionality,
                                    coding style, adheres to the component design and contains a suitable test suite.
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
            <p></p>

            <div align="center">
                <a href="/reg/"><img src="/i/development/ad_register.gif" width="146" height="35" border="0"></a></div>

            <p></p>

        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>