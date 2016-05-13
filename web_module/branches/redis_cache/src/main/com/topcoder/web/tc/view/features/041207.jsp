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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="515162" message="Discuss this article" />
</div>

<span class="bigTitle">Meet the March Coders of the Month</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" /><br />
      <em>TopCoder Member</em>
</div>
--%>
<br clear="all">

<p>We caught up with March's "coders of the month," to learn a little bit more about them, what brought them to TopCoder, and their insights.</p>

<p>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="22675302" /><br>
TCO07 Qual 1: 1911<br>
SRM 344: 1775<br>
SRM 343: 1592 <br>
Kyoto, Japan
</p>

<p>"I've participated in TopCoder since 03.06.2007. Before I registered for TopCoder, I participated in ACM/ICPC 2005 and 2006, and I register with some online judges.  When I first solved programming problems in ACM/ICPC 2005, I found that solving problems was very pleasant for me."</p>

<p>"<tc-webtag:handle coderId="15764636" />'s <a target="_blank" href="<tc-webtag:linkTracking link='http://d.hatena.ne.jp/nyaasan/' refer='feature_041207' />">blog</a> let me know about TopCoder. TopCoder gives me chances to participate in competitions more frequently, so that attracted me."</p>

<p><strong>What's your proudest TopCoder moment?</strong><br>
"It is moment of submitting. Especially when I've submitted the last problem's solution, it is a very proud moment. But, after the coding phase, when I find my mistakes, I'm in very low spirits."</p>

<p><strong>What advice would you give to someone just starting out?</strong><br>
"Solve and solve and solve and&#8230;and solve problems!  Solving problems is the best way to build skills in programming, knowledge of algorithms and data structure, and so on."</p>

<p><strong>What's the biggest obstacle you've faced?</strong><br>
"English. I always manage to understand the problem statement, but it takes a long time. I must study English."</p>

<p>"Please enjoy programming!"</p>

<p>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="22651514" /><br>
5 wins, 3 second places, 1 third place <br>
Cincinnati, Ohio
</p>

<p><i>In addition to the wins cited above, <tc-webtag:handle coderId="22651514" /> is currently leading Stage 4 of Digital Run Design Cup, with 4125 points. He's also the current leader for the Digital Run Rookie of the Year in Design, with 9430 points (more than twice the tally of the next closest ROTY contender).</i></p>

<p>"I came to TopCoder in September of last year to polish my programming skills and resume. I initially participated in a few algorithms competitions, which I found to be very fun and exciting, before moving on to development and finally design. I've learned a tremendous amount interacting with the TopCoder community, and I look forward to many future competitions."</p>

<p><strong>What's one thing you've noticed about the most successful TopCoder members?</strong><br>
"Top designers at TopCoder are serious about doing quality work, both in design and review. The competition aspect of design at TopCoder is important, but top designers are also serious about seeing the projects they work on succeed."</p>

<p><strong>What's a tip or technique that you've observed to be particularly important?</strong><br>
"Design and development competitions are ruled by the law of supply and demand - TopCoder purchases the work of TopCoder members at the rate set in it's private market. The supply of TopCoder designers is fairly inelastic in the short term -- most people have commitments in their lives that can't be avoided on short notice. On the demand side, TopCoder occasionally needs to move a large project through quickly, which can result in a large number of related projects in a single week. A designer with high reliability and a minimum of unavoidable commitments can profit nicely from these surges in demand."</p>

<p><strong>What advice would you give?</strong><br>
"Have fun. Enjoy the intensity of effort and focus required, and you will succeed."</p>

<p>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="14820574" /><br>
3 wins, 2 second places<br>
GuangZhou, China
</p>

<p><i><tc-webtag:handle coderId="14820574" /> is also having a great Stage 4 of the Digital Run, currently leading the Development Cup with 3070 points.</i></p>

<p>"I first came to TopCoder about two years ago. My friend <tc-webtag:handle coderId="347569" /> told me about <tc-webtag:handle coderId="286907" /> -- that he had won quite some money in the software competition -- and recommended that I have a look. Then I browsed the forums, learned Java, C# and some components. I like the competitions and do them better and better, and am glad that I was selected as a coder of the month."</p>

<p><strong>What's the coolest thing you’ve seen at TopCoder?</strong><br>
"That was about one year ago, when several classmates and I participated in a SRM. We shared our algorithms after the contest, and the feeling was like playing an interesting game with some friends -- unlike software competitions, which are more work than game to me."</p>

<p><strong>What advice would you give?</strong><br>
"The start may be a pain, but don't be frustrated even if you've failed several times. You have gained more experience and will do better next time."</p>

<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
