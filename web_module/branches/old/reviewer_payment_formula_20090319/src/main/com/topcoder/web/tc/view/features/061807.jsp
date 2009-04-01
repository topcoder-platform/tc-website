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
    <tc-webtag:forumLink forumID="516231" message="Discuss this article" />
</div>

<span class="bigTitle">TCO Preview: Meet Team Russia</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/Petr_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10574855" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p>There are 12 coders representing the Russian Federation in the TCO07 Algorithm competition onsite, and
one coder representing the Russian Federation in the Marathon track. Considering previous
Algorithm onsite events, we had 6 competitors in the TCO 05 finals, 8 competitors in the TCO 06 finals,
and 16 competitors in the TCCC 06 finals &mdash; so this year marks the end of steady growth for Russia.
But the more interesting stat is that prior to the 2005 TCO only one Russian ever advanced to a TopCoder 
onsite Algorithm event &mdash; <tc-webtag:handle coderId="274023" context="algorithm"/> in the TCO 03. Then, what was the reason for that jump in the TCO 05?</p>
<p>That jump unveils one important property of Russian programming contest competitors &mdash; we all keep
in contact. There are many All-Russian competitions, including, but not limited to the ACM ICPC semifinal 
NEERC as the biggest event for university students and the All-Russian high school olympiad as the
community center for highschoolers. These two biggest shows are accompanied by many other 
internet and onsite contests, and most Russian competitors try to participate in many, if not all,
of them. That means frequent meetings, and constant competition, and search for more fun contests to 
participate in. That's why when several Russian competitors started to participate in TopCoder SRMs 
regularly -- after finding that they brought so much fun and experience, the entire community followed suit and jumped into TopCoder.</p>
<p>Another exciting thing such a community brings for Russian competitors is that older competitors
tend to teach the newbies, thus passing and accumulating the experience. Let's take a closer
look at this year's finalists by 'generation' &mdash; from the most experienced ones to the
powerful youngsters. :)</p>
<br>
<h3>Generation 1: The gurus</h3>
<p>
<div class="authorPhoto">
    <img src="/i/m/andrewzta_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="11829284" context="algorithm"/><br/>
<i>Has taught these finalists at some point</i>: <tc-webtag:handle coderId="21971539" context="algorithm"/>, <tc-webtag:handle coderId="22641345" context="algorithm"/>, <tc-webtag:handle coderId="15881985" context="algorithm"/>, <tc-webtag:handle coderId="19721111" context="algorithm"/>, 
and in some sense all others by posting a total of 24 contests (roughly 240 problems!) at the Russian ICPC training camps during the last five years.<br/>
<i>ACM ICPC finalist</i>: 2000, 2001.<br/>
<i>TC Algorithm rating (max)</i>: 2812 (3198).<br/>

<i>TC rated Algorithm events</i>: 94.<br/>
<i>TC problems authored</i>: 14.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCO 06 &mdash; 6th place, TCCC 06 &mdash; 4th place.</p>
<p>Andrew joined the Russian progamming contest community in the late 1990s, and has become
one of its key figures since then. Having participated in the ICPC World Finals in 2000 and 2001,
and earning fourth and the third place respectively, he continued his career as a coach,
and became one of the best (and most successful) coaches in Russia. As a result, he led the SPb IFMO team
(with <tc-webtag:handle coderId="15881985" context="algorithm"/> as one of its members) to the world championship in 2004. However, in the summer of 2005
TopCoder made him return as a regular competitor (after about 4 years!), and he gradually regained
his form to become a target in less than a year.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="7485898" context="algorithm"/><br/>
<i>Has taught these finalists at some point</i>: <tc-webtag:handle coderId="19721111" context="algorithm"/>, and most of the others by
posting many good contests at the Russian ICPC training camps and http://acm.sgu.ru online judge.<br/>
<i>ACM ICPC finalist</i>: 2002, 2003.<br/>
<i>TC Algorithm rating (max)</i>: 2667 (2726).<br/>
<i>TC rated Algorithm events</i>: 81.<br/>
<i>TC problems authored</i>: 86.<br/>

