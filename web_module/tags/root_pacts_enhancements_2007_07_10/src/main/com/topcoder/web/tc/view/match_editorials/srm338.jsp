<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10662">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506228" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 338</span><br>Wednesday, February 7, 2007
<br><br>

<h2>Match summary</h2> 

<p>
Division 2 saw a very tough hard problem, worth 1100 points. Ultimately the
problem proved too hard, and none of the 30 submitted programs passed. 
This meant that there were only three sources of "point income" left:
the easy, the medium, and the challenge round. To place at the top, one had
to use each of them. In the end, the division win went to
<tc-webtag:handle coderId="21470487" context="algorithm"/>. 
<tc-webtag:handle coderId="15179349" context="algorithm"/> came in second
and 
<tc-webtag:handle coderId="20538097" context="algorithm"/> followed in third.
<br /><br />

In the stronger division the challenge phase brought down almost 
half of the submissions, but this didn't really affect 
the top of the division ranklist. In the end the equation was
clear: to finish on top, you had to solve all three tasks. 
Twenty-one coders were able to solve all three problems, and
they all deserve congratulations for doing so. The top three 
contained some of the usual suspects:
<tc-webtag:handle coderId="10574855" context="algorithm"/> won, followed by 
<tc-webtag:handle coderId="11829284" context="algorithm"/> in second
and 
<tc-webtag:handle coderId="8355516" context="algorithm"/> in third.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7385&amp;rd=10662" name="7385">BinaryIncrementation</a></b>
</font>
<A href="Javascript:openProblemRating(7385)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506228" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      490 / 540 (90.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      467 / 490 (95.31%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>wongiseng</b> for 248.82 points (1 mins 57 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      209.28 (for 467 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Basically, there were three different approaches to this simple task.
<br /><br />

<b>Straightforward</b><br />
To increase the number, we need to change all the trailing '1's into '0's,
and the preceding '0' into a '1'. This could be done using a simple loop -- 
if not for the case when the input string contains only '1's. In this case
the result will have one more character.
<br /><br />

A simple way to handle this: Take the string representing a number N. 
Add a leading zero. Change the string to represent N+1. If we still have a leading zero, remove
it. 
<br /><br />

Here's this approach in C++ code:

<pre>
  public string plusOne (string x) {
    x = "0" + x;
    for (int i=x.size()-1; i&gt;=0; i--)
      if (x[i]=='1') {
        x[i]='0';
      } else {
        x[i]='1'; break;
      }
    if (x[0]=='0') x = x.substr(1);
    return x;
  }
</pre>

<b>Break it into simple steps</b><br />
The main idea of this solution: convert the input to a number, add 1, and convert
the number back to a string.
<br /><br />
C++ code:

<pre>
  public string plusOne (string x) {
    int X = 0;
    // convert to a number
    for (unsigned i=0; i&lt;x.size(); i++) {
      X *= 2;
      X += (x[i]-'0');
    }
    // add 1
    X++;
    // convert back
    string res = "";
    while (X) {
      res += ('0'+(X%2));
      X /= 2;
    }
    reverse( res.begin(), res.end() );
    return res;
  }
</pre>

<b>Know your libraries</b><br />
Did you know that Java's BigInteger class can also work with bases other than 10?
If yes, you could quickly write a flawless solution:

<pre>
  public String plusOne (String x) {
    BigInteger X = new BigInteger(x,2);
    return X.add(BigInteger.ONE).toString(2);
  }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7386&amp;rd=10662" name="7386">ImprovingStatistics</a></b>
</font>
<A href="Javascript:openProblemRating(7386)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506228" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      380 / 540 (70.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 380 (19.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cax</b> for 461.23 points (8 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      291.60 (for 75 correct submissions) 
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
      402 / 413 (97.34%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      230 / 402 (57.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 247.03 points (3 mins 7 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      191.94 (for 230 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let's start by writing the simplest solution possible.
<br /><br />

<b>Naive solution</b>

<pre>
  int display(int played, int won) {
    return (won * 100) / played;      // integer division rounds down
  }

  int howManyGames (int played, int won) {
    if (played == won) return -1;
    int currentDisplay = display(played,won);
    for (int g=1; ; g++)
      if (display(played+g,won+g) &gt; currentDisplay)
        return g;
  }
</pre>

The solution above will <b>not</b> pass, and there are <b>three</b> different bugs.
<br /><br />

<b>Bug 1.</b> The display() function contains an overflow, won * 100 may not fit into an int.
The easiest fix is to use 64-bit integers:

<pre>
  int display(int played, int won) {
    return (won * 100LL) / played;      // integer division rounds down
  }
</pre>

<b>Bug 2.</b> The solution will time out. The worst possible valid input case:
played = 1,000,000,000, won = 980,000,000. In this case we need 1,000,000,000 
games to change the displayed value.<br /><br />


<b>Bug 3.</b> The solution doesn't work. The tricky case is that once the
displayed value is 99%, it will never be 100%, and thus the answer in such
a case shall be -1.<br />
<br />

There is an elegant way how to avoid bug 3 without even realizing that the tricky case
is there. The problem statement stated that the answer is always less than 2,000,000,000.
Thus at the beginning of our program we simply check whether 2,000,000,000 wins changes
anything. If not, we return -1.<br />
<br />

<b>Fixing bug 2 the hacker's way</b><br />
Is trying 1,000,000,000 values too slow? Then what about trying the possible answers
with step 1,000 first, and only when we get close switch to step 1?<br /><br />

C++/Java code:

<pre>
  int howManyGames (int played, int won) {
    int currentDisplay = display(played,won);
    if (currentDisplay &gt;= 99) return -1;

    int g;
    for (g=1; ; g+=1000)
      if (display(played+g,won+g) &gt; currentDisplay)
        break;

    // We already crossed the boundary.
    // Now we return one step back and find its exact position.
    g-=1000;
    for ( ; ; g++)
      if (display(played+g,won+g) &gt; currentDisplay)
        return g;
  }
</pre>

<b>Fixing bug 2 the programmer's way</b><br />
Whenever we can write a solution similar to the one above, there is always
a solution that is faster and more elegant: binary search.
<br /><br />

There were two variations of this approach. 
The easier way was to note that 2*10^9 is an upper bound on the value we seek.
But even if we didn't know the upper bound, only that it exists, binary
search would still be possible. In the first phase, try g=2^0, 2^1, 2^2, ...
until you find one that is large enough to serve as an upper bound for the
rest of the search.
<br /><br />

C++/Java code of the second variation:

<pre>
  int howManyGames (int played, int won) {
    int currentDisplay = display(played,won);
    if (currentDisplay &gt;= 99) return -1;

    long minG = 0, maxG = 1;
    while (display(played+maxG,won+maxG) == currentDisplay)
      maxG *= 2;

    while (maxG - minG &gt; 1) {
      long midG = (maxG + minG) / 2;
      if (display(played+midG,won+midG) == currentDisplay)
        minG = midG;
      else
        maxG = midG;
    }

    return maxG;
  }
</pre>

<b>And finally, the mathematician's way</b><br />
Let Z be the currently displayed value. 
We have to find the smallest g such that:<br />
floor( 100*(won+g) / (played+g) ) &ge; Z+1.
<br /><br />

As Z is an integer, we may omit the floor function. Solving for g, we get:<br />
g*(99-Z) &ge; (Z+1)*played - 100*won
<br /><br />

The value on the right side is always positive. Thus for Z &ge; 99 the inequality
has no solutions. If Z &lt; 99, we may divide and we find out that the 
smallest integer solution is: <br />
g = ceil( ( (Z+1)*played - 100*won ) / (99-Z) )
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7387&amp;rd=10662" name="7387">NewOperator</a></b> </font> <A href="Javascript:openProblemRating(7387)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506228" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 540 (5.56%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 30 (0.00%) 
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
First of all, let's find out what values we can get by computing <tt>A@B</tt>, where 
<tt>A</tt> and <tt>B</tt> are positive 32-bit integers.
Remember that <tt>A@B = 5 * prod3(X) + first(X) * sum(Y) + smallest(Y)</tt>.
We get:

<ul>
<li>
<tt>prod3(X)</tt> is between 0 and 9*9*9, inclusive. 
</li>
<li>
<tt>smallest(Y)</tt> is between 0 and 9, inclusive.
</li>
<li>
<tt>first(X)</tt> is between 1 and 9, inclusive.
</li>
<li>
<tt>sum(Y)</tt> is positive and always less than 90. 
</li>
</ul>

Thus <tt>A@B</tt> is always positive, and always less than 5*9*9*9 + 9*90 + 9 = 4464.
<br /><br />

The fact that we can only create less than 5,000 different values suggests
that we may generate them all, and then check whether the goal is among them
The tricky part is to avoid doing unnecessary work. 
<br /><br />

Let the <i>distance</i>
of a number be the smallest count of <tt>@</tt>s necessary to create it.
We will generate the numbers in increasing distance order.
<br /><br />

Suppose that we already generated all the numbers that could be created
using less than K <tt>@</tt>s. How to generate the numbers that require exactly
K <tt>@</tt>s? 
When creating such a number, let X and Y be the values combined in the
last, K-th step. If the distance of X is d1 and the distance of Y is d2,
then the distance of <tt>(X@Y)</tt> is at most (d1+d2+1). 
<br /><br />

Our program will work as follows: First, we pre-compute all the unary
functions from the problem statement. (This is not really necessary,
we could compute them when needed. I chose this way to be able to 
split my code into smaller parts that are easier to explain.)

<pre>
  #define MAXIMUM_INPUT 1012345
  #define MAXIMUM_OUTPUT 6000
  int sum[MAXIMUM_INPUT], prod3[MAXIMUM_INPUT], 
      smallest[MAXIMUM_INPUT], first[MAXIMUM_INPUT];

  int compute(int X, int Y) {
    return 5 * prod3[X] + first[X] * sum[Y] + smallest[Y];
  }

  void init() {
    int D[20]; 
    for (int x=1; x&lt;MAXIMUM_INPUT; x++) {
      int tmp = x, dc = 0;
      while (tmp) { D[dc++] = tmp%10; tmp /= 10; }
      first[x] = D[dc-1];
      sum[x] = 0;
      for (int i=0; i&lt;dc; i++) sum[x] += D[i];
      sort(D,D+dc);
      smallest[x] = D[0];
      prod3[x] = 1;
      for (int k=1; k&lt;=3 &amp;&amp; dc-k&gt;=0; k++) prod3[x] *= D[dc-k];
    }
  }
</pre>

Now we will generate the reachable numbers. For each of them the vector
"<tt>best</tt>" contains its distance, and for each k "<tt>sequence[k]</tt>" contains a
list of all the numbers that have the distance exactly equal to k.

<pre>
  int minimumCount(int x, int goal) {
    if (x==goal) return 0;
    init();

    vector&lt;int&gt; best(MAXIMUM_OUTPUT,987654321);
    vector&lt; vector&lt;int&gt; &gt; sequences( MAXIMUM_OUTPUT );

    sequences[0].push_back(x);

    // try all possible distances
    for (int distance=1; distance&lt;=MAXIMUM_OUTPUT; distance++)
      
      // for each of them, try all possible distances of one element
      for (int d1=0; d1&lt;distance; d1++) {
        
        int d2 = distance - 1 - d1;

        // once we fixed the distances, try all possible
        // pairs X, Y of items having these distances 

        for (unsigned i=0; i&lt;sequences[d1].size(); i++)
          for (unsigned j=0; j&lt;sequences[d2].size(); j++) {
            int X = sequences[d1][i];
            int Y = sequences[d2][j];
            int Z = compute(X,Y);
            if (best[Z] &gt; distance) {
              best[Z] = distance;
              sequences[distance].push_back(Z);
            }
          }
      }

    if (goal &gt;= MAXIMUM_OUTPUT) return -1;
    if (best[goal] == 987654321) return -1;
    return best[goal];
  }
</pre></p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7289&amp;rd=10662" name="7289">RandomSwaps</a></b> </font> <A href="Javascript:openProblemRating(7289)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506228" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      295 / 413 (71.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      255 / 295 (86.44%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 487.64 points (4 mins 32 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      330.36 (for 255 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
At first glance, this seems like an ordinary DP problem. Let P(t,a,b) be the probability
that after t swaps the element from index a will move to index b. We can write a
simple recurrence equation and... and then we read the constraints. 
It seems that the above solution will be too slow.
<br />
<br />

However, there is a simple observation that will save us. The entire situation 
is really quite symmetric. The probability of moving an element from one place
to some other place must always be the same, regardless of the indices assigned
to those places.
<br /><br />

In other words, consider some fixed element. After t swaps it is enough to
distinguish between two cases: either the element is on its original place
or not. If it is not, than all possible places have to be equally likely.
Moreover, the probability that an element is on its original place
does not depend on the choice of the element.
<br /><br />

Suddenly, instead of keeping arrayLength^2 probabilities for each step,
we see that it is enough to store a single probability.
<br /><br />

Formally, let P(t) be the probability that the element from the place 0
is at the place 0 after t swaps. Clearly, for any other place the probability
that this element is there equals to Q(t) = (1 - P(t)) / (arrayLength - 1).
<br /><br />

We are interested in the values P(swapCount) and Q(swapCount). How to compute them?
<br /><br />

There are S = (arrayLength)*(arrayLength-1)/2 possible swaps in each step.
Out of them, T = (arrayLength-1)*(arrayLength-2)/2 leave the element 0 on its place,
and U = arrayLength-1 move it. 
<br /><br />

The event "after t swaps, our element is on the place 0" can be split into two
events: either it was there after t-1 swaps and remained there, or it came there
in the t-th swap.
<br /><br />

The probability of the first event is (T/S) * P(t-1), the probability of the 
second event is U * Q(t) * (1/t). 
<br /><br />

This was already enough to solve the problem. However, note that the recurrence
equation has a closed form solution. 
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7424&amp;rd=10662" name="7424">CakeParty</a></b> </font> <A href="Javascript:openProblemRating(7424)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506228" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      52 / 413 (12.59%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 52 (44.23%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>andrewzta</b> for 761.17 points (17 mins 4 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      519.05 (for 23 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem contained two separate parts. One was plainly in sight, the other 
  slightly hidden.
  <br />
  <br />
  
The obvious part is solving the game.
  <br />
  <br />
  
Playing around with small cases, analyzing the examples, or even writing a brute 
  force solution to compute some winning positions -- these are some of the ways you could discover the optimal strategy.
  <br />
  <br />
  
Once you get the right idea, the game is unbelievably simple: Let P be a position,
    M the maximal number of pieces of one cake, and let C be the number of cakes 
    that have exactly M pieces left. The position P is winning if and only if
    C is odd. <br />
  <br />
To prove this, we need to show two things: </p>
<ol>
<li>
From any losing position, all moves lead to a winning position.<br />
This is clearly true. The player will eat from exactly one of the maximal cakes,
thus their count changes from even to odd.<br />
</li>
<li>
From any winning position, there is a move that leads to a losing position.<br />
If we have 3 or more maximal cakes, this is similar to the previous case. 
The interesting situation is when there is exactly one maximal cake. 

If this happens, we count the second largest cakes. If their count is odd,
reduce the maximal cake to this count of pieces. If their count is even, 
reduce the maximal cake to a smaller count. (Note that there may be many
valid moves here.)
</li>
</ol>

Now, after feeling that we solved the problem, we stumble upon the hidden second
part: selecting the lexicographically smallest move.
<br />
<br />

Clearly, we may select the cake and the number of pieces independently:
<ul>
<li>
The cake is always the lexicograpically smallest of the maximal cakes. 
</li>
<li>
For a losing position the number of pieces is 1.
</li>
<li>
For a winning positition with more than one maximal cake the number
of pieces is 1, again.
</li>
<li>
For a winning position with one maximal cake and an odd count of 
second largest cakes, there is a unique correct number of pieces.
</li>
<li>
Finally, for a winning position with one maximal cake and an 
even count of second largest cakes, the winning moves correspond
to some interval [A,B].
</li>
</ul>

Thus all we need is a helper function that will find the
lexicograpically smallest integer in [A,B]. This
one will do, for example:

<pre>
  int digits(int x) { return (""+x).length(); }

  String lexSmallest(int min, int max) {
    if (digits(min)==digits(max)) return ""+min;
    String cand1 = ""+min;
    String cand2 = "1"; for (int i=0; i&lt;digits(min); i++) cand2 += "0";
    if (cand1.compareTo(cand2) &lt; 0) return cand1;
    return cand2;
  }
</pre>

</p>

<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
