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
                    
<div align="right"><tc-webtag:forumLink forumID="528036" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">NetEase and Youdao Partner with TopCoder to Host Algorithm Tournament in China</span><br />
<span class="bodySubTitle"><em>Search Engine Subsidiary of NetEase Selects TopCoder Competition Platform to Help Identify Best and Brightest Chinese Programmers for Recruitment</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. and London - May 6, 2009 -</strong>TopCoder, Inc., today announced that China-based NetEase, (Nasdaq:NTES), and its independently developed search engine subsidiary, Youdao, are partnering with the company to host the Youdao TopCoder Tournament, a multi stage computer programming challenge seeking the best and brightest algorithmists from across China. A grand total of more than $70,000 in prizes is to be awarded with the first prize winner earning $7,300. The first phases of the competition will begin with online qualification rounds starting May 31st and culminate in an onsite final July 11th, 2009.  All participants will compete to solve a series of algorithmic brain teasers which will be available in Java, C++, C# and VB. For full competition details visit: <a href="http://www.youdao.com/nanti/">www.youdao.com/nanti/</a>.      
</p>

<p>"Internet technology is changing rapidly, so to continue innovation and to remain competitive the key to success is to discover and cultivate new talent," said Feng Zhou, NetEase Senior Vice President and Youdao Chief Architect.  "The goal of this competition is to identify creative potential within the technical community. It is important not just for NetEase, but on a larger scale for the entire Chinese high technology industry to discover more quality technical talent - particularly from amongst university students in China. Through collaboration with TopCoder, it is our desire to set the highest standards for technical programming competitions throughout China."</p>

<p><strong>Competition Registration and Prize Detail</strong><br />
Registration starts May 5th and ends May 29th. Online rounds will begin May 31st and will culminate with the top 50 competitors earning an all expense paid trip to compete live at the onsite finals in Beijing on July 11th.   The top ten finalists will take share in the more than $70,000 prize purse which includes $7,300 for the first place finalist, and $4,300 and $1,400 awarded to the second and third place finalists.</p>

<p>Top performers will also have the chance to discuss internship and employment opportunities with NetEase Youdao divisions such as NetEase Youdao Search, the NetEase Hangzhou Research Institute and the NetEase Guangzhou Game Development Department. </p>

<p>"We are especially happy to be to be partnering with NetEase and Youdao, both two very popular brands in the fastest growing web market in the world.," said Jack Hughes, Chairman and Founder of TopCoder, Inc. "China has a special significance to TopCoder as so many of our very best and successful members come from this region of the world."</p>

<p>TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world. For more information on TopCoder events and competitions, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p><strong>About Youdao</strong><br />
A brand new Chinese search engine independently developed by NetEase, Youdao search is committed to providing faster and better search services to Chinese Internet users. At the end of 2006, Youdao beta search was launched with a full production version made available in December 2007.  Youdao search products currently include search tools for the web pages, blogs, shopping, images, music, news, video, maps, encyclopedia, translation, a desktop dictionary, tool bar and the Youdao Reader for RSS feeds. </p>

<p>With the rapid development of the internet in China, Chinese internet users have many new search application needs. Youdao is removing barriers and shortening timelines, allowing users to find answers and information more quickly and easily, improving the overall user experience.</p>

<p>Youdao search is based on the powerful product platform and diverse resources of NetEase and has attracted many innovative and talented employees.  Youdao has already attracted more than 100 of the brightest and best young Chinese minds and is growing quickly. For more information visit: <a href="http://www.youdao.com">www.youdao.com</a>.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with over 180,000 developers representing more than 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>
<p>
<em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em>
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
