<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School</title>

    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
            <div class="myTCBody">

              <!--  <div align=center>
                    <img src="/i/hs/hs_banner_stepup.jpg" alt="Step up to the challenge" border=0 clear="all">
                </div> -->
                <div align="center" style="margin-top: 15px;">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>
                <p>
                <h2>TopCoder High School</h2>

We are excited to announce the addition of a new level of competition at TopCoder &ndash; the TopCoder High School tournament. In the spirit of all other TopCoder competitions, TopCoder High School seeks to be the premier computer programming tournament for high school-aged math and science students enrolled in secondary schools or equivalent programs world-wide.
<br/><br/>
Given the competitive technological nature of today's world, we believe it is more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's surroundings. By adding a tournament for high school-aged students, TopCoder is doing its part to ensure that there is a fun and competitive learning environment where students from around the world can build and showcase their talent.
<br/><br/>
<span class="bodySubtitle">Overview</span><br/>
Beginning in June 2006, TopCoder will hold weekly events, called Single Round Matches (SRMs), which will be available only to high school students. The SRMs will allow students to demonstrate their problem-solving skills by unraveling complex word problems through the use of a computer language &ndash; either Java, C++, C# or VB.Net. Students will be able to compete either as an individual or as part of a team representing their school, or, in case they are not affiliated with a school, representing their town or themselves. The worldwide TopCoder High School tournament will begin in early 2007 and will culminate in a large onsite final event on a U.S. college or university campus in May 2007.
<br/><br/>
<span class="bodySubtitle">Prizes</span><br/>
Based on support from local, national and international sponsors (see below) prizes will take the form of scholarships, hardware, software and educational materials awarded to individuals and schools. We will be enlisting the support of students to help spread the word and engage sponsors at the local level.
<br/><br/>
<span class="bodySubtitle">Your Support</span><br/>
TopCoder does NOT intend to make a profit on its high school offerings. Any proceeds through sponsorship will be used to defray costs. Funds in excess of costs for the program will be contributed to prize offerings. TopCoder is looking to the community at the local, national and international level for financial support. There are a variety of sponsorship opportunities available for anyone &ndash; parents, teachers, community members, local businesses, multi-national corporations &ndash; who is interested in supporting a team, individual or the entire tournament. Sponsorship proceeds will be used for prizes as well as to cover team and individual expenses for travel. Please <a href="mailto:sponsortchs@topcoder.com">contact us</a> to learn more.
<br/><br/>
<span class="bodySubtitle">Stay Tuned</span><br/>
As we firm up the structure of the tournament, we will post changes to the TopCoder web site and will contact those interested by email. So, start practicing and, as always, good luck to you in the arena!
<br/><br/>

<a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=509013">Discuss TopCoder High School</a>
<br/><br/>
                </p>

            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
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
