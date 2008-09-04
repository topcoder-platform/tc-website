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
                    
<div align="right"><a href="/openaim/forums">Discuss this press release</a></div>
                        
<p align="center"><b>TopCoder 
Awards $100,000 in Prize Money to Winners of AOL's Open AIM Developer 
Challenge during TopCoder Open in Las Vegas</b> <br></p>
<p align="center"><b><i>Competition 
Delivered 53 New Mashups, Widgets and Plugins </i></b></p>
<p align="center"><b><i>Built 
Using AOL's Open AIM APIs </i></b> <br></p>
<p><b>Las Vegas 
(2008 TopCoder Open) and Glastonbury, Conn. 
- May 19, 2008</b> - TopCoder and AOL today announced the winners 
of AOL's Open AIM Developer Challenge. These winners were awarded 
$100,000 in prize money, live and on stage, at the 2008 TopCoder Open, 
the world's most elite software developer face-off, at the Mirage 
in Las Vegas. In just two short months of competition, TopCoder community 
members created an incredible 53 new applications using new Open AIM 
APIs, extending the power of AOL's leading instant messaging platform 
in powerful new ways. <br></p>
<p>With cash prizes up for grabs 
in the Developer Challenge, creativity was unleashed, with applications 
submitted that do everything from live desktop sharing over AIM to instant 
language translation. A purely fun plugin even makes animal noises when 
the animal name is typed in the message window. Winners were chosen 
based upon innovation, actual download and usage stats for each application, 
best use of Open AIM API functionality, and popularity in separate voting 
by both the TopCoder community and by AOL. A list of the winning developers 
with descriptions of their applications follows below. <br>
</p>
<p>"We're pleased to have 
taken part in such a creative and exciting competition, and even more 
pleased with the bold and innovative AIM applications that resulted," 
said Kevin Conroy, Executive Vice President, AOL. "When we opened 
up our messaging network wider than ever before in March we sought to 
empower the web community to leverage the AIM network in bold new ways, 
and we were not let down. Kudos to the participating developers. We 
look forward to sharing their creations with our users."  <br>
</p>
<p>The full gallery of competition 
submissions is online at the Open AIM Developer Challenge homepage at: <a href="http://www.topcoder.com/openaim" target="_blank"><u>http://www.topcoder.com/openaim</u></a>.  <br></p>
<p>"These new applications were 
just built, yet we're already seeing them being downloaded all over 
the world, and popping up on social networks everywhere, because the 
flexibility and choice to build any imaginable client drives tremendous 
creativity, resulting in innovative new AIM plugins that users really 
want," said Rob Hughes, President and COO of TopCoder. "The TopCoder 
community, both long-time members and new competitors that joined for 
the Open AIM Developer Challenge, really came through - showing what 
top developers are truly capable of when competing to extend AIM in 
new ways." <br></p>
<p><b>Open AIM Developer Challenge 
Winners:  </b></p>
<p>A prize of $10,000 was awarded 
to the nine top winning applications. An additional 20 secondary winners 
were also awarded $500 each. Full details on all the winning applications 
and the members who built them are <a href="http://www.topcoder.com/openaim" target="_blank"><u>available online</u></a>. The top nine winning applications, 
available for download, include: <br></p>
<ul type="DISC">
  <li><b>IM Remote:</b> 
  A plugin that lets users share their desktop with a buddy using AIM.</li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/03/31/desktop-sharing-through-aim-with-im-remote/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/03/31/desktop-sharing<WBR>-through-aim-with-im-remote/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>IM Loud: </b>
  A plugin that lets users listen to their instant messages. </li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/03/13/first-submission-im-loud/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/03/13/first-submission<WBR>-im-loud/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>IM Whiteboard:</b> 
  An AIM plugin that lets users draw simultaneously with their buddies.</li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/03/25/draw-with-your-buddies-with-im-whiteboard/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/03/25/draw-with-your<WBR>-buddies-with-im-whiteboard/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>LinkPreview:</b> 
  A plugin that lets AIM users preview an URL by hovering over a link.</li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/04/07/preview-links-in-aim-without-opening-with-linkpreview/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/04/07/preview-links-in<WBR>-aim-without-opening-with<WBR>-linkpreview/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>Free2IM: </b>
  A plugin that enables instant language translation between AIM buddies.</li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/05/06/instant-language-translation-with-free2im/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/05/06/instant-language<WBR>-translation-with-free2im/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>Share-A-Map:</b> 
  An AIM plugin that lets friends customize and share maps. </li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/04/16/share-maps-with-a-buddy-with-share-a-map/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/04/16/share-maps-with-a<WBR>-buddy-with-share-a-map/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>PopsChat:</b> 
  An AIM plugin for the TopCoder Arena that provides integration of AIM 
  features. </li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/04/11/popschat-an-aim-plugin-for-the-topcoder-arena/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/04/11/popschat-an-aim<WBR>-plugin-for-the-topcoder-arena/</u></a> <br>
</p>
<ul type="DISC">
  <li><b>FeedReader:</b> 
  A plugin for AIM users that lets them manage their RSS feeds from within 
  AIM.</li>
</ul>
<p><a href="http://openaimblog.aol.com/2008/04/02/use-aim-to-track-your-rss-feeds-with-feedreader/" target="_blank"><u>http://openaimblog.aol.com<WBR>/2008/04/02/use-aim-to-track<WBR>-your-rss-feeds-with-feedreader<WBR>/</u></a> <br>
</p>
<p><b>About AOL <br>
</b>AOL is a global Web services company that operates some of the most 
popular Web destinations, offers a comprehensive suite of free software 
and services, runs one of the largest Internet access businesses in 
the U.S., and provides a full set of advertising solutions. A majority-owned 
subsidiary of Time Warner Inc., AOL LLC and its subsidiaries have operations 
in the U.S., Europe, Canada and Asia. Learn more at AOL.com. <br>
</p>
<p><b>About TopCoder, Inc.</b></p>
<p>TopCoder is the world's largest 
competitive software development community with over 150,000 developers 
representing more than 200 countries.  TopCoder hosts the largest and 
most comprehensive developer ratings and performance metrics available.  
 The TopCoder community builds software for a wide-ranging client base 
through a competitive, rigorous, standards based methodology.   This methodology 
results in a highly consistent set of software components allowing a 
software-as-parts approach to application development.  TopCoder makes 
this large library of software components built through competition 
available to all of our clients.  Utilizing a world-wide member base 
and this library, TopCoder seeks to lower the cost of software development 
while increasing both the speed at which applications can be developed 
and the quality of the ultimate application. For more information about 
utilizing TopCoder's software services or sponsoring TopCoder events, 
visit <a href="http://www.topcoder.com/" target="_blank"><u>http://www.topcoder.com/</u></a>.   <br></p>
<p align="center"><b><i>TopCoder 
is a registered trademark of TopCoder, Inc. in the United States and 
other countries. All other product and company names herein may be trademarks 
of their respective owners.</i></b></p>

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
