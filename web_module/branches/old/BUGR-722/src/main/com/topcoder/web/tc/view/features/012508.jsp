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
    <tc-webtag:forumLink forumID="519228" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a
</div>

<span class="bigTitle">Meet the December 2007 Coders of the Month</span>
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

<p><em>We caught up with December's Coders of the Month, as well as December's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>


<p>
<div class="authorPhoto">
    <img src="/i/m/neal_wu_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="22663117" /><br />
TCHS SRM 49: 2218<br />
TCHS SRM 48: 2120<br />
TCHS SRM 46: 2053
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I heard about TopCoder from friends, decided to participate in a contest, and found it was fun. :)</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
Either finishing 4<sup>th</sup> at the TCHS finals last year or becoming red in TCHS last month.</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Probably making bugs in my code. In my first SRM I had bugs in all three solutions. :)</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Don't give up, even when you seem to be stuck.</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Work mostly on problems that are hard for you, but not too hard. Also, learn some new algorithms and data structures from time to time, and try to apply them to future problems. Finally, try taking a look at the solutions of others to learn new ideas and techniques (in both problem solving and coding).</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
I've tried to rush less on problems and make sure my solutions are correct, which has helped me have fewer failing solutions.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Failing system tests on a problem I know I should have solved.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I enjoy talking with friends, playing sports, and playing the violin.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/AleaActaEst_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="252022" context="design" /><br />
Four 1st place<br />
Four 2nd place<br />
Three 3rd place
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I am very competitive and through most of my life I participated in many different competitions (not necessarily anything to do with computers) so when I saw that Sun Microsystems was going to sponsor this competition that was hosted by a company named TopCoder (back in 2001 I think it was the advertising for the <a href="/tc?module=Static&d1=tournaments&d2=tccc02&d3=champ">2<sup>nd</sup> Collegiate Challenge</a> and I saw it in the Sun website) and got very interested in TopCoder as a company. The rest is history :) TopCoder IS competition.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
There are many. Qualifying to the TCO was definitely a great one... The TopCoder TCO competitions are pure magic :) I will try my best to be there again.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
I have sustained a pretty bad injury to my right hand which has now become chronic so I have to do everything with my left hand which is awkward and slows me down. It is frustrating but look at my answer to question 5 :)</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Be on time :) Do you know how many submissions I missed because my clock was not synchronized with TC clock? (pathetic but true)</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Just do it.<br />
"But <tc-webtag:handle coderId="252022" context="design" />, I am not good at design, how can I compete?"<br />
- You will become good.. JUST DO IT<br />
"But <tc-webtag:handle coderId="252022" context="design" />, I do not know C#"<br />
- I didn't either. JUST DO IT.<br />
"But..."<br />
- JUST DO IT.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Less sleep, more design time.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
9:00 am submission time. Review going into Appeals phase.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Music, writing, reading... and some sports.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/elkhawajah_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="20284684" context="development" /><br />
4 wins<br />
<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
<tc-webtag:handle coderId="19992271" context="development" /> told me about TopCoder, and encouraged me to participate in algorithm matches, later we started to do development compititons, which is really a good source of money :)</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Being Coder of the Month ;) and also making it into top 3<sup>rd</sup> in DR2007.5.  #2 is really a good feeling :)</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
I've found the biggest obstacle is always motivation. If you can get yourself to work for what you really want, you'll end up with a good result.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
I learned that impossible is nothing :)</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
For development, I am still a junior developer, but trying is the best way to gain experience.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Luck?!!</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Well!! answering these questions :)</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Hanging out with my friends.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/djackmania_big.jpg" alt="Author" />
</div>
Studio Design: <tc-webtag:handle coderId="22690288" /><br />
Won $3,400 in three contests<br />
<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
Once I found TC from a blog which was telling about <tc-webtag:handle coderId="22076237" /> (TC Studio member) who achieved as one of the finalists and finally he was awarded as runner up winner in TCO07. It had inspired me and I was challenged to participate in this global competition. Learning a lot from the past winners and forums, I thought that it was great to try to be the new winner.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
It is when I won the <a target="_blank" href="http://studio.topcoder.com/?module=ViewContestResults&ct=2148">$1000 Weekend! TopCoder Cockpit Storyboard Design</a>. The competition was so hard because of its complexity and very tight deadline, only 3 days to finalize it. I had to compete with 84 competitors, 16 submission and 14 passed screening submission whose storyboard designs were so cool. Furthermore, the design was going to be used for competition website with new rules as being developed by TC. Once more, I'm also glad when I know that my design of <a target="_blank" href="http://studio.topcoder.com/?module=ViewContestResults&ct=2152">"Wayang"</a> and "Selamat Datang" wall art will be colorized at TC's new office.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Working in a very tight deadline with complex requirements and designs, and so many pages/screens to be designed.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
TC has changed my point of view in competitions; I really appreciated the transparent process. I have no fear to answer the global challenge now. Everybody wants to be the winner, but there's only one winner in every competition.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Learning from the past winners to know why they won a competition. Don't be afraid to start, read the spec doc carefully, and spend the time to do the best. Designing with passion, passion and then get paid. :)</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Firstly, she must be my beloved wife, Maya. She always supports me to join the new competitions. Her support has led me to be the winner. And of course secondly, my PC which has been forced to meet the deadlines, again and again.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
It was <a target="_blank" href="http://studio.topcoder.com/?module=ViewContestDetails&ct=2144">myAOL Module Platform Storyboard Design</a>. I've tried to do my best, but I missed one important thing which caused my submission to fail after being re-reviewed. That had seriously shocked me, but I've learnt from this. The design must go on...  Hakuna Matata!</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I am enjoying my precious time with my beloved sweet little Giga. We play football, TumbleBugs and Platypus :), listen to music and sing Giga's favorite song, <em>Hakuna Matata</em>, together. I also teach him something new everyday. Last but not least, I hope I'll get another great experience by competing with other competitors all around the world directly; of course it will be in <a href="/tco08">TCO08</a>. Wish me luck!</p>
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
