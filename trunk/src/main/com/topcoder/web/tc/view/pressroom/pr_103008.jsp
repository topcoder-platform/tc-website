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
                    
<div align="right"><tc-webtag:forumLink forumID="524347" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Direct Platform Opens Access to 170,000 Member<br />Community of Software Designers, Developers and Creative Artists</span><br />
<span class="bodySubTitle"><em>Any Size Business Can Now Use Same Level of Talent as Fortune 500 to Build Web<br />Applications, Infrastructure and More</em></span></p>
</div>
      
<p>
<strong>BOSTON/SAN FRANCISCO October 30, 2008 &#151;</strong>TopCoder&reg;, Inc. today opened the world's largest competitive software development community for any business or individual to engage with a new offering called TopCoder Direct®. Previously available only to the enterprise, TopCoder Direct now provides on-demand access to some of the best talent from more than 200 countries-literally competing to build web infrastructure, mobile applications, database systems and creative solutions at a price point the individual company or consumer can set. TopCoder Direct is now available at <a href="/direct">http://www.topcoder.com/direct</a> .
</p>

<p>
TopCoder Direct is a global platform for solutions that empower any business or individual to define and build any type of application - from simple websites to complex business-critical systems. With an easy to use web interface streamlining the process of engaging the TopCoder community, TopCoder Direct allows individuals to launch contests for everything from building a basic logo or redesigning a web site, to creating large transactional databases and custom web applications. TopCoder Direct offers a highly scalable and cost-effective way to support or replace traditional development and creative shops.
</p>

<p>
"Software is the enabler of innovation, and shouldn't be an entry barrier to the more than seven million businesses that struggle finding the top-level talent required to achieve their visions and transform their business," said Jack Hughes, founder and chairman of TopCoder. "TopCoder Direct is the answer, giving everyone access to the same level of top talent and experience. It's a simple interface to harness a massive creative asset and software development engine that effectively taps some of the world's best talent as a virtual software factory."
</p>

<p>
TopCoder software and creative work is performed under a highly structured and competitive process to ensure a quality outcome at an optimal price. This provides the quality and functionality you need, along with the speed and expertise previously only available to the select few.
</p>

<p>
<span class="bodySubtitle">Engage the TopCoder Community Directly</span><br />
The TopCoder community is comprised of members who have backgrounds in everything from software architecture and design to software development, graphical user interface design and creation to deployment and integration.  The community has created and has access to a large library of pre-built digital assets that are used to ensure fast delivery to our customers.
</p>

<p>
<span class="bodySubtitle">TopCoder Direct Platform (Beta)</span><br />
Users gain access to and interact with the TopCoder community through the TopCoder Direct section of TopCoder's website.  A series of highly functional widgets guides the user through the process of setting up contests, pricing and viewing submissions.  The user controls as much of the process as they desire with as much help from the community and TopCoder as desired.  The process and model combine to give unrivaled power to the individual through access to a global community in a competitive format.<br /><br />
Starting today with the creative aspects of application design and implementation: logos, web site graphics design, layout and prototypes, TopCoder Direct will ultimately allow companies and individuals to build entire applications on-line. The ability to interact with community member 'co-pilots' will be implemented in the next release of TopCoder Direct.  For a fee negotiated up-front, these co-pilots will help set-up, define and price competitions for those users that do not have the time or desire to do it themselves.
</p>

<p>
<span class="bodySubtitle">Pricing &amp; Availability</span><br />
When accessing TopCoder Direct users only pay when launching a contest.  Users determine what they would like to set the prize purse amount for a particular contest and TopCoder charges an administration fee based on this amount (currently 20%) of the prize purse.  Part of the administration fee (currently 50 percent) is contributed to a prize pool paid out based on a point based system developed for TopCoder members.  Under beta, creative contests (logos, web-site layout and prototypes, presentations and general graphics) can be launched quickly using only a credit card.  Platform services for larger applications are sold under a subscription and cost-plus pricing model on a case by case basis. For more information on pricing schedules visit <a href="http://topcoderblogs.com/direct/?page_id=2">http://topcoderblogs.com/direct/?page_id=27</a>
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 170,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.  The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.  This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
