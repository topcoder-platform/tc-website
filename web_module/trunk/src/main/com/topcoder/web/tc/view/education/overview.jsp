<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Educational Content</title>

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
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="edu_overview"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="educational"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<span class="bigTitle">Overview</span>
<br><br>
<span class="bodySubtitle">Most recent articles:</span><br>
<ul>
<%--
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=102306"><strong>A Number or a String: <br>Parsing Your Input and Formatting Your Output in C++</strong></A>, by <tc-webtag:handle coderId="15635590" /><br>
This article is focused on main fast-to-type and convenient means of parsing input and formatting output in cases that are typical for TopCoder problems. All methods are specific to C++, but Java and VB coders may find several helpful ideas.</li>
--%>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=110206"><strong>TCCC Preview: China Steps Up</strong></A>, by <tc-webtag:handle coderId="21196141" /><br>
The 2006 Collegiate Challenge will play host to 13 coders from China, occupying seven slots among the Algorithm semifinalists, one in the Design finals, and six in the Development finals&#8230;</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=103006"><strong>TCCC Preview: Component Competitions</strong></A>, by <tc-webtag:handle coderId="252022" /><br>
With the competition enhancements first introduced at the 2006 TCO adding some interesting twists to the College Challenge's design and development finals, I am expecting an exciting contest in San Diego.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=102606"><strong>TopCoder visits Dalian Software Park</strong></A><br>
Last week TopCoder's Yingying Wu hosted the company's first professional open house at Dalian Software Park, part of "the Silicon Valley of China."</li>
<%--<li><A href="/tc?module=Static&amp;d1=features&amp;d2=101906"><strong>TCCC Preview: By the Numbers</strong></A>, by <tc-webtag:handle coderId="21196141" /><br>
In this article, I'll take a look at some of the numbers and trivia behind the upcoming 2006 TopCoder Collegiate Challenge, and how those compare to last year's tournament and the last few TopCoder Opens.</li>--%>
</ul>
<span class="bodySubtitle">From the archives:</span><br>
<ul>
<li><A href="/tc?module=Static&d1=features&d2=021004"><strong>The 5 Most Common Design Mistakes</strong></A>, by <tc-webtag:handle coderId="119676" /><br>
Being on the review board, I see designs that are first attempts, those that are well polished and everything in-between. After seeing so many, a few mistakes seem to be made over and over.&#8230;I've attempted to summarize their and my experiences in a compilation of the most 5 common mistakes and how to avoid them.</li>
</ul>
<br>
<span class="bodySubtitle">Tell us what you'd like to learn!</span><br>
Got ideas for educational content you'd like to see? Post your idea in <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505803">the forum</A> for members to discuss, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
<br><br>
<span class="bodySubtitle">Write for TopCoder!</span><br>
Got knowledge you'd like to share? Check out our <A href="/tc?module=Static&d1=help&d2=writeForTC">writing guidelines</A> for suggested topics and payment details, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
