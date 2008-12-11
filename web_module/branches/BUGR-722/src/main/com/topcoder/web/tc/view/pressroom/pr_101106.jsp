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
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="506140" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL to Webcast TopCoder World Championship of Computer Programming Live on November 17</span><br />
<span class="bodySubTitle"><em>TopCoder Collegiate Challenge Offers High Stakes Computing<br>Competition to Global Audience Exclusively on AOL Developer Site</em></span></p>
</p>
</div>
      
<div align="center">
<A href="/movies/tournament/tccc06/tccc06AOLWebcast.mpeg"><img src="/i/pressroom/watchTheTrailer.png" alt="Watch the Trailer" /></A>
</div>                  
<p><strong>Glastonbury, Conn. & Dulles, Va., October 11, 2006 &#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, and AOL, a global Web services company, today announced that the 2006 TopCoder&#174;  Collegiate Challenge will be webcast live on Friday, November 17. This first of its kind program will present the excitement and drama of 64 of the world's best collegiate programmers competing against the clock and each other for a share of $200,000 in prizes. The 2006 TopCoder Collegiate Challenge will be produced live from San Diego, California and distributed worldwide exclusively via title sponsor AOL's developer site. For more details and updates, check: <A href="http://dev.aol.com/" target="_blank">http://dev.aol.com/</A> or http://www.topcoder.com/. 
<br><br>
"One of TopCoder's core goals is to bring value to the programming community, and with the help of AOL we'll now be able to present much of the excitement and thrill of the onsite contest live, via the internet," said Rob Hughes, President and COO of TopCoder, Inc. "We'll have some special surprises in store, including celebrity commentators and powerful production technologies using multiple cameras, screens and data feeds that will allow a menu of end-user choices and create a custom feel for viewers." 
<br><br>
Thousands of the brightest students from computer science, mathematics, physics and other fields representing 92 countries from around the world are now locked in qualifying heats for the chance to be one of the elite 64 contestants flown in all expenses paid to the TopCoder Collegiate Challenge San Diego finals. 
<br><br>
On Friday, November 17, viewers will be able to visit AOL's developer site at <A href="http://dev.aol.com/" target="_blank">http://dev.aol.com/</A> to watch the competition unfold live starting at 1:30 p.m. PST. Over the course of the four hour webcast, viewers will be able to watch the high stakes software competition through live views of the arena, entertaining profiles and interviews with contestants - and in-depth coverage of the final results - in real time.
<br><br>
"We are really pleased to provide the live webcast of the 2006 TopCoder Collegiate Challenge finals. For the first time, the worldwide developer community will have an opportunity to experience this premier computer programming contest as the finalists compete in real-time at the event," said John McKinley, AOL's Chief Technology Officer. "AOL is committed to providing the web development community with the tools and resources to help drive innovation, and we think it's tremendously important to support great activities and organizations like TopCoder."
<br><br>
AOL provides a range of resources for developers to build customized third-party applications, plug-ins and mashups based on its leading products and services. For more information about available open APIs, tools and documentation for services such as Open AIM&#174;, AIM&#174; Pages, AIM&#174; Phoneline, AOL&#174; Video Search, MapQuest&#174;, Winamp&#174; and others, please visit <A href="http://dev.aol.com/" target="_blank">http://dev.aol.com/</A>. 
<br><br>
<span class="bodySubtitle">About AOL</span><br>
AOL is a global Web services company that operates some of the most popular Web destinations, offers a comprehensive suite of free software and services, runs the country's largest Internet access business, and provides a full set of advertising solutions. A majority-owned subsidiary of Time Warner Inc. AOL LLC is based in Dulles, Virginia. AOL and its subsidiaries also have operations in Europe, Canada and Asia. Learn more at AOL.com.
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">http://www.topcoder.com/</A>.

TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
</p>
                                                
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
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

<jsp:include page="../foot.jsp" />

</body>

</html>
