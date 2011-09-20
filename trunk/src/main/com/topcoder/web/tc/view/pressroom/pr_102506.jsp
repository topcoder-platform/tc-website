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
                    
<div align="right"><tc-webtag:forumLink forumID="506157" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Launches Operations in China with New Beijing Appointment</span><br />
<span class="bodySubTitle"><em>TopCoder Announces Ms. Yingying Wu to Lead TopCoder Operations in Asia</em></span></p>
</p>
</div>
      
<p><strong>Glastonbury, Conn., October 25, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it has hired Yingying Wu as Vice President of Operations for TopCoder in Asia. Wu will oversee and manage TopCoder business relationships and will build TopCoder's market presence and member enrollment throughout the greater China and Asia region. 
<br><br>
Wu has earned accolades for her technical skills including the Innovation and Technology Prize of China in 2006, the highest award of its kind from China's Ministry of Education, and the 2005 National Contest in Modeling in Beijing where she took first prize. Technically accomplished, she holds patents for several of her 100 inventions including OPEN Indexing Technology and Dynamic Counter Cachet Technology. Wu also authored several technology books including Data Structure and Comprehensive Practical Activity and is a member of the American Psychology Association and the Association for Computing Machinery. 
<br><br>
Previous to TopCoder, she held a position with Edoor Information and Technology Co. Ltd, in Dalian, China and was the Asia coordinator for the ACM International Collegiate Programming contest. Wu is currently a student at California's Stanford University in the graduate program of the university's Department of Psychology. 
<br><br>
"TopCoder has a large number of Chinese members and has sought to establish a presence in China for some time, however a unique person with a highly specialized set of skills was needed," said Rob Hughes, President and COO of TopCoder, Inc. "Yingying Wu brings with her a graduate degree in psychology, extensive technical understanding and a deep awareness of business management all of which will bring significant value as we expand membership and the TopCoder brand in China."
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">www.topcoder.com</A>.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
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
