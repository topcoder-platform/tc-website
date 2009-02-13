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
                    
<div align="right"><tc-webtag:forumLink forumID="516084" message="Discuss this press release" /></div>

<div align="center">
<p><span class="bodyTitle">AOL to Webcast TopCoder Open 2007 Finals Live on June 29</span><br>
<span class="bodySubTitle"><em>Coverage of High Stakes Programming Competition <br>Available Globally at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a></em></span></p>
</div>
      
<div align="center">
<A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=trailer&title=Trailer"><img src="/i/pressroom/watchTheTrailer_tco07.png" alt="Watch the Trailer" /></A>
</div>

<p><strong>Glastonbury, Conn., &amp; Dulles, Va., June 7, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, and AOL, a global Web services company, today announced that the 2007 TopCoder&#174; Open (TCO07) will be webcast live at the AOL&#174; Developer site (<a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a>) on Friday, June 29. Coverage of the TCO07 finals from the Mirage Resort in Las Vegas begins at 21:00 GMT.</p>

<p>The 2007 TopCoder Open, sponsored by AOL, will be presented live on the Internet, bringing the excitement and drama of competitive coding at the highest level as some of the brightest programmers and designers in the world work against the clock and each other for a share of $260,000 in prizes. Algorithm, component design and development, Studio graphic design and Marathon Match championships will all be at stake during the ultimate test of computing prowess, speed and accuracy.</p>

<p>"It is our goal with this webcast to bring the same level of excitement and production value to the sport of programming that viewers experience with any number of major league competitions," said Rob Hughes, President and COO of TopCoder, Inc. "These competitors are the very best in mathematics, problem solving and software development."</p>

<p>More than 4,600 talented computer programmers from around the world began competing in qualifying rounds of the TCO earlier this year. Through a series of online rounds, this field has been narrowed down to 77 final competitors comprised of 48 Algorithm, 14 Component, 7 Studio, and 8 Marathon Match competitors.</p>

<p>On Friday, June 29, viewers will be able to visit the AOL Developer site at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a> to watch the competition unfold live starting at 21:00 GMT / 5:00pm EDT / 2:00pm PDT. Over the course of the three hour webcast, viewers will be able to watch the high stakes software competition through live views of the arena, entertaining profiles and interviews with contestants - and in-depth coverage of the final results - in real time.</p>

<p>"AOL is committed to being a catalyst for creativity and innovation around the Web. As a company, it is very important for us to support an event like the TopCoder Open which brings together some of the best talent in the industry," said Balan Nair, AOL's Chief Technology Officer.</p>

<p>The AOL Developer Network provides third-party developers with direct access to AOL's technology platforms and open APIs. For more information about available open APIs, tools and documentation for services such as Open AIM&#174;, Web AIM&#174;, AIM&#174;  Pages, AOL&#174; Video Search powered by Truveo&#174;, MapQuest&#174;, Winamp&#174; and others, please visit <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a>. </p>

<p><span class="bodySubtitle">About AOL</span><br>
AOL&#174; is a global Web services company that operates some of the most popular Web destinations, offers a comprehensive suite of free software and services, runs one of the country's largest Internet access businesses, and provides a full set of advertising solutions. A majority-owned subsidiary of Time Warner Inc., AOL LLC is based in Dulles, Virginia. AOL and its subsidiaries also have operations in Europe, Canada and Asia. Learn more at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.aol.com' refer='pr_060507' />">http://www.aol.com</a>.

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>
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
