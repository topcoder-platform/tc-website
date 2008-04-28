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
                    
<div align="right"><tc-webtag:forumLink forumID="506069" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">UBS Extends Premier Sponsorship of TopCoder Events</span><br />
<span class="bodySubTitle"><em>Banking and Financial Services Leader to Support November Tournament<br>and World's Top Student Computer Programmers</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, July 12, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that UBS, (<b>NYSE:UBS</b>), the global financial services firm, has continued its sponsorship of TopCoder global events by becoming a Premier level sponsor of the 2006 TopCoder Collegiate Challenge (TCCC06) in San Diego, CA this November. UBS recently sponsored the TopCoder Open 06 in Las Vegas. Through its sponsorship, UBS will support the TCCC06 as it brings many of the world's finest student programmers from around the world together in competition for international ranking, notoriety and a share of the $200,000 prize purse for Algorithm, Design and Development categories. Look for upcoming TCCC06 details and announcements online at <a href="http://www.topcoder.com/tc">http://www.topcoder.com/tc</a>. 
<br><br>
"As a growing, global company, we're looking for the brightest programmers in the world," said Ken Vogel, a Director at UBS and TopCoder member. "The Collegiate Challenge presents a unique opportunity for us to connect with talented student programmers, and talk with them about the excitement and rewards of developing software for one of the world's top Wall Street firms."
<br><br>
TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 85,000 members that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
<br><br>
"We are delighted to have UBS join us as a repeat Premier level sponsor," said Rob Hughes, President and COO of TopCoder, Inc. "TopCoder sponsors understand the growing importance and potential of interfacing with this key developer community within its environment of choice &mdash; the TopCoder arena."   
<br><br>
<span class="bodySubtitle">About TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
<br><br>
<b>The TopCoder Collegiate Challenge (TCCC)</b> involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. The destination of the finals varies from year to year. <b>The TopCoder Open (TCO)</b> is host to both professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels.
<br><br>
<span class="bodySubtitle">About UBS</span><br>
UBS is a global investment banking and securities firm with a strong institutional and corporate client franchise. Consistently placed in the top tiers of major industry rankings, it is a leading player in the global primary and secondary markets for equity, equity-linked and equity derivative products. In fixed income, it is a first-rate global player. In foreign exchange, it places first in many key industry rankings. In investment banking, it provides first-class advice and execution capabilities to its corporate client base worldwide. All its businesses are sharply client-focused, providing innovative products, top-quality research and comprehensive access to the world's capital markets.
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="http://www.topcoder.com">www.topcoder.com</a>.
<br><br>
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
