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
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=080706"><strong>The Intricate Art of Testing</strong></A>, by <tc-webtag:handle coderId="9927526" /><br>
At some point, every coder experiences the intense feeling of disappointment that comes when you are told your carefully written solution has "Failed System Test." How can you keep from repeating such a mishap? The answer is quite simple: learn the art of testing.
<li><A href="/tc?module=Static&d1=tutorials&d2=prototypePattern"><strong>Prototype Pattern</strong></A>, by <tc-webtag:handle coderId="119676" /><br>
It's Friday afternoon, about an hour before the end of the day. Monday morning is a national holiday, so there is a long weekend in your future &mdash; until the hot coffee breath on the back of your neck makes you think otherwise. It's the boss.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=072406"><strong>How long will this take, anyway?</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br>
It's Friday afternoon, about an hour before the end of the day. Monday morning is a national holiday, so there is a long weekend in your future &mdash; until the hot coffee breath on the back of your neck makes you think otherwise. It's the boss.</li>
</ul>
<span class="bodySubtitle">From the archives:</span><br>
<ul>
<li><A href="/tc?module=Static&d1=features&d2=040104"><strong>Dynamic Programming</strong></A>, by <tc-webtag:handle coderId="299177" /><br>
If you were to survey the reds, you would probably find that 9 out of 10 of them recommend the study of dynamic programming as one of the best ways to improve your rating&#8230; and the 10th doesn't only because he makes it a policy never to help future competitors!</li>
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
