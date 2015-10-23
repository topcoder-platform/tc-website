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
                    
<div align="right"><tc-webtag:forumLink forumID="527346" message="Discuss this press release" /></div> 
                        
<div align="center">
<p align="center"><strong>IEEE-USA Becomes Sponsor of 2009 TopCoder Open</strong><br />
  <span class="bodySubTitle"><em>World's Largest Technical Professional Society Joins Sponsors of TCO09 in Las Vegas</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. - April 9, 2009</strong> - <a href="http://www.topcoder.com" target="_blank">TopCoder, Inc.</a>, today announced that <a href="http://www.ieeeusa.org/">IEEE-USA</a> has joined the group of distinguished sponsors and patrons of the <a href="http://www.topcoder.com/tco09">2009 TopCoder Open</a>, (TCO09).&nbsp; The online computer programming and graphic design tournament challenges thousands of programmers and creative people worldwide and culminates June 1st -4th when the top 100 finalists spanning multiple competition tracks will compete live&nbsp; onsite at the <a href="http://www.mirage.com/">Mirage Resort</a> in Las Vegas for a share of $150,000 in prizes. </p>

<p>IEEE-USA joins sponsor SNIA-XAM and patron NSA in support of the world's premier competitive programming competition. Full details including event schedules, rules and guidelines are available online at: <a href="http://www.topcoder.com/tco09">www.topcoder.com/tco09</a>.</p>

<p>IEEE-USA is part of IEEE, the world's largest technical professional society with 375,000 members in 160 countries. IEEE publishes 30 percent of the world's literature in the electrical and electronics engineering and computer science fields, and has developed nearly 900 active industry standards. The organization, which is celebrating its 125th anniversary in 2009, annually sponsors more than 900 conferences worldwide. See <a href="http://www.ieee.org">www.ieee.org</a>. </p>

<p>&quot;The TopCoder competition brings together some of the best programmers in the world,&quot; IEEE-USA President Gordon Day said. &quot;We encourage these talented people to become IEEE members so they can realize the benefits of belonging to an organization of fellow tech-minded individuals. We think TopCoder's goals align well with ours at IEEE-USA.&quot;</p>
<p>The IEEE Computer Society is the largest of IEEE's 38 technical societies. Computer Society members work in a wide range of computing fields such as artificial intelligence, graphics, microprocessors, IT, networking, information security and software engineering.</p>
<p>&quot;IEEE as an organization is synonymous with worldwide recognized standards and engineering excellence,&quot; said Rob Hughes, president and COO of TopCoder, Inc. &quot;We share an ongoing and deep commitment to identifying best practices in software development as we serve our global communities of technical professionals.&quot;</p>
<p>The 2009 TopCoder Open (TCO) is a world-wide programming tournament that is open to all TopCoder members 18 and older, who are in good standing, and meet all other eligibility criteria. Taking part in the TCO09 gives competitors the opportunity to showcase their programming and/or design skills up against some of the best in the world. Becoming a TopCoder member is easy and free &ndash; register at: <a href="http://www.topcoder.com/reg/">http://www.topcoder.com/reg/</a>.</p>
<p>This year's TCO has expanded to include a record nine tracks of competition, offering a specialized opportunity for members to test their skills in every aspect of software. The full lineup of competition tracks include: Algorithm; Architecture; Assembly; Component Design; Component Development; Marathon; Mod Dash; Specification and Studio Design. </p>
<p>The TCO offers sponsors equal billing with the same opportunities for global branding and interfacing with the TopCoder community and onsite finalists. The annual TopCoder Open draws the top software developers from around the world to match skills in a variety of competitions, with the 2008 TCO having drawn more than 4,600 talented competitors registered across all competitions. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.</p>
<p><a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=home">The TopCoder Open</a> is host to both professional and collegiate developers, who compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers and business professionals of all levels. </p>
<p><strong>About IEEE-USA</strong><br>
IEEE-USA, located in Washington, D.C., advances the public good and promotes the careers and public policy interests of more than 210,000 engineers, scientists and allied professionals who are U.S. members of IEEE. IEEE-USA advises Congress, the administration and various federal agencies on issues such as national security, U.S. technological innovation and competitiveness, universal high-speed broadband access, intellectual property protection and retirement security, among others. See <a href="http://www.ieeeusa.org">www.ieeeusa.org</a>. &nbsp;</p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 187,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/">http://www.topcoder.com/</a> . </p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>

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
