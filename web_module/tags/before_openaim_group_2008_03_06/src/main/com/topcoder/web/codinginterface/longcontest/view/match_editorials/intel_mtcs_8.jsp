<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
<%-- Left Column Begins--%>
<td width="180" id="onLeft">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="left"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
<span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="506093" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 8</span><br>08.16.2006 - 08.30.2006
<br><br>

<img src="/i/m/battyone_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="7504863" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=5979&rd=10089">MessageReceiver</A></span>
<br><br>
<span class="subtitle">1. Introduction</span><br>
<p>Let us consider a simpler problem,
which is to ignore the different line states and try to recompose the
message by only querying the entire message a predetermined number of
times, then using the most frequent character at each position. I am
explaining this because it is a part of the final solution. For this
simpler problem, the difficulty is just finding the number of queries
that optimally balances the probability of errors versus the cost of
these queries.</p>
<p>Instead of working with the given line
states let us consider the line qualities, defined as the probability
of the transmitted character being correct. Since in a state <strong>S</strong><sub style="font-weight: bold;">i</sub>
the correct character is transmitted with probability S<sub>i</sub>,
and a random character is transmitted with probability 1-S<sub>i</sub>,
the quality for that state is <img alt="Qi = Si + (1-Si)/C" src="/i/longcontest/match_editorials/intelmtcs8/120adeea.gif" name="Object13" align="middle">.
Let us call <strong>Q</strong> the average
quality.</p>
<p>Now let <strong>PF(T)</strong>
be the probability, over
<strong>T</strong> transmissions of the same
position, that the most frequently
observed character is the correct one. <strong>PF(T)</strong>
can be decomposed over
the number of times the correct character was observed. Let us call <strong>M</strong>
that number. If, for simplicity, we ignore ties where the correct
character occurred the same number of times as another character, we
have:</p>
<div>
<img alt="PF(T) = Sum PC(T,M) * PI(T-M,M)" src="/i/longcontest/match_editorials/intelmtcs8/4eee81a6.gif" name="Object2" align="middle">
</div>
<p>where <strong>PC(T,
M)</strong> is the probability of
getting the correct character M times:<br>
<br>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/6454b96b.gif" name="Object3" align="middle">
</div>
<p>and <strong>PI(T-M,
M)</strong> is the probability that
all the other characters occur fewer than M times. PI can be
calculated recursively depending on the number of possible incorrect
characters. Let us call <strong>K</strong> that
number (initially K = C-1).
Decomposing PI over the number of times an arbitrary incorrect
character was observed, we have:<br>
<br>
</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/3f887df5.gif" name="Object4" align="middle">
</div>
<p>with the end condition: <strong>PI(T, M, 1) = 1
if T &lt; M, 0 otherwise</strong>.<br>
<br>
With <span lang="en-US">memoization</strong>
PI and in turn PF can be calculated efficiently.</p>
<p><br>
Given PF(T), let <strong>r = 1 - PF(T)</strong>
be the average error
at each position<strong></strong>.<br>
<br>
<strong></strong>The total expected number of
errors is
<strong>R = N * r</strong>.</p>
<p>The error penalty factor is <img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m28b2df19.gif" name="Object18" align="middle">, or
approximately<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m17d8daa0.gif" name="Object19" align="middle">.<br>
</p>
<p>So the optimal number of queries for
the simplified problem is the one that maximizes:</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/25b276.gif" name="Object12" align="middle">
</div>
<p><br>
There are two ways to improve from
there. One way is to only query the characters or intervals which we
aren't yet reasonably sure are correct, instead of the entire message
every time. The other is to use the line quality information to learn
as much as possible from each transmission. Since, in order to do
these things, we need to already have a pretty good idea what the
message is, the first step is to query the entire message
unconditionally a certain number of times. There is also a minimum
number of times that we need to query the entire message to have
enough confidence in entire intervals, so up to a certain number
these queries aren't wasted. Experimentally I found 95% to be a good
threshold, so we use enough queries to have a PF at least 95% as
initial data, then create an initial solution from the most frequent
character at each position.<br>
</p>
<p><br>
</p>
<h3 style="font-weight: bold;">2. Estimating line quality</h3>
<p>From this 95% accurate solution, we
estimate line quality using Bayes' theorem. <a
 href="http://en.wikipedia.org/wiki/Bayes_theorem" target="_blank">Bayes'
