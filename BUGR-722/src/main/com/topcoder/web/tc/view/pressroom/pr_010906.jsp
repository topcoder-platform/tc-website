<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
                    
<div align="right"><tc-webtag:forumLink forumID="505886" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces NSA Participation in<br> 2006 TopCoder Open in Las Vegas</span><br />
<span class="bodySubTitle"><em>U.S. National Security Agency Returns as Patron of World Championship of Programming <br> Scheduled for May 3rd -5th at Aladdin Resort and Casino<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, January 9, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced additional details of its 2006 TopCoder Open (TCO06) which include the continued support of the National Security Agency as an event patron. The TCO06 will bring thousands of the world's finest programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at:  <A href="http://www.topcoder.com/tco06">http://www.topcoder.com/tco06</A>.
<br><br>
Beginning January 19th, registrants for the TCO06 Design and Development tracks will compete in five weeks of online tournaments for qualification and advancement to the online Championship rounds beginning March 16th. Algorithm contest registration will run February 13th through February 28th, with four online qualification rounds ending March 22nd. Through these series of online elimination rounds, the field of thousands will be narrowed to 64 final competitors by April 20th, comprised of 48 Algorithm and 16 Component competitors. These finalists will compete in face-to-face competition at the Aladdin Resort and Casino in Las Vegas from May 3rd - 5th to determine the winners of all competitions. 
<br><br>
"The TopCoder member base is seen as dynamic, intelligent and unsurpassed in its ability to dissect and solve the most difficult algorithmic problems imaginable," said Rob Hughes, President and COO of TopCoder. "TopCoder tournaments provide an attractive platform for organizations such as NSA as they seek out the best and the brightest code makers, breakers and problem solvers in the field of computer science."
<br><br>

<span class="bodySubtitle">About National Security Agency</span><br>
The National Security Agency is America's cryptologic organization. It coordinates, directs, and performs highly specialized activities to protect U.S. government information systems and produce foreign signals intelligence information. A high technology organization, NSA is on the frontiers of communications and data processing, dedicated to developing and recruiting the best and the brightest computer/electrical engineers, computer scientists, mathematicians, linguists, cryptanalysts, and signals analysts in the world. For more information visit: <A href="http://www.nsa.gov">www.nsa.gov</a>.<br><br>
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
