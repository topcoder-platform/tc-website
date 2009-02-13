<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
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
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
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

<div align="right"><tc-webtag:forumLink forumID="505814" message="Discuss this press release" /></div>

<div align="center">
<p><span class="bodyTitle">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006</span><br />
<span class="bodySubTitle"><em>World Championship of Competitive Programming Comes to Vegas Strip May 3<sup>rd</sup>-5<sup>th</sup></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, October 21, 2005 &#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that the world famous Aladdin Resort and Casino in Las Vegas, Nevada will host its 2006 flagship event, the TopCoder Open, May 3rd through 5th, 2006. Registration for the May 5th event will begin January 2nd for the Design and Development tracks and February 13th for the Algorithm competition. Full details will be available at <A href="/">http://www.topcoder.com</A> on December 5th, 2005.
<br><br>
<span class="bodySubtitle">TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current technologies are incorporated, including Java, C++, C#, VB.Net, UML, J2EE and .NET.
<br><br>
The TopCoder Open (TCO) is host to professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels. The TopCoder Collegiate Challenge (TCCC) involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. As with the TCO, the destination of the finals varies from year to year. In the past, TopCoder has hosted the TCCC during the spring timeframe, while the TCO would take place during the fall months. This year the order of the two flagship events has been reversed to better meet the needs of both academic and corporate recruiting cycles.  
<br><br>
"Las Vegas is known for high stakes, high risk and great entertainment," said Rob Hughes, President and COO of TopCoder, Inc. "What better setting to see the most exciting programmers in the world strategize and fight for big money prizes?"
<br><br>
The Aladdin Resort & Casino, the future home of Planet Hollywood Resort & Casino, is a full-service resort located in the heart of the world-famous Las Vegas strip. Offering the complete Las Vegas experience, the Aladdin includes more than 2,500 oversized rooms and suites; the famous Theatre for the Performing Arts, featuring top headline entertainment; a dozen award-winning dining experiences; 75,000 square feet of meeting space; more than 100,000 feet of non-stop gaming action, and Desert Passage with more than 140 retail shops.  
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of highly talented programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
<div align="center"><i>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</i><div>
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
