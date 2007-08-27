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
<li><a href="/tc?module=Static&d1=tutorials&d2=combinatorics"><strong>Basics of combinatorics</strong></a>, by <tc-webtag:handle coderId="22654859" /><br>
The myriad ways of counting the number of elements in a set is one of the main tasks in combinatorics, and I&rsquo;ll try to describe some basic aspects of it in this tutorial.</li>
<li><a href="/tc?module=Static&d1=tutorials&d2=randomNumbers2"><strong>Generating random distributions, Part 2</strong></a>, by <tc-webtag:handle coderId="251074" /><br>
In <a href="/tc?module=Static&d1=tutorials&d2=randomNumbers">Part 1</a>, I looked at how to generate a single random number or event. Many marathon matches require more complicated lists or sets of items, however, so <a href="/tc?module=Static&d1=tutorials&d2=randomNumbers2">Part 2</a> will focus on how to tackle those.</li>
<li><a href="/tc?module=Static&d1=features&d2=082007"><strong>Meet the August Coders of the Month</strong></a>, by <tc-webtag:handle coderId="8365955" context="design"/><br>
August's "Coders of the Month" include an Italian designer, a Chinese algorithm competitor, and a developer from Bosnia &amp;  Herzegovina.  In this article, we ask them for their advice to newbies, the accomplishments that they're most proud of, and the things that stress them out.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br>
<ul>
<li><A href="/tc?module=Static&d1=features&d2=100506"><strong>TopCoder @ Work: Incorporating new technologies</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br>
The situation: The boss has just returned from a technology conference, no doubt full of torturous new ideas. You perspire in your seat, waiting for the inevitable conversation. What twisted brand of innovation will he force upon your project today? Last year's mandatory integration of XML over HTTP launched the development team into long weekends of unpaid overtime, as "unanticipated" browser compatibility issues plagued your flagship product.</ul>
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
