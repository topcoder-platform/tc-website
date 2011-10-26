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

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>

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
    <tc-webtag:forumLink forumID="516783" message="Discuss this article" />
</div>

<span class="bigTitle">Meet the June Coders of the Month</span>
<br /><br />

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8365955" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>June's "Coders of the Month" are a diverse mix, hailing from Estonia, Ukraine and India, but there are some similarities among them. For example, two of them like to listen to music while they code, while the third compares TopCoder SRMs themselves to musical performances. 


In this article, we'll look at how these three coders approach TopCoder competition, and what they do when they need a break.</p>

<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="8580975" context="algorithm"/><br>
SRM 354: 2428<br>
SRM 353: 2296<br>
SRM 352: 2188</p>

<p><strong> Q: What's your proudest TopCoder moment? </strong></p>
<p> A: I am really proud of currently being the highest rated coder from Estonia. And of course, Coder of the Month is a great honor.</p>
<p><strong>Q: What's one thing you learned at TopCoder that has helped you in other areas of your life? </strong></p>
<p> A: Learning new nuances in C++ built-in functions and algorithms, like memset, __gcd, string manipulation, and STL generic algorithms. They are effective and simple to use, but I did not know much about them before TopCoder. I have also learned how to implement dynamic programming algorithms using recursive functions to make the code much more readable.</p>
<p><strong>Q: What is competing like for you &ndash; does it feel like work, or like play? </strong></p>
<p> A: It is certainly fun to compete, but TopCoder competitions curiously are really fun to watch, too. Despite the poor 1-0-0 problemset in TCO07, the live coverage was really very entertaining, so I would compare TopCoder competitions with performances or concerts.</p>
<p><strong>Q: What kind of environment do you like  to compete in? </strong></p>
<p> A: The environment and general mood is pretty important. I have no special rituals before the contest. Generally it is good idea not to compete at 4:00 AM or in some noisy place, since it is hard to keep concentration. I suggest arriving at the SRM on time. Being late 5 minutes is also OK (unless you miss registration) but if you have to rush too much to get to the Arena you probably won't be very successful.</p>
<p><strong>Q: Anything else you'd like to tell people? </strong></p>
<p> A: Enjoy your summer!</p>
<br />

<p>
<div class="authorPhoto">
    <img src="/i/m/Vovka_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="8518361" context="design"/><br>
2 wins<br>
1 second place<br>
100% reliability</p>

<p><strong> Q: What&rsquo;s the biggest obstacle you&rsquo;ve had to overcome? </strong></p>
<p> A: That&rsquo;s definitely laziness. The rest is just not worth mentioning. </p>
<p><strong>Q: What would you compare the experience of competing to?</strong></p>
<p>A: It depends on the type of a contest. If it&rsquo;s an algorithm match, that&rsquo;s real sport and I should say it demands a lot of psychic energy. Component contests are more like work, but the good point about them is that you have time to think and make everything nice.</p>
<p><strong>Q: What kind of environment do you like to compete in? </strong></p>
<p> A: Normally I crawl deeper into the armchair and turn music on. Though you can&rsquo;t stay like that for too long and need to have a break, at least sometimes&hellip;</p>
<p><strong>Q: Have you ever gotten burned out on programming competitions? What did you do to overcome it?</strong></p>
<p>A: I've taken a break before, just until the desire to compete comes back. Usually that happens in no time.</p>
<p><strong> Q. What do you do to have fun outside of TopCoders?</strong></p>
<p>A. I like backpacking and hitting the silk. </p>
<br />

<p>
<div class="authorPhoto">
    <img src="/i/m/cyberjag_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="15763205" context="development"/><br>
4 development wins</p>

<p><strong> Q: What brought you to TopCoder?</strong><strong></strong></p>
<p> A: I came to learn about TopCoder from Google Code Jam India in 2005.&nbsp; Initially I started with algorithm competitions and later moved to development competitions , which suite me better. </p>
<p><strong>Q: What's your proudest TopCoder moment?&nbsp; </strong></p>
<p> A: Seeing my picture as Coder of the Month. </p>
<p><strong>Q: What advice would you give to someone just starting in TopCoder competitions?</strong><strong></strong></p>
<p> A: Understand that the TopCoder development process is very important. For development competitions , watching the forums is a must. Also I used to look into the other submissions done by my fellow competitors after every competition. </p>
<p><strong>Q: What's the biggest obstacle you've had to overcome? </strong></p>
<p> A: The biggest obstacle for me is getting some free time to participate.</p>
<p><strong>Q: What kind of environment do you like to co</strong><strong> de in ?&nbsp; </strong></p>
<p> A: I am always playing music while I code.</p>
<p><strong>Q: What was the biggest </strong><strong> factor in your success this month? </strong></p>
<p> A: Very little participation for the Hermes components. For m y first submission I totally underestimated the component and I had to learn the technology completely during the Final Fix. Later I realized that very few participants are familiar with JPA, so I tried to participate mainly on those components. </p>
<p><strong> Q. Have you ever felt burned out on programming? What do you do to overcome that feeling?</strong> &nbsp; </p>
<p>A. I will work out in the gym for two hours.</p>
<br />
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