<i>Previous TCO and TCCC onsite appearances</i>: TCO 05 &mdash; semifinalist.</p>
<p>Andrew (again :)) was one of those at the origin of the programming contest community at the Saratov
State University. Unlike many other bright students who decide to study in major Moscow and St. Petersburg
universities, he stayed in Saratov, and formed a team together with <tc-webtag:handle coderId="308953" context="algorithm"/> and <tc-webtag:handle coderId="309641" context="algorithm"/> 
that made the world know of Saratov
programmers by placing 6th and 7th in the 2002 and 2003 ICPC World Finals. Later, he helped coach
other Saratov teams, and Saratov State finally became World Champions in 2006. He was one of the few
Russians actively participating in TopCoder SRMs before 2005, and has also become a respected
TopCoder problem writer.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/nicka81_big3.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="293874" context="algorithm"/><br/>
<i>TC Algorithm rating (max)</i>: 2369 (2791).<br/>
<i>TC rated Algorithm events</i>: 164.<br/>

<i>Previous TCO and TCCC onsite appearances</i>: TCO 05 &mdash; 8th place, TCO 06 and TCCC 06 &mdash; semifinalist.</p>
Nikolay is one of the few Russian TopCoder members not actively involved in the Russian
progamming contest community: he wasn't a big contest lover during his university years, and moved abroad
after his graduation in 2002. However, he became an active TopCoder member while working abroad,
reaching the top in both Algorithm and Component Design competitions. He has attended the onsite part for both
Algorithm and Design tracks of the last three major TC tournaments &mdash; incredible enough on its own, but he
also won the Design competition twice! This year he cut down
his time spent on TC, thus not participating in the Design competitions, but still managed to grab
an onsite Algorithm spot.</p>

<br>
<h3>Generation 2: The veterans</h3>
<p>
<div class="authorPhoto">
    <img src="/i/m/pashka_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="15881985" context="algorithm"/><br/>
<i>Has taught these finalists at some point</i>: <tc-webtag:handle coderId="19721111" context="algorithm"/>, <tc-webtag:handle coderId="21971539" context="algorithm"/>, <tc-webtag:handle coderId="22641345" context="algorithm"/>.<br/>

<i>ACM ICPC finalist</i>: 2004, 2005.<br/>
<i>TC Algorithm rating (max)</i>: 2539 (2701).<br/>
<i>TC rated Algorithm events</i>: 50.</p>
<p>Pavel is one of the most sucessful graduates of <tc-webtag:handle coderId="11829284" context="algorithm"/>'s 'school'. He moved to St. Petersburg
after earning a silver medal at the IOI 2002 and thus being accepted freely into SPb IFMO, and found himself 
under the strong supervision of Andrew. As it was mentioned before, this resulted in his team winning the 
World Champions title in 2004. Having retired from the ICPC after placing 3rd in 2005, Pavel became an assistant coach,
but returned as a competitor shortly after TopCoder spread over Russia. However, he started participating
regularly in TopCoder SRMs only in 2006, and is in my view still trying to get used to the TopCoder
style and to regain all his skills. This guy might become a target very soon.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="7340263" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2006.<br/>
<i>TC Algorithm rating (max)</i>: 2565 (2723).<br/>

