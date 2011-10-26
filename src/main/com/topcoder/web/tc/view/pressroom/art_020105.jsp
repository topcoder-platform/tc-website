<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">DE-CODER: The kings of coding</span><br/>
                        <span class="bodySubTitle"><em>By Alan Earls</em></span></p>
                        </div>

<p>
&#8220;Tomek&#8221; and &#8220;Pops&#8221; may be unfamiliar names to you, but in the world of coding competitions, they&#8217;re as big as rock stars.
<br /><br />
Now they&#8217;re at the top of the stack, according to their peers who
participate in online programming contests at TopCoder.com, a mecca for
those willing to publicly test their programming chops.
<br /><br />
Submissions to the competitions (usually divided into
design/development and algorithm categories) undergo peer review before
they are ranked. There&#8217;s prize money and camaraderie&#8212;and participatants
love it.
<br /><br />
&#8220;At the very core of what we do is the belief that competition
is the best method of evaluating ability and delivering quantifiable
results,&#8221; says TopCoder&#8217;s president, Rob Hughes.
<br /><br />
&#8220;Tomek,&#8221; a.k.a. Tomasz Czajka, a Ph.D. candidate in computer
science at Purdue, began participating in online competitions when he
was in high school in Poland. He entered his first TopCoder competition
in 2003 and won the &#8220;TopCoder Open&#8221; two years running, as well as the
TopCoder Collegiate Challenge, earning about $98,000.
<br /><br />
Czajka says he was &#8220;just looking for any kind of programming
contest.&#8221; But since entering TopCoder, the adrenaline rush of
competition has become habit forming. &#8220;The problems are so interesting
so it is very stimulating,&#8221; he adds.
<br /><br />
&#8220;Pops,&#8221; a.k.a. Tim Roberts, an independent consultant in the
Chicago area, and TopCoder member since 2001, focuses on
design/development. Competing on TopCoder not only helps pay bills; his
consistently high rankings also give him a strong reference for
potential clients.
<br /><br />
Mike Morris, TopCoder&#8217;s VP of software development, says the
company has nearly 50,000 members in 160 countries, and about 1,500
compete weekly in online coding rounds.
<br /><br />
For Roberts, TopCoder isn&#8217;t just fun and games; it represents
the future. &#8220;I have been very active on the design side, trying to
improve the process over the years,&#8221; he says. &#8220;I find that many
companies talk about reuse but most don&#8217;t really do it.&#8221; He believes
TopCoder shows it can be done efficiently. &#8220;The stuff they develop is
[of] much higher quality than you&#8217;ll find in most companies.&#8221;
<br /><br />
This article originally appeared in the <a href="http://www.adtmag.com/toc.asp?mon=2&amp;yr=2005" target="_blank">February 2005</a> issue of <a href="http://www.adtmag.com/index.asp" target="_blank">Application Development Trends</a>.
</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
