<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 426 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13515">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524438" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 426</span><br />Saturday, November 22, 2008
<br /><br />


<h2>Match summary</h2> 



<p>SRM 426 provided an unusual problem set that shook up the usual pecking order. In division I, a relatively straightforward easy problem lead to a medium that required careful implementation and a hard that looked innocuous, but actually provided a real test of competitors' skills in rigorous analysis.</p>

<p>The lack of action during the challenge phase belied a set of submissions that was rich in challenge-fodder and the system tests were brutal, massacring a good proportion of the medium and hard submissions. After the dust settled on the battlefield (and after a short delay due to some technical problems), three hard submissions remained, giving their authors' the top three spots in the division. Congratulations go to yuhch123, pashka and andrewzta who came first, second and third. dskloet and monsoon rounded out the top five.</p>

<p>In division II, the hard problem unfortunately proved too difficult to get a passing solution, but the attempts at naïve brute force solutions provided some interest during the challenge phase. Fast solutions on the first two problems with a challenge were enough for thinfaifai and siara to take the top two spots, with  ludvik, lucasufrn and aydarov coming in positions three to five.</p>

<H1> The Problems </H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10146&amp;rd=13517" name="10146">KnockoutTourney</a></b> 

</font> 

<A href="Javascript:openProblemRating(10146)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      737 / 910 (80.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      539 / 737 (73.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>atemplar</b> for 249.99 points (0 mins 8 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      181.71 (for 539 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>As with most easy division II problems, the solution here is simply a case of simulating the process. In each round, every competitor in an odd numbered position of the list is paired against the competitor 1 position higher, so if at any point you and your oppenent are in such a pair of positions, then you will meet in the current round. Otherwise, you need to calculate your position in the list for the next round. This is simply a case of noticing that if your position is p (1 based indexing), then exactly p/2 competitors (rounded down) before you in the list will be eliminated each round. Your position for the next round is therefore p - (p/2). The situation is exactly the same for your rival. The problem lends itself nicely to recursive solution. Note that the total number of competitors N is actually irrelevant.</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10196&amp;rd=13517" name="10196">ShufflingMachine</a></b> 

</font> 

<A href="Javascript:openProblemRating(10196)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      148 / 910 (16.26%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      123 / 148 (83.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>thinfaifai</b> for 416.46 points (13 mins 17 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      258.33 (for 123 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      542 / 653 (83.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      516 / 542 (95.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 243.20 points (4 mins 46 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      166.50 (for 516 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

First of all, lets call all positions listed in <b>cardsReceived</b> <i>good</i>, and all positions not

in <b>cardsReceived</b> will be  <i>bad</i>.

Lets start from the easiest possible case - K = 1, when the player is interested in only one card.

We need to determine which position we should place that card before shuffling. 

The most natural brute-force way to do that is to check all possible positions, do <b>maxShuffle</b> shuffles for each position.

The <i>quality</i> of position X will be equal to the number of times that

the card from position X will appear at <i>good</i> positions after one of those <b>maxShuffle</b> shuffles. 

Obviously, if we are interested in only one card, we place it at the position with the highest quality.

The probability of getting this card will be equal to <b>Q / maxShuffle</b>, where Q is the respective quality.

</p>

<p>

The situation is very similar when we have two, three, or more cards - since the quality of each position is independent from 

qualities of other positions, we just pick two (three, or more) positions with highest qualities and place

the cards we are interested in on those positions. The expected number of cards we get will be equal to 

the sum of all qualities divided by <b>maxShuffle</b>:

</p>

<pre>

    public double stackDeck(int[] shuffle, int maxShuffles, int[] cardsReceived, int K) {

        int N = shuffle.length;

        int[] total = new int[N];

        int[] order = new int[N];

        for (int i = 0; i < N; i++)

            order[i] = i;

        for (int i = 0; i < maxShuffles; i++) {

            int[] cpy = order.clone();

            for (int j = 0; j < N; j++)

                order[shuffle[j]] = cpy[j];

            for (int j = 0; j < cardsReceived.length; j++)

                total[order[cardsReceived[j]]]++;

        }

        Arrays.sort(total);

        int sum = 0;

        for (int i = N - K; i < N; i++)

            sum += total[i];

        return sum / (double)maxShuffles;

    }

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10186&amp;rd=13517" name="10186">DistinctDigits</a></b> 

</font> 

<A href="Javascript:openProblemRating(10186)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      34 / 910 (3.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 34 (0.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>null</b> for null points (NONE) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem looks quite scary at the first glance. 

Fortunately, one may notice the answer for example 5 (1000, 10000000) is only 19 thousands, so

