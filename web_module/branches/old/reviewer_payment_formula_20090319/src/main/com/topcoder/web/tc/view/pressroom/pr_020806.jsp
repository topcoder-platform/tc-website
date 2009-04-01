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
                    
<div align="right"><A href="http://forums.topcoder.com/?module=Thread&threadID=509013&mc=1#525461">Discuss this press release</a></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder High School Launches Global <br>Programming Tournament in June</span><br />
<span class="bodySubTitle"><em>Worldwide Contest From TopCoder Will Promote Problem Solving Skills in <br>Math and Science Among High School-Age Students<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, February 8, 2006 &#151;</strong>TopCoder&#174;, Inc.,  the leader in online programming competition, skills assessment and competitive software development, today announced the launch date for a new programming tournament for high school-age students around the world. Beginning in June, TopCoder High School (TCHS) will offer students the chance to compete as individuals and teams in a designated version of the highly regarded TopCoder competition arena. Young problem solvers will be able to win educational scholarships, valuable prizes and recognition while they learn in an online environment that is fun and exciting. Sponsorships for the competition will be available at the individual, local, national and international levels. All sponsorship proceeds beyond tournament operating costs will be entered into the overall scholarship prize pool.  For more information on TopCoder competitions, visit <a href="http://www.topcoder.com/tc">http://www.topcoder.com/tc</a>.
<br><br>
<span class="bodySubtitle">Overview</span><br>
Beginning in June 2006, TopCoder will hold weekly online events, called Single Round Matches (SRMs), which will be available only to high school-aged students. The SRMs will allow students to demonstrate their problem-solving skills by unraveling complex word problems through the use of a computer language &ndash; either Java, C++, C# or VB.Net. Students will be able to compete either as an individual or as part of a team representing their school, or, in case they are not affiliated with a school, representing their town or themselves. The worldwide TopCoder High School tournament will begin in early 2007 and will culminate in a large onsite final event in the U.S. in May 2007. 
<br><br>
<span class="bodySubtitle">Prizes</span><br>
Based on support from individual, local, national and international sponsors, prizes will take the form of scholarships, hardware, software and educational materials. TopCoder will enlist the support of students to help spread the word and engage sponsors at the local level.
<br><br>
"Given the competitive technological nature of today's world, TopCoder believes it is more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's surroundings," said MaryBeth Luce, Programs Director for TopCoder, Inc. "By adding a tournament for high school-aged students, TopCoder is doing its part to ensure that there is a fun and competitive learning environment where students from around the world can build and showcase their talent." 
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
