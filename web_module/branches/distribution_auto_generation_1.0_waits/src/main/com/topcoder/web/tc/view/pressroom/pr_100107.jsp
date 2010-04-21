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
                    
<div align="right"><tc-webtag:forumLink forumID="517634" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament</span><br />
<span class="bodySubTitle"><em>Las Vegas to Host New Software Symposium as TopCoder's Annual Computing Contest Expands;  <br />120 to Compete for Top Honors and Share of $260,000 in Prize Money May 11-15, 2008</em></span></p>
</div>
      
<p>
<strong>Glastonbury, Conn., October 1, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced a new and improved 2008 TopCoder Open, with the finals set to take place May 11th to 15th, 2008 at The Mirage Las Vegas. This year's event is bigger and better, expanding the finalist pool by 50 percent to fly in 120 of the world's top software developers from around the world to match skills in a variety of competitions, from traditional algorithm, development and design tracks, to the newer TopCoder Studio for graphic design and Marathon Match events. New this year, a TopCoder Masters Invitational will headline the event, with past TopCoder champions competing live in an unprecedented challenge of the most elite talent. The 2008 TopCoder Open will also present a series of educational sessions featuring some of the top software engineering talents in the business sharing their expertise. The new TopCoder Software Symposium, taking place May 12-14, features four seminars just for developers, with three special guests on hand as Keynote Speakers (stay tuned as we head into 2008 for the Keynote Speaker Lineup announcement). For business professionals in attendance, TopCoder's Software Symposium hosts corporate sessions to address how the TopCoder community of more than 120,000 proven developers, and the power of TopCoder's competitions, provide direct benefit to your organization. For full TopCoder Open details visit <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=preview' refer='pr_100107' />">http://www.topcoder.com/tco08</a>.
</p>

<p>
"The power of competition drives development to new levels, and the TopCoder Open is an exciting event where the top competitors from our community of more than 120,000 software developers unite to challenge themselves and each other in arguably the most prestigious gathering of high tech talent ever assembled," said Rob Hughes, president and COO of TopCoder, Inc. "This is a great way to bring our community together live and in person, regardless of where in the world they live, to compete in the highest level of competition, learn from the best minds in the business and interact with other members from among their unequalled level of talent, all in the dynamic setting that only Las Vegas can offer."
</p>

<p>The total prize purse for the 2008 TopCoder Open will pay out $260,000 across all competitions, with first place prizes broken down as follows:</p>
    <ul>
        <li>Algorithm competition: $25,000;</li>
        <li>Software Design: $25,000;</li>
        <li>Software Development: $15,000;</li>
        <li>TopCoder Studio: $15,000;</li>
        <li>TopCoder Marathon Match: $15,000.</li>
        <li>The TopCoder Masters Invitational will comprise of a group of 10 finalists with a "winner take all" first prize of $20,000.</li>
    </ul>

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
