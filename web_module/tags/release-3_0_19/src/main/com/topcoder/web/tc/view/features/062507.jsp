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
    <tc-webtag:forumLink forumID="516296" message="Discuss this article" />
</div>

<body><span class="bigTitle">TCO Preview: Meet the Bloggers</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/jmzero_big.jpg" alt="Author" />
</div>
<div class="authorPhoto">
    <img src="/i/m/Petr_big.jpg" alt="Author" />
</div>
<div class="authorText">

  By&#160;<tc-webtag:handle coderId="15498334" /> &amp; <tc-webtag:handle coderId="10574855" /><br />
      <em>TopCoder Members</em>
</div>
<br clear="all">

<p><i>The winners of this year's TopCoder Open "Blog It" contest, Petr and jmzero will be blogging about the TCO in Las Vegas later this week. Read about their expectations for the tournament below, and look for the first of their blog entries, starting Wednesday morning, at <a href="/tco07">www.topcoder.com/tco07</a>.</i></p>

<%-- jmzero --%>
<br>
<p><b>jmzero: "Two-fisted Programming Excitement"</b></p>
<p>For a few days each year, the sleepy city of Las Vegas becomes a hotbed of two-fisted programming excitement.  Yes, we're only days away from the 2007 TopCoder Open.  I'll be there blogging this year, and in this article I'll try to give you a preview of what's happening and some good reasons to tune in.</p>

<p>Throughout history, mankind has felt driven to compete.  People compete in sports, in politics, in battle, and in love - but most of all in programming competitions.  Indeed, human history makes little sense until we understand the fundamental human longing to become a TopCoder.</p>

<p>While modern TopCoder competition began with an algorithm tournament, it's clear from the earliest recorded history that component design competitions were actually first.  For example, here is a well-preserved (though low scoring) design from the 12 thousand year-old Snewman caves:</p>

<div align=center><img src="/i/education/tco07bloggers/caveart.jpg" width="200px" /></div>

<p>This design, for the COBOL "hammer" component, shows only the central "rock" object.  The review board docked heavily for not including the author's name, and for showing the rock as connecting to three mysteriously missing objects.  On appeal, this was shown to be a bug in Poseidon's rendering, and the entire contest was unrated (with prize money split evenly between competitors who passed screening).  Confused Roman historians would later misinterpret this design as a picture of a horse, thus naming Poseidon the God of horses, the sea, and (presumably) sea horses.  Modern historians recognize this role actually belongs to Aquaman.</p>

<div align=center><img src="/i/education/tco07bloggers/graph.PNG" /></div>

<p>But while it's clear that the desire for programming competitions has always burned in the heart of mankind, participation historically has been low.  The recent spike can be explained by two main factors: the creation of TopCoder in 2001, and the invention of computers at some indeterminate time before that.  Clearly, programming competitions have never been as popular and exciting as they are now, and thus it is with a clear cognizance of the weight of history that I prepare to do my part in covering the 2007 TopCoder Open.</p>

<p>And, in all seriousness, I am thoroughly excited for the opportunity.</p>

<p>This year's TCO is comprised of a wider than ever variety of competitions, and each of the involved disciplines is interesting and complex.  Thus while it is humbling to have a broadcast partner (Petr) whose algorithm rating is roughly double my own, it is comforting to know that he'll be there to provide an intelligent counterpoint to whatever I write.</p>

<p>The algorithm competition takes place over a number of rounds spaced throughout the event - and this year it's wide open with the absence of last year's champ (Petr).  There's a number of established favorites, fast rising newcomers, and generally smart cookies in the running.  Anyone who has competed in an SRM knows how stressful it can be to fight a difficult problem right up to the time limit, and the gripping tension while waiting for system tests and scores.  Here, that stress is compounded by the promise of glory, the possibility of big cash prizes, and by the persistent blogger who keeps bothering you for an interview.</p>