the maximum total number of <i>distinct</i> numbers shouldn't be much bigger. 

This means we can easily check all possible non-increasing sequences and check whether each of them

can represent a number between <b>low</b> and <b>high</b>. Note: Unlike in many similar problems, the answer

 in this one is not equal to the total number of distinct numbers between 1 and <b>high</b> minus

the total number of distinct numbers between 1 and <b>low</b>.

</p>

<p>

To go through all possible sequences we can use a DFS on a graph, 

where each vertex is a pair (sequence S, digit D).

You start from a pair (empty string, digit 0), and on each step we have 3 options:

stop and check the current sequence S, append the digit to the sequence and continue to state (S + D, D),

 or move to the next digit and continue with state (S, D + 1).

Now we need to solve the harder part of the problem - to check whether a 

sequence S can be reordered to represent a number X between <b>low</b> and <b>high</b>.

</p>

<p>

First we take care of the most obvious cases - 

when the length of sequence is not equal to lengths of <b>low</b> and <b>high</b>. Having done that, the problem is 

down to one of the following three subproblems:

</p>

<p>

<b>Subproblem A1.</b> Given a sequence of digits S and a number X determine whether it is possible to reorder the sequence such that 

the result will be not less than X. This problem can be solved by greedy approach - build a number T by picking the biggest number in S as the first digit of T,

the second-biggest number as the second digit, and so on. Since T is the biggest number

we can build from S, then the subproblem A is solvable if and only if T >= X.

</p>

<p>

<b>Subproblem A2.</b> Given a sequence of digits S and a number X determine whether it is possible to reorder the sequence such that 

the result will be not greater than X. Can be solved similarly to A1, but we build the smallest possible number T

and make sure to avoid leading zeroes in T.

</p>

<p>

<b>Subproblem B.</b> Given a sequence of digits S, numbers low and high of the length equal to S, determine whether it is possible 

to reorder the S to receive a number T, such that low <= T <= high. 

First we need to make sure that the first digits of low and high are distinct. 

If both low and high start from a digit d, then we discard d from S, low, and high, 

and continue solving the problem with the smaller params (for example, if low = 12345, high = 16177 and S = "22341" then 

we discard '1' and continue with low = 2345, high = 6177 and S = "2234"). 

Of course, if S does not contain d, then we already know that the answer to the subproblem is negative.

So, when the first letters of low and high are distinct, we 

