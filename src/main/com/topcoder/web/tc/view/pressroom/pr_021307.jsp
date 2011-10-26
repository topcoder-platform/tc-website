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
                    
<div align="right"><tc-webtag:forumLink forumID="514294" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Registration Opens for First TopCoder High School Global Programming Tournament</span><br />
<span class="bodySubTitle"><em>Students from Around the World to Compete for Trip to May Finals and $50,000 in Scholarship Awards</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., February 13, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the opening of registration for the inaugural 2007 TopCoder High School Tournament (TCHS). The TCHS computer programming competition will be open to eligible TopCoder registered high school students anywhere in the world. Registration runs February 13th through February 25th with online rounds starting February 26th and culminating with the top 100 competitors advancing to the onsite Semifinal and Championship rounds on May 19th, 2007 at Purdue University, in West Lafayette, Indiana. Scholarships and prizes worth at least $50,000 will be at stake along with 1,000 participatory prizes. For full tournament registration and eligibility requirements and tournament details please visit <A href="/tchs07">http://www.topcoder.com/tchs07</A>. 
</p>
<p>
The TopCoder High School Tournament follows in the full tradition of the company's flagship TopCoder Open and TopCoder Collegiate Challenge professional and collegiate events by providing a world class platform for high school students to demonstrate their programming talents and skills to the world.
</p>
<p>
"Math and science proficiency has never been more important to the futures of our young people," said Rob Hughes, President and COO of TopCoder, Inc. "With the TopCoder High School tournament, our goal is to begin engaging those future mathematicians and scientists with a program that is fun and educational while also preparing them with the skill sets needed for world-class challenges."
</p>
<p>
TopCoder competitions currently include the annual TopCoder Collegiate Challenge, TopCoder Open and inaugural TopCoder High School tournaments, weekly online Single Round Matches, Marathon Matches, the Digital Run series and private label events such as Google Code Jam. TopCoder also offers multiple software design, development and assembly competitions 24 x 7 in which real world business solutions are built. In addition, TopCoder Studio provides a competitive arena for creative skills such as graphic arts and design. In a best-solution-wins format, through its contests, tournaments and competitive software development methodology, TopCoder identifies and accesses the development skills of thousands of developers to be applied to software development needs for clients such as Google, AOL, Microsoft, ESPN, VeriSign and UBS.
</p>
<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder's software services, visit <A href="/">http://www.topcoder.com/</A>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>                                                
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
