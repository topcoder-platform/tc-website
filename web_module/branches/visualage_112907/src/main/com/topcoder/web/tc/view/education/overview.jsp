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
<li><a href="/tc?module=Static&d1=tutorials&d2=usingTries"><strong>Using Tries</strong></a>, by <tc-webtag:handle coderId="10200923" context="algorithm"/><br />
There are many algorithms and data structures to index and search strings inside a text, some of them are included in the standard libraries, but not all of them; the trie data structure is a good example of one that isn't.</li>
<li><a href="/tc?module=Static&d1=features&d2=111207"><strong>TCCC07: So this guy goes to Orlando, and ...</strong></a>, by <tc-webtag:handle coderId="22666646" /><br />
<tc-webtag:handle coderId="22666646" />, a.k.a. Adrian Nadjiwon (TopCoder Studio member and self-proclaimed nicotine addict) lends his perspective of the 2007 TopCoder Collegiate Challenge from Walt Disney World.</li>
<li><a href="/tc?module=Static&d1=features&d2=110707"><strong>Meet the October 2007 Coders of the Month</strong></a><br />
Don't miss this month's Meet the Coders, where <tc-webtag:handle coderId="21684580" context="development" /> gives an insider's view into the Component Development Competition.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br />
<ul>
<li><A href="/tc?module=Static&d1=features&d2=100506"><strong>TopCoder @ Work: Incorporating new technologies</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br />
The situation: The boss has just returned from a technology conference, no doubt full of torturous new ideas. You perspire in your seat, waiting for the inevitable conversation. What twisted brand of innovation will he force upon your project today? Last year's mandatory integration of XML over HTTP launched the development team into long weekends of unpaid overtime, as "unanticipated" browser compatibility issues plagued your flagship product.</ul>
<br />
<span class="bodySubtitle">Tell us what you'd like to learn!</span><br />
Got ideas for educational content you'd like to see? Post your idea in <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505803">the forum</A> for members to discuss, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
<br /><br />
<span class="bodySubtitle">Write for TopCoder!</span><br />
Got knowledge you'd like to share? Check out our <A href="/tc?module=Static&d1=help&d2=writeForTC">writing guidelines</A> for suggested topics and payment details, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
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
