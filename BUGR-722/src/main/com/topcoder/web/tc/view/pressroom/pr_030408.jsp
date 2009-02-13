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
                    
<div align="right"><tc-webtag:forumLink forumID="520145" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL Selects TopCoder Enterprise Software Development Platform</span><br />
<span class="bodySubTitle"><em>AOL to Leverage TopCoder "Software Factory" Delivery Platform for Reusable Components, Tools &amp; Processes and Global Development Community</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., March 4, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that AOL has signed on to use the company's TopCoder Enterprise Software Development Platform and associated services. The platform's "Software Factory" approach is based upon TopCoder's unique competitive component-based methodology, and will deliver strategic software development capabilities with lowered cost, shorter timelines and higher quality applications. With the TopCoder Enterprise Software Development Platform, AOL will be able to fully harness the skills and on-demand power of TopCoder's virtual collaborative community of 140,000 ranked and rated software developers.
</p>

<p>
"AOL is excited to further leverage the depth and reach of the TopCoder Community through this powerful platform," said Kevin Conroy, executive vice president,, AOL. "We look forward to TopCoder's support as we continue to provide companies, communities and independent developers with new and innovative experiences on the Web and on mobile devices."
</p>

<p>
AOL's use of the TopCoder Enterprise Software Development Platform includes an enterprise-wide license to the TopCoder Component  Catalog of more than 1,100 reusable software components, access to the TopCoder Enterprise Software Development Platform suite of tools and processes and access to the TopCoder Competition engine of online and onsite programming contests. Over the course of the next 15 months, AOL will leverage the powerful strategic development capabilities presented by this enterprise-wide license to the TopCoder catalog of reusable software components, access the TopCoder "software factory" suite of tools and processes and increase usage of the TopCoder Competition platform of online and onsite programming contests. In addition, AOL will be afforded unique branding opportunities through enhanced access to the global TopCoder community. During the past 3 years more than $11 million has been paid out to over 1,500 of the top ranked and rated TopCoder designers, developers, architects and assemblers who have competed and contributed to produce the TopCoder Catalog.
</p>

<p>
"The TopCoder software factory approach mitigates many of the challenges associated with managing a full time staff of thousands worldwide by delivering high quality software assets and access to a global pool of developer talent," said Mike Morris, senior vice president of TopCoder, Inc. " Our community combined with an automated assembly line type methodology allows enterprise clients to quickly scale development resources up and down as dictated by their ever changing business requirements."
</p>

<p>
With the TopCoder Component Catalog, AOL will now have direct online access to component documentation, source, build environment and source code. Pre-built and pre-tested TopCoder Components are available 'off the shelf' for rapid development of widgets, web 2.0 applications and enterprise strength mobile products such as AOL's Open Mobile Platform.
</p>

<p>
<span class="bodySubtitle">TopCoder Enterprise Software Development Platform Tools &amp; Processes</span><br />
The TopCoder 'Software Factory" license now allows AOL to take full advantage of a suite of powerful tools and processes already being used by TopCoder's global developer community:
</p>

<ul>
    <li><strong>TopCoder Component Catalog</strong>: unrestricted online access to more than 1,100 generic, reusable and custom components;</li>
    <li><strong>Online Review</strong>: project workflow for Applications and Components;</li>
    <li><strong>TopCoder Studio</strong>: a platform for posting new graphic design competitions and to view competition submissions prior to winners being chosen;</li>
    <li><strong>Competition Screening</strong>: validation of component submissions with a set of rules;</li>
    <li><strong>Component Pipeline Report</strong>: access to the TopCoder competition platform posting schedule</li>
    <li><strong>Online Forums</strong>: access to project forums for each AOL-specific competition.</li>
    <li><strong>TopCoder Competition Engine</strong>: TopCoder's best-of-breed programming competition engine and world renowned arenas including Component Design, Component Development, Assembly, Testing, Bug Races and Marathon Matches.</li>
</ul>

<p>
In addition, AOL will be able to leverage the free license <strong>TopCoder Unified Modeling Language (UML) Design Tool</strong> (<a href="/wiki/display/tc/TopCoder+UML+Tool">http://www.topcoder.com/wiki/display/tc/TopCoder+UML+Tool</a>) which provides the ability to specify, visualize, construct, and document the concepts, processes and procedures of software systems.
</p>

<p>
<span class="bodySubtitle">About AOL</span><br />
AOL&reg; is a global Web services company that operates some of the most popular Web destinations, offers a comprehensive suite of free software and services, runs one of the largest Internet access businesses in the U.S., and provides a full set of advertising solutions. A majority-owned subsidiary of Time Warner Inc., AOL LLC and its subsidiaries have operations in the U.S., Europe, Canada and Asia. Learn more at AOL.com.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about utilizing TopCoder's software services or sponsoring TopCoder events, visit <a href="/">http://www.topcoder.com/</a>.
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
