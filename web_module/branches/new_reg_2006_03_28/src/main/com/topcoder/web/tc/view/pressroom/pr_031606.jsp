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
                    
<div align="right"><tc-webtag:forumLink forumID="505925" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces AMD as Title Sponsor <br>of 2006 TopCoder Open in Las Vegas</span><br />
<span class="bodySubTitle"><em>Top Programmers in the World Will Battle at The Aladdin Resort for Share of $150,000<br>Prize Purse in World Championship of Computer Coding<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, March 16, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that AMD (NYSE: AMD), a leading global provider of innovative microprocessor solutions, has been named the title sponsor of the 2006 TopCoder Open (TCO). The Premier event for competitive coding's elite, the 2006 TopCoder Open will bring the world's finest professional and collegiate programmers together for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place May 3rd through 5th at the Aladdin Resort and Casino in Las Vegas, Nevada. Full registration details and rules are provided at: <A href="http://www.topcoder.com/tco06">http://www.topcoder.com/tco06</a>. 
<br><br>
"AMD Developer Central, AMD's program to support software developers, is pleased to sponsor the 2006 TopCoder Open and help showcase the unique creativity and genius shown by TopCoder members in this competition," said Richard Finlayson, Director Segment and Industry Solutions, Software Strategy and Alliances Group, AMD.  "This year's competition promises to be one of the best. Software development is at a key juncture as demand for 64-bit and multi-core hardware enables new ways to develop and deploy operating systems and applications.  By promoting best practices in software development on the latest hardware, this competition brings together the finest talent in the business to build better code that solves challenges and benefits everyone in the community." 
<br><br>
<span class="bodySubtitle">TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
<br><br>
<b>The TopCoder Open (TCO)</b> is host to both professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels. <b>The TopCoder Collegiate Challenge (TCCC)</b> involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. As with the TCO, the destination of the finals varies from year to year. In the past, TopCoder has hosted the TCCC during the spring timeframe, while the TCO would take place during the fall months. This year the order of the two flagship events has been reversed to better meet the needs of both academic and corporate recruiting cycles.
<br><br>
"The TopCoder Community exemplifies the new breed of dynamic global environments based on a great breadth and depth of accumulated knowledge and by perfecting technique with communal mentoring," said Rob Hughes, President and COO of TopCoder, Inc. "TopCoder welcomes AMD as a sponsor that shares our passion for recognizing the innovation, creative thinking and achievements that are the hallmarks of our community."
<br><br>
<span class="bodySubtitle">About AMD Dev Central</span><br>
AMD Dev Central is designed specifically to meet the needs of our expanding developer community.  This program helps capture the benefits of AMD performance and technology in hardware and software products by supporting developers and x86 free-thinkers with the resources they need to be successful.  Resources include: information, how-tos, development tools (such as CodeAnalystª and the AMD Core Math Library) and community forums.  To learn more and become a member of AMD Developer Central, visit <A href="http://www.amd.com/devcentral">www.amd.com/devcentral</a>.
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
