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
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=101606"><strong>TCCC Preview: Past Winners Tell All</strong></A>, by <tc-webtag:handle coderId="21196141" /><br>
With the Collegiate Challenge less than a month away, we asked some past TCCC winners for some advice and feedback that could come in handy in San Diego.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=101206"><strong>C++ tools #2 - GNU Make</strong></A>, by <tc-webtag:handle coderId="275640" /><br>
There's a well-known joke about two women eating lunch at a resort. "The food here is so horrible," says one. "I know," replies the other, "and the portions are so small!" There's a somewhat similar paradox that seems to apply to most developers.</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=100906"><strong>Design Patterns in C++, Part 2</strong></A>, by <tc-webtag:handle coderId="21195715" /><br>
Part One of this article covered the Strategy, Adaptor and Iterator design patterns.  This part will cover the Facade and Composition design patterns and the idea of Object Factories.</li>
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
