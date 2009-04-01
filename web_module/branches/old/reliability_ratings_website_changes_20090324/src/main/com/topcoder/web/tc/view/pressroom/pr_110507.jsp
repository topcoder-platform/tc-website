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
                    
<div align="right"><tc-webtag:forumLink forumID="518220" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Students from Russian Federation, China, Indonesia and United States Win 2007 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Top Ranked Winners Bring Home International Honors and $260,000 Prize Money from Global Software Development Competition at Disney World</em></span></p>
</div>
      
<p>
<strong>ORLANDO, FLA. AND GLASTONBURY, CONN., November 5, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the winners in the 2007 TopCoder Collegiate Challenge. The annual competition, open to all higher education students worldwide, drew thousands of online competitors, and culminated with four intensive days of competition for the 120 top semi-finalists in a dynamic culminating event at Disney World. Sponsored by Lilly, Deutsche Bank, and patron NSA, the TopCoder Collegiate Challenge assembled the best and brightest technical students in the world in the premier event for software development collaboration and competition.
</p>

<p>
Representing 26 countries from around the world, 120 students flew to Disney World for the TopCoder Collegiate Challenge to compete live in the tournament's semifinals and the championship round on November 2nd at Disney's Contemporary Resort. Competitors qualified to be flown to the TopCoder Collegiate Challenge by earning a top global ranking in online qualifying rounds of competition involving more than 3,200 members earlier this summer. Five students achieved the title of TopCoder Collegiate Challenge Champion for 2007 in the following categories:
</p>
<ul>
    <li><strong>TopCoder Algorithm Competition Champion</strong> - Petr Mitrichev (<tc-webtag:handle coderId="10574855" context="algorithm"/>) from Moscow State University, Russian Federation, won $25,000 U.S. and earned recognition as the fastest and most accurate coder, by solving word problems of increased difficulty through written software code and withstanding challenges by competitors seeking to crack, or break the code by finding bugs.</li>
    <li><strong>Software Component Design Champion</strong> - Nikolay Archak (<tc-webtag:handle coderId="293874" context="design"/>) from New York University, Russian Federation, won $25,000 U.S. for producing the best full set of software component design documentation.</li>
    <li><strong>Software Component Development Champion</strong> - Ninghai Huang (<tc-webtag:handle coderId="9998760" context="development"/>) from Jiangsu Haimen, China, won $15,000 U.S. for best development and implementation of a software application.</li>
    <li><strong>TopCoder Studio Design Champion</strong> - Junius Albertho (<tc-webtag:handle coderId="22689218" />) from Universita Utaras Sumatera, Indonesia, won $15,000 U.S. for winning a 36-hour long creative web and graphic design competition that culminated in an 8-hour live challenge.</li>
    <li><strong>Marathon Match Champion</strong> - Michael Skinner (<tc-webtag:handle coderId="7454301" context="marathon_match"/>) from the University of Washington, United States, won $15,000 U.S. for winning the ultimate test of coding endurance, a multi-week competition that culminated in an 8-hour on-site challenge pitting their coded solutions against hundreds, even thousands of test cases.</li>
</ul>

<p>
"On behalf of Lilly, Deutsche Bank, NSA and our entire community of more than 128,000 TopCoder members, we'd like to congratulate all the finalists for their tremendous showing in this year's TopCoder Collegiate Challenge," said Rob Hughes, president and COO for TopCoder. "This is an empowering experience integrating education, challenge and technical skill that impacts participants at every level, and it speaks volumes about these individuals that they emerged as champions against the highest level of competition in the world."
</p>

<p>
Visit the TopCoder Collegiate Challenge web site for event video, photos and blogging at:  <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tccc07&d3=about">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tccc07&d3=about</a>.
</p>

<p>
A downloadable program including profiles of all 120 finalists, and details on the individual competitions, is available online at: <a target="_blank" href="http://www.topcoder.com/pdfs/tournaments/TCCC07_Program_View.pdf">http://www.topcoder.com/pdfs/tournaments/TCCC07_Program_View.pdf</a>.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
