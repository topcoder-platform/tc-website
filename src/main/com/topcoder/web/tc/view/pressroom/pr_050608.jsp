<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="521066" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Betfair Joins 2008 TopCoder Open Sponsors</span><br />
<span class="bodySubTitle"><em>Las Vegas Event is Premier Showcase for Computing Skills and Talent</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., May 6, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Betfair, the world's leading betting exchange, as a sponsor of the 2008 TopCoder Open in Las Vegas, NV. Betfair joins AOL, Lilly, NSA, VeriSign and BT in support and sponsorship of the 2008 TopCoder Open. The live finals for competitive programming's top tournament, scheduled for May 11th - May 15th at the Mirage Resort in Las Vegas, will match the top 120 finalists spanning four tournament tracks in competition for a share of $260,000 in prizes. Full details including event schedules, rules and guidelines are available online at: <a href="/tco08">http://www.topcoder.com/tco08</a> .
</p>

<p>
"Betfair is committed to attracting the world's best and brightest software technologists to its global team and challenging them to solve interesting and demanding problems," said Rorie Devine, Betfair CTO. "We are very excited to sponsor the TCO. It's a great opportunity to raise our profile among a global community of talented software developers and to encourage their participation in the Betfair Developers Program."
</p>

<p>
The annual TopCoder Open (TCO) draws the world's top software developers from around the globe to match skills in a variety of competitions, with more than 4,600 talented competitors registered across all competitions. This year's TCO features four highly contested tournament tracks - the Algorithm Competition, Component Design and Development Competitions, Marathon Match Competition and Studio Design Competition. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
</p>

<p>
"Being a finalist in a TopCoder competition is a powerful resume builder," said Rob Hughes, president and COO of TopCoder, Inc. "Smart organizations, like Betfair and our other TCO sponsors and patrons, understand the critical value of being proactive as they search for great talent."
</p>

<p>
<span class="bodySubtitle">About the Betfair Developers Program</span><br />
The Betfair Developers Program is a program dedicated to assisting Betfair users to integrate their business or personal needs with the Betfair exchange platforms. A member of the Betfair Developers Program can use the Betfair API's to create custom applications for personal, commercial or third party use.
</p>

<p>
<span class="bodySubtitle">About Betfair APIs</span><br />
The <strong>Games</strong> API allows developers to write their own applications that seamlessly integrate with the Betfair Games system. This offers the potential to build a wide range of applications from a new client front end to the system as an alternative to the existing website, to an automated betting tool. The implementation of the web service uses a framework known as Representational State Transfer (REST). This enables developers to interact with the Betfair Games system using simpler development and runtime technologies like HTTP and XML.
</p>

<p>
The <strong>Sports</strong> API enables developers to create applications that provide a customized interface, functionality and specialized operations not otherwise afforded by the web interface. For more information visit <a target="_blank" href="<tc-webtag:linkTracking link='http://bdp.betfair.com/' refer='pr_050608' />">http://bdp.betfair.com/</a> .
</p>

<p><strong>Please note: Betfair does not accept registration and/or gambling activities from residents of the United States.</strong></p>

<p>
<span class="bodySubtitle">About Betfair</span><br />
Betfair is the world's leading online betting exchange, a concept it has pioneered. Driven by cutting-edge technology, Betfair processes 15 million transactions a day and more than 300 bets a second. Launched in 2000, Betfair is a profitable and debt-free company with annual revenues exceeding £180 million. It is a privately-owned company with a worldwide workforce of 1300 representing over 60 different nationalities. The global headquarters are in London.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 150,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
