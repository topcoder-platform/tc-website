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
    <tc-webtag:forumLink forumID="516358" message="Discuss this article" />
</div>

<span class="bigTitle">Meet the May Coders of the Month</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8365955" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>We caught up with May's "coders of the month," to learn a little bit more about them, how they feel about competition, and more&#8230;</p>

<p>
<div class="authorPhoto">
    <img src="/i/m/vsb_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="21661009" /><br>
SRM 351: 1688<br>
SRM 350: 1661<br>
SRM 349: 1523 
</p>

<p><strong>What brought you to TopCoder? </strong><br>
A bit more that a year ago (May, 2006) I met  <tc-webtag:handle coderId="344259" /> and he told me about TopCoder contests. He said it was very interesting and one could win a prize there.</p>

<p><strong>What's one thing you learned at TopCoder that has helped you in other areas of your life? </strong><br>
I had to learn STL.</p>

<p><strong>What would you compare the experience of competing to -- does it feel like work, or like play, like a sporting event, or something else?</strong><br>
The contest itself is definitely a sporting event J. Training process that precedes the contest is more like work but still is very enjoyable and interesting.</p>

<p><strong>In what kind of environment do you like to compete? </strong><br>
Music, TV and the like impede my concentration. That's why I prefer silence and maybe just the sound of me mumbling something&#8230; I don't like darkness either as it strains my eyes so I try to set good lighting. I remember when my team took part in the regional ACM contest and at the trial round we were placed near the door and the board [Note: "Board" is a computer where participants may view the status of the contest] It was just unbearable. Annoying draughts and other people talking constantly about who is in which place did not give me a chance to gather wits and get to actually solving the problems. So I prefer a calm and comfortable environment. </p>

<p><strong>What was the biggest contributor to your progress this month?</strong><br>
Luck :-)</p>

<p><strong>If you've ever gotten burned out on programming competitions (because of failure or just getting tired), what did you do to overcome it?</strong><br>
Rest. I would go out with my old friends, or play guitar. Now I also ride a bike and backpack. I may spend some time on my studies to improve my knowledge of the disciplines I'm not very good at. Often while I'm reading for an exam, a thought comes to my mind that "how cool it could be to be solving algorithm problems instead" -- but this thought comes to me irrespectively of whether I've gotten burned out on programming competition or not before.  </p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/ShindouHikaru_big2.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="7463987" /><br>
3 wins<br>
1 second place 
</p>

<p><strong>What brought you to TopCoder?</strong><br>
A friend of mine introduced me to TC, and I used to do SRMs regularly with [handle]necramirez[/handle] as practice for local programming competitions.  From there, I found the component competitions and found them interesting, so I got started on them too.</p>

<p><strong>What's the most interesting thing you've seen at TopCoder?</strong><br>
I always find it remarkable how the (component) competitors keep coming up with better approaches to solving the problem.  You can sometimes even see competitors discussing a particular problem among themselves.  It's very likely that you'll learn something new when participating in the competitions.</p>

<p><strong>What would you compare the experience of competing to -- does it feel like work, or like play?</strong><br>
The competitive environment is good fuel to go above and beyond doing a 'regular' job.  It is also very satisfying to receive a good peer review from an experienced reviewer who understands your design.</p>

<p>Going for a DR spot does feel more like a fulltime job because of the time that you need to dedicate to put it several quality designs per week.  But I'd still say that the entire experience is more enjoyable than a regular job.</p>

<p><strong>What's the biggest obstacle you've had to overcome -- or you've seen others overcome?</strong><br>
Poseidon. ;)</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/nebulaDOTlam_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="15046749" /><br>
4 wins<br>
1 second place<br>
1 third place<br>
</p>

<p><strong>What brought you to TopCoder?</strong><br>
At the beginning I joined TopCoder for the algorithm contests. Later I found the development contest can prepare me for realistic programming. It's a good chance for a student to practice the realistic development.</p>

<p><strong>What's the coolest thing you've seen at TopCoder? </strong><br>
In development contest, the coolest (also the most challenge) thing is the timeline, which pushes me to learn new technologies in a short time.</p>

<p><strong>What's a tip or technique that you've observed to be particularly important? </strong><br>
Make sure all design points are correctly implemented and keep improving your submission until Thursday morning.</p>

<p><strong>What advice would you give to someone just starting to learn coding, or starting in TopCoder competitions? </strong><br>
Don't be so embarrassed by mistakes that you forget to learn from them.</p>


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
