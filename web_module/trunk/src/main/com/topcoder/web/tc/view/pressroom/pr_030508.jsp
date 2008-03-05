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
                    
<div align="right"><tc-webtag:forumLink forumID="520184" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL, Lilly and VeriSign Return as Sponsors &amp; NSA Returns as Patron of 2008 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Competitive Programming's Top Tournament Underway with Continued Support of<br />AOL, Lilly, NSA and VeriSign; Expanded Field of 120 Finalists to<br />Compete for $260,000 Prize Money in Las Vegas</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., March 5, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced  AOL, Eli Lilly and Company (NYSE: LLY) and VeriSign, (NASDAQ: VRSN), will be encore sponsors of the 2008 TopCoder Open, with live finals scheduled for May 11<sup>th</sup> - May 15<sup>th</sup> at the Mirage Resort in Las Vegas. In addition, the National Security Agency (NSA) continues as an event patron. Online competition is underway with more than 4,600 competitors worldwide, and will run through March. The top 120 finalists spanning four competition tracks will compete for a share of $260,000 in prizes. Full details including event schedules, rules and guidelines are available online at: <a href="/tco08">http://www.topcoder.com/tco08</a>
</p>

<p>
"We are excited to have the continued support of such a high profile and forward thinking group of innovation leaders," said Rob Hughes, president and COO of TopCoder, Inc. "Given the recent explosion and growing importance of social networks and Web 2.0 companies, the TopCoder Community is a recognized leader in delivering tangible results on the global stage."
</p>

<p>
The TCO sponsor track will for the first time offer sponsors more equal billing - each will be afforded the same opportunities for global branding and interfacing with the TopCoder community and onsite finalists. The annual TopCoder Open draws the world's top software developers from around the world to match skills in a variety of competitions, with more than 4,600 talented competitors registered across all competitions.
</p>

<p>
This year's TCO features four highly contested tournament tracks - the Algorithm Competition, Component Design and Development Competitions, Marathon Match Competition and Studio Design Competition. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
</p>

<p>
<span class="bodySubtitle">About TopCoder Competitions</span><br />
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
</p>

<p>
<strong>The TopCoder Open (TCO)</strong> is host to both professional and collegiate developers, who compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers and business professionals of all levels. The TopCoder Software Symposium, held onsite at the TCO, features a series of seminars just for developers, with special guests on hand as keynote speakers.
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
