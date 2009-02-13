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
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=041808"><strong>Meet the March 2008 Coders of the Month: PaulJefferys &amp; oton</strong></a>&nbsp;<br />
We caught up with <tc-webtag:handle coderId="7394165" context="algorithm" />, March's Algorithm Coder of the Month, and <tc-webtag:handle coderId="22076237" />, March's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</li>
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=032008"><strong>Meet the February 2008 Coders of the Month: oninkxronda</strong></a>&nbsp;<br />
We caught up with <tc-webtag:handle coderId="22418135" />, February's Studio Designer of the Month, to learn a little bit more about him, his proudest TopCoder moments, and anything else he wishes to share with the community.</li>
<li><a href="/tc?module=Static&amp;d1=features&amp;d2=031308"><strong>Computerworld's "Rock star coders" profile: Petr</strong></a>&nbsp;<br />
On January 22, 2008, Computerworld ran an <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='overview' />">article</a> about various TopCoders and how programming has affected their lives.  The following is the full Computerworld interview with <tc-webtag:handle coderId="10574855" context="algorithm"/>, our final member in this series, from which portions were used in the article.</li>
</ul>
<span class="bodySubtitle">From the archives: </span><br />
<ul>
<li><A href="/tc?module=Static&amp;d1=features&amp;d2=100506"><strong>TopCoder @ Work: Incorporating new technologies</strong></A>, by <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br />
The situation: The boss has just returned from a technology conference, no doubt full of torturous new ideas. You perspire in your seat, waiting for the inevitable conversation. What twisted brand of innovation will he force upon your project today? Last year's mandatory integration of XML over HTTP launched the development team into long weekends of unpaid overtime, as "unanticipated" browser compatibility issues plagued your flagship product.</ul>
<br />
<span class="bodySubtitle">Tell us what you'd like to learn!</span><br />
Got ideas for educational content you'd like to see? Post your idea in <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505803">the forum</A> for members to discuss, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
<br /><br />
<span class="bodySubtitle">Write for TopCoder!</span><br />
Got knowledge you'd like to share? Check out our <A href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">writing guidelines</A> for suggested topics and payment details, or send an email with your idea to <A href="mailto:editorial@topcoder.com">editorial@topcoder.com</A>.
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
