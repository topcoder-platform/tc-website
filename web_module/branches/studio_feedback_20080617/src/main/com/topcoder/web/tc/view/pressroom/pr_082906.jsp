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
                    
<div align="right"><tc-webtag:forumLink forumID="506100" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">NSA Continues TopCoder Patronage with Support of 2006 <br>TopCoder Collegiate Challenge in San Diego</span><br />
<span class="bodySubTitle"><em>U.S. National Security Agency Extends Involvement <br>with TopCoder Developer Community</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, August 28, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the National Security Agency's continued patronage of the 2006 TopCoder Collegiate Challenge (TCCC06) will involve advance online interactive sessions as well as an onsite presence at the tournament finals in San Diego, CA November 15th, 16th and 17th. Through informational chat sessions coinciding with regularly scheduled weekly Single Round Matches, high profile branding and onsite booth opportunities NSA is able to interface with some of the brightest young collegiate minds in the TopCoder community.
<br><br>
NSA is increasing its partnerships with industry and academia and is expanding its research and development by aggressively recruiting and hiring cryptologic professionals. These changes are revolutionizing the Agency's capability to produce foreign signals intelligence and protect sensitive government communications in a digital age. These changes give warfighters and policymakers real-time insight into the adversary's mindset. These changes ensure that NSA's capabilities will continue to prevent conflict, shorten wars, and save lives.
<br><br>
NSA has previously supported the 2006 TopCoder Open and the 2005 TopCoder Collegiate Challenge. The TCCC06 will bring thousands of the world's finest programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $200,000 prize purse for Algorithm, Component Design and Development categories. NSA's representatives will be available to contestants and members through online chat sessions, presentations and an onsite presence at the finals in San Diego, CA.
<br><br>
"The field of cryptology presents exactly the kind of challenge that appeals to the TopCoder community," said Rob Hughes, President and COO of TopCoder. "NSA is among the elite group of organizations in the world recognizing, evaluating and recruiting the top programming talent represented at TopCoder competitions."
<br><br>
<span class="bodySubtitle">About National Security Agency</span><br>
The National Security Agency is America's cryptologic organization. It coordinates, directs, and performs highly specialized activities to protect U.S. government information systems and produce foreign signals intelligence information. A high technology organization, NSA is on the frontiers of communications and data processing, dedicated to developing and recruiting the best and the brightest computer/electrical engineers, computer scientists, mathematicians, linguists, cryptanalysts, and signals analysts in the world. For more information visit: <A href="/?t=sponsor&c=link&link=http://www.nsa.gov">www.nsa.gov</A>. 
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
