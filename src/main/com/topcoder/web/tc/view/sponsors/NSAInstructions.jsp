<%@ page contentType="text/html;charset=utf-8" %>
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
           
        
        <div align="center"><img src="/i/sponsor/nsa/nsa_logo.jpg" border="0px" alt="NSA Logo" /></div>
        <br /><br />

        <p align="center">
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NSAOverview">Overview</a>&#160;&#160;|&#160;&#160;
            How to Compete&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NSARules">Rules</a>&#160;&#160;|&#160;&#160;
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
        </p>
        
        <p><span class="bigTitle">How To Compete</span></p>
        
        <p><span class="bodySubtitle">Registration</span><br />
        
        <p><span class="bodySubtitle">Problem Statements</span><br />
        
        <p><span class="bodySubtitle">Submitting Solutions</span><br />
        

        <p><span class="bodySubtitle">Viewing Match Standings</span><br />

        
        <p><span class="bodySubtitle">Match results</span><br />

        
        <p><span class="bodySubtitle">Competition Series Schedule</span><br />

        <table cellpadding="0" cellspacing="0" class="stat" width="90%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="3">Schedule</td>
                </tr>
                <tr>
                    <td class="header">Competition</td>
                    <td class="header C">Registration</td>
                    <td class="header R">Deadline</td>
                </tr>
                <tr class="light">
                    <td class="value">Competition 1</td>
                    <td class="value C">September 15, 2009<br />12:00 Noon EDT</td>
                    <td class="value R">September 29, 2009<br />12:00 Noon EDT</td>
                </tr>
                <tr class="dark">
                    <td class="value">Competition 2</td>
                    <td class="value C">TBD<br />12:00 Noon EDT</td>
                    <td class="value R">TBD<br />12:00 Noon EDT</td>
                </tr>
                <tr class="light">
                    <td class="value" colspan="3">*Please note the change in Daylight Saving Time in November for deadlines.</td>
                </tr>
            </tbody>
        </table>
        
        <p><span class="bodySubtitle">Prizes</span><br />
        There will be up to $3000 in total prize money awarded to the five (5) highest scoring members who are citizens of the United States.
        </p>
        <table cellpadding="0" cellspacing="0" class="stat" width="45%" align="center">
            <tbody>
                <tr>
                    <td class="header">Place</td>
                    <td class="header R">Prize</td>
                </tr>
                <tr class="light">
                    <td class="value">1st Place </td>
                    <td class="value R">$1,500</td>
                </tr>
                <tr class="dark">
                    <td class="value">2nd Place </td>
                    <td class="value R">$750</td>
                </tr>
                <tr class="light">
                    <td class="value">3rd Place </td>
                    <td class="value R">$400</td>
                </tr>
                <tr class="dark">
                    <td class="value">4th Place </td>
                    <td class="value R">$250</td>
                </tr>
                <tr class="light">
                    <td class="value">5th Place </td>
                    <td class="value R">$100</td>
                </tr>
            </tbody>
        </table>
        <p>Placement will always be dependant on final score at the end of each event. The rules for calculating final score will be specific to each problem and outlined within the problem statement of each series event.</p>
        
        <p><span class="bodySubtitle">Forums</span><br />
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