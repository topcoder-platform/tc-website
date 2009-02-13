<%@  page language="java"  %>
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
                        <div align="center">
                        <p><span class="bodyTitle">VeriSign Sponsors 2005 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>Company is Premium Sponsor of Annually Held Competition That Identifies Next Generation Of Programming Leaders</em></span></p>
                        </p>
                        </div>
                        
<p><strong>MOUNTAIN VIEW, CA, July 7, 2005 &#151;</strong>VeriSign, Inc. (Nasdaq: VRSN), the leading provider of intelligent infrastructure services for the Internet and telecommunications networks, today announced that it is a premium sponsor of the 2005 TopCoder Open (TCO). The TCO is the premier event for competitive coding, bringing together professional and collegiate programmers competing for international ranking and a $150,000 overall prize purse distributed between Algorithm and Component Design and Development categories.
<br><br>
As part of its agreement with TopCoder, VeriSign is sponsoring two initial single-round matches, occurring on July 7 and September 27, 2005, as well as the final rounds. In the initial matches, participants will be faced with a coding problem they must solve using either Java, C++, Microsoft Visual C#.NET or Microsoft Visual Basic.NET.  Winners will proceed to the next round, and the onsite finals will take place on October 12 - 14, 2005 in Santa Clara, CA. 
<br><br>
"With rapid advances in technology occurring everyday, companies are looking for the next generation of leaders to author the code that will provide the backbone for advanced applications," said George Haddad, senior vice president, VeriSign Human Resources. "VeriSign is pleased to be a premium sponsor of the 2005 TopCoder Open, which will pit the finest professional and academic minds against each other in a spirited competition that seeks to identify the individuals who will lead that charge."  
<br><br>
Online registration for the Algorithm competition will run August 1 - 16, 2005, with qualification rounds beginning August 16, 2005 and continuing on a weekly basis through September 7, 2005. The top 48 competitors in this competition will advance to the onsite Finals in Santa Clara, CA on October 12, 2005.  Component Design and Development registration ran June 13 - 29, 2005.  Online rounds for this competition are running weekly through August 18, 2005, with the final online round starting on August 24, 2005. The top eight competitors from each of these categories will advance to the onsite finals
<br><br>
Contestants can compete in the Algorithm competitions, the Component competitions, or both. Cash prizes for the 2005 TCO will comprise $75,000 for the Algorithm contest and $75,000 for the Component tournament ($46,500 Design, $28,500 Development). Full registration details and rules are available at <A href="/tco05">www.topcoder.com/tco05</A>.
<br><br>
"We are extremely pleased that VeriSign has become a premium sponsor of the TopCoder Open, and look forward to their participation throughout our competitions," said Rob Hughes, president and COO, TopCoder. "With their sponsorship, VeriSign shows that it is clearly committed to identifying and harnessing the talent that will help them, and other technology companies, develop the applications and solutions of tomorrow."
<br><br>
VeriSign is currently seeking visionary, skilled, enthusiastic professionals to help the company provide the platform for the future of electronic commerce through innovative Internet services. For more information on job openings at VeriSign, please go to <A href="http://www.verisign.com/verisign-inc/careers/jobs/index.html">www.verisign.com/verisign-inc/careers/jobs/index.html</A>. 
<br><br>
<span class="bodySubtitle">About VeriSign</span><br>
VeriSign, Inc. (Nasdaq: VRSN) operates intelligent infrastructure services that enable businesses and individuals to find, connect, secure and transact across today's complex global networks. Additional news and information about the company is available at <A href="http://www.verisign.com">www.verisign.com</A>.
<br><br>
<span class="bodySubtitle">About TopCoder</span><br>
TopCoder, Inc. is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">www.topcoder.com</A>. 
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
For more information, contact:<br>
VeriSign Media Relations: Brendan Lewis, brlewis@verisign.com, 650-426-4470 <br>
VeriSign Investor Relations: Tom McCallum, tmccallum@verisign.com, 650-426-3744
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