<i>TC rated Algorithm events</i>: 88.<br/>
<i>TC problems authored</i>: 25.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCO 06 and TCCC 06 &mdash; semifinalist.</p>
<p>Alexey is one the four finalists representing the Ural region of Russia. As a member of the Ufa SATU team,
he earned 10th place at the 2006 World Finals. His alliance with <tc-webtag:handle coderId="2058177" context="algorithm"/> is a good example
of a self-made team. Ufa was never famous for its programming competition achievements 
(unlike Moscow, St. Petersburg, Saratov or Yekaterinburg), but those guys put in a lot of hard work,
participated in a lot of online contests, solved most of the available problem archives &mdash; and they
got rewarded. <tc-webtag:handle coderId="7340263" context="algorithm"/> is a stable red at TopCoder, notable for his amazing challenges.
He has also become a regular problem writer.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Revenger_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="2058177" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2005, 2006.<br/>
<i>TC Algorithm rating (max)</i>: 2541 (2952).<br/>
<i>TC rated Algorithm events</i>: 105.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCCC 06 &mdash; semifinalist.</p>
<p>The story of Denis is similiar to the one of his teammate <tc-webtag:handle coderId="7340263" context="algorithm"/>. Having earned
the 13th and the 10th places in the ICPC finals, he is still actively participating in online
programming contests after his ICPC retirement. Denis was quite close to becoming a target
this winter, so he is capable of putting in some really amazing performances. Maybe one of them
will to be seen at this TCO?</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/abikbaev_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="22628392" context="algorithm"/><br/>
<i>TC Algorithm rating (max)</i>: 2565 (2904).<br/>
<i>TC rated Algorithm events</i>: 34.</p>
<p>Alexander is representing the biggest city of the Ural region - Yekaterinburg. His school,
Ural State University, has participated in the ICPC World Finals five times, however, Alexander's
team was never able to get there, thus he is an exception among this year's Russian finalists. He became red in early 2007, and has been constantly rising until the middle of May, achieving a near-target
status. Who knows, maybe TopCoder format suits him better?</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/DOTInvader_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="15803924" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2006.<br/>
<i>TC Algorithm rating (max)</i>: 2502 (2550).<br/>
<i>TC rated Algorithm events</i>: 72. <br/>

<i>TC Marathon rating (max)</i>: 1931 (1931).<br/>
<i>TC rated Marathon events</i>: 4.</p>
<p>Maxim is representing another diamond in the crown of the Russian programming schools &mdash; the Petrozavodsk
State University. Heavily supported by the University, and even by the local government,
Petrozavodsk students are among the most motivated to perform  in programming contests. Regular two-week
training camps for all the top Russian teams take place in Petrozavodsk twice a year, so it's a base
for a constantly evolving Russian university students' programming contest community, and Petrozavodsk
students have a chance to compete with and  learn from the finest Russian teams and coaches. Maxim's team
earned the 19th place at the 2006 ICPC World Finals.</p>
<p>However, it is the introduction of the Marathon Matches that allowed Maxim to show his best and
get a ticket for the TCO. Many have wondered before the TCO online rounds whether the top ranked
algorithm coders would occupy all the top marathon spots if they put enough effort in it, however,
it turned out that Marathon Matches' 'usual suspects' have a skillset better adjusted for the
format, and the participation of many algorithm reds didn't make much difference. Maxim is clearly in
posession of the required skills, so let's wish him luck in the Marathon track!</p>

<br>
<h3>Generation 3: The rookies</h3>

<p>
<div class="authorPhoto">
    <img src="/i/m/darnley_big2.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="21971539" context="algorithm"/><br/>

<i>ACM ICPC finalist</i>: 2006, 2007.<br/>
<i>TC Algorithm rating (max)</i>: 2808 (2868).<br/>
<i>TC rated Algorithm events</i>: 27.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCCC 06 &mdash; semifinalist.</p>
<p>Mikhail became famous among the Russian programming contest community by placing second in the 2003 
All-Russian high school olympiad and then moving to the U.S. for the last two years of his high school 
studies. However, he then returned back to Russia and joined the SPb IFMO, and together with <tc-webtag:handle coderId="22641345" context="algorithm"/>
and <tc-webtag:handle coderId="22248856" context="algorithm"/> formed the first team of the school (after the retirement of <tc-webtag:handle coderId="15881985" context="algorithm"/> and his
teammates). They have only managed to place 19th at the 2006 World Finals, but fought back in 2007 to
keep the tradition of SPb IFMO teams placing third in the odd years (true for 1999, 2001, 2003, 2005 and 2007).
Mikhail is now at the turning point of his life (at least with respect to programming competitions), and
we hope he will stay in the community to help <tc-webtag:handle coderId="11829284" context="algorithm"/>, <tc-webtag:handle coderId="15881985" context="algorithm"/> and all of us to find
and teach new champions.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/falagar_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="22641345" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2006, 2007.<br/>
<i>TC Algorithm rating (max)</i>: 2445 (2665).<br/>
<i>TC rated Algorithm events</i>: 17.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCCC 06 &mdash; semifinalist.</p>
<p>Roman's greatest achievements also belong to the SPb IFMO team. However, he perceived
placing third at the 2007 ICPC World Finals as the top of his career, and is starting to abandon
the programming competitions world and to move into the world of mathematical research. Well,
let's hope he will at least find enough time to participate in TopCoder SRMs and tournaments!</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Vitaliy_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="21822659" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2006, 2007.<br/>
<i>TC Algorithm rating (max)</i>: 2495 (2530).<br/>
<i>TC rated Algorithm events</i>: 34.<br/>
<i>Previous TCO and TCCC onsite appearances</i>: TCCC 06 &mdash; semifinalist.</p>
<p>Vitaliy is representing another major St. Petersburg school &mdash; the St. Petersburg State
University. After the astounding success of their team led by <tc-webtag:handle coderId="22641704" context="algorithm"/> and <tc-webtag:handle coderId="15805598" context="algorithm"/> in 2000 and 2001, 
winning two world championships in a row, they're still trying to at least come close to that level.

