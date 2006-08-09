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
                    
<div align="right"><tc-webtag:forumLink forumID="505978" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Russian, US and Indonesian Programmers Win $150,000<br>TopCoder Open Sponsored By AMD in Las Vegas</span><br />
<span class="bodySubTitle"><em>Computer Programmers Celebrated at TopCoder Open World Championship Sponsored by<br>AMD, UBS, National Security Agency and VeriSign<br></em></span></p>
</p>
</div>
                        
<p><strong>LAS VEGAS, NV, May 8, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that that Petr Mitrichev of the Russian Federation, Tim Roberts of the United States, and Sindunata Sudarmaji of Indonesia have won the Algorithm, Design and Development Component tournaments of the 2006 TopCoder Open (TCO) sponsored by AMD, held at the Aladdin Resort and Casino in Las Vegas, Nevada on May 5th. 
<br><br>
An elite group of 64 finalists representing 19 countries were invited from around the world to Las Vegas to compete in computing science disciplines such as algorithms and software component design and development.
<br><br>
This year's competition attracted more than 4,200 registrants from TopCoder's community of 80,000 members representing over 200 countries. Building upon the successful TCO and TopCoder Collegiate Challenge (TCCC) tournaments, TopCoder recently announced several additions to its schedule including the upcoming TopCoder High School tournament for grade-school programmers, the Marathon Match series and the newly launched Digital Run competitions for top performing software designers and developers. For more information visit <A href="http://www.topcoder.com/tc">http://www.topcoder.com/tc</a>.
<br><br>
"AMD Developer Central, AMD's program to support software developers, is pleased to have sponsored the 2006 TopCoder Open and help showcase the unique creativity and genius shown by TopCoder members in this competition," said Richard Finlayson, Director Segment and Industry Solutions, Software Strategy and Alliances Group, AMD.  "This year's competition was one of the best. TopCoder competitions bring together the finest talent in the business to build better code that solves challenges and benefits everyone in the community."
<br><br>
Mitrichev, known to the member community by his handle '<b>Petr</b>', beat 47 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $20,000 grand prize in the Algorithm tournament. Roberts or '<b>Pops</b>' as he is known, and '<b>sindu</b>' Sudarmaji, took home $20,000 and $12,500 respectively as the Design and Development winners in the Component tournament.
<br><br>
At the start of the Algorithm tournament, <b>Petr</b> was the 4th seed and ranked 3rd among TopCoder member worldwide. <b>Petr</b> successfully submitted the only solution to the hardest problem to win the closely contested Championship round. Mitrichev beat out second place finisher Tomasz '<b>tomek</b>' Czajka of Poland. The 64 finalists each earned a spot at the event by besting thousands of other programmers from around the world in simultaneous, online competitions.
<br><br>
<b>Pops</b> and <b>sindu</b> won hard fought contests against an elite field of international component opponents. <b>Pops</b> took top Design honors over opponents from the North America and Europe and <b>sindu</b> claimed victory over developers from China, Hong Kong and Europe.
<br><br>
The Algorithm tournament was a timed competition where the participants solved complex algorithmic problems using Java, VB.Net, C++ or C#. The Component tournament was divided into two tracks. The Design competition required competitors to submit a software design based on general requirements and The Development competition asked competitors to develop a re-useable software component from a specific TopCoder guideline. A peer review board evaluated submissions and awarded final point standings based on TopCoder's rigorous scorecard system. Visit <A href="/reg/">/reg/</a> for full membership details.
<br><br>
"Our community is showing rapid growth worldwide - over 16,000 members in the last 6 months alone - and new competitions such as TopCoder High School, the Marathon Match Series and Digital Run will certainly continue that growth trend and keep our members very busy," said Rob Hughes, President and COO of TopCoder, Inc. "The level of high quality software production, sharing of best practices and learning is surging throughout our community and nowhere is it more apparent than here at our flagship onsite event, the TCO."
<br><br>
<b>For more details, interviews or to request event video, please contact TopCoder at (860) 633.4450 or <A href="mailto:jmckeown@topcoder.com">jmckeown@topcoder.com</a> or visit <A href="http://www.topcoder.com">www.topcoder.com</a>.</b>
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
