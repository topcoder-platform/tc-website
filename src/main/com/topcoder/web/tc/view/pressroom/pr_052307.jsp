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
                    
<div align="right"><tc-webtag:forumLink forumID="515881" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University</span><br>
<span class="bodySubTitle"><em>First World Championship for TopCoder High School Members Sees Eastern Europe Prevail in Individual and Team Tournaments</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., May 21, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the winners in the first ever TopCoder High School global programming tournament hosted by Purdue University. Forty-seven elite competitors from the U.S., China, Russian Federation, Australia, Poland, Romania, Kazahkstan, Canada, Bulgaria, Croatia and the Ukraine representing themselves, their schools and their countries competed in a challenging contest of computing skills for a share of $50,000 in scholarship awards.</p>

<p>Fist place honors in the individual competition went to Yury Petrov, of the Russian Federation, known by his TopCoder handle <tc-webtag:handle coderId="21111148" context="algorithm"/>. Petrov, from the Phys-Math Lyceum school #30 in St. Petersburg earned a scholarship award worth $10,000 for his win. Second runner up was Ivo Sluganovic aka <tc-webtag:handle coderId="15604398" context="algorithm"/> of the V. Gimnazija school in Zagreb, Croatia with Filip Pavetic aka <tc-webtag:handle coderId="12005484" context="algorithm"/>  of the Ivan Svear school in Croatia rounding out the top three.</p>

<p>Full TopCoder member profiles of winners are available online.<br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=21111148" target="_blank">Yury Petrov</a><br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=15604398" target="_blank">Ivo Sluganovic</a><br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=12005484" target="_blank">Filip Pavetic</a><br /></p>

<p>"In addition to advancing the students' computer science skills and providing scholarships, the TopCoder competition brought students from 11 different countries together on Purdue's campus and offered a cultural experience," said Tim Korb, assistant head of Purdue's Department of Computer Science. "There was great camaraderie among the students and the sharing of knowledge went beyond computer programming skills. It is important that we encourage such talented students to further develop their skills and ensure that they have the educational opportunities necessary to reach their full potential."</p>

<p>The TopCoder High School team competition was won buy Croatia's V. Gimnazija. Team members <tc-webtag:handle coderId="11972352" context="algorithm"/> (Goran Zuzic), <tc-webtag:handle coderId="15604398" context="algorithm"/> (Ivo Sluganovic) and <tc-webtag:handle coderId="21507690" context="algorithm"/> (Petar Sirkovic) took home top honors and a $12,000 scholarship prize for their efforts.</p>

<p>Full profiles for the team are available online at:<br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=11972352" target="_blank">Goran Zuzic</a><br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=15604398" target="_blank">Ivo Sluganovic</a><br />
    <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=21507690" target="_blank">Petar Sirkovic</a><br /></p>

<p>"The overall quality of these competitors as a group and the wide international representation was extremely impressive," said Rob Hughes, President and COO of TopCoder, Inc. "The future generation of world class engineers and mathematicians is represented by these students and we are excited to help elevate and highlight their abilities with TopCoder High School."</p>

<p><span class="bodySubtitle">About Purdue University</span><br>
Purdue University was founded in 1869 and is one of the largest four-year universities in the United States. More than 38,000 students from all 50 states and the District of Columbia, three territories, residents abroad, and 126 foreign nations study at the West Lafayette campus, and more than 30,000 are enrolled at other campuses and locations. The university attracts more international students than any other public research university in America.</p>

<p>The Department of Computer Science was formed in 1962 and is recognized as one of the top computer science programs in the country. The department's mission is to advance the frontiers of computer science, to expand the pool of qualified individuals working in the discipline, and to reach out both within and beyond the university to apply computational principles to technical and societal problems.</p>

<p>The department offers the degrees of bachelor of science, master of science, and Ph.D. in Computer Science. Currently, there are 450 undergraduate students and 150 graduate students enrolled.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>
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
