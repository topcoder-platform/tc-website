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
                    
<div align="right"><tc-webtag:forumLink forumID="525772" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">China, Belarus &amp; Croatia Win Top Honors in the <br>2009 TopCoder High School Tournament</span><br />
</div>
      
<p>
<strong>GLASTONBURY, Conn., February 2, 2009 &#151;</strong>TopCoder&reg;, Inc. today announced the winners in the annual TopCoder High School global programming tournament. The TopCoder High School Tournament is the premier computer programming tournament for high school-aged math and science students, ages 13 to 18, enrolled in secondary schools or equivalent programs world-wide. The online competition challenges math and computer science students to demonstrate their problem-solving skills—unraveling complex word problems by writing computer programs that solve the problems. TopCoder’s tournament brought together 400 of the most talented high school programmers from around the world, in quest of bragging rights, scholarships and cash prizes worth more than $10,000.
</p>

<p>Following three elimination rounds of competition, 400 competitors from 51 countries advanced to the finals. </p>

<p>First place honors in the competition went to Bin Jin of Shanghai, China, known by his TopCoder handle 'crazyb0y'. Bin, from Changzhou High School, earned a scholarship award worth $3,000 U.S. for his win. Second runner up was Henadzi Karatkevich, aka 'tourist' of School #56 in Gomel, Belarus., who earned $1,500 in prizes, with Goran Zuzic, aka 'Zuza' of Zagreb, Croatia rounding out the top three and taking home $1,000. Full TopCoder member profiles for the top 5 winners are available online:</p>

<ol>
    <li><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22704157">crazybOy (Shangai, China)</a></li>
    <li><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22263204">tourist (Gomel, Belarus)</a></li>
    <li><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=11972352">Zuza (Zagreb, Croatia)</a></li>
    <li><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22692969">rng_58 (Tokyo, Japan)</a></li>
    <li><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22723672">qizichao (ChangSha, China)</a></li>
</ol>

<p>&ldquo;The annual TopCoder High School competition is a world class platform for high school students to demonstrate their programming talents and skills to the world,&rdquo; said Rob Hughes, president and COO for TopCoder. &ldquo;This is a fun and educational way to engage an impressive group of talented young students, and we congratulate this year&rsquo;s winners for their skills and ability.&rdquo;</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 175,000 developers representing more than 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards-based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>
<strong>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</strong>
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