<tc-webtag:handle coderId="21822659" context="algorithm"/>'s team has managed to come 6th and 14th in the last two years &mdash; but we 
expect more from the team of <tc-webtag:handle coderId="15868491" context="algorithm"/>, <tc-webtag:handle coderId="21111148" context="algorithm"/> and <tc-webtag:handle coderId="21468741" context="algorithm"/> next year. 
<tc-webtag:handle coderId="21822659" context="algorithm"/> has also made a solid contribution into the teaching of high school students by
participating in training camps, and is still helping the community. He has placed 16th at the TCCC 06
last online round, and 14th at the TCO 07 last online round, showing he can pull himself together and
perform well when it is required &mdash; this can surely help him onsite.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/VitalyGoldstein_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="19721111" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2005, 2007.<br/>

<i>TC Algorithm rating (max)</i>: 2726 (2735).<br/>
<i>TC rated Algorithm events</i>: 52.<br/>
<i>TC problems authored</i>: 12.</p>
<p>Vitaliy has spent a lot of time solving programming contest problems during his last year of high school,
and that allowed him to jumpstart his career by winning the All-Russian high school olympiad in 2004.
Ever since, he has been participating in almost all programming competition events, in the university ones
as a participant, and in the high school ones as an assistant coach. As the ICPC participant in the
Saratov State University team, he earned 17th and 6th places at the World Finals. His interest in working with
high school students has also allowed him to author several HS SRMs, and the TCHS tournament semifinal.
More than that, <tc-webtag:handle coderId="19721111" context="algorithm"/> has always been a permanent source of good cheer at any event
he participated in.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/yava_big.jpg" alt="Author" />
</div></p>
<p><tc-webtag:handle coderId="20208899" context="algorithm"/><br/>
<i>ACM ICPC finalist</i>: 2005, 2007.<br/>

<i>TC Algorithm rating (max)</i>: 2372 (2372).<br/>
<i>TC rated Algorithm events</i>: 17.</p>
<p>Vladimir is the fourth, and the youngest representative of the Ural region, and the second representative 
of Yekaterinburg. His ICPC team,
Ural SU Osliki, has achieved quite a success in many online and onsite programming competitions,
culminating in advancing to the World Finals twice and earning 17th and  26th places. <tc-webtag:handle coderId="20208899" context="algorithm"/>
is still quite unaccustomed to TopCoder, alternating really good performances with awfully bad ones.
Let's hope he'll do the former at the TCO!</p>
<p>That completes the Russian team &mdash; are all the others ready for battle? The strengh of the Russian
team lies both in its diversity and in its unity. You will surely see all the Russians chatting in
their native language during the onsite, cheering and encouraging each other. But during the contest 
different skills can appear to be in the limelight &mdash; will it be the experience of <tc-webtag:handle coderId="11829284" context="algorithm"/>
and <tc-webtag:handle coderId="7485898" context="algorithm"/>, or the youth and creativity of <tc-webtag:handle coderId="21971539" context="algorithm"/> and <tc-webtag:handle coderId="19721111" context="algorithm"/>?
Regardless, the Russian team is ready to show its best.</p>

<br>
<p>P.S. And <tc-webtag:handle coderId="11829284" context="algorithm"/>'s dog's name is Chelly.</p>
<br>

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
