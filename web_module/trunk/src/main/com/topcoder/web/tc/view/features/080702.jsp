<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Match Strategy</B></FONT><BR/>
<I>"If you take it slow you'll move up."</I><BR/><BR/>
Wednesday, August 7, 2002<BR/>
By&#160;KaiEl,<I>TopCoder Member</I><BR/>
</P>

<P>If you ask most coders about their strategy for TopCoder matches, they'll probably answer with something like "score a lot of points" or "code the problems correctly." This isn't chess after all; it's computer programming. No need for deep strategy here, just code quickly and accurately. As <B>cintamani</B> puts it "this is about trying not to make a mistake, that's all there is to it."</P>
<P>Dig a little deeper, though, and you'll find that little differences in style and approach can be all that separates a top-tier coder from a low-level gray-name. The decisions a coder makes about match preparation, coding, and challenging can affect the final outcome of a tight match. I did a post-match interview with the members of two different rooms - one in each division -- to get some idea of how these various strategies play out in the coding arena.</P>
<P><B>Pre-match strategies</B></P>
<P>Some of the most important strategy decisions in a TopCoder match come before the match even starts.  It's important to arrange yourself and your environment (a.k.a. your computer desk) for optimal performance in the hours before a match starts. Setting everything up just right can help you get "into the zone" during a match, leading to faster submissions and higher scores.</P>
<P>Nearly all of the interviewed coders have music ready to play during a match. Some coders, like <B>FlySkippy1</B>, will listen to any type of music, "just so long as its not too quiet," while others prefer to listen to rap, trance, techno or classical music as they program. <B>Leadhyena_inran</B> listens to remixed videogame music while he codes because TopCoder "is the closest thing to a videogame for coding... and it needs an appropriate soundtrack."</P>
<P>Tastes were almost as divergent on the issue of eating and drinking before a match. Some coders, like <B>sreesree</B>, can't code when they're hungry while others, like <B>Mr. Sketch</B>, "always [code] on a full stomach." Most coders, like <B>Liam</B> "can't program without caffeine," while some, like <B>Leadhyena_inran</B>, "gave up caffeine for the SRMs." <B>Jhedlund</B> articulated the most popular position on pre-match food: "I'd rather code when my stomach is not bothering me... so not hungry, not too full" <B>Mr. Sketch</B> adds the following words of caution: "I'd hate to be halfway though coding and get hunger pains and have to go raid the fridge."</P>
<P>Most of the interviewed coders made sure to have a pen and paper nearby so they could jot down notes and work out solutions while coding. Some coders gather even more outside materials before a match: <B>kv</B> recommends keeping graph paper handy, "for the occasional geometry problem," while <B>CodePony</B> sometimes uses a calculator because it's "handy for checking bounds on brute force problems."</P>
<P>Many coders recommended having the Java API or C++ STL documentation nearby, either in a web browser or a textbook, to check syntax during a match. However, a few coders, like <B>cintamani</B>, feel that "looking things up costs too much time," and recommend coding "with what you don't need to look up."</P>
<P>Most coders also suggested using the bathroom before the match starts because, as <B>stkaway</B> puts it, you "don't want to get caught up in the middle of the match."</P>
<P><B>Leading off...</B></P>
<P>So now that you're all set with a full CD player, a full bottle of coke, and an empty bladder, it's time to start the all-important coding phase! The first question every coder has to answer during this phase is which problem to open first. Overwhelmingly, coders seem to prefer opening the easiest problem first, and working their way up from there. <B>Batty</B> explains the standard reasoning behind this strategy: "I only occasionally get the medium [problem], and never the hard, so any other strategy would be stupid on my part."</P>
<P>Despite the popularity of the ascending order strategy, many coders have deviated from it at least once, with varying results. For instance, <B>negotiator</B> has only won when he opened the second problem first, "for some random reason." <B>cintamani</B>, on the other hand, once tried opening the Division II 1000-point problem first and didn't find it helpful. "If you can't finish all three, you can't do it an any order," he explains. </P>
<P><B>kv</B>, a highly ranked red-name coder, points out that the top-level coders often open the hardest problem first, "because if there isn't enough time to do them all, it's better to get 500+1K instead of 250+500." <B>ValD</B> questioned the soundness of this strategy for lower-level coders like himself, saying that it's "a greedy strategy that often doesn't pay off." <B>Leadhyena_inran</B> offered what is probably the soundest advice on this subject: "Do the highest one that you can comfortably code first."</P>
<P><B>Careful planning</B></P>
<P>Once you've opened your first problem, whichever one it might be, it's time to code. Or is it? Most coders recommend against diving into the coding immediately, and instead studying the problem statement carefully before starting. <B>FlySkippy1</B> says that "about a minute," of consideration is usually enough, while <B>ValD</B> says that you should take "as long as you need to fully understand it...  sometimes up to ten minutes." </P>
<P>At the very least, you should glance at all the examples before you code. As <B>sreesree</B> recounts, "sometimes I didn't realize what the problem is unless I stepped into the final example. That was a nightmare." <B>Batty</B>, a coder who admits to "diving into coding too early," thinks that he probably would have done better in a recent match if he had "read it clearly through with the examples and thought it out. As it stood I had a nearly working solution that I never quite debugged."</P>
<P>If you absolutely can't stand wasting all that time reading and re-reading, <B>stkaway</B> recommends jumping into the routine parts of a problem while thinking about the tougher parts. "Let's say the problem has some tokenizing stuff," he explains, "I will just go ahead and do the tokenizing part and think about the problem in the middle of tokenizing, since it's pretty straightforward coding there."</P>
<P><B>Test, 1-2-3</B></P>
<P>Once you've coded and compiled a problem, the delicate balancing act of self-testing begins. Too much testing can lower your score considerably, but too little can cause your problem to fail on a tricky system test or challenge. How do you know what to test for, and how much to test for it?</P>
<P>Most of the interviewed coders found that the examples provided in the problem statement were a more than sufficient test for their code. "The examples will more often push the specifications," according to <B>Leadhyena_inran</B>. For some coders, in fact, even typing in the provided examples takes too long. "If I want to get more points, usually I'll take the simplest one (1st example) and last example," explains <B>stkaway</B>. <B>Skeeve</B> admits to occasionally skipping testing altogether if he's "totally jammed on time, but thinks [the code] is good."</P>
<P><B>cintamani</B> joins some other coders on the opposite end of the testing spectrum, stressing careful testing of everything and anything you can think of. You should test "the examples, plus the borderline inputs.  Check the part that says 'Topcoder will ensure.'  Watch for empty lists, unexpected legality of negative input, etc." <B>kv</B>'s testing method mediates between the two extremes: "run all examples, submit, then look for boundary conditions (and resubmit if you find them)"</P>
<P><B>Challenging Challenge Phase</B></P>
<P>The coding phase is over. You've tested all your problems to the point of overconfidence. It's time to milk those last few points out of this match by totally screwing your roommates over. That's right; it's the challenge phase. </P>
<P>As in the coding phase, the question of what to look at first comes up again in the challenge phase. Coders seemed evenly split on this issue. Some coders go after the fast submissions that are likely to be sloppily coded and fail on a boundary case. Similarly, other coders go after the slow submissions that coders try to sneak in right before the buzzer, which "are usually rushed and don't even pass all the examples," according to <B>ermular</B>. A few coders will try to challenge problems that they had trouble with first, or problems that were conceptually tough, but most look for slow or fast submissions first.</P>
<P>Almost every coder interviewed recommended being conservative in your challenges. <B>kv</B> cites past experience for his lack of aggressiveness: "I got burnt in the beginning, so now I'm very conservative. I challenge only what I am sure will fail." <B>Mr. Sketch</B> agrees, saying he'd "have to be 10000% sure before challenging." <B>Leadhyena_inran</B> lead the minority position on aggressive challenging, saying that he'll sometimes "gamble if I'm in a gap for scoring, like 100 points either way." <B>Jlyer</B> concurs: "Sometimes... I'd challenge if I can see I have nothing to lose by challenging."</P>
<P>The interviewed coders also recommend against wasting time looking at solutions whose algorithm aren't immediately apparent. "If it's a mess, it's not worth the effort," explains <B>Skeeve</B>. <B>ValD</B> agrees, saying that hard-to-read code is often right, even if you can't tell why. <B>CodePony</B>'s challenge strategy consists of scanning the source code quickly, then looking closer if there's any area of the code that makes him uncomfortable. "Sometimes I'll spend a couple minutes," <B>CodePony</B> said of his slightly more time-intensive strategy, "though I check to make sure it hasn't been challenged by someone else already."</P>
<P><B>Finding your own strategy</B></P>
<P>So where does all this leave you, the coder looking for that extra edge to push himself up in the rankings? With so many different strategy questions to answer, and so little consensus between coders as to what those answers should be, it can be a little baffling coming up with a strategy that works for you. </P>
<P>The best method for this seems to be simple experience. Participate in as many single round matches as you can, and stay after them to consider what worked and what didn't. Talk with other coders about their strategies in the lobby and analyze the code of people who got the high scores for the night. If one match a week isn't enough to build your experience, don't be afraid to use the <A HREF="/tc?module=Static&d1=help&d2=pracArena" CLASS="bodyGeneric">Practice Room</A>. Over 100 matches worth of great experience is there for the taking. </P>
<P>For a quick fix, though, the best overall strategy TopCoder success seems to be patience. Don't get so caught up in the excitement of the coding arena that you end up rushing and losing points. <B>Leadhyena_inran</B> recalls some words of wisdom that the highly ranked <B>ZorbaTHut</B> gave him on this issue: "If you take it slow you'll move up."</P>
<P>If that doesn't work, then you can always try taking <B>negotiator</B>'s advice and "just pretend it's for money. That works wonders."</P>
<P>Special thanks to the coders in room 7 on SRM104 and Room 2 of SRM 105 for all their help with this story.</P>


<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
    
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
