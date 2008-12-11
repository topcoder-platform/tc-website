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
                    
<div align="right"><tc-webtag:forumLink forumID="514576" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">UBS, DRW, and NSA Announced as Sponsors/Patrons of 2007 TopCoder Open</span><br>
<span class="bodySubTitle"><em>UBS and National Security Agency Continue Involvement with Leading Collegiate Computer Programming Contest, DRW Joins at Premier Level</em></span></p>
</div>
      
<p>
<strong>Glastonbury, Conn., March 5, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the sponsor group for the 2007 TopCoder Open (TCO). DRW Trading Group (DRW) will join returning TopCoder premier sponsor UBS&#174; and patron National Security Agency (NSA). Thousands of professional programmers, computer scientists, mathematicians, physicists and talents from an array of fields and disciplines began registering February 19, 2007 to compete online with the goal of advancing to the world-renowned TopCoder Open onsite finals June 26th through 29th. This year, the finals are being held at The Mirage, Las Vegas, NV. Finalists will compete in algorithm, component design and component development divisions as well as the newly featured Marathon Match and TopCoder Studio graphic design events to earn a share of $260,000 in cash prizes.
</p>
<p>
"We are pleased to announce this great group of new and returning sponsors and patrons," said Rob Hughes, President and COO of TopCoder, Inc. "This year's Open has the added excitement of new events like the Marathon Match which rewards long term performance and the TopCoder Studio competition which highlights the field of graphic arts."</p>
<p>
TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 105,000 members that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.</p>
<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.
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
