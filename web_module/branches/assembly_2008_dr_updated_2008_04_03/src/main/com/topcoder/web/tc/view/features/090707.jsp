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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517269" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Introducing August's Coders of the Month</span>
<br /><br />
<br clear="all">
<p><em>Last month, we saw great performances by three veteran TopCoder members: one from India, one from the Russian Federation, and one from China. In this article, they tell us a little bit about themselves.</em></p>

<p><div class="authorPhoto">
    <img src="/i/m/myprasanna_big2.jpg" alt="myprasanna, August's Algorithm Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="13366203" context="algorithm"/><br>
TCCC07 Rd 1A: 1984<br>
  TCCC07 Qual 1: 1895<br>
  SRM 363: 1727</p>

<p><strong>Q: What brought you to TopCoder? </strong></p>
<p>A: I heard first about the Google India Code Jam and didn't know much about the format of the contest then. I came in at something like 120 in the rankings for the contest, but I was sure I could make it to the onsites the next time. Hence I started competing in TopCoder for practice.</p>
<p><strong>Q: What advice would you give to someone just starting out? </strong></p>
<p>A: Do only what you want to do and do all that you want to do. Make sure no one around you knows what it is. :-) 
<br>I like <tc-webtag:handle coderId="7581406" context="algorithm"/>'s quote: &quot;Well, I can't die of hunger. So let me do what I want to.&quot;</p>
<p><strong>Q: What was the biggest contributor to your progress this month?</strong></p>
<p>A: I am writing a local contest for our campus, to create teams for the upcoming ACM ICPC. I think I wrote a nice problemset, and that helped me practice well written invariant rich code.</p>
<p><strong>Q: Who is your favorite teacher, professor, or coach?</strong></p>
<p>A: First of all, my best inspiration is Shreevatsa, or <tc-webtag:handle coderId="10254716" context="algorithm"/>. I really love following <tc-webtag:handle coderId="144400" context="algorithm"/>'s code. And I enjoy competing, and share a lot in common, with <tc-webtag:handle coderId="7581406" context="algorithm"/>.</p>
<br />

<p><div class="authorPhoto">
    <img src="/i/m/MiG-29_big.jpg" alt="MiG-29, August's Design Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="20437508" context="design"/><br>
3 wins in August<br>
Won last 14 components</p>

<p><strong>Q: What brought you to TopCoder?</strong></p>
<p>A: I got information about TopCoder from <tc-webtag:handle coderId="293874" context="design"/> around 2 years ago. After a while I decided to improve my coding skills and worked on a couple of development components. It was amazing, because I had never been required to code so fast and with such high quality. Next I tried design competitions, and was again amazed by how profitable it was!</p>
<p><strong>Q: What's your proudest TopCoder moment?</strong></p>
<p>A: Of course, it was my first design competition. Before my attempt that component had been reposted several times, and its prize had become very large. So, I decided &ndash; why not start design competitions with this one? There were a total of three submissions, and who would ever have thought that my submission would win!</p>
<p><strong>Q: What's one thing you learned at TopCoder that has helped you in other areas of your life?</strong></p>
<p>A: Fast typing on an English keyboard! The touch method with ten fingers helped me very much, because I recognize that the most needed design competition skill is describing everything. Sometimes I even feel myself sweating all over just from typing. Just try TopCoding and you will feel it, too!</p>
<p><strong>Q: What's the biggest obstacle you've had to overcome? </strong></p>
<p>A: I have to overcome laziness, and I think that's true for most Russian designers and developers too. Simply imagine &ndash; almost all the Russian designers are yellow TopCoders, but we produce only a&nbsp;few components because we like to relax very much. So I always look to <tc-webtag:handle coderId="10574855" context="algorithm"/>'s achievements and try to do my best on the design side.</p>
<br />

<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Yeung, August's Development Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="15604762" context="development"/><br>
4 components, 4 wins</p>

<p><strong>Q: </strong><strong> What brought you to TopCoder? <br>
</strong>A: I joined because I can learn new techniques, and earn good payments, from TopCoder competitions.</p>
<p><strong>Q: </strong><strong> What&rsquo;s your proudest TopCoder moment? </strong></p>
<p>A: I think it would be anytime I've had to teach myself something new.</p>
<p><strong>Q: </strong><strong> What advice would you give to someone just starting to learn coding, or starting in TopCoder competitions?</strong></p>
<p>A: Don&rsquo;t give up. The most difficult part of accomplishing something is getting started. I spent one month on my first component competition, and at the end, the win was robbed by another person.</p>
<p><strong>Q: </strong><strong> What was the most help this month? </strong></p>
<p>A: <tc-webtag:handle coderId="21471587" context="development"/> and <tc-webtag:handle coderId="20076717" context="development"/>, they encouraged me. The <a href="/tc?module=TCCC07ContestDetails&ct=421&eid=3002">TCCC</a> prize is a great encouragement, too. :-)</p>
<p><strong>Q: </strong><strong> Who is your favorite teacher, professor, or coach? </strong></p>
<p>A: <tc-webtag:handle coderId="14788013" context="development"/> -- he is a good competitor and teacher. He teaches me a lot. If you have any questions, you could ask him. :-)</p>
<p><strong>Q: </strong><strong> What's your most stressful TopCoder moment? </strong></p>
<p>A: It's anytime the submission phase is closing, and I haven&rsquo;t finished my submission.</p>
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
