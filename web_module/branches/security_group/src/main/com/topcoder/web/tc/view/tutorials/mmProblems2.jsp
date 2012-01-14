<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Marathon Match Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
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
            <jsp:param name="node" value="mm_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="mm_tut"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=mm_index">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="516840" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">Stepping up to a Marathon Match problem, Part 2</span>
<br />
<br />

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" context="marathon"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>In <a href="/tc?module=Static&d1=tutorials&d2=mmProblems">Part 1</a>, we talked a bit about the simplest type of problem, where we are asked to write a single method that takes a set of inputs and returns a specified output.&nbsp; How do we approach more complicated types of problems?<br>
    <br>
    <strong>Problems with callbacks</strong><br>
    <a href="/longcontest/?module=ViewProblemStatement&compid=6983&rd=10815">ContinuousSameGame</a> is a good, simple, example of a problem that deals with callbacks.&nbsp; Note that, for each call to our method, we are given the full configuration of the board.&nbsp; One might assume this to mean that we can simply take the input we're given, and make a decision based upon that input.&nbsp; Certainly, we can, but we can also be a bit more clever to avoid doing the same work over and over again.</p>
<p>Suppose part of our solution involved determining which color(s) are most common on the board.&nbsp; If we keep this type of data in class-level variables then, following any move that did not completely clear any columns (and hence, did not introduce a new random column on the right), we can avoid having to recalculate these values.&nbsp; Similarly, if we have looked over the entire board and found several good candidate moves, and have only made moves that did not otherwise change the state of the board, then there is no need for us to find moves until we have exhausted our existing batch.</p>
<p>Some problems may involve writing multiple functions, implying that at least one callback is inevitable.&nbsp; A common scenario might be an <em>init()</em> function, and a <em>next()</em> function, where the <em>init</em> method is given basic parameters about the setup, and each successive call to the <em>next</em> method requests some type of move or selection to be made.&nbsp; Typically, the <em>next</em> method is passed only minimal information (in part, to reduce overhead on the server side), implying that a submission should include the necessary code to keep track of such data.</p>
<p><strong>Using state machines</strong><br>
This &quot;keeping track of data&quot; is more formally known as implementing a state machine.&nbsp; Simply defined, a state machine is something that has a defined state, and ways to transition from one state to another.</p>
<p>One of the more complex implementations required by a submission came in this past TCO, with the <a href="/longcontest/?module=ViewProblemStatement&compid=6777&rd=10733">TwoCardDraw</a> problem.&nbsp; This problem required six methods, and it is still the record holder in that respect, by a wide margin.&nbsp; As alluded to in the problem statement, the problem was designed, in part, with the intention that a clever solution might able to glean information about the server's predefined strategy by carefully keeping track of how it behaved in various situations.&nbsp;&nbsp; In reality, most competitors decided that such an involved approach was unnecessary, and in fact, there probably would not have been enough data to usefully adapt before the end of a test case.<br>
  <br>
However, for illustrative purposes, consider how we might have proceeded with a learning type approach.&nbsp; We might want to keep track of how long each hand lasted, for instance. In other words, when did the server fold?&nbsp; (Or did we fold?) We are told within the problem statement that we need to determine things like that indirectly from how our methods are called.&nbsp; In particular, whenever <em>newhand() </em>is called, we can take that to mean that the previous hand ended.&nbsp; A simple approach might be to maintain a simple variable called currentPlay, where 1 = the initial round of betting, 2 = the draw, 3 = the second betting round, etc.&nbsp; Then, on each call to <em>newhand()</em>, we note the last value of our currentPlay, and reset it.&nbsp; We could expand this approach to use more variables to note other information about how many bets were placed, which cards we saw, or anything else we felt might be useful.</p>
<p>As an alternative to having to write callback-based solutions, library functions were introduced.&nbsp; With library functions, rather than the server calling a method in the competitor's solution, the submitted code can actually make calls directly to the server -- typically to request information, or make a move.&nbsp; Often, the number of times such a function is called will play a part in the scoring of the solution.</p>
<p><strong>Problems involving randomness</strong><br>
Part of the idea of marathon problems is that it is generally impossible to get a perfect solution, at least before the sun burns out.&nbsp; One common element that is introduced to make problems more challenging is an element of randomness.&nbsp; This past TCO saw two problems, <a href="/longcontest/?module=ViewProblemStatement&compid=6780&rd=10723">DensityImaging</a> and <a href="/longcontest/?module=ViewProblemStatement&compid=6826&rd=10748">LumberjackExam</a>, that relied heavily upon this randomness to make the problems themselves interesting.&nbsp; How the two problems introduce randomness, however, and what that means in writing a solution, are very different.</p>
<p>In the case of <a href="/longcontest/?module=ViewProblemStatement&compid=6780&rd=10723">DensityImaging</a>, we know that each measurement is adjusted by a random amount that fits a Gaussian distribution.&nbsp; Simply put, this means the adjustment will typically center around 0, with more wild adjustments being less frequent.&nbsp; In theory, with a large enough sample size, the returned values (when performing an identical measurement) should all fit a perfect bell curve, and the mean value would be absolutely correct.&nbsp; Since taking more measurements reduces our score, though, it is impossible to make anywhere near enough measurements to be able to average out the results and hope to minimize the total error.&nbsp; However, a little experimentation could show that even taking the same measurement twice and averaging the results can help improve one's score.&nbsp; Further experimentation may show that, depending on implementation details, adding a third or fourth round of measurements would be too costly for the diminishing returns.</p>
<p><strong>Bayes Theorem<br>
  </strong>In the case of <a href="/longcontest/?module=ViewProblemStatement&compid=6826&rd=10748">LumberjackExam</a>, where the probabilities and errors refer to yes/no values, we can take a more precise mathematical approach to dealing with the inaccuracy by using some rules that are formally demonstrated by Bayes' Theorem.&nbsp; The theorem can be stated in a variety of different ways, but here's the one I find most useful:<br>
  <br>
