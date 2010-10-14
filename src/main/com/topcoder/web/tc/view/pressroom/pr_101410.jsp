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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
	<div align="right"><tc-webtag:forumLink forumID="540954" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>DARPA and TopCoder Seek to Change How Students Spend Time Online</strong><br />
    <strong><em>Experimental Education Approach Will Reward Middle and High Schoolers as they Develop STEM Skills and Build a Cyber Community for Learning</em></strong></p>
</div>
      
<p><strong> Las Vegas, October 14, 2010</strong> &ndash;  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, the leader in online programming competition, skills assessment and competitive software development platforms, today announced the company has been awarded a $5.57 million contract by the Defense Advanced Research Projects Agency (DARPA) for the development of a new Internet-based platform for competitions and educational resources that will focus on realizing computer science, science, technology, engineering and math (CS-STEM)-focused goals for middle and high school students in the U.S. and beyond.</p>
<p>Being designed and managed as a commercial enterprise, the TopCoder CS-STEM educational platform will present varied online activities matched with a social impact theme to empower students to take control of their own academic development through the fostering of curiosity, creativity and discovery.</p>
<p>The platform will be an online &lsquo;hub&rsquo; targeting a large community of grade 6-12 students and will engage and promote collaboration and constructive use of time spent online by that community. Students will have a voice in how it is developed and how it will be run, giving them a real ownership stake in the community. To introduce and actively engage grade school students to a host of interesting and fun age-specific competitions will offer collaborative activities, puzzles and games, webisodes and workshops in all applications of critical thinking in the computer science field.  </p>
<p>&ldquo;The United States has always been a thought leader in developing new ways to address pressing problems in the economy and the environment that impact society in this country as well as globally.  Solutions to many of these problems will come from individuals who have successfully mastered critical
STEM-related skills,&rdquo; said Jack Hughes, chairman and founder of TopCoder, Inc. &ldquo;This community-centric educational experience will create new competitions and opportunities that will encourage young students to develop their critical thinking abilities and help build better solutions for our world.&rdquo;</p>
<p>The community platform will allow both public and private partnering organizations to plug into a structured online hub, saving time and resources by avoiding parallel efforts. The platform will reside online and be built through TopCoder&rsquo;s existing global developer community of 265,000 technologists and creative designers. An early component will be an extension of the TopCoder High School tournament platform.</p>
<p>&ldquo;With this program, we are focusing on computer science specifically to highlight its importance in modern education,&rdquo; said Melanie Dumas, DARPA program manager. &ldquo;US students should realize their potential to become expert developers and innovators, beyond simple users of their daily technologies.&rdquo;</p>
<p>TopCoder has assembled an accomplished group of creative thinkers who will be involved throughout the strategic and operational process:</p>
<ul>
	<li>Neale Godfrey, award-winning author of 16 books that deal with money, life skills and value issues for kids and families;</li>
	<li>Education management analyst and academic performance metrics expert Christine Theberge Rafal;</li>
	<li>The New York Hall of Science will provide oversight of the program&rsquo;s mentoring component and will network and liaise with both corporate and public partners.</li>
</ul>
<p>TopCoder community infrastructure solutions and problem solving capabilities are currently being used successfully by NASA and PayPal.</p>

<p><strong>About DARPA</strong><br />
The Defense Advanced Research Projects Agency (DARPA) is the research and development office for the <a href="http://www.defense.gov/">U.S. Department of Defense</a>. DARPA&rsquo;s mission is to maintain technological superiority of the U.S. military and prevent technological surprise from harming our national security. We also create technological surprise for our adversaries. DARPA funds unique and innovative research through the private sector, academic and other non-profit organizations as well as government labs.</p>

<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 260,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
