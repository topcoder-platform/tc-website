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
                    
<div align="right"><tc-webtag:forumLink forumID="506059" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces Bloomberg L.P. As <br>Premier Sponsor of TCCC06</span><br />
<span class="bodySubTitle"><em> Leading Global Provider of Data, News and Analytics Backs <br>Top Computer Science Tournament 
</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, June 26, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Bloomberg L.P. is a Premier level sponsor of the 2006 TopCoder Collegiate Challenge (TCCC06) in San Diego, CA this November. Through its sponsorship, Bloomberg will support the TCCC06 as it brings many of the world's finest student programmers from around the world together in competition for international ranking, notoriety and a share of the $200,000 prize purse for Algorithm, Design and Development categories. Look for upcoming TCCC06 details and announcements online at <a href="http://www.topcoder.com/tc">http://www.topcoder.com/tc</a>. 
<br><br>
Bloomberg provides real-time news, analytics, financial and market data, pricing, trading and communications tools to corporations, professionals and individuals through the BLOOMBERG PROFESSIONAL&#174; service and its worldwide media services. The global leader in providing financial analytics and information, Bloomberg seeks out the best software engineering talent to build enhancements for the BLOOMBERG PROFESSIONAL&#174; service and develop sophisticated financial tools and solutions for financial industry professionals. This makes Bloomberg an ideal fit for the TopCoder Collegiate Challenge. Bloomberg is deeply committed to the promotion of talent and creativity and expanding access to education and skills development. Sponsorship of initiatives and student competitions, such as the TopCoder Collegiate Challenge, enables Bloomberg to foster creativity, skills-development and relationship building.
<br><br>
TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 85,000 members that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
<br><br>
"We are excited to have Bloomberg join us as a first time Premier level sponsor," said Rob Hughes, President and COO of TopCoder, Inc. "The company brings a great business pedigree to our event and we look forward to helping them reach new audiences in our developer community."
<br><br>
<span class="bodySubtitle">About TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
<br><br>
<b>The TopCoder Collegiate Challenge (TCCC)</b> involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. The destination of the finals varies from year to year. <b>The TopCoder Open (TCO)</b> is host to both professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels.
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
