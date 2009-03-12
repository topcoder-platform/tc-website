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
                    
<div align="right"><tc-webtag:forumLink forumID="520966" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">BT Joins Sponsors of 2008 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Leading Provider of Communications Solutions Teams Up with AOL, Lilly, NSA and<br />VeriSign in Support of Computer Programming Championship</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., April 2, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that BT  has joined AOL, Lilly, NSA and VeriSign in support and sponsorship of the 2008 TopCoder Open. The live finals for competitive programming's top tournament, scheduled for May 11th - May 15th at the Mirage Resort in Las Vegas, will match the top 120 finalists spanning four tournament tracks in competition for a share of $260,000 in prizes. Full details including event schedules, rules and guidelines are available online at: <a href="/tco08">http://www.topcoder.com/tco08</a>.
</p>

<p>
"BT is delighted to sponsor the innovative TopCoder Open," said Al-Noor Ramji, CIO, BT Group and CEO, BT Design. "At BT, we are harnessing the power of our software-driven innovation ecosystem.  Partnering with the world's leading programming minds is core to that strategy. We look forward to helping these remarkably talented people achieve their objectives."
</p>

<p>
The annual TopCoder Open (TCO) draws the world's top software developers from around the globe to match skills in a variety of competitions, with more than 4,600 talented competitors registered across all competitions. This year's TCO features four highly contested tournament tracks - the Algorithm Competition, Component Design and Development Competitions, Marathon Match Competition and Studio Design Competition. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
</p>

<p>
"We believe a global organization such as BT is a great sponsorship match for our international member base and competitions," said Rob Hughes, president and COO of TopCoder, Inc. "Given the rapid adoption and growing importance of social networks to innovative organizations like BT, TopCoder provides recognized leadership and a proven model for delivering tangible results from an expert global community."
</p>

<p>
<span class="bodySubtitle">About TopCoder Competitions</span><br />
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
</p>

<p>
<strong>The TopCoder Open</strong> is host to both professional and collegiate developers, who compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers and business professionals of all levels. The TopCoder Software Symposium, held onsite at the TCO, features a series of seminars just for developers, with special guests on hand as keynote speakers.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

<p>
<span class="bodySubtitle">About BT</span><br />
BT is one of the world's leading providers of communications solutions and services operating in 170 countries.  Its principal activities include the provision of local, national and international telecommunications services to our customers for use at home, at work and on the move; higher-value broadband and internet products and services and converged fixed/mobile products and services.  BT consists principally of four lines of business: BT Global Services, Openreach, BT Retail and BT Wholesale.
</p>
<p>
In the year ended 31 March 2007, BT Group plc's revenue was &pound;20,223 million with profit before taxation of &pound;2,484 million.
</p>
<p>
British Telecommunications plc (BT) is a wholly-owned subsidiary of BT Group and encompasses virtually all businesses and assets of the BT Group.  BT Group plc is listed on stock exchanges in London and New York.
</p>
<p>
For more information, visit <a target="_blank" href="http://www.bt.com/aboutbt">www.bt.com/aboutbt</a>.
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
