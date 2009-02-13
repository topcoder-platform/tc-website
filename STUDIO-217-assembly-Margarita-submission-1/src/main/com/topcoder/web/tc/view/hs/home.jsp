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
                <br />
                <div align="center">
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                </div>
                <br />

                    <span class="title">TopCoder High School</span>
                    <br /><br />
                    We are excited to announce the new season of the TopCoder High School tournament. In the spirit of all other TopCoder competitions, TopCoder High School seeks to be the premier computer programming tournament for high school-aged math and science students enrolled in secondary schools or equivalent programs world-wide.
                    <br /><br />
                    Given the competitive technological nature of today's world, we believe it is more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's surroundings. By having a tournament for high school-aged students, TopCoder is doing its part to ensure that there is a fun and competitive learning environment where students from around the world can build and showcase their talent.
                    <br /><br />
                    <span class="subtitle">Overview</span><br />
                    TopCoder will be holding weekly events, called Single Round Matches (SRMs), which will be available only to high school students. The SRMs will allow students to demonstrate their problem-solving skills by unraveling complex word problems through the use of a computer language - either Java, C++, C# or VB.Net. The worldwide TopCoder High School tournament will begin in December 2008 and will culminate in a large onsite final event at
                    <a href="http://www.cs.purdue.edu/" target="_blank">Purdue University</a> in March 2009.
                    <br /><br />
                    <span class="subtitle">Prizes</span><br />
                    Based on support from local, national and international sponsors, prizes will take the form of scholarships, hardware, software and educational materials awarded to individuals and schools. We will be enlisting the support of students to help spread the word and engage sponsors at the local level.
                    <br /><br />
                    <span class="subtitle">Who can Compete</span><br />
                    In order to be eligible to compete in TCHS competitions, students must be between the ages of 13 and 20 (inclusive) and must not yet be enrolled at a college or university.
                    <br /><br />
                    <a href="/tc?module=HSViewRegister">Register for Season 3</a>
                    <br /><a href="/reg/">Register for TopCoder High School competitions <strong>and</strong> Season 3</a>
                    <br /><br />
                    <span class="subtitle">TCHS Tournament Rules</span><br />
                    We have posted the <a href="/tc?module=Static&amp;d1=hs&amp;d2=rules">rules</a> for the upcoming 2009 TCHS Tournament. Please take the opportunity to read through them. 
                    Any questions that arise should be posted in the Algorithm and High School Competitions Discussions <a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=7167">forum</a>.
                    <br /><br />
                    <span class="subtitle">TCHS Referral Program</span><br />
                    Refer and Win!  Read more <a href="/tc?module=Static&amp;d1=hs&amp;d2=referralProgram">here</a>.
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