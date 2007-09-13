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
<li><a href="/tc?module=Static&d1=features&d2=091307"><strong>An interview with fabrizyo</strong></a>, <tc-webtag:handle coderId="21926605" context="design" /><br>
While a few final fixes are still pending, and a few scores may yet move, it appears that somebody has finally broken the hold of <tc-webtag:handle coderId="287614" context="design" /> on the <a href="/tc?&ph=112&module=LeaderBoard">Digital Run Design Cup</a>. With 18,515 points in Stage 1 of the 2007.5 DR, Fabrizio Lovato, 27, brings Digital Run bragging rights -- and more than $80,000 in total prizes -- to his home in Italy.</li>
<li><a href="/tc?module=Static&d1=features&d2=091007"><strong>Spotlight: The Arab Academy for Science &amp; Technology</strong></a>, by <tc-webtag:handle coderId="21777558" /><br>
Egypt's <a href="/tc?module=AlgoRank&cc=818">algorithm contingent</a> has 118 current active members and a <a href="/stat?c=country_avg_rating">country rank</a> of 31, along with one (relatively recent) red coder, <tc-webtag:handle coderId="7400531" context="algorithm"/>. In this article, I'll introduce some of the coders from our community, primarily from my school: the Arab Academy for Science and Technology.</li>
<li><a href="/tc?module=Static&d1=features&d2=090707"><strong>Introducing August's Coders of the Month</strong></a><br>
Last month, we saw great performances by three veteran TopCoder members: one from India, one from the Russian Federation, and one from China. In this article, they tell us a little bit about themselves.</li>
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
