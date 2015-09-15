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
                    
<div align="right"><tc-webtag:forumLink forumID="520896" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Finalists Announced for 2008 TopCoder Open<br />May 12-15 in Las Vegas</span><br />
<span class="bodySubTitle"><em>TopCoder Members Representing 30 Countries to Compete for Recognition, Honors and<br />Share of $260,000 in Prize Money</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., April 15, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the list of finalists for the 2008 TopCoder Open (TCO). The live rounds scheduled for May 12th - May 15th at the Mirage Resort in Las Vegas, will match the top 120 finalists spanning four tournament tracks in 5 competitions for a share of $260,000 in prizes. Full details including event schedules, rules and guidelines are available online at: <a href="/tco08">http://www.topcoder.com/tco08</a> .
</p>

<p>
"This year's TopCoder Open has assembled the largest representation of our member base ever," said Rob Hughes, President and COO of TopCoder, Inc. "In terms of the number of finalists we're bringing onsite,  the geographic distribution of those members and the growing list of competition tracks for highlighting the increasing variety of skill sets, it's a powerful illustration of the reach and impact of TopCoder around the world."
</p>

<p>
The annual TopCoder Open draws the world's top software developers from around the world to match skills in a variety of competitions, with more than 4,700 talented competitors registered across all competitions. This year's TCO features 5 competitions in four highly contested tournament tracks - the Algorithm Competition, Component Design and Development Competitions, Marathon Match Competition and Studio Design Competition. TopCoder competitive events offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
</p>

<p>
The total prize purse for the 2008 TopCoder Open will pay out $260,000 across all competitions, with first place prizes broken down as follows:
</p>
<ul>
    <li>Algorithm competition: $15,000;</li>
    <li>Software Design: $25,000;</li>
    <li>TopCoder Studio: $20,000;</li>
    <li>TopCoder Marathon Match: $10,000.</li>
</ul>

<p>
<strong>The TopCoder Open (TCO)</strong> is host to both professional and collegiate developers, who compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers and business professionals of all levels. The TopCoder Software Symposium, held onsite at the TCO, features a series of seminars just for developers, with special guests on hand as keynote speakers.
</p>

<p>
<span class="bodySubtitle">About TopCoder Competitions</span><br />
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
</p>
<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing over 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
