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
                    
<div align="right"><tc-webtag:forumLink forumID="517549" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit</span><br />
<span class="bodySubTitle"><em>Jack Hughes, TopCoder Chairman and Founder, Joins Elite Lineup of America's Most Engaging <br />Innovators to Showcase the Collaborative Power of Competition</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., September 24, 2007 &#151;</strong>Joining an impressive line-up of national innovation thinkers and doers, TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Chairman and Founder Jack Hughes will speak at the prestigious Business Innovation Factory's third Collaborative Innovation Summit (BIF-3), an intense, energetic, story-based conversation between America's most engaging public and private sector innovators.</p>

<p>Hosted by <em>Wall Street Journal</em> columnist Walt Mossberg and "Mavericks at Work" author Bill Taylor, the BIF-3 Summit features an impressive lineup of national innovation thinkers and doers. Joining TopCoder's Hughes to headline BIF-3, storytellers range from Dallas Mavericks owner and entrepreneur Mark Cuban and 37signals founder Jason Fried, to MIT Age Lab director Joseph Coughlin and Harvard Business School's Clay Christensen. BIF-3 takes place October 10-11, 2007 at the Trinity Repertory Theater in Providence, Rhode Island.</p>

<p>"The BIF Collaborative Innovation Summit is much more a conversation than a conference," said Host Bill Taylor. "By replacing canned presentations with something more personal, the BIF Summit successfully ties together themes of innovation across industries and disciplines in a very provocative way. It is a pleasure to be part of this unique experience." BIF-3 celebrates those "a-ha" moments where ideas intersect and disciplines collide. The Summit is organized around long breaks during which participants enjoy unfettered access to the storytellers and to each other.</p>

<p>"Collaboration is the driving force behind innovation, taking powerful ideas and expanding them through the collective creativity, expertise and real-world experiences of multiple individuals," said Jack Hughes of TopCoder. "We've proven at TopCoder that competition spurs collaboration and innovation to exponentially greater results, and I look forward to sharing my experiences with collaborative competition at BIF-3, trading stories with some of the most brilliant minds of the modern business era."</p>

<p>As a featured storyteller for BIF-3, Jack Hughes will tackle the topic of Collaborative Competition as he shares first hand experiences from building TopCoder into the world's most elite global community of more than 120,000 software developers. One of the more profound paradigm shifts taking place in business today, TopCoder is leading the evolution of the traditional corporate enterprise into the "new corporation" structured around virtual communities. Mr. Hughes will provide a rare first-hand account of the implications of this new frontier, and explain how TopCoder created its proprietary community infrastructure, how it manages the community's deliverables, and the numerous ways in which it has succeeded in benefiting its members and its clients.</p>

<p>To learn more about the BIF-3 storytellers, see a list of registered attendees, and to register for the summit, visit the BIF-3 web site at: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.businessinnovationfactory.com/bif-3' refer='pr_092407' />">www.businessinnovationfactory.com/bif-3</a>.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.</p>

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
