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
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=090506"><strong>TopCoder @ Work: Introduction to upselling, Part 2</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br>
Last week we attacked a common problem -- selling new ideas and functionality to clients -- with a clever acronym (UPSELL). Today, we'll demonstrate how to apply that methodology to a realistic situation.</li>
--%>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=082906"><strong>TopCoder @ Work: Introduction to upselling</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br>
In this article, we'll describe how you can "sell" projects to both internal clients (if you're salaried), and external clients (if you consult), using a model we call UPSELL: Understand, Plan, Story, Estimate, Lock, and Leverage.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=082106"><strong>The Digital Run: Highlights from Stage 1</strong></A>, by <tc-webtag:handle coderId="252022" /><br>
As the first stage draws to an end for The Digital Run, I am going to take stock of this great new competition format. And a great competition it was, with veterans and newbies alike withstanding the challenges of a 13-week marathon and racking up some surprising results.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=081406"><strong>The art of testing C++ code: An introduction to cppUnit</strong></A>, by <tc-webtag:handle coderId="275640" /><br>
Before a motor company releases a new car, it must first be tested to make sure the steering, acceleration and brakes function correctly.&#8230;In the same way, before any software is released into the wild, it should first be subjected to rigorous tests to try to confirm that each section of the code is bug free.</li>
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
