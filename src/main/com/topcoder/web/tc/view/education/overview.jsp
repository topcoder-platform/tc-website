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
<br /><br />
<span class="bodySubtitle">Most recent articles:</span><br />
<ul>
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=071008"><strong>Meet the June 2008 Coders of the Month</strong></a>&nbsp;<br />
This month we caught up with <tc-webtag:handle coderId="22653044" context="algorithm" />, June's Algorithm Coder of the Month, <tc-webtag:handle coderId="9981727" context="design"/>, June's Design Coder of the Month, <tc-webtag:handle coderId="22630348" context="development" />, June's Development Coder of the Month, and <tc-webtag:handle coderId="22690288" context="development" />, June's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</li>
<li><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=hungarianAlgorithm"><strong>Assignment Problem and Hungarian Algorithm</strong></a>, by <tc-webtag:handle coderId="22654859" context="algorithm" /><br />
Are you familiar with the following situation? You open the Div I Medium and don't know how to approach it, while a lot of people in your room submitted it in less than 10 minutes. Then, after the contest, you find out in the editorial that this problem can be simply reduced to a classical one. If yes, then this tutorial will surely be useful for you.</li>
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=062708"><strong>Know your hero: yuhch123</strong></a>, by <tc-webtag:handle coderId="22419265" context="algorithm" /><br />
Yu Huacheng, known at TopCoder by his handle <tc-webtag:handle coderId="14768757" context="algorithm" />, has the honor of being the second target after <tc-webtag:handle coderId="20812309" context="algorithm" /> while still studying in Hangzhou No. 2 high school. Let's get to know him better in his own words.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br />
<ul>
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=100506"><strong>TopCoder @ Work: Incorporating new technologies</strong></a>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br />
The situation: The boss has just returned from a technology conference, no doubt full of torturous new ideas. You perspire in your seat, waiting for the inevitable conversation. What twisted brand of innovation will he force upon your project today? Last year's mandatory integration of XML over HTTP launched the development team into long weekends of unpaid overtime, as "unanticipated" browser compatibility issues plagued your flagship product.</ul>
<br />
<span class="bodySubtitle">Tell us what you'd like to learn!</span><br />
Got ideas for educational content you'd like to see? Post your idea in <a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=505803">the forum</a> for members to discuss, or send an email with your idea to <a href="mailto:editorial@topcoder.com">editorial@topcoder.com</a>.
<br /><br />
<span class="bodySubtitle">Write for TopCoder!</span><br />
Got knowledge you'd like to share? Check out our <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">writing guidelines</a> for suggested topics and payment details, or send an email with your idea to <a href="mailto:editorial@topcoder.com">editorial@topcoder.com</a>.
<br /><br />

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
