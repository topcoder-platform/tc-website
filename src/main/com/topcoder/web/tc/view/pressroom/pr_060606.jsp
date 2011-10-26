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
                    
<div align="right"><tc-webtag:forumLink forumID="506050" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons <br>of 2006 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>UBS and National Security Agency Continue Involvement with<br> Leading Collegiate Computer Programming Contest<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, June 6, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the sponsor group for the 2006 TopCoder Collegiate Challenge (TCCC). AOL&#174; and Bloomberg LP will join returning TopCoder premier sponsor UBS&#174; (NYSE: <A href="/?t=sponsor&c=link&link=http://www.hoovers.com/ubs/--ID__41649,ticker__UBS--/free-co-fin-stockquote.xhtml">UBS</A>) and patron National Security Agency (NSA). Thousands of students in computer science, mathematics, physics and other disciplines from universities around the world will begin registering in August to compete online with the goal of advancing to the world-renowned TCCC onsite finals being held in San Diego, CA this coming November. Finalists will compete in algorithm, component design and component development divisions to earn a share of $200,000 in cash prizes.
<br><br>
"TopCoder is very excited to announce that AOL, the largest U.S. Internet supplier and Bloomberg, the leading global provider of news, data and analytics, through the BLOOMBERG PROFESSIONAL&#174; service and web site are bringing their world class support to the TCCC," said Rob Hughes, President and COO of TopCoder, Inc. "This year sponsorship berths were filled in record time and we welcome back returning premier level partners UBS and NSA. With the addition of the new Digital Run point system, the increasing amount of software developed and money earned within the TopCoder community we're set to have an explosive year of growth."
<br><br>
TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 84,000 members that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world. 
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