<p>Of course the other stars of the algorithm competition are the problems themselves.  Each year I enjoy the opportunity to fail at solving the fiendish puzzles posed during the final rounds, and I'm sure many of you share this opportunity.  I'll be excited to see Petr's insight on the more difficult ones, though he'll probably make me wait for his blog entry like everyone else. </p>

<p>I'm guessing fewer people try to "play along at home" with the design and dev competitions, but there's still good reason to watch.  While the nature of the competition may not seem conducive to nail-biting drama, TopCoder has proven very creative in staging these.  With last-minute appeals, wagers, and plenty of tension, these competitions make for good spectacle even if the one doesn't understand the nuances involved in the scoring.  I'm also looking forward to meeting some of the top competitors, some of whom may be less familiar to the general TopCoder audience.</p>

<p>The studio competition, being new, should be particularly interesting this time around.  Studio competitions have covered a lot of different ground in terms of deliverables, and it will be interesting to see how the assigned tasks mesh with the particular strengths and backgrounds of each competitor.  The studio competition rewards a different genus of genius, and I am very much looking forward to chatting with the competitors here.  Representing all coders who've made a red-and-yellow blinking website, I'll do my best to tease out some design hints and winning strategies from these creative minds.</p>

<p>And I don't know how anyone isn't excited about the marathon competition - I think it's the perfect format for this kind of spectated high-stakes competition.  The possibility of a clear visualization of how each solution is progressing, along with the somewhat relaxed timeframe, allows for more of a narrative arc to the competition.  While normal algorithm competitions are certainly exciting, sometimes it's hard to get a hold of the dramatic arc of the battle given the speed with which things unfold.  Also, for those who've done marathons, you know the great atmosphere of investigation that attends these competitions (and their aftermath).  Many familiar faces from the traditional "Post your approach" discussions are here, and I look forward to their analysis and discussion after the match almost as much as the match itself.</p>

<p>While the timeline is compressed from a normal marathon match, I'm sure competitors will appreciate the relative lack of distractions and other commitments.  If competitors find the change uncomfortable, I'm offering my services to help simulate a more natural marathon match environment.  I can pretend I'm a brother-in-law asking for tech support, simulate an unfortunately timed work engagement, or perhaps arrange for a telemarketer to call during the last moments before the submission queue closes.  For an extra fee, I can simulate some forum chatter complaining about the difficulty of generating new cases, questioning whether the evaluator is working right, or predicting the eventual top score.</p>

<p>I guess I've expressed uniformly positive feelings for all the various competition tracks.  That might seem somewhat cowardly or indecisive, but I'm honestly excited for all of the events.  I suppose if I had to pick just one track to cover it would have to be the algorithms, as in the case of a tie I have been habituated to pick the lexicographically first choice.  In the same spirit, if I had to pick 9 tracks to cover I guess I'd return -1.</p>

<p>But whatever your personal favorite, this year's TCO should be tremendously exciting.  Tune in, play along, cheer on your favorites, and enjoy the event.</p>


<%-- Petr --%>
<br>
<p><b>Petr: "Make your bets!"</b></p>
<p>Hiya! I'm Petr, from Moscow, and I will try to guide you through the upcoming TopCoder Open (also known as TCO) competition.</p>

<p>When thinking of what to expect from the upcoming event, I've decided to review
my pictures taken at the TCO 06, and remember my impressions.</p>

<div align="center"><img src="/i/education/tco07bloggers/pic1.jpg"/></div>

<p>The first impression is
very simple: whoa, this is Vegas! Let's face it &mdash; whether we, foreigners, like or absolutely hate
America, we are all interested in seeing its unique places, with Vegas quite possibly
being at the top of that list. With the competition taking place at the Strip,
everyone (well, everyone above 21 to be exact) gets a chance to take a breath
of real Vegas life. And TopCoder returns to Vegas in 2007, proposing that
major coding tournaments have something to do with the gambling spirit. Don't them?</p>

