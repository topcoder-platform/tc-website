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
                    
<div align="right"><tc-webtag:forumLink forumID="518782" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum</span><br />
<span class="bodySubTitle"><em>Jack Hughes, TopCoder Chairman and Founder, to Share Insight on Using Online Professional Communities to Accomplish Work</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., January 7, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Chairman and Founder Jack Hughes will speak at the Mid-Atlantic CIO Forum (January 17 at Towson University in Maryland). The Forum identifies challenges and issues in information technology, setting an agenda of activities to facilitate interchange and learning among Chief Information Officers and Senior Technology Executives in the Mid-Atlantic Region.
</p>

<p>
The Mid-Atlantic CIO Forum is assembling in January to address the topic of collaboration in today's business era of online communities, social networks and virtual workforces. Jack Hughes was invited to share insight on the power of competition, and how online professional communities can be used to accomplish work. Drawing from his experience building TopCoder, Mr. Hughes will share real world examples of the values, incentives and process necessary to establish the 135,000+ member global community of software designers and developers. Hughes will be joined by speakers Jeff Howe, <em>WIRED</em> contributing editor and leading authority on crowdsourcing, as well as IT Director Jim Robshaw of Cisco.
</p>

<p>
"Online communities provide a true global marketplace for connecting the business world with the top talent, regardless of geographic location," said Jack Hughes, TopCoder chairman and founder. "The key to ensuring success when corporate entities engage an online community seeking real business output, is to start with the right management system and process, while understanding and embracing the cultural aspects of the changing work environment and even the structure of the work itself." Mr. Hughes will discuss the requisite approach necessary for companies to engage and get the best out of professional networks.
</p>

<p>
The Mid-Atlantic CIO Forum is an association of Chief Information Officers and senior information technology executives based in the Mid-Atlantic region. The Forum is designed to foster excellence in business and information technology in an environment that promotes educational and networking opportunities for CIOs facing similar challenges and issues. The Forum is held at Towson University, the largest comprehensive university in the Baltimore area and a major regional conference destination, playing host each year to approximately 10,000 meetings, conferences and special events. For directions and more information on the Mid-Atlantic CIO Forum, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.towson.edu/outreach/cioforum/' refer='pr_010708' />">http://www.towson.edu/outreach/cioforum/</a>
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