Suppose a set of conditions, A1, A2,..., An each independently suggest that a condition B exists with probabilities p1, p2,..., pn, then the overall probability that condition B exists is given by:</p>
<div align="center"><img src="/i/education/mmProblem2-bayes_theorem.jpg" width="154" height="54"></div><br />
<p>So how does this apply? Let's consider a real world example.&nbsp; Suppose that, of all people with long hair, 80% are computer programmers.&nbsp; Suppose also that of all the people who wear glasses, 70% are computer programmers.&nbsp; Now, suppose someone walks by who has long hair, and wears glasses.&nbsp; What are the chances he is a computer programmer?</p>
<p>At first glance, someone might confuse this with another type of problem and arrive at an answer of 94%. I'm referring to problems like, &quot;There is a 70% chance of rain today, and an 80% chance of rain tomorrow.&nbsp; What are the chances that it rains today or tomorrow?&quot;</p>
<p>The key difference here, in the example of the rain problem, is the word &quot;or.&quot; It doesn't matter if it rains today, tomorrow, or both. When dealing with conditional probabilities that fall under Bayesian rules, that same &quot;or&quot; does not apply; that is, the two propositions are no longer independent events. The visually impaired, long-haired gentleman in question is either a programmer or he is not -- thus, either both conditionals are true, or both are false.</p>
<p>If both are true, then 70% * 80% = 56%.&nbsp; If both are false, and he is not a programmer, then we evaluate 30% * 20% = 6%.&nbsp; Now, notice that 56% + 6% does not add up to a full 100%.&nbsp; So, we divide both by 62% to scale the value appropriately.&nbsp; Thus, there is approximately a 90.3% chance this gentleman is a programmer.</p>
<p>There is one more important and useful detail of this basic equation.&nbsp; Though I will leave the formal algebraic proof as an exercise to the reader, compare what happens if we have three conditional probabilities (as opposed to just two), and one of them is the calculated overall probability based upon two or more conditionals.&nbsp; Perhaps not surprisingly, the result is the same.&nbsp; What this means for us is that, using Bayes' theorem, we can accurately keep track of the probability of something being true by repeatedly applying the theorem every time we get a new piece of information, without having to keep track of the individual conditional probabilities that we have previously collected.</p>
<p>In the example above, we already know the gentleman has a 90.3% chance that he is a programmer.&nbsp; If we were then to be told that whenever someone is carrying a laptop (and let's assume our friend is), that they have a 60% chance of being a programmer, we can then update our probability:</p>
<p> p = (0.903 * 0.6) / ((0.903 * 0.6) + (.097 * 0.4)) = 93.3%.</p>
<p>This is particularly useful in the lumberjack problem.&nbsp; Every time we make an observation, we calculate a conditional probability for each tree (which was included in that viewing) being infected.&nbsp; If any of those trees have already been viewed, then we can use the theorem to update our conditional probability for any of those trees, and can continue to do so with each new observation.&nbsp; And, in theory, we can continue doing so repeatedly, each time ending with a more accurate feel for if the tree is actually infected.&nbsp; In the case of this particular problem, we can make some observations about the effectiveness of looking at certain long distances, and may wish to only consider, say, the first five trees in front of us.</p>
<p>During the Intel competition series, the <a href="/longcontest/?module=ViewProblemStatement&compid=5979&rd=10089">MessageReceiver</a> problem had a similar conditional probability at work, in that each letter could either be transmitted correctly or incorrectly.&nbsp; Knowing this, it should come as no surprise that the winning solution relied heavily upon Bayes' theorem as well.</p>
<p><strong>Putting it all together<br>
</strong>There are many different approaches to Marathon Match problems. As always, the key thing to remember &ndash; and the single coolest thing about Marathon Matches, in my opinion &ndash; is that these problems are interactive. Rather than a &quot;final answer,&quot; the best type of Marathon Match solution is more like a dialogue.&nbsp; As each test case progresses, your solution must keep track of its progress, and refine or shift its strategy accordingly.&nbsp; Good luck!</p>
<p>&nbsp;</p>
<p><em>Interested in writing for TopCoder? We're looking for new educational tutorials and feature articles -- if you've got ideas, email them to editorial@topcoder.com.</em></p>
<p>&nbsp;</p>

<br /><br />
<%--
<a href="/tc?module=Static&d1=tutorials&d2=mmProblems2">Part 2</a>
--%>
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
