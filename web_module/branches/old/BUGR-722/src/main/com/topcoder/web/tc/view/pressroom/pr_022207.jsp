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
                    
<div align="right"><tc-webtag:forumLink forumID="514445" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</span><br>
<span class="bodySubTitle"><em>Top 80 Programmers from Around the World to Compete for $260,000 in Prizes<br>June 27th through 29th at The Mirage, Las Vegas </em></span></p>
</div>
      
<p>
<strong>Glastonbury, Conn., February 22, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 2007 TopCoder Open scheduled for June 27th - 29th  at The Mirage Las Vegas and that AOL will serve as title sponsor of the event. This year's event will bring a total of 80 talented competitors from around the world to compete in algorithm, development and design tracks as well as two new competitions - TopCoder Studio for graphic design and the Marathon Match event. Total prize purse across all competitions is $260,000. Online registration for multiple tracks opens Monday, February 19th and continues through March 27th.  For full TopCoder Open registration details please visit <a href="/tco07">http://www.topcoder.com/tco07</a>.
</p>
<p>
"The TopCoder Open is a great competition and we're pleased to sponsor the event," said Balan Nair, Chief Technology Officer, Technology Operations, AOL. "AOL is committed to providing the web development and programming community with the tools and resources to help drive innovation, and it's important to us to be involved with and help support activities and organizations like TopCoder."
</p>
<p>
The 2007 TopCoder Open onsite competitions will be broken down as follows:<br>
The Algorithm competition will comprise a group of 48 semifinalists with a first prize purse of $25,000;<br>
The software Design track will comprise a group of 8 finalists with a first prize of $25,000;<br>
The software Development track will comprise a group of 8 finalists with a first prize of $15,000;<br>
The new TopCoder Studio competition will comprise a group of 8 finalists with a first prize of $15,000;<br>
The TopCoder Marathon Match will comprise a group of 8 finalists with a first prize of $15,000.
</p>
<p>
AOL provides a range of resources for developers to build customized third-party applications, plug-ins and mashups based on its leading products and services. For more information about available open APIs, tools and documentation for services such as Open AIM&#174;, AIM&#174; Pages, AIM&#174; Phoneline, AOL&#174; Video Search, MapQuest&#174;, Winamp&#174; and others, please visit ( <a href="<tc-webtag:linkTracking link="http://dev.aol.com/"/>" target="_blank" refer="pr_022207"/>http://dev.aol.com/</a> ). For information about AOL, visit  <a href="<tc-webtag:linkTracking link="http://www.aol.com/"/>" target="_blank" refer="pr_022207"/>http://www.aol.com/</a>.
</p>
<p>
TopCoder competitions currently include the annual TopCoder Collegiate Challenge, TopCoder Open and inaugural TopCoder High School tournaments, weekly online Single Round Matches, Marathon Matches, the Digital Run series and private label events such as Google Code Jam. TopCoder also offers multiple software design, development and assembly competitions 24 x 7 in which real world business solutions are built. In addition, TopCoder Studio provides a competitive arena for creative skills such as graphic arts and design. TopCoder membership is free and brings with it eligibility to compete in high profile tournaments, discussions and learning via round tables and educational forums, as well as access to some of the world's leading employers of software developers. 
</p>
<p>
"Las Vegas is a spectacular venue for the TCO 07 sponsored by AOL," said Rob Hughes, President and COO of TopCoder, Inc. "We believe our competitors, sponsors and audience alike will find this the most exciting and entertaining TopCoder Open yet!"
</p>
<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.
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
