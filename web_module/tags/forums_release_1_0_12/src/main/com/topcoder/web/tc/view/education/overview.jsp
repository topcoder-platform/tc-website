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
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=061906"><strong>How to prepare for an Assembly Competition</strong></A>, by <tc-webtag:handle coderId="16096823"/><br>
What does it take for you and your team to ace TopCoder's next Assembly Competition? The winner of the very first Assembly contest tells all&#8230;</li>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=061206"><strong>Creating Use Case and Sequence Diagrams</strong></A>, by <tc-webtag:handle coderId="151743"/><br>
This article provides an overview of use case and sequence diagrams, including how they are created, how they influence design, and how they help developers and users.</li>
<li><a href="/tc?module=Static&d1=tutorials&d2=xmiDocumenter"><strong>Using XMI Documenter</strong></a>, by <tc-webtag:handle coderId="15664457" context="development"/><br>
This article will show how the XMI Documenter component can be used to build an XMI documentation editor which can be used as a replacement for the somewhat sub-optimal documentation editing features of Poseidon.</li>
</ul>
<span class="bodySubtitle">From the archives:</span><br>
<ul>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=060204"><strong>Java for C++ coders, and vice versa</strong></A>, by <tc-webtag:handle coderId="251184" /><br>
Three out of the four languages used in TopCoder competitions derive from a common language, C. But there are still differences (and similarities) between C++, Java, and C#. In this feature, I will point out the more significant, and interesting, features that distinguish these three languages&#8230;</li>
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