theorem</a> is helpful in estimating hidden parameters based on their
observed effects. It states:</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/240dfc92.gif" name="Object6" align="middle">
</div>
<p>where O is the observation,
H is the
hypothesis we're interested in, P(O/H) the probability of the
observation if H is true, P(H) is the prior probability of H, and
P(O) the total probability of O, or a normalizing constant.<br>
<br>
Let us consider each
transmission separately, and for simplification assume that the line
quality stays constant in an interval +- 20 positions around the position we're interested in. In this
case, the hypotheses are the possible line qualities, which all have
equal prior probabilities, and the observations are the correct or
incorrect characters around the position of interest. If k out of
these n=40 characters are correct (match the initial solution), this
is an event that for a quality Q<sub>i</sub> has a probability<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m2ed38f9a.gif" name="Object5" align="middle">of
occurring, and per Bayes' theorem this is also the probability
(before normalization) of that Q<sub>i.</sub> Therefore the expected
line quality (i.e. line quality to the best of our knowledge) at that
position is the weighted average:
</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/2a482d4.gif" name="Object1" align="middle">
</div>
<p>Note that it may seem overly
simplifying to assume a constant line quality, but I estimated it
wouldn't lose much information, compared to considering every
character as a separate observation and factoring in the distance and
probability of a state change from the position of interest, because
state changes are infrequent and in the case of a state change either
method would usually result in an average of both states weighted
towards the more prevalent state. On the other hand, just depending
on the number of correct characters has the advantage of being very
fast, since updating the number of correct characters in a moving
interval is a constant-time operation, and the quality for each
possible number of correct characters out of 40 can be pre-calculated
and stored in a table.<br>
</p>
<p><br>
</p>
<p></p>
<h3 style="font-weight: bold;">3. Calculating likelihoods of each
character</h3>
<p>Now that we have a good estimate of the
line quality in each transmission, we can more accurately calculate
the probability of each character at each position, and refine our
initial solution. For example, if at some position we got 4 times the
character A and 3 times the character B, then our initial solution is
A, but if it turns out the transmissions of A occurred at 50%
quality and the transmissions of B occurred at 80% quality, then B
becomes the more likely correct character. In more detail:<br>
</p>
<p>Let <strong>T</strong><sub
 style="font-weight: bold;">i</sub> be the transmitted
character and <strong>Q</strong><sub
 style="font-weight: bold;">i</sub> the estimated line quality in each
transmission of a certain position. We use Bayes' theorem again to
calculate the likelihood of each possible correct character.</p>
<p>If we call <strong>C</strong> the hypothesized correct
character from the set <strong>{ C<sub>i</sub>
}</strong>,
then the probability of getting T<sub>i</sub> is:<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m5d50c24d.gif" name="Object20" align="middle">.<br>
Let us define<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m4d1bb570.gif" name="Object21" align="middle">the
probability of any incorrect character, and<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m118f59dd.gif" name="Object22" align="middle">
the odds ratio for a correct character.</p>
<p>The probability of all our
observations, or likelihood of C, is:<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/1f96983e.gif" name="Object7" align="middle"></p>
<p>Dividing by <img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m922ceb9.gif" name="Object8" align="middle">(which
doesn't depend on the C):<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m111e4dcf.gif" name="Object9" align="middle"></p>
<p>Normalizing:<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m541f1495.gif" name="Object10" align="middle"></p>
<p>This formulation allows calculating all
the likelihoods very efficiently: start with all of them set to 1,
then for each character observed at a certain quality, multiply the
likelihood of that character by the quality's odds ratio, and update
the sum of likelihoods correspondingly. This updates the
probabilities for all the possible characters in constant time.
Naturally, when we find a character's likelihood becomes greater than
the likelihood of the current solution, we also change the solution
to that character.<br>
</p>
<p>Note that, ideally, when we change our
solution for a position, we should go back and recalculate the line
qualities with the new information, then refine the likelihoods of
the surrounding positions. Again I didn't do this because I estimated
that the small improvement in precision wasn't worth the extra cost
in complexity and runtime. Also note that we don't count the position
of interest as a correct character when estimating the line quality
at that position, because line quality is used to determine the
correct character and using what we believe to be the correct
character would be <a
 href="http://en.wikipedia.org/wiki/Begging_the_question" target="_blank">begging
