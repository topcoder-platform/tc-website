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
<%--POST THURSDAY JULY 12
<li><a href="/tc?module=Static&d1=features&d2=071207"><strong>An Interview with ahyangyi</strong></a>, by <tc-webtag:handle coderId="21684580" /><br>
"I'm in awe."  Those were the words used by TopCoder member <tc-webtag:handle coderId="22651496" /> in describing <tc-webtag:handle coderId="20812309" />, one of the newest "targets" in algorithm competitions, and the first ever high school student to achieve such status.</li>--%>
<li><a href="/tc?module=Static&d1=tutorials&d2=maxFlowRevisited"><strong>Maximum Flow: Augmenting Path Algorithms Comparison</strong></a>, by <tc-webtag:handle coderId="22671469" /><br>
In this article, we'll revisit the so-called "max-flow" problem, with the goal of making some practical analysis of the most famous augmenting path algorithms. We will discuss several algorithms, and reveal which one is actually most efficient one in practice.</li>
<li><a href="/tc?module=Static&d1=features&d2=070207"><strong>An Interview with Team V. Gimnazija</strong></a>, by <tc-webtag:handle coderId="7390467" /><br>
The team portion of the TCHS 2007 tournament was won by the V. [fifth] Gimnazija team. I sat down and talked with the three winning members, Petar Sirkovic [<tc-webtag:handle coderId="21507690" />], Ivo Sluganovic [<tc-webtag:handle coderId="15604398" />], Goran Zuzic [<tc-webtag:handle coderId="11972352" />], as well as their chaperone, Predrag Brodanac.</li>
<li><a href="/tc?module=Static&d1=features&d2=062807"><strong>Meet the June Coders of the Month</strong></a>, by <tc-webtag:handle coderId="8365955" /><br>
We caught up with June's "coders of the month," to learn a little bit more about them, how they feel about competition, and more&#8230;</li>
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
