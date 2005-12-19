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
                    
<div align="right"><tc-webtag:forumLink forumID="505880" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Welcomes VeriSign as Return Sponsor<br> of 2006 TopCoder Open in Las Vegas</span><br />
<span class="bodySubTitle"><em>VeriSign Named Premier Level Sponsor of<br> World Championship of Coding - Registration Begins January 2nd</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, December 19, 2005 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that VeriSign, Inc., the leading provider of intelligent infrastructure services for the Internet and telecommunications networks, has been named a Premier sponsor of the 2006 TopCoder Open (TCO). The preeminent event for competitive coding's elite, the 2006 TopCoder Open will bring the world's finest professional and collegiate programmers together for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place at the Aladdin Resort and Casino, Las Vegas, NV, May 3rd-5th 2006.  Full registration details and rules are provided at: <A href="http://www.topcoder.com/tco06">http://www.topcoder.com/tco06</A>.
<br><br>
"We are proud to be a returning sponsor of the 2006 TopCoder Open, which provides companies like VeriSign a pool of talented professional and academic minds to choose the next-generation of employees that will develop advanced services and technologies," said George Haddad, Senior Vice President, Human Resources, VeriSign.  "Through our sponsorship of the 2005 TopCoder Open, VeriSign was able to meet great coders taking parting the competition, and have added several to our employee base, and we look forward to interacting with next year's competitors."
<br><br>
Component Design and Development registration begin January 2nd, with online rounds starting January 18th.  Five weeks of online competition will run through April 19th with the top 8 competitors from each of these categories advancing to the Onsite Finals in Las Vegas, Nevada, May 3rd-5th. Online registration for the Algorithm competition will begin February 13th, with qualification rounds starting February 28th and continuing on a weekly basis through March 22nd. The top 48 competitors will advance to the Onsite Finals.  Contestants can compete in the Algorithm or Component competitions, or both. Cash prizes for the 2006 TCO will comprise $75,000 for the Algorithm contest and $75,000 for the Component tournament ($46,500 Design, $28,500 Development) for an overall prize purse worth $150,000. 
<br><br>
"TopCoder is excited to have VeriSign return as a back-to-back Premier sponsor of our tournaments. They've been quick to grasp the full potential of the range of business opportunities TopCoder presents through our competitions, employment services and software manufacturing model," said Rob Hughes, President and COO of TopCoder. "Given Verisign's leadership and innovation in the areas of security and transactions on the Internet, it's a great fit for TopCoder and our members."
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
