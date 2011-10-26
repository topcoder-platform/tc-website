<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="hs_sponsor"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
            <div class="myTCBody">

                <div align="center" style="margin-top: 15px;">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

                <p>
                    <h2>TopCoder High School - Sponsorship Overview</h2>

                    <span class="bodySubtitle">Your Support</span><br/>
                    TopCoder High School is a profit-neutral endeavor for TopCoder. Any proceeds through sponsorship
                    will be used to defray costs. Funds in excess of costs for the program will be contributed to prize
                    offerings. TopCoder is looking to the community at the local, national and international level for
                    financial support.
                    <br/><br/>
                    <span class="bodySubtitle">Sponsorship Opportunities</span><br/>
                    There are a variety of sponsorship opportunities available for anyone &mdash; parents, teachers,
                    community members, local businesses, multi-national corporations &mdash; who is interested in
                    supporting a team, individual or the entire tournament. Sponsorship proceeds will be used for prizes
                    as well as to cover team and individual expenses for travel.
                    <br/><br/>
                    If you are interested in sponsoring the TopCoder High School tournament, please
                    <A href="mailto:sponsortchs@topcoder.com">contact us</A> for specific opportunities.
                    <br/><br/>
                    <%--[LEAVE THIS OUT FOR NOW] If you are interested in sponsoring a team or individual, please use the functionality below to enter your information.
                    <br/><br/>--%>

                </p>

            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="tchs"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
