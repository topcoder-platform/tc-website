<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
           
        <div align="center"><img src="/i/longcontest/banner.jpg" border="0px" alt="TopCoder Marathon Matches" /></div>
        <br /><br />
        <%--
        <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
            <strong>
                <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=sponsors&amp;d2=btChat20070721">SRM 359</a>
            </strong>
        </div>
        <br /><br />
        --%>

        <h1>TopCoder Predictive Marathon Match</h1>
        <p align="center">
            Overview&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveInstructions">How to Compete</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveRules">Rules</a>&#160;&#160;|&#160;&#160;
            <%--
            <span class="grayedOut">Active Contests (coming soon)</span>
            --%>
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
            
        </p>
        
        <span class="bigTitle">Overview</span>
        <p>Do you think you have what it takes to predict the future? Some TopCoder members have already demonstrated their prognostication skills by predicting the results of recent tournaments, and some game simulations are becoming eerily accurate at being able to predict real sporting events. Now it's time to really put your precognitive programming skills to the test. We are proud to announce the first TopCoder Predictive Marathon Match, with a prize purse of $2,000! Pit your forecasting skills against your fellow members in this month-long rated match.</p>
        <p>This month long competition will begin on Friday, June 6th, 2008 at 12:00 PM EDT (UTC/GMT -4). You will have until July 7, 2008 at 12:00 PM EDT (UTC/GMT -4) to finalize your submission.</p>
        <p>Keep checking back in for more details of our exciting new competition.</p>
        <p>&nbsp;</p>

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