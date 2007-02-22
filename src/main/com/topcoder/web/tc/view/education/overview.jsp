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
<li><A href="/tc?module=Static&d1=features&d2=022207"><strong>Beginning TopCoder Competition with C#.Net</strong></A>, by <tc-webtag:handle coderId="20641048" /><br>
C# is an object oriented, programming language, with a C-based syntax much like C++ or Java. Since its release, its popularity as a coding language for TopCoder competitions has increased each year.</li>
<li><A href="/tc?module=Static&d1=features&d2=021907"><strong>Five things you didn't know about C++, Part 3</strong></A>, by <tc-webtag:handle coderId="251074" /><br>
By popular demand, I'm concluding with a list of another five features, this time featuring ones that you're almost certain never to use in your code. Amaze your friends, confuse your teachers, enter the IOCCC and ask yourself how on Earth these features ended up in the standard.</li>
<li><A href="/tc?module=Static&d1=features&d2=021507"><strong>An Introduction to Marathon Matches</strong></A>, by <tc-webtag:handle coderId="21464956" /><br>
You face a number of different issues in a marathon match than you do in an SRM, from time management and organization to figuring out how the matches actually work. This article can help you understand the unique structure of a marathon match and what it takes to create, test and submit your entries.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br>
<ul>
<li><A href="/tc?module=Static&d1=features&d2=022006"><strong>GCC Hacks: Abusing C++ Extensions for Fun and Profit</strong></A>, by <tc-webtag:handle coderId="251074" /><br>
GCC provides a number of extensions to the C++ language and standard library&#8230; Several of these extensions can be put to use in a TopCoder round. Some will make your program faster; others will save you typing.</ul>
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
