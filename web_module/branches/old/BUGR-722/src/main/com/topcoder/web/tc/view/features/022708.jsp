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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="520004" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a
</div>

<span class="bigTitle">Meet the January 2008 Coders of the Month</span>
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

<p><em>We caught up with January's Coders of the Month, as well as January's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>


<p>
<div class="authorPhoto">
    <img src="/i/m/blueblimp_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=5">Algorithm</a>: <tc-webtag:handle coderId="22504795" context="algorithm" /><br />
SRM 389: 2539<br />
SRM 388: 2473<br />
SRM 387: 2476<br />
SRM 386: 2423
</p>

<p><strong>What brought you to TopCoder?</strong><br />
There was an online Q&amp;A with <tc-webtag:handle coderId="152347" context="algorithm" /> in which I believe he mentioned that TopCoder helped him get a job at Google. TopCoder sounded interesting, so I signed up.</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
There are a few, but I'd pick <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=srm377">SRM 377</a>, which was the first time I solved all three Division 1 problems. Before then, I had gained rating by being faster on the first two problems and solving the Medium more often. It is more satisfying to start solving the Hard. (Unfortunately, SRM 377 was so plagued by problems that the statistics for it do not even show up on the TopCoder website, although the match ran smoothly for me.)</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
My inability to solve the Hard took a while to fix. Speed and accuracy are rarely problems for me, but they are only useful when I can see how to solve a problem. The main goal of my practice has been to solve the Hard problem more often.</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Dynamic programming, certainly. I have yet to need other algorithms in practice, but I've solved several real-world problems using dynamic programming. I learned dynamic programming in my first week at TopCoder, and since then have received a lot practice in the technique from TopCoder and other contests. Dynamic programming is not my favourite algorithmic technique in contests (I prefer graph algorithms), but it has helped the most elsewhere in my life.</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Avoid focusing too much on solving problems. Most of my improvement has come from learning new algorithms and studying others' solutions. TopCoder is an excellent resource for the latter, since all solutions are public. I also find learning algorithms and techniques to be the most satisfying training. But don't forget to compete as well, because SRMs are exciting and good motivation to study.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Around August 2007, I spent time reading CLRS, studying others' solutions to Medium and Hard TopCoder problems, and working through the USACO training. All my progress since then has been driven by that effort. My difficulties since then mostly have been foolish mistakes in the Medium problem, and I avoided those in January.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
That would be not advancing to the on-site rounds of TCCC '07 solely because of a dumb mistake in the Easy that could have been fixed by adding two characters. Hopefully nothing similar happens in TCO '08. :)</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I find taking mathematics courses a lot of fun. :) I also enjoy music, particularly playing the piano. And games of various sorts: video games (of the Guitar Hero and Super Monkey Ball type), card games (Set is fun, as are various trick-taking games), and board games.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/d000hg_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=6">Design</a>: <tc-webtag:handle coderId="21464956" context="design" /><br />
Three 1st place<br />
One 2nd place<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
A friend was telling me about some multi-threaded contest run by Intel a couple of years ago, I went to their site and had a look but wasn't too interested. However on their site I also found that Intel were sponsoring some contests on a site called TopCoder... it turned out these were the <a href="/longcontest/stats/?module=ViewOverview&amp;rd=9881">Intel Multithreaded Marathon Matches</a>. All my previous programming contest experience had been much more laid back, writing games, where people chatted about what they were working on, so it took me a little time to adjust to the more formal format for TC contests. But the contests were fascinating and I was quickly hooked.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Coming 2nd in division in <a href="/stat?c=round_overview&er=5&amp;rd=11123">SRM389</a>. I rarely solve the hard problems so I was particularly happy to get a rainbow (each problem solved using a different language).</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
I think it would have to be getting to grips with the TC component library. Either that, or the pain of having to use Poseidon... it's odd to think that some designers/developers reading this will have escaped that particular torture. Maybe by the time <a href="/wiki/display/tc/TopCoder+UML+Tool">The TCUML tool</a> reaches 2.0 it will be just a distant memory, but as long as that trident icon adorns my desktop the fear never goes away.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
It's hard to choose just one. The first time I found a real-world application for Dynamic Programming was pretty cool, but much more useful is the experience I've gained doing UML design work. And it was the Digital Run which made me realise I could leave my job and work from home as a freelance software developer... which is what I do now! So it's quite fair to say TopCoder changed my life!</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Take the time to explore the site, including the wiki. There is a lot of content but it can be hard to find everything. If you're doing SRMs, then don't rush to submit 3 problems fast, pay attention to the parameter constraints, and be VERY careful of using floating point numbers. If you're doing design contests, then be very thorough. Check you document every argument of every method and so on, there are so many easy points here.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
The new architecture contests gave me a chance to do something new, and there wasn't a lot of competition. It's fun to see my components go through the pipeline and I'm really interested to see how this new contest type develops this year. Hopefully we'll see more contests and an architecture DR.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Every time I open my review scores for a design contest, and see how my beautiful design has been ripped to shreds!</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I play guitar, I love to read, I play a lot of PES and I watch a bit of TV. I still tinker with making games for fun and I'm also developing a taste for fine single-malt whisky. In theory I'd love to do something a little more active like tennis or swimming, but somehow I don't seem to find the time for those :)</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=7">Development</a>: <tc-webtag:handle coderId="20224338" context="development" /><br />
Two 1st place<br />
Two 2nd place<br />
One 3rd place
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I heard about Topcoder in a party of another competition.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Saw my handle on the home page.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
English skills.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Anything can be better.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Please, participate in some components, try to submit and study the reviewer responses as well as the winning submissions.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
<tc-webtag:handle coderId="14840263" context="design" />, he is the designer of almost all my winning components of this month.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Appealing some components that scored less than 75, because every point counts.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Movies, cooking and walking with my dog.<br /><br />Thank you.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
Studio Design: <tc-webtag:handle coderId="22705851" /><br />
Won $1,850 in six contests<br />
<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
One day, I read a blog about TopCoder development competitions. It's very interesting. And then I found TopCoder hold UI design competitions too, which is more interesting for me. So I registered an account and became one of the TopCoder Studio members.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Completed two Cockpit widget design contests within one day, and fortunately, I won both.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
My English isn't good enough. Compared with the other members, I lacked in experience too.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
We must persist in the most hard moment.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
As same as the above answer.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Admins. They answered many questions very kindly. They help me a lot indeed.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
I submitted my prototype files for the <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2170">TopCoder Cockpit Report Widget Prototype</a> just 3 minutes before the deadline. I won this contest luckily.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I like travel very much. Watching movie is another big fun for me.<br /><br />Thank you very much!</p>
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
