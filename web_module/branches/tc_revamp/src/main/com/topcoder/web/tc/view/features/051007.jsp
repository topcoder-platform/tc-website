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
    <tc-webtag:forumLink forumID="515781" message="Discuss this article" />
</div>

<span class="bigTitle">TCO Preview: The Marathon Match Competition</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>It's 5:00 AM.  No, you're not a farmer who has been rudely awakened by the call of the rooster.  In fact, you haven't been awakened at all -- you haven't yet gotten to bed.  But why would you go to bed? How could you possibly sleep knowing that there are only seven more hours remaining for you to find a way to better optimize a path, more logically select items, or more intelligently play a game against an automated opponent?  Ah yes, you're competing in a Marathon Match, a week-long (or sometimes longer) odyssey with the goal of finding the best possible solution to a given problem that has been presented for your programming pleasure.</p>

<p>With this year's addition of the Marathon Match track to the TopCoder Open, and a chance for 8 finalists to take a free trip to Las Vegas -- not to mention the hope of winning the $15,000 top prize -- it's no wonder that competitors came from far and wide to try their coding skills against each other.  Many competitors participated in their first marathon match, and other, more seasoned participants poured every bit of their hearts and souls into making their solutions just a little bit better, with the hope that their extra effort would give them just a little bit of an edge over their nearest competitor.</p>

<p>Though the format is wildly different from what one experiences in the Arena, there are still some common principles that make this new format very similar in some ways.  In spite of the substantial prize money at stake, the competition means a lot more than just a big check for many of the top competitors, many of whom would (and have) compete even when no money was involved.  On the flip side, even with a much larger prize purse, it doesn't seem likely that the competition could attract many participants beyond those who have already joined.  Above all else, doing well in this kind of competition requires a true enjoyment of both problem solving and programming; it almost needs to be a sort of obsession, but (hopefully) it's a positive one.  Many forum posts alluded to the enormous time spent by those who took the competition seriously.  From the stereotypical "I didn't get much sleep last night" to the partly-joking "My family will be glad this match is over," it was clear that some pretty serious effort was being put into the tournament.</p>

