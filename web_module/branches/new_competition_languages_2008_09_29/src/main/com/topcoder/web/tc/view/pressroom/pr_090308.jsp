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
                    
<div align="right"><tc-webtag:forumLink forumID="523212" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Featured in New Book "Crowdsourcing: Why the Power of the Crowd is Driving the Future of Business"</span><br />
<span class="bodySubTitle"><em>Wired magazine's Jeff Howe describes the process by which the power of the many can be<br />leveraged to accomplish feats that were once the province of the specialized few</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. September 3, 2008 &#151;</strong>TopCoder&reg;, Inc., today announced it is featured in the new book "Crowdsourcing: Why the Power of the Crowd is Driving the Future of Business," by <em>Wired</em> contributing editor Jeff Howe. The book examines the growing trend of mass collaboration and the wisdom of the crowd as a new force in business. Howe is widely recognized as having coined the term <em>crowdsourcing</em> in a June 2006 <em>Wired</em> magazine article.
</p>

<p>
In the section Community at Work, Howe follows the growth of TopCoder from its beginnings as a niche online destination for a small handful of competitive programmers to the full-fledged software factory and global community of 167,000 developers and creative technologists it is today.
</p>

<p>
From the book:<br />
<em>Hughes and company could have been following the crowdsourcing playbook, except of course that no such thing existed. In 2003 TopCoder was basically sui generis, employing a model that Hughes would come to call "competitive collaboration". "There was no crowdsourcing. No wisdom of crowds. "We weren't applying theory," says Hughes. "We were a science experiment!"</em>
</p>

<p>
"We are very pleased to be included as an example of how crowdsourcing can work in a commercial environment," said Jack Hughes, Founder and Chairman of TopCoder, Inc. "TopCoder members are the real heroes here; demonstrating that communities can not only play together, but they can also accomplish real work with astounding results.  Not only do our members participate for the benefit of each other, they have built the infrastructure to do so."
</p>

<p>
<span class="bodySubtitle">About the Author</span><br />
Jeff Howe is a contributing editor at <em>Wired</em> magazine, where he covers the entertainment industry among other subjects. Before coming to <em>Wired</em> he was a senior editor at Inside.com and a writer at the Village Voice. In his fifteen years as a journalist, he has traveled around the world working on stories ranging from the impending water crisis in Central Asia to the implications of gene patenting. He has also written for U.S. News & World Report, Time magazine, the Washington Post, Mother Jones, and numerous other publications.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with more than 167,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

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
