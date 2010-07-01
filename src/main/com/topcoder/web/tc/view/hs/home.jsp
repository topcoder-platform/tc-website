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

                <div align="center"><br><br>
                    <img src="/i/tournament/tchs10/tchs10-logo.png" alt="TopCoder High School" border="0"><br><br><br><br>
				<span class="title"><span style="color:#5c9741; font: 'Times New Roman', Times, serif"><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22263204" target="_blank" class="coderTextRed">tourist</a> is the 2010 TopCoder High School Champion!</span></span><br>
                </div>
                <br />
                <div align="center">
                    <%--
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/tchs_spotlightbanner.jpg" alt="Spotlight Sessions" border="0"></a>
                    --%>                
              </div>
                <p align="center">
                    Overview&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSRules">Rules</a>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSSchedule">Schedule</a>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSResults">Results</a>
                </p>
                <br />
                <span class="title">TopCoder High School</span>
                    <p>TopCoder high school students, get ready!</p>
                    <p>Announcing the 2010 TopCoder High School Tournament! TopCoder is excited to bring back this premier programming tournament for high school-aged math and science students enrolled in secondary schools or equivalent programs world-wide.</p>
              <p>Given the competitive technological nature of today's world, we believe it is more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's surroundings. By having a tournament for high school-aged students, TopCoder is doing its part to ensure that there is a fun and competitive learning environment where students from around the world can build and showcase their talent.</p>
                <p><span class="subtitle">Overview</span>
                	<br />
           	  TopCoder is currently holding bimonthly contests, called Single Round Matches (SRMs), which are available for all TopCoder members who are high school students. The SRMs will allow students to demonstrate their problem-solving skills by unraveling complex word problems through the use of a computer language - either Java, C++, C# or VB.Net. They are also a great avenue for practicing for the tournament.&nbsp; Additionally there are a number of practice rooms and practice problems available in the Competition Arena.&nbsp; </p>
                <p>The worldwide TopCoder High School tournament will begin in February 27, 2010, and will finalize online in March.&nbsp; The tournament will consists of three online elimination rounds as well as one online Championship Round, all in the SRM format.
           	  </p>
                    <span class="subtitle">Prizes</span>
                	<br />
                	There will be $10,000 in prizes awarded!
                    </p>
                    <span class="subtitle">Who can Compete</span>
                	<br />
                	In order to be eligible to compete in TCHS competitions, students must be between the ages of 13 and 20 (inclusive) and must not yet be enrolled at a college or university.<br><br>
                    Please read the <a href="/tc?module=Static&d1=hs&d2=TCHSRules">rules and regulations</a> for more information.
                    </p>
           	    </p>
              <p>Register for <a href="http://www.topcoder.com/reg/">TopCoder</a>.</p>
                <span class="subtitle">Frequently Asked Questions:</span>
                	<ol>
                		<li><b>How can I take part in the 2010 TopCoder High School tournament?</b><br />
                			First, you must be a registered TopCoder member.&nbsp; If you are not, you may register <a href="http://www.topcoder.com/reg/">here</a>. Be sure when you register as a TopCoder member be sure to choose high school competitions.It is also important to make sure your date of birth is entered correctly. Once you are registered, it is a good idea to read up about TopCoder Single Round Matches (SRM) <a href="http://www.topcoder.com/wiki/display/tc/How+To+Compete+in+Algorithm+Competitions">here</a> and compete in a few SRMs to get used to them.<br />
               		  </li>
                        <li><b>Who can I contact if I am having difficulty registering as a high school member?</b><br />
                			If you have problems registering as a high school student on TopCoder or entered your date of birth incorrectly, please email <a href="mailto:support@topcoder.com">support@topcoder.com</a> with your handle and your date of birth.&nbsp; TopCoder will help you fix your registration problem.<br /></li>
                        <li><b>What are the eligibility criteria for high school students to be able to compete in the tournament?</b><br />
                			Please read the <a href="/tc?module=Static&d1=hs&d2=TCHSRules">rules and regulations</a> of the TCHS10 tournament for eligibility criteria.</li>
                        <li><b>How can I participate in TopCoder Single Round Matches (SRM)?</b><br />
                			You can check the <a href="http://www.topcoder.com/tc?module=Static&d1=calendar&d2=thisMonth">Event Calendar</a> for the schedule of the SRMs.&nbsp; As long as you are registered to compete on TopCoder, you can participate in the SRMs.&nbsp; Please read about the SRMs <a href="http://www.topcoder.com/wiki/display/tc/How+To+Compete+in+Algorithm+Competitions">here</a>.</li>
               		 </ol>
               </p>
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