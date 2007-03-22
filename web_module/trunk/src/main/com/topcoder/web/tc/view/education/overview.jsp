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
<li><a href="tc?module=Static&d1=features&d2=032207"><strong>The Last 20 Feet</strong></a>, by <tc-webtag:handle coderId="10407399" /><br>
For a few years now, there has been plenty of buzz about the "last mile problem," the final leg of communications connectivity between service provider backbones and the end customer. Whether or not "last mile" connectivity is an issue, we all have to figure out the best possible path for the most important of it -- the last twenty feet. </li>
<li><a href="/tc?module=Static&d1=tutorials&d2=binarySearchRedBlack"><strong>An Introduction to Binary Search and Red-Black Trees</strong></a>, by <tc-webtag:handle coderId="19841837" /><br>
As a programmer, you'll frequently come across tasks that deal with a number of objects -- numbers, strings, people, and so forth -- and that require you to store and process those objects.</li>
<li><a href="/tc?module=Static&d1=tutorials&d2=recursionPt2"><strong>An Introduction to Recursion, Part 2</strong></a>, by <tc-webtag:handle coderId="15498334" /><br>
When our program only has to make one decision, our approach can be fairly simple.  We loop through each of the options for our decision, evaluate each one, and pick the best.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br>
<ul>
<li><A href="/tc?module=Static&d1=features&d2=092806"><strong>Writing Code That Writes Code</strong></A>, by <tc-webtag:handle coderId="10584406" /><br>
Writing code that writes code can be a powerful technique for developers. In an effort to be more productive, developers want to be able to accomplish tasks with fewer keystrokes, bugs, and headaches. While writing a code generator can take longer than simply writing the code, the time you can save in the future will more than make up for the initial effort.</ul>
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
