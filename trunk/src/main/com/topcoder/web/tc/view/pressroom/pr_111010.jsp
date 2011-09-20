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
                    
	<div align="right"><tc-webtag:forumLink forumID="541465" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>New York Hall of Science Honors TopCoder Founder Jack Hughes with Inaugural &quot;Vision &amp; Venture&quot; Award</strong><br />
    </p>
</div>
      
<p><strong>Glastonbury, CT - November 10, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, today announced that company Founder and Chairman Jack Hughes, will be the recipient of the first ever NYSCI Vision & Venture Award. The award from the New York Hall of Science (NYSCI) is in recognition of &quot;bold corporate vision to establish a creative environment for achievement in science and technology as an innovative and young company&quot;. The award will be presented on Tuesday, November 16 at NYSCI's "Evening of Science Inspiration and Invention" event in New York City.</p>
<p>Current TopCoder programs to promote open innovation and core science and math education include initiatives with government agencies such as the NASA Tournament Lab and DARPA CS-STEM platform for computer science activities geared towards middle and early high school students. The DARPA program is focusing on conceiving and building creative ways to engage and inspire young people in math and science.</p>
<p>&quot;We are thrilled to honor Jack Hughes, Founder of TopCoder, the recipient of the inaugural NYSCI Vision and Venture Award,&quot; said Margaret Honey, President and CEO of the New York Hall of Science. &quot;This up and coming company uses a cutting edge business model that crowd-sources computer coding solutions through web-based competitions. Instead of setting up a bricks & mortar research center, Jack has created a virtual version that taps the best minds around the world for original ideas and rewards them. This is the kind of thinking that will enhance America's competitiveness.&quot;</p>
<p>Based on his own programming experience and history as an entrepreneur, Hughes believes that while the global economy becomes more information and knowledge based, more is needed to drive interest and mastery of foundational skills for existing and future entrants into these fields.  Founded in 2001, TopCoder's mission has been to create mechanisms for learning, skills mastery and opportunity through online social and professional community.   Hughes holds a B.S. degree in computer science from Boston College. He has been a board member of the Christopher & Dana Reeve Foundation since 2000 and is currently Chairman of the National Board. </p>
<p>Central to the TopCoder model is a large community of highly motivated individuals who embrace transparent competition and collaboration within a results-based, metrics driven methodology. TopCoder's innovative management processes and culture have been the subject of studies and research by Harvard Business School, MIT and London Business School among others. Founded in 2001, TopCoder has been recognized as one of the fastest-growing technology companies in North America by Inc. magazine,  has been identified as a Cool Vendor by Gartner and been a Deloitte Fast 50 winner in multiple years.</p>
<p><strong>About the New York Hall of Science</strong><br />
  Built originally for the 1964 World's Fair, the New York Hall of Science's (NYSCI) mission is to bring the excitement and understanding of science and technology to children, families, teachers, and others by galvanizing their curiosity and offering them creative, participatory ways to learn. Today NYSCI offers an unparalleled range of 450 indoor and outdoor interactive exhibits, discovery labs, a Science and Technology library and special events that promote curiosity, creativity, and discovery and invite visitors to explore science, technology, engineering and math (STEM). NYSCI is the City's only hands-on science and technology center and is committed to serving a broad audience, particularly low-income, minority and other underserved communities. Each year NYSCI serves nearly a half-million visitors - who are recognized as the most ethnically diverse population in the country - whom include children and families, students, teachers, community groups and more from every borough of New York City, Nassau and Suffolk counties, the tri-state area, and beyond. Currently, NYSCI's staff is comprised of 85 full-time and 149 part-time employees. </p>
<p>NYSCI also offers comprehensive and nationally replicated programs designed to engage diverse audiences in STEM education. For more than twenty-five years, NYSCI has been a leader in the field of informal science education through programs. Examples include the Science Career Ladder (SCL), a youth development and employment initiative that offers minority students pathways to STEM and education careers; After School Science Clubs that provide elementary and middle school students access to STEM learning in a museum environment and serve as a pipeline to the SCL and early childhood initiatives. Additionally, NYSCI provides an array of professional development opportunities for teachers that employ inquiry-based principles informed by the latest studies on how students learn, along with a practical understanding of the realities of the classroom. NYSCI is frequently awarded federal grants from the National Science Foundation, the National Institute of Health and the Institute of Museum and Library Services for its leadership and innovation in informal science teaching and learning.</p>  
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community and platform with more than 270,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software and community platforms for a wide-ranging client base through a competitive, rigorous, standards based methodology.  For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
