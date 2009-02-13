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
                    
<div align="right"><tc-webtag:forumLink forumID="520427" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">China, US and Poland Take Honors in TopCoder High School<br />Tournament at Purdue University</span><br />
<span class="bodySubTitle"><em>Annual World Championship for TopCoder High School Members Sees<br />Chinese Student Win $15,000 in Algorithm Programming Competition</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., March 17, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the winners in the annual TopCoder High School global programming tournament hosted by Purdue University. Forty-nine elite competitors from the U.S., China, Russian Federation, Poland, Romania, Kazahkstan, Canada, Bulgaria, Croatia, the UK, India, Georgia, Hungary, Mexico, Belarus, Armenia and Serbia representing themselves, their schools and their countries competed in a challenging contest of computing skills for a share of $50,000 in scholarship awards. For more details of the 2008 TopCoder High School tournament visit: <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview">http://www.topcoder.com/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview</a>
</p>

<p>
First place honors in the individual competition went to Yang Yi, of China, known by his TopCoder handle '<tc-webtag:handle coderId="20812309" context="hs_algorithm"  />'. Yi, from the middle school attached to Anhui Normal University earned a scholarship award worth $15,000 for his win. Second runner up was Neal Wu aka '<tc-webtag:handle coderId="22663117" context="hs_algorithm" />' of the Baton Rouge Magnet High School in Baton Rouge, La., US, who earned $10,000 in prizes with Marcin Andrychowicz, aka '<tc-webtag:handle coderId="22628118" context="hs_algorithm" />' of XIV LO im. S. Staszica, Poland rounding out the top three and taking home $5,000.
</p>

<p>
Full TopCoder member profiles of winners are available online:<br />
Yang Yi:  <a href="/tc?module=MemberProfile&amp;cr=20812309">http://www.topcoder.com/tc?module=MemberProfile&amp;cr=20812309</a><br />
Neal Wu:  <a href="/tc?module=MemberProfile&amp;cr=22663117">http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22663117</a><br />
Marcin Andrychowicz: <a href="/tc?module=MemberProfile&amp;cr=22628118">http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22628118</a>
</p>

<p>
"We are excited the TopCoder High School tournament continues to grow as an event and platform for highlighting the best and brightest high school programmers from around the world," said Rob Hughes, President and COO of TopCoder, Inc. "We congratulate this impressive group of contestants and thank the Purdue University Computer Science program for providing such a wonderful setting as the Lawson Computer Science Building."
</p>

<p>
<span class="bodySubtitle">About Purdue University</span><br />
Purdue University was founded in 1869 and is one of the largest four-year universities in the United States. More than 38,000 students from all 50 states and the District of Columbia, three territories, residents abroad, and 126 foreign nations study at the West Lafayette campus, and more than 30,000 are enrolled at other campuses and locations. The university attracts more international students than any other public research university in America. The Department of Computer Science was formed in 1962 and is recognized as one of the top computer science programs in the country. The department's mission is to advance the frontiers of computer science, to expand the pool of qualified individuals working in the discipline, and to reach out both within and beyond the university to apply computational principles to technical and societal problems. The department offers the degrees of bachelor of science, master of science, and Ph.D. in Computer Science. Currently, there are 454 undergraduate students and 125 graduate students enrolled.
</p>
<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about utilizing TopCoder's software services or sponsoring TopCoder events, visit <a href="/">http://www.topcoder.com/</a>.
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
