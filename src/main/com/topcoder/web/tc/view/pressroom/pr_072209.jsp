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
                    
<div align="right"><tc-webtag:forumLink forumID="526937" message="Discuss this press release" /></div>
                        
<div align="center">
<p align="center"><strong>Chinese Search Engine Youdao Uses TopCoder Competition Platform to Find Technical Talent</strong></p>
<p align="center"><strong><em>Search Engine Subsidiary of NetEase Attracts 17,000 Competitors in </em></strong><br>
    <strong><em>Algorithm Tournament for Cash and Jobs </em></strong></p>
</div>
      
<p><strong>Glastonbury, Conn. - July 22, 2009 -</strong>&ndash; <strong><a href="http://www.topcoder.com/">TopCoder&reg;, Inc</a></strong><strong>.,</strong> today announced with China-based NetEase, <strong>(Nasdaq:NTES), </strong>and its<strong> </strong>independently developed search engine subsidiary, Youdao, the winners of the <strong><a href="http://www.youdao.com/nanti/">NetEase/Youdao programming competition</a></strong>, a multi stage computer programming challenge seeking the best and brightest algorithmists from across China. Yi Yang, (TopCoder handle: <strong><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=20812309">ahyangyi</a></strong>), was awarded first prize of $7,300 with a score of 2804. Yang successfully answered all six algorithmic problems. Second place and $4,300 went to Huacheng Yu, (<strong><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=14768757">yuhch123</a></strong>), with a score of 1984, and third place was taken by TianCheng Lou, (<strong><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=19849563">ACRush</a></strong>) who earned $1,400 with his score of 1583. </p>

<p>All three top finalists are Tsinghua University students and long time TopCoder members having achieved advanced placement in multiple <strong><a href="http://www.topcoder.com/tc?module=Static&d1=hs&d2=support&d3=index">TopCoder High School</a></strong>, <strong><a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tccc07&d3=about">Collegiate</a></strong> and <strong><a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=overview">Open</a></strong> tournaments. Yang was most recently TopCoder High School champion in <strong><a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview">2008</a></strong>. More than 17,000 programmers registered in May for a chance to qualify and advance to Monday&rsquo;s onsite finals in Beijing and earn part of a grand total of more than $70,000 in prizes. Participants solved a series of algorithmic brain teasers in Java, C++, C# or VB.</p>
<p>&ldquo;As a company driven by technology, NetEase has been focusing on the discovery and training of new technical talent,&rdquo; said Feng Zhou, NetEase Senior Vice President and Head of Youdao. &nbsp;&ldquo;Youdao wanted to provide a stage for competitors and collaborating with a professional programming competition provider like TopCoder, brings a great dynamic into China&rsquo;s IT companies and accelerates the development of our industry.&nbsp;Youdao Nanti will continue as a competition brand in the future.&rdquo; </p>
<p>Top performers also discussed internship and employment opportunities with NetEase Youdao divisions such as NetEase Youdao Search, the NetEase Hangzhou Research Institute and the NetEase Guangzhou Game Development Department. </p>
<p>&ldquo;TopCoder is very pleased and excited by the level of skills and dedication demonstrated by the competitors in this event,&rdquo; said Jack Hughes, Chairman and Founder of TopCoder, Inc. &ldquo;Our Chinese members have been performing very well in our recent international events, which indicates the overall quality of the technical talent pool in China is making it one of the leading talent hot spots of the world.&rdquo; </p>
<p>TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world. <br>
</p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world&rsquo;s largest competitive software development community with more than 210,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/" target="_blank">http://www.topcoder.com/</a>. 
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
