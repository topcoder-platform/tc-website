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
                    
<div align="right"><tc-webtag:forumLink forumID="521211" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Lilly Partners with TopCoder, to Find Drug Discovery IT Solutions</span><br />
<span class="bodySubTitle"><em>TopCoder Collaboration allows Lilly to Tap into World's Top Software Developers for<br />Solutions to Complex Technology Processes Associated With Drug Discovery</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., May 13, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced a formal partnership with biopharmaceutical firm Eli Lilly and Company <strong>(NYSE: LLY)</strong>. Through the relationship, TopCoder will apply the skills of its global community of top ranked software designers and developers to enhance the software and Information Technology backbone at Lilly.
</p>

<p>
"TopCoder's business model of collaborative software development aligns well with our strategy to leverage external partnerships.  By engaging TopCoder to help us tackle complex drug discovery IT issues, we're looking to increase our overall productivity, accelerate the capabilities of Lilly scientists to deliver medicines to market for urgent medical needs, and ultimately improve health outcomes for patients around the world."  -- Everett Lee, Manager, Discovery Research Information Technology, Eli Lilly and Company.
</p>

<p>
As an innovative biopharmaceutical firm, Lilly works with a wide network of strategic partners seeking answers to some of the world's most urgent medical needs. The company is currently transforming its business, moving from a Fully Integrated Pharmaceutical Company or FIPCo to a Fully Integrated Pharmaceutical Network or FIPNet, striking up strategic partnerships across the globe. Lilly has engaged TopCoder for new software development initiatives which will enhance its process for requesting and distributing chemical samples around the world to assist biologists in testing compounds that are used in assays, or defined tests, to determine if a compound or group of compounds can achieve a desired goal.
</p>

<p>
"Outsourcing complex drug discovery IT issues to TopCoder allows Lilly to become more productive and ultimately speed their medicines to market, thereby improving outcomes for patients," said Rob Hughes, president and COO of TopCoder, Inc. "With a more networked enterprise to leverage collaborations amongst partners, Lilly is able to capitalize on globally shared knowledge and resources."
</p>

<p>
<span class="bodySubtitle">About Eli Lilly and Company</span><br />
Lilly, a leading innovation-driven corporation, is developing a growing portfolio of first-in-class and best-in-class pharmaceutical products by applying the latest research from its own worldwide laboratories and from collaborations with eminent scientific organizations. Headquartered in Indianapolis, Ind., Lilly provides answers - through medicines and information - for some of the world's most urgent medical needs. Additional information about Lilly is available at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.lilly.com/' refer='pr_051308' />">www.lilly.com</a>.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing over 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
