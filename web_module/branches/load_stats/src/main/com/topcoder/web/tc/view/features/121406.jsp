<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
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


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506216" message="Discuss this article" />
</div>

<span class="bigTitle">TopCoder Celebrates 100,000 Members</span>
<br><br>
<%--
<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
    <img src="/i/m/rhudson_big.jpg" alt="Author" />
</div>
--%>
<br clear="all">


At the end of the month of January 2001, a total of 18 people had registered as TopCoder members. By June of that year, after the first few SRMs and the first Collegiate Challenge were held, that number had climbed to more than 1,900.  By September 2002 – fifteen months, two tournaments, and more than 100 SRMs later &mdash; the number of members reached over 20,000. 
<br><br>
It took a little longer than two additional years before the member base hit 50,000 &mdash; in January 2005 &mdash; and a little less than two additional years before it again doubled in size, hitting 100,000 on December 14, 2006.
<br><br>
 
<div align="center"><img src="/i/education/graph_20061214.png" alt="Member Growth" border="0" /></div>
 
<br><br>
While many members have come and gone over the years, a great many have stuck around. In fact, more than a quarter of all of TopCoder's registered members have been active on the site within the last six months. Traffic on the site has grown with the member base and now averages more than a million hits per week. 
<br><br>
Earlier this year, we asked TopCoder members what mattered most to them: "What is the one theory, term, or tactic that you most rely on, and that is most responsible for making you a better coder?" The answers covered a broad range of topics, but some common themes emerged that help explain TopCoder's enduring appeal: 
<br><br>
<span class="subtitle">Being part of a community:</span><br>
The unique character of the TopCoder community has been a frequent topic of conversation. In a discussion after the TCO '06, <tc-webtag:handle coderId="119676" /> said, "The community itself should be proud in how it encourages such open, yet non-slashdot like, conversations and friendships." 

<ul>
<li>"I'm not sure that this qualifies as a 'theory' or 'tactic', but the aspect of TopCoder that matters the most to me is the people. Against all odds, TopCoder has managed to create a community that is both on the internet, and something I'm proud to be a part of." - <tc-webtag:handle coderId="22651496" /></li>
<li>"To this question, I would answer 'community'. There is no other competition that has such a strong community, with so many different people and interests, but where everyone is so in love with TC. After all, this is one of the reasons why TC has so many members."-  <tc-webtag:handle coderId="276230" /></li>
</ul>

<span class="subtitle">Having fun:</span><br>
From the "General Discussion" forum to the onsite events, fun is a big component of TopCoder.
<ul>
<li>"Fun:  I believe it's easier when you don't treat it too seriously and don't get discouraged by yet another tournament you haven't qualified for the final." - <tc-webtag:handle coderId="8382018" /></li>
<li>"Having fun when coding." - <tc-webtag:handle coderId="15545604" /></li>
<li>"If I'm not having fun, what's the point?" - <tc-webtag:handle coderId="251184" /></li>
</ul>

<span class="subtitle">Building skills:</span><br>
Education has been central to the TopCoder experience since Day One, with practice rooms and educational tutorials generating a significant percentage of the site's traffic. 

<ul>
<li>"Let me be the first to state the obvious: Practice." - <tc-webtag:handle coderId="19786437" /></li>
<li>"If I can't solve a problem I find that reading other peoples code helps. This is not always easy in the arena where microscopic variable names are used for speed and a terse coding style makes it harder for people to challenge.....  I generally look at several examples and pick the ones with the least code and keep plugging away until I realize what the author has done!" - <tc-webtag:handle coderId="22040641" /></li>
<li>"Feedback. Without this feedback - be it in the form of 'systest results', ratings/rankings, reviews or just plain old money (as a result of doing 'well'), nobody would know where they stand. We wouldn't know our faults nor how to improve ourselves. I myself depend on this feedback (both positive and negative) to learn.  This is what makes TopCoder unique amongst the competition sites… And as far as the design/development competitions go, there is nothing out there like it with regards to the large amount of (anonymous!) review feedback. Most companies don't have such stringent, written, followed, rules.  When you think about it, even the "appeals phase" is a form of feedback - back to the reviewers - which should help THEM improve the way they review submissions." - <tc-webtag:handle coderId="251184" /></li>
</ul>

<span class="subtitle">Challenging oneself:</span><br>
People may come to TopCoder the first time to see how they fare against the competition, but those who come back again and again seem more interested in improving themselves.

<ul>
<li>"Persistence: Nothing has served me better. With it, everything else gets pulled into line. Without it, everything falls apart." - <tc-webtag:handle coderId="10688304" /></li>
<li>"Solving harder problems is a challenge to me. And I want to succeed at them. So I keep trying until I get better at them. This is the only thing which drives me to be a better coder." - <tc-webtag:handle coderId="20464007" /></li>
<li>"Fail and keep trying." - <tc-webtag:handle coderId="13358674" /></li>
</ul>

These are just a few highlights, from just one discussion out of thousands that have taken place since January 2001. Whatever your reasons for participating at TopCoder, we thank you, and we look forward to continuing the conversation over the years to come.
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
