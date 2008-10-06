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
                    
<div align="right"><tc-webtag:forumLink forumID="523757" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Joins Lineups for SD Best Practices and Software Business 2008 Conferences October 28-31</span><br />
<span class="bodySubTitle"><em>TopCoder Algorithm Contest Takes Center Stage in Boston, TopCoder Presentation on<br />Harnessing the Benefits of Crowdsourcing Highlight of San Francisco</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. October 6, 2008 &#151;</strong>TopCoder&reg;, Inc., today announced its participation in two premier software industry conferences scheduled for the end of October. In Boston, TopCoder will host the SD Best Practices TopCoder Challenge - a timed competition to develop software algorithms as part of the SD Best Practices lineup (October 27-30). On October 30, TopCoder will lead a discussion of crowdsourcing, collaboration and innovation at Software Business 2008 in San Francisco (October 30-31). Attendees are also welcome to stop by the TopCoder booth at each show for a demonstration of new solutions for engaging some of the world's best talent to compete on your next software project.
</p>

<p>
<strong>The SD Best Practices TopCoder Challenge</strong> is a live, onsite programming competition that will provide attendees with a battle against the clock and fellow contestants as they face off on an even playing field with their peers. Two sessions of competition will determine who can deliver the fastest correct solutions to address a series of written problem statements. Contestants will compete for cash, notoriety and other prizes. Please visit TopCoder at <strong>Booth #209</strong> at SD Best Practices in Boston, or for more information on SD Best Practices, please visit: <a target="_blank" href="<tc-webtag:linkTracking link='http://sdbestpractices.com/' refer='pr_100608' />">http://sdbestpractices.com</a>
</p>

<p>
Businesses have recognized the power of engaging online communities as a sounding board and a means to communicate more openly with customers, partners and other influences in the market. In his presentation, "Harnessing the Benefits of Crowd Sourcing Through a Virtual Workforce," TopCoder Senior Vice President Michael Morris will examine what it takes to make open collaboration work as a real business model. The presentation will explore how innovation can transform the way work is done in the software industry, drawing from direct examples of success within the Fortune 500. Please visit TopCoder at Booth #4 at Software Business 2008, or for more information, please visit: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.softwarebusinessonline.com/sb_conf08_index.php' refer='pr_100608' />">http://www.softwarebusinessonline.com/sb_conf08_index.php</a>
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with more than 170,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
