<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506146" message="Discuss this article" />
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">TCCC Preview: Past Winners Tell All</span>

      <p>
      <img src="/i/m/kzimmerman_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="21196141" /><br>
      <span class="smallText"><em>TopCoder Staff</em></span><br clear="all" />
      </p>

With the Collegiate Challenge less than a month away, we asked some past TCCC winners for some advice and feedback that could come in handy in San Diego.
<br><br>

    <div style="float: left; padding: 0px 20px 20px 0px;"><img src="/i/tournament/tccc04/onsite_photos/alg_finals.jpg" alt="Tomek" border="0" /></div>
    <span class="bodySubtitle">Tomek: "Treat it as a fun game"</span><br>
    <tc-webtag:handle coderId="144400" />'s TopCoder career is legendary. Currently the top-ranked Algorithm competitor, some of his past achievements include being a finalist at this year's TopCoder Open, a finalist at last year's Collegiate Challenge, and the Algorithm Champion at three on-site tournaments in a row: The <A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final" target="_blank">2003 TCO</A> and both the <A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis" target="_blank">TCO</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_finals_analysis" target="_blank">TCCC</A> in 2004.
    <br><br>
    His advice to this year's finalists: "Treat it as a fun game, because it is one, not as a way of making money or anything like that. This way the whole big competition atmosphere -- with the live audience and the media and everything -- will only help you perform well and make it more fun, rather than disturbing you."
    <br><br>
    When asked what, if anything, he will do differently if he makes it to the finals again at this year's tournament, <tc-webtag:handle coderId="144400" /> replies, "As long as I win, I don't need to change anything."
    <br><br>
    "<A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_finals_analysis" target="_blank">Last year</A> I was second," he continues. "Well, it was hard to beat Mathijs that time. He was going for the win from the start of the competition, and he succeeded; I was quite happy about coming in second. Less concentration on the speed, and a little more on solution correctness, could have won it for me."
    <br><br>
    While he is undoubtedly a serious competitor, <tc-webtag:handle coderId="144400" /> emphasizes the value of the overall experience, not just of winning. 
    <br><br>
    "The series of TopCoder contests was one of the factors in my choosing a Ph.D. program in the USA, since it gave me the opportunity to travel to the United States a few times," he says.  "More importantly, the contests let me meet a number of great people who do mathematics and Computer Science research, both in academia and other places, and I am sure it will influence my life a lot."
    <br><br>

<br style="clear:both;">

    <div style="float: left; padding: 0px 20px 20px 0px;"><img src="/i/tournament/tccc05/onsite_photos/shot_development.jpg" alt="Gladius" border="0" /></div>
    <span class="bodySubtitle">Gladius: The importance of sleeping and eating</span><br>
    After a third-place finish in 2004, <tc-webtag:handle coderId="268851" /> came through to win the <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_summary" target="_blank">Development Championship</A> at the 2005 Collegiate Challenge. 
    <br><br>
    His advice for this year's competitors is very practical: "Make sure to get a good amount of sleep, and eat right before the contest," he says. "That can make an absolutely huge difference in how well you perform! Other than that, just try to relax, and have fun coding or designing."
    <br><br>
    In terms of his approach to the finals, <tc-webtag:handle coderId="268851" /> says he would have to follow his instincts if he were in this year's tournament. "I took a gamble in how I approached the requirements by going for an 'all or nothing' approach," he says. "The risk paid off, and I'd probably do it again, but it's a tough judgment call."
    <br><br>
    How did winning affect him? "I've been programming for most of my life, and knew that was what I wanted to do, so it didn't affect my career too much," he says. "However, it did generate some very positive news at my university. I hope it encouraged more students to get into computer science."
    <br><br>

<br style="clear:both;">
    <div style="float: left; padding: 0px 20px 20px 0px;"><img src="/i/tournament/tccc04/onsite_photos/des_finals.jpg" alt="Aksonov" border="0" /></div>
    <span class="bodySubtitle">Aksonov: "Be the best"</span><br>
    A TopCoder Open Component Design finalist in 2003 and 2004, <tc-webtag:handle coderId="277356" /> took home the <A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_editorial" target="_blank">Design Championship</A> at the 2004 Collegiate Challenge.
    <br><br>
    "My advice to finalists is to be confident in themselves, and not be nervous," he says. "Music helped me in that regard."
    <br><br>
    <tc-webtag:handle coderId="277356" />'s strategy for the finals: "If I were in the finals this year I would do the same things as two years ago -- be the best!"
    <br><br>
    As for the overall experience, winning the 2004 Design championship changed <tc-webtag:handle coderId="277356" />'s life in at least one significant way. "TopCoder proposed a job for me," he says, "and currently I'm a TopCoder contractor!"
    <br><br>

<br style="clear:both;">

    <HR>
    <br>
    What's your advice for the collegiate competitors heading to San Diego next month? Discuss it <tc-webtag:forumLink forumID="506146" message="here" />.
    <br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
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