the question</a>.<br>
</p>
<p><br>
</p>
<p></p>
<h3><strong>4. Targeted queries</strong><br>
</h3>
<p>
Now, we have a better solution, and
more importantly a pretty good estimate of the probability of error
of that solution, at each position:</p>
<div><img alt="" src="/i/longcontest/match_editorials/intelmtcs8/m45fdefe4.gif" name="Object11" align="middle"><br>
There are 3 categories of positions:
</div>
<ul>
  <li>
    positions with a very low
probability of error, e.g. .0001%. We are almost certain our solution
for
these positions is correct and don't need any more information.
  </li>
</ul>
<ul>
  <li>
    position with a high probability of
error, e.g. 1% or more. For these it is worthwhile querying the
position again, either to confirm the solution, or to discover that a
different character is correct.
  </li>
</ul>
<ul>
  <li>
    positions with an intermediate
error, which we'd like to query again but aren't worth the cost of a
query by themselves. We only want to query those if we can do so
cheaply, by grouping them in a larger interval. Of course if we query
those and get the second most likely character, the error increases and
the position can move to the high-error category.
  </li>
</ul>
<p>The problem is finding the optimal set
of queries that include all the high-error positions, plus the
intermediate-error positions when beneficial, at the cheapest
possible cost. This turns out to be a generalization of the maximum-sum
subsequence problem.<br>
<br>
Let's consider the cost and benefit of
querying each position. The cost is the derivative of the score per
character transmitted:</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/373fc98a.gif" name="Object14" align="middle">
</div>
<p>The benefit is the expected reduction
in score penalty due to the change in error:</p>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/28ea8691.gif" name="Object15" align="middle">
</div>
<div>
<img alt="" src="/i/longcontest/match_editorials/intelmtcs8/2384b062.gif" name="Object16" align="middle">
</div>
<p>Let us call the value of a position its
benefit minus its cost. A value can be negative or positive.</p>
<p>The cost of a transmission is the
derivative of the score per transmission:</p>
<div><img alt=""
 src="/i/longcontest/match_editorials/intelmtcs8/m1d12a87d.gif" name="Object17"
 align="middle">
</div>
<p><br>
We find intervals that maximize the
total value as follows:</p>
<ol>
<li>
moving from left to right, find the first position having a positive
value. Start a candidate interval containing just that position, and
remember this as the best interval found.
</li>
<li>
consider each following position:<br>
- if its value is also positive, then adding it to the interval is
beneficial, we do so, and update the best interval if the new cumulated
value is higher than the best interval's.<br>
- if it is negative, then it may still be beneficial to include this
position as part of a bridge if later on we find high-value positions.
So we add it to the candidate interval but not to the best interval.
</li>
<li>
if the candidate interval's cumulated value becomes negative, or lower
than the value of the best interval minus the cost of a transmission,
then there are a lot of positions at the end of that interval with a
negative value, which we are better off without, and even if a very
high value position is next it is cheaper to make two queries. In that
case we stop augmenting the candidate interval and look at the best
interval found so far. Otherwise, we continue in step 2.</li>
<li>if the best interval's total value is higher than the cost of the
transmission, then the query is worthwhile and we mark that interval
for querying. Otherwise, even though the characters individually were
worth querying, the overall interval isn't, so we discard it.</li>
<li>
return to step 1 and continue looking for intervals from the next
position, until the entire message length has been processed.</li>
</ol>
Once we have all the intervals we want
to query, we query them, then for each transmission calculate line
quality and update character likelihoods as we did for the initial
complete transmissions. We repeat this process until no interval is worth querying. 
<br><br>
In practice, it gets a little more
complicated, as queries also have a large time cost which needs to be
factored in the value, and the N/4 call limit can sometimes be
exceeded. To avoid that limit I only allowed each pass to use at most
1/10 of the remaining allowed queries, redoing the interval
computations after doubling the cost of a transmission as long as the
number of intervals found exceeds that limit - which forces dropping
or merging less worthwhile intervals.</p>
<p>At this point, we have a solution that
is not expected to be error-free, but has an optimal expected score,
that we return.<br>
<br>
</p>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170" id="onRight">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>
</body>
</html>