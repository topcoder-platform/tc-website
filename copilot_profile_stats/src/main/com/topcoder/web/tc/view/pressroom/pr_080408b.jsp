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
                    
<div align="right"><tc-webtag:forumLink forumID="522683" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder &amp; Think Services Announce Dr. Dobb's Architecture &amp; Design World 2008 Software Design Contest Winner</span><br />
<span class="bodySubTitle"><em>Architects Challenged to Create and Document Comprehensive Solutions to a Set of System Requirements</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. &amp; SAN FRANCISCO, CA., August 4, 2008 &#151;</strong>TopCoder&reg;, Inc. and Think Services today announced the winner of the recent Software Architecture Contest held during the Dr. Dobb's Architecture &amp; Design World 2008, July 21-24 at the Hyatt Regency McCormick Place in Chicago. Matt Cowan of Chicago won the first prize and Esteban Porcelli of Livingston, New Jersey took second place in the contest.
</p>

<p>
The Software Architecture Contest presented attendees with a real-world exercise in architectural design to determine who could create and document the best comprehensive software solution to address a given set of system requirements within a set timeframe.
</p>

<p>
Cowan won an All Access pass to the Dr. Dobb's Event of his choice including SD Best Practices 2008, SD West 2009 or Dr. Dobb's Architecture &amp; Design World 2009, while Porcelli earned a 50% discount on the Dr. Dobb's Event of his choice.
</p>

<p>
"The Software Architecture Contest provided an engaging and interactive experience for our attendees at Architecture &amp; Design World," said Amber Ankerholz, Conference Manager, Dr. Dobb's Events. "We would like to extend our congratulations to all of the attendees who participated."
</p>

<p>
During Architecture &amp; Design World attendees were asked to create submissions using the same scorecards and criteria that TopCoder uses to judge their own commercial software architecture competitions.
</p>

<p>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software, and incorporate all current industry standard technologies, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
</p>

<p>
"We saw very interesting submissions from our contestants, each of which used different technologies and different stylistic approaches to the problem -- from traditional stack builds to cloud type approaches using Google's App Engine," said Dave Messinger, Chief Architect of TopCoder. "The winning submission presented a very complete and elegant solution to the problem set."
</p>

<p>
<span class="bodySubtitle">About Dr. Dobb's</span><br />
Dr. Dobb's is recognized worldwide as the leading resource for the professional software development community. With an award-winning monthly publication (Dr. Dobb's Journal), worldwide technical events and conferences (Dr. Dobb's Events) and one of the web's most comprehensive sites (Dr. Dobb's Portal), Dr. Dobb's attracts the industry's most authoritative audience of professional developers, architects and managers and provides marketing partners highly actionable integrated marketing solutions to reach the software development buying team.
</p>

<p>
<span class="bodySubtitle">About Think Services</span><br />
Think Services connects specialized communities worldwide using innovative media, educational events, consulting, training and certification. Providing comprehensive opportunities for people to learn from, network with, and inspire each other, Think Services builds strong brands and works within communities to foster a unique affinity with its products and services. The division's flagship products include the Game Developers Conference, the Webby Award-winning Gamasutra.com, Game Developer magazine, the International Customer Management Institute, HDI, and Dr. Dobb's Journal. Think Services is a subsidiary of United Business Media, a global provider of news distribution and specialist information services with a market capitalization of more than $2.5 billion. To learn more, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.think-services.com/' refer='pr_080408b' />">http://www.think-services.com</a>.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 160,000 developers representing over 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.  The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.  This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