<p>Or is it just the temptation of saying "Here we are at the TopCoder Open, live from
Las Vegas"? With all the video coverage (will it be live commentary again?) taking
place, the venue is an important status indicator. As we are at the point
where TopCoder tries to gain a lot more spectators for its events, the name
of Las Vegas will surely help.</p>

<p>Speaking of spectators, I have one suggestion.
There's probably a simpler way to enhance their
experience: we need more spectator seats (and spectator power outlets :))! Yes, we're all geeks and can sit on the floor,
but still, sometimes it just feels like "why not go the more comfortable way?", you know.
And if we're expecting random Las Vegas inhabitants to visit our party, they could
probably enjoy that as well.</p>

<div align="center"><img src="/i/education/tco07bloggers/pic2.jpg"/></div>

<p>Speaking of the seats, what are the guys sitting around the table doing on this picture?
Why do they need laptops during the coding phase (you see that big live scoreboard
behind them?), when they could walk around and enjoy the competition spirit?</p>

<p>The answer is the second thing that comes to mind remembering TCO 06. It's
the community. In fact, at least two of those guys are now reporting
everything that's happening to those who weren't lucky enough to come onsite
but still want to know everything. As the running results were not visible in the
Arena for some reason, those guys decided not to keep their friends waiting
and do live coverage.</p>

<p>A night in Vegas... A night of board games? Yes! This is possible in the 
community that makes even geeks feel at home. These people really care about
TopCoder competitions, so that's no wonder they think quite the same as you.</p>

<p>The competition features four entirely different tracks, requiring all kinds of skill from the best of the best. No one managed to
advance onsite in two or more tracks this year, so the competitions will be completely separate from each other. However, one of the things
making TopCoder unique is that all the competitors are brought together, giving algorithm coders, coding marathoneers, real-world software 
developers and pure artists, so different but still big fans of TC, a chance to learn from each other.</p>

<div align="center"><img src="/i/education/tco07bloggers/pic3.jpg"/></div>

<p>When we speak about the TCO, the competition itself is of course the most
important thing to think of.</p>

<p>My favourite track is of course the Algorithm one. Recent events involving last-second match-winning challenge made me feel it
is even more like an athletic event &mdash; clicking "Challenge" at the very end of the competition resembled LeBron shooting a 3-pointer
trying to tie the NBA finals game... Well, LeBron has missed, but that's not the point. Like in competitive sports, luck plays an important
role here, but it is the skill and the courage that makes some people winners. And I hope that the problems posted will be tricky enough to allow
the coders to show their best &mdash; both during the coding, and, more excitingly, during the challenge.</p>

<p>Component Design and Development bear the most of the gambling spirit here. As the
finals components are submitted beforehand, it is the game of wagers that
gets the limelight. Of course the strongest will win, but still one can win two of the three components but still lose due to
not setting wagers accordingly. One needs to somehow judge one or two of his
submissions to be better than the others. Doesn't it feel like understanding
if your hand is strong enough when betting in poker? So, make your bets, gentlemen!</p>

<p>The two remaining tracks are here for the first time. I can't really say
what exactly will be the most interesting about the Marathon track, and even
more so about the Studio track. But this exact property will make them very fun
to watch. We're sure they will be exciting, aren't we? So let's find out how!</p>

<div align="center"><img src="/i/education/tco07bloggers/pic4.jpg"/></div>

<p>Strangely enough, one of my pictures taken a year ago contained the name of
this year's TCO hotel, The Mirage. And no, I didn't run and photograph all of them.
Just a coincidence &mdash; but such a coincidence is always fun to notice.</p>

<p>This is a well-used-and-reused phrase, but it does always say what we mean: I'm really 
looking forward to seeing you all in less than two weeks, and to enjoying the
competition. And I hope I'll help those who don't go somewhy to enjoy it by reading
my blog. Do svidaniya!</p>

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
