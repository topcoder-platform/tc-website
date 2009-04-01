<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="center">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

                    <span class="title">Refer 5 Friends and win!</span>
                    <br /><br />
                    <strong>Introducing the TopCoder High School Referral Program!</strong>
                    <br /><br />
                    <strong>Designed to increase the number of high school coders who participate in TopCoder competitions, this referral program is exclusively for high school participants.</strong>
                    <br /><br />
                    <span class="subtitle">How it works</span><br />
                    On the member registration page, there is a "Referring Member" field. If you tell a fellow coder to register with TopCoder, ask him or her to provide your handle in the "Referring Member" field.
                    <br /><br />
                    For every five (5) members you refer that compete in at least one (1) High School Single Round Match (SRM), you will win a limited edition TopCoder T-shirt!
                    <br /><br />
                    The "Referring Member" field in the registration cannot be changed once the registration process has been completed. Therefore, please ensure that any referred member provides the correct handle upon registering with TopCoder.
                    <br /><br />
                    <span class="subtitle">Official Rules</span><br />
                    "Referring Member" must be a high school student and registered for the 2009 High School Season. Any current high school TopCoder member is eligible to be a "referring member".
                    <br /><br />
                    In order to win a t-shirt, each new member must be a high school student, eligible to compete in high school Single Round Matches. Each of the five members must compete in a minimum of one (1) SRM before the first round of the 2009 TCHS Tournament.
                    <br /><br />
                    The "Referring Member" field in the registration may not be changed once the registration process has been completed.
                    <br /><br />
                    TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice people to register and participate at TopCoder. Sending such unsolicited emails may lead to your termination from the TopCoder Referral Program.
                    <br /><br />
                    TopCoder reserves the right to modify or cancel the TopCoder Referral Program at any time for any reason. TopCoder also reserves the right to disqualify any TopCoder member from the TopCoder Referral Program at any time for any reason.
                    <br /><br />
                    Winners will be announced during the 2009 TopCoder High School tournament and T-shirts will be sent after the 2009 TCHS Finals.
                    <br /><br />
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>