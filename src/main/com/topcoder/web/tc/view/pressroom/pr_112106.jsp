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
                    
<div align="right"><tc-webtag:forumLink forumID="506189" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Russia's nicka81 and Petr, China's PE<br> Triumph at TopCoder Collegiate Challenge in San Diego</span><br />
<span class="bodySubTitle"><em>New York, Moscow and Zhejiang University Students <br>Are TopCoder's World Champion Programmers</em></span></p>
</p>
</div>
      
<p><strong>Glastonbury, Conn., November 21, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Nikolay Archak of New York University, Petr Mitrichev of Moscow State University and Huang Ninghai of ZheJiang University as champions in their respective tournaments for design, algorithms and development at the 2006 TopCoder&#174; Collegiate Challenge in San Diego Friday night. Archak, known by his TopCoder handle "nicka81" took $25,000 in prize money for his victory with Mitrichev (aka "Petr") and Ninghai ("PE") earning $25,000 and $15,000 for their first place finishes.
<br><br>
An onsite finalist in both the algorithm and component tracks, nicka81 produced first place submissions for each of three design components from a field of seven designers who competed over the course of three days. Petr is a back-to-back algorithm champion having won the 2006 TopCoder Open first prize in that category. This was the first onsite appearance for PE who submitted two out of three winning development challenges. 
<br><br>
In an interesting side note, programmers from China - "maone" (Mao Yiqiang),  "ACRush" (TianCheng Lou) and "magicpig" (Ronghui Zhu),  took second place in each of the three competition tracks. Third places went to sql_lall (Patrick Coleman of Australia), mathijs (Mathijs Vogelzang of the Netherlands) and kiveol (Nathan Kuchta of the U.S.).
 <br><br>
"We congratulate all our onsite finalists and hope they had a great time here in San Diego," said Rob Hughes, President and COO of TopCoder, Inc. "The growth of our community this year has been truly amazing and we will continue to look for better ways to challenge and empower programmers around the world."
<br><br>
This year marked the first time a TopCoder global event was presented on the internet, Webcast live via AOL's <A href="http://dev.aol.com">http://dev.aol.com</A> site, bringing the excitement and drama of competitive coding at the highest level to a global audience. Thousands of the brightest students from computer science, mathematics, physics and other fields representing 92 countries from around the world spent months locked in qualifying heats. The final 63 were flown in all expenses paid to San Diego to compete for a share of the $200,000 prize purse. 
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