<p>But then there are those things which separate this competition from the typical SRM-style match, beyond the time commitment.  First, there is no single correct answer for any given test case (well, except maybe one match where a perfect solution was attainable, though that was not intended by the problem's creators).  In fact, most of the problems can be generalized to any of a number of "NP hard" problems, for which it is known that computing a perfect solution for a large enough test case is for all intents impossible, at least if you are hoping to have the calculations complete within your own lifetime.</p>

<p>Next, resubmission is not only free from penalty, but is in fact encouraged, and is generally an essential part of participation.  As the contest progresses, one can see their current standing against everyone else, and it is very easy to quantitatively determine if an "improved" solution really does fare better against the competition.</p>

<p>Also, because of the length of time and nature of the problems, working "offline" is a much more common -- and again, almost essential -- part of doing well.  In some cases this means spending significant time in generating your own test cases, writing code to simulate the behavior of the TC server, or other similar tasks that are ancillary to the actual coding at hand.</p>

<p>And of course, one of the more obvious differences is that there is only a single problem in play. While this may seem minor, it can have some pretty big consequences.  In an SRM, where there are three problems, it is possible (and for some, even likely) that one of them will be something that the competitor categorically dislikes.  In one onsite match a few years ago, one competitor jokingly added a comment to their solution to the effect of "if I am doing this problem, it means the first one was some weird graph theory thing that I just don't get."  Midway through that round, they added a second comment beneath it: "Whoa, that was a spooky prediction."  As humorous as that is, it highlights the fact that a set of three problems gives you options. If you hit a brick wall, you can focus on another problem, or finding some challenge cases. There's more than one way to gain points in the match.</p>

<p>Such is not the case in a marathon match.  There is a single problem statement and, within it, a single, clearly defined way that solutions will score points on the problem.  Now, there may be any number of approaches to the problem itself, but at the end of the day, if the problem is about getting robots to deliver products quickly, that is what they have to do, and if scheduling problems are not your favorite type, well... learn to like them.  Such was the case in this year's online rounds, particularly round 2.  While the problem itself was interesting in its own right, and in some ways broke some new ground in marathon problems, the number of people who simply did not enjoy poker, or did not find the problem interesting was absolutely overwhelming -- and a little disappointing, honestly.  Nonetheless, competitors worked through it, and those who were flexible enough to do well on the problem despite not liking it advanced to the next round.</p>

<p>The four problems of the online rounds were all very different, and drew upon a wide range of skills of the participants.  In the first round, the <a href="/longcontest/?module=ViewProblemStatement&compid=6780&rd=10722">DensityImaging</a> problem presented a mountain of varying density, and challenged competitors to determine the internal densities using only measurements made from outside the mountain.  Unfortunately, the measurements had some margin of error built in, so any type of exact mathematical approach was doomed to fail.  Ultimately, success depended upon balancing the use of multiple measurements that covered the same square(s) versus the accumulated error that resulted from continually taking more measurements.  In the end, with less than 500 participants, all that was required to advance (and win a t-shirt) was to make a submission that compiled properly.</p>

<p>The second round presented a problem unlike any other in marathon match history, called <a href="/longcontest/?module=ViewProblemStatement&compid=6777&rd=10732">TwoCardDraw</a>.  A simplified variant of more classical poker games, competitors programmed a solution that played against a set of fixed strategies.  From my experience in helping with the production of the problems -- writing one, and testing the other three -- I can say that the intent here was for competitors to design a solution which could adapt as it learned about the server strategy.  In reality, it would take playing through many more hands before there would be enough data to make a practical attempt at such adaptation.  A few of the top competitors constructed strategies similar to the way the server was programmed, in an attempt to perform optimally based upon the bet amounts.  More commonly, coders wrote strategies that had relatively simple, fixed behaviors, based upon the cards in their hand.  A great many of the 200 advancers had submitted less than 50 lines of code to accomplish this.</p>

<p>In round 3, <a href="/longcontest/?module=ViewProblemStatement&compid=6826&rd=10747">LumberjackExam</a>, coders were tasked with spending a fixed amount of time searching through a forest, attempting to identify "infected" trees, based upon observations whose accuracy faded with increasing distance.  Successful solutions here relied upon careful mathematical analysis of observation results, with many competitors pulling Bayes Theorem from their probability toolbox.  Here, there was a balancing act of competing against the unseen adversary--time.  Since both observations and movements take time, the crucial decision was where to move before making new observations.</p>

<p>Based on forum buzz, as well as my informal chats with some individuals, many competitors felt as though the fourth round, <a href="/longcontest/?module=ViewProblemStatement&compid=6775&rd=10757">RobotRouting</a>, was by far the hardest to even get a rough working solution for, let alone one that scored well.  In short, the problem required the scheduling of robots to move throughout a warehouse, picking up and dropping off products in accordance with a defined list of required tasks.  Long shelves separated only by thin rows and columns meant that, especially on cases densely populated with robots, scheduling the movements to avoid a gridlock was imperative.  All drop off points were along a single edge of the warehouse, which posed another opportunity for slowdown from general robot congestion.  The best solutions considered at least three main problems: how to schedule movements so that no robot gets stuck, choosing the best of multiple product pickup locations (while staying in accordance with the first goal), and dealing well across a range of test cases that varied from small to large, with few to many robots, and varying degrees of density.</p>

<p>Looking forward to the onsite final, it should be an exciting match.  But, at the same time, it might be a bit different than what the competitors are used to.  The entire round is nine hours long, there will be a live audience of sorts, and the overall pressure of the situation goes without saying.  All of that says a lot about the nature of the problem as well.  It needs to be easily approachable, have a wide range of room for competitors to make improvements and, for the sake of spectators, lend itself well to visualization.  It's also worth noting that the thought process for what kind of problem to use has been going on for a while, and even at the time of writing this, it's not yet complete.</p>

<p>Were you hoping for a little more info about the problem?  Well -- as long as you promise not to tell any of the finalists -- it goes something like this:</p>

<blockquote>Your local cattle ranch, TopFarm, is looking to optimize some of their operations.  The farm has N cows&#8230;</blockquote>

<p>And that's it for now. Sorry, you'll just have to wait until next month to see what challenge really awaits!</p>

<p><br></p>
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