may meet one of three following possibilities (let x and y be the first digits of (low  and high, respectively):

<ol>

<li><b>S contains a digit d, x < d < y.</b> Then we put d as the first character of a number T, appending

it with all other chars of S in any order. Obviosly low < T < high, so the subproblem is solved, and the answer is positive. </li>

<li><b>All chars of S are either less than x or greater than y</b>. 

Obviously, the subproblem is solved as well, but the answer is now negative. </li>

<li><b>S contains a digit d1 = x or / and digit d2 = y, with all other digits being either less than x or greater than y</b>. 

In this case, we have two choices: use digit d1, discard it from S and from low, and continue with subproblem A1,

or use d2 and continue with subproblem A2. Fortunately, we already can solve the subproblems A1 and A2 in a linear time, 
and the 

answer to this subproblem will be positive if answer to one of two cases is positive.</li>

</ol>

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8066&amp;rd=13517" name="8066">CatchTheMice</a></b> 

</font> 

<A href="Javascript:openProblemRating(8066)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      278 / 653 (42.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      123 / 278 (44.24%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>monsoon</b> for 453.85 points (9 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      295.14 (for 123 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 





<p>This problem admitted a very wide number of different solutions, but all of them were a little tricky in implementation. While few successful challenges were registered on this problem, there were a large number of challengeable solutions taken down by the system tester, with most failing due to either time-out or precision issues.</p>

<p>Before delving into the solution methods, there are a few general points to make. We can define a function <tt>f(t)</tt>, which is the largest cage that cannot capture all the mice at time <tt>t</tt>. It's quite easy to see that this is the larger of the largest difference in x-coordinate and the largest difference in y-coordinate between any pair of mice. We can therefore write:</p>

<p><tt>f(t) = max<sub>i,j</sub>( max(x<sub>j</sub>(t)-x<sub>i</sub>(t), y<sub>j</sub>(t)-y<sub>i</sub>(t)) )</tt></p>

<p>Now, since all the coordinates are simple linear functions of time, any difference between coordinates is also a linear function of time, so we can write <tt>f(t)</tt> as:</p>

<p><tt>f(t) = max<sub>k</sub>( A<sub>k</sub> * t + B<sub>k</sub> )</tt></p>

<p>where <tt>A<sub>k</sub></tt> and <tt>B<sub>k</sub></tt> are given by the pairwise differences in the given values in velocity and position for each mouse.</p>

<p>There are a few things to notice about this function. Firstly, it must be piecewise linear, such that any minimum can only happen at an articulation point of the function. Secondly, it is the maximum across a set of convex functions (linear functions are non-strictly convex), and therefore must be convex itself. Since we are looking for the largest cage that cannot capture the mice at any point in time, we are looking for the minimum of <tt>f(t)</tt> in time.

<H2>Converging Solutions</H2>

<H3>Ternary Search</H3>

The second point above immediately leads us to possibly the most obvious solution method. We are looking for the minimum of a function which is known to be convex, so ternary search in time applies. <tt>f(t)</tt> is very easy to calculate at a point in time, so the code ends up being fairly compact (see pashka's code for an example). However, there is a pitfall with ternary search: precision. This actually stems from the method chosen by most competitors to calculate the value of <tt>f(t)</tt>, which was to calculate <tt>min<sub>i</sub>(coordinate)</tt> and <tt>max<sub>i</sub>(coordinate)</tt> and take the difference between the two. Why is this problematic? Because the absolute values of the coordinates can be relatively large and when you take the difference between two large numbers, the absolute error propagates not the relative error. This means that a small relative error in time, and therefore a small error in the calculated position can become a much larger relative error in the calculated answer. This meant that many competitors placed convergence criteria on time, leading to the solution failing due to the larger error in the answer. Possibly the unluckiest failure was that of neal_wu, whose solution performed a single iteration too few to converge enough for the system tests. Note that if the value of <tt>f(t)</tt> is instead calculated using the formula above, the delta is taken when all the values are integer and can therefore be represented exactly. This precision issue therefore disappears and a relative error in time will be of the same order as the relative error in the answer.</p>

<H3>Binary Search</H3>

<p>A different approach ignores <tt>f(t)</tt> entirely and asks, "given a cage size, is it possible to capture all the mice at any point in time?" This function is clearly monotonic, since any cage smaller than the desired answer will never be able to capture all the mice and any cage larger than the answer will definitely be able to. Binary search therefore applies, we just need to work out some way of answering the question.</p>

<p>The trick here is to notice that for some given cage size <tt>L</tt>, at the exact point in time when it transitions from being possible to being impossible (or vice-versa) to capture all the mice, two mice must be exactly a distance of <tt>L</tt> in either x- or y-coordinate (if such a time exists). This is quite easy to see, since beforehand, the maximum delta must be less than <tt>L</tt> and afterwards it must be greater than <tt>L</tt>, so at that exact moment, it must be equal to <tt>L</tt>. We can therefore check all pairs of mice, look at the point in time when they are exactly <tt>L</tt> apart and check whether all the mice fit in a cage of size <tt>L</tt> at that time. For an example of this approach, see yuhch123's code. Notice that this is slightly different in that he calculates the range of time when each pair of mice is a distance of exactly <tt>L</tt> and checks that the intersection of all these ranges is not empty. This is somewhat quicker in that the complexity of each binary search iteration is O(N<sup>2</sup>), rather than O(N<sup>3</sup>).</p>

<H2>Non-converging Solutions</H3>

<H3>Naïve O(N<sup>5</sup>)</H3>

<p>The most naïve exact solution would be to check all possible articulation points of <tt>f(t)</tt> and take the minimum over all of them. Since there are O(N<sup>2</sup>) values of <tt>A<sub>k</sub></tt> and <tt>B<sub>k</sub></tt>, and the articulation points can ony happen at an intersection of two lines, we can try all O(N<sup>4</sup>) intersections and if we work out the value of <tt>f(t)</tt> in O(N), we get an overall complexity of O(N<sup>5</sup>). This will cleary require some optimization to run in time, but is apprently possible. See ainu7's code for an example.</p>

<H3>Better O(N<sup>3</sup>) solution</H2>

<p>A better solution instead separates <tt>f(t)</tt> into <tt>g(t) = max<sub>i,j</sub>( x<sub>j</sub>(t)-x<sub>i</sub>(t) )</tt> and <tt>h(t) = max<sub>i,j</sub>( y<sub>j</sub>(t)-y<sub>i</sub>(t) )</tt> and calculates each one separately. There can only be O(N<sup>2</sup>) articulation points in each of <tt>h(t)</tt> and <tt>g(t)</tt>, so we can examine them all in O(N<sup>3</sup>). The overall minimum of <tt>f(t)</tt> must then happen at either some articulation point of <tt>h(t)</tt> or <tt>g(t)</tt>, or some point at which <tt>h(t)</tt> = <tt>g(t)</tt>. These points where the functions are equal can be calculated by combining all the times of all the articulation points together, sorting them and looking for the functions intersecting in each range between any two adjacent times. Since the functions are both linear within these ranges, this is just the intersection of two straight lines. See Gassa's solution for an example.</p>

<H3>O(N<sup>2</sup> * log (N))</H3>

<p>I introduce this since it is the way the reference solution works and is a tidy way of explicitly formulating <tt>f(t)</tt>. It is not the most efficient way, but it could also lead to an O(N * log (N)) solution, which I think would be hard to beat asymptotically with an exact solution. If you can reduce it to O(N), then present your solution on the message boards!</p>

<p>Since <tt>f(t)</tt> is convex, the piecewise linear segments must appear in increasing order of gradient. If we calculate all the values of <tt>A<sub>k</sub></tt> and <tt>B<sub>k</sub></tt> and then sort them by <tt>A<sub>k</sub></tt>, we therefore know the order in which they will appear. We can therefore build up <tt>f(t)</tt> one segment at a time, maintaining the current solution on a stack. For each line, we compare look at the last line segment added to the stack. If this segment lies completely under the next line we are considering, then we pop it from the stack and discard it and repeat with the new segment at the top of the stack. We then add the next line with the new segment starting at the point at which it intersects the last one on the stack. Since each line only gets added to or removed from the stack once, this process is linear in the number of lines. In c++, this process looks like:</p>

<pre>

int N = xp.size();

vector &lt;pair &lt;long long,long long&gt; &gt; lines;



for (int i=0;i&lt;N;i++)

  for (int j=0;j&lt;N;j++)

    if (i != j){

      lines.push_back(make_pair(xv[i]-xv[j],xp[i]-xp[j]));

      lines.push_back(make_pair(yv[i]-yv[j],yp[i]-yp[j]));

    }

  

sort(lines.begin(),lines.end());



// line contains the current f(t) 

stack &lt;pair &lt;pair &lt;long long,long long&gt; ,int&gt; &gt; line;



for (int i=0;i&lt;lines.size();i++){



  if (i+1 &lt; lines.size() && lines[i].first == lines[i+1].first) continue;



// Pop from the stack until the next line intersects the last segment

  while (!line.empty()){

    int j = line.top().second;



    if (line.top().first.first * (lines[i].first-lines[j].first) 

      &lt; line.top().first.second * (lines[j].second-lines[i].second))

        break;

    line.pop();

  }



  if (line.empty())

    line.push(make_pair(make_pair(0,1),i));

  else {

    int j = line.top().second;

    line.push(make_pair(make_pair(

             lines[j].second-lines[i].second,lines[i].first-lines[j].first),i));

  }

}



// Work back through the stack, checking articulation points to find the answer

double ret = 1000000000.0;

while (!line.empty()){

  int j = line.top().second;

  ret = min(ret,lines[j].second 

         + 1.0 * lines[j].first*line.top().first.first/line.top().first.second);

  line.pop();

}



return ret;

</pre>

<H3>O(N * log (N)) and beyond</H3>

<p>Of course, the above trick could also be used to calculate <tt>min<sub>i</sub>(coordinate)</tt> and <tt>max<sub>i</sub>(coordinate)</tt> in O(N * log(N)). For x and y, these piecewise linear functions could then be combined in O(N * log(N)) or O(N) to calculate <tt>f(t)</tt> and <tt>g(t)</tt> using a similar method as that described in the O(N<sup>3</sup>) solution. <tt>f(t)</tt> and <tt>g(t)</tt> can then again be combined in almost exactly the same way to get the final answer in O(N * log(N)) overall.</p>

<p>If anyone is feeling masochistic, then try implementing this solution in the practice room (this is likely to be quite ugly). Alternatively, if you can think of an asymptotically faster solution then let us know on the mesage boards! And no, you can claim O(N) with a constant number of ternary search iterations, since this is not really constant, but has to be proportional to log(input dimension) to give the constant precision required in the answer.</p>

 





<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=9894&amp;rd=13517" name="9894">LongStraightRoad</a></b> 

</font> 

<A href="Javascript:openProblemRating(9894)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      41 / 653 (6.28%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      3 / 41 (7.32%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>yuhch123</b> for 507.57 points (36 mins 32 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      424.49 (for 3 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>These were many conditions that competitors had to check in the solution of this problem, but only one provided any real difficulty: ensuring that the given ordering of the signs is feasible. It's difficult to know for sure, but I would guess that many competitors implemented a naïve search, only to find it fails that annoying last example case, onto which is attached the innocent-looking statement, "There is no way the signs could be in this order." Determining if the given ordering of signs was possible required some tricky detective work.</p>

<p>So what is the naïve solution? Simply generate a graph with a node for each sign and each place, with edges between any sign and any place that it references, giving the difference in position between the two. Then check whether all paths between any two nodes are the same length. This will show whether the sign and place positions can be consistently represented. This check can be carried out any number of ways: DFS, BFS, Floyd-Warshall, etc. This will also tells us whether we have enough information to know how far to the final destination: this is equivalent to checking that the destination and the last sign in the list are in the same component.</p>

<p>The problem here is that while we can then check that the ordering within each component is valid, we can't tell whether we can fit the components together in a way consistent with the ordering. The trick here is to rewite all the constraints that we have as inequalities. At the start, it helps the analysis to relax the constraints on the ordering to make it a non-strict ordering (i.e., 2 signs are allowed to be colocated). We will reintroduce the strict ordering constraint at the end. We can then write all the constraints in a single set of inequalities:</p>

<p><tt>P[i][j] &lt;= x[j] - x[i] &lt;= Q[i][j]</tt></p>

<p>If <tt>i</tt> is a sign and <tt>j</tt> is a place, then <tt>P[i][j] = Q[i][j]</tt> and we end up with an equality constraint as required. If <tt>i</tt> and <tt>j</tt> are both signs, with <tt>i &lt; j</tt>, then <tt>P[i][j] = 0</tt> (remembering that we relaxed the strict inequality for the moment) and <tt>Q[i][j]</tt> is infinite (just set it to some very large value). Notice that these inequalities then represent all the constraints we have put on the positions of the signs, so if we can find a solution that satisfies all of these (and the strict inequalities on top), then we have an answer: the signs are consistent. The next trick is then to examine the inequalities in <tt>P</tt> and <tt>Q</tt> separately. We want to find some set of differences that satisfies all the inequalities simultaneously. Noticing that:</p>

<p><tt>P[i][k] &lt;= x[k] - x[i]</tt></p>

<p>and</p>

<p><tt>P[k][j] &lt;= x[j] - x[k]</tt></p>

<p>together imply that</p>

<p><tt>P[i][k] + P[k][j] &lt;= x[j] - x[i]</tt></p>

<p>it is clear that the overall value of <tt>x[j] - x[i]</tt> has a lower bound that is given by the length of any path between i and j. This lower bound must therefore be at least as long as the longest path between the vertices. Notice that there can be no cycles in our graph with non-zero length (or it would be inconsistent anyway), so this longest path is well-defined. Now what happens when we try to set the distances to be the longest path between any pair of vertices? We actually get a solution that meets all the constraints in <tt>P</tt>. More importantly, we get a solution where each distance is as small as possible. We can therefore see if this solution satisfies the constraints given in <tt>Q</tt> and since all the inequalities in <tt>Q</tt> go the other direction, if one of them is violated by our <tt>P</tt> solution, then we find that we would need to have a solution with a smaller distance between two vertices. However, we have just shown that the solution we have contains the minimal distances: there is no valid solution with any smaller distances, so no solution can exist that can satisfy all the constraints simultaneously.</p>

<p>Our proof of existence of a solution is therefore constructive: we have a solution, which we can show that if it is invalid, no valid solution can exist. Similarly, we could have done eactly the same thing with <tt>Q</tt> using the shortest path between any two vertices. In fact, the check of validity comes down to checking whether the final matrices of shortest and longest distances describe valid ranges for each pair of vertices.</p>

<p>But what of the strict inequality constraint? We have to ensure that we can construct a solution in which <tt>x[j] - x[i] &gt; 0</tt> for every sign where <tt>j &gt; i</tt>. This is actually trivial now that we have constructed the solution that gives the maximum values for <tt>x[j] - x[i]</tt> which satisfies all the other constraints. If this solution gives the maximum value as greater than 0, then we also have a solution that satisfies the strict inequality. Otherwise we would again have to violate our maximum value constraint to get a solution.</p>

<p>Since the shortest and longest distances can be calculated in 4 or 5 lines using Floyd-Warshall, the final solution can be very short and simple for such a tricky problem analytically. See pashka's solution for a very tidy implementation, although notice that he uses doubles with a small tolerance to get around the strict inequality issue.</p>


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>
<div class="authorPhoto">
    <img src="/i/m/StevieT_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21911760" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
