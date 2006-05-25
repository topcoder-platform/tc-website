<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School</title>

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
            <jsp:param name="node" value="hs_overview"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
            <div class="myTCBody">

                <div align="center" style="margin-top: 15px;">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

<span class="title">TopCoder High School</span>
<br><br>
We are excited to announce the addition of a new level of competition at TopCoder - the TopCoder High School tournament. In the spirit of all other TopCoder competitions, TopCoder High School seeks to be the premier computer programming tournament for high school-aged math and science students enrolled in secondary schools or equivalent programs world-wide. 
<br><br>
Given the competitive technological nature of today's world, we believe it is more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's surroundings. By adding a tournament for high school-aged students, TopCoder is doing its part to ensure that there is a fun and competitive learning environment where students from around the world can build and showcase their talent. 
<br><br>
Overview
Starting on June 5, 2006, TopCoder will hold weekly events, called Single Round Matches (SRMs), which will be available only to high school students. The SRMs will allow students to demonstrate their problem-solving skills by unraveling complex word problems through the use of a computer language - either Java, C++, C# or VB.Net.  The worldwide TopCoder High School tournament will begin in February 2007 and will culminate in a large onsite final event at <A href="http://www.cs.purdue.edu/" target="_blank">Purdue University</A> in May 2007. 
<br><br>
<span class="subtitle">Prizes</span><br>
Based on support from local, national and international sponsors, prizes will take the form of scholarships, hardware, software and educational materials awarded to individuals and schools. We will be enlisting the support of students to help spread the word and engage sponsors at the local level. 
<br><br>
<span class="subtitle">Who can Compete</span><br>
Students will be able to compete either as an individual or as part of a team representing their school, or, in case they are not affiliated with a school, representing their town or themselves.  In order to be eligible to compete in TCHS competitions, students must be between the ages of 13 and 20 (inclusive) and must not yet be enrolled at a college or university.  All students who register from a school will be part of that school's team.  Eligible students who do not attend a school can register to compete as an individual.  In order to be eligible for participation in the TopCoder High School tournament, teams and individuals must participate in at least four (4) of the rated events for their region between June 2006 and February 2007.  Registration for TopCoder High School is simple, so <A href="/reg/">start now</A>.
<br><br>

<a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=509013">Discuss TopCoder High School</a>
<br><br>

            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
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
