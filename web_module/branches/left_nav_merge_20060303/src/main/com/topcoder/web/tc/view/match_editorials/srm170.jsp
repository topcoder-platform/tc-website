<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505612" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 170</span><br>Saturday, November 8, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>The submissions started quickly as many Divison 2 coders finished their 250-point problem in just a few minutes, but 
many of them ran into trouble with their 500-pointer, and only a handful finished the 1000 successfully, leaving the median 
score for Division 2 at just over 215 points.  On the Division 1 side, things were slow out of the gate for most coders as they 
worked on their 250, which was the same problem as the Division 2 500, and the median score there was about 240.</p>

<p>Not long after the start of the contest, it seemed <b>SnapDragon</b> would win easily with over 1680 points, with <b>tomek</b> 
in a distant second with just over 1500.  But <b>SnapDragon</b> discovered a mistake in his 550 and resubmitted, which put him 
in third after the coding phase.  During challenge phase, some rooms looked to be slaughterhouses; room 5 had 13 successful challenges, 
<b>tomek</b> claiming 4 of them, and <b>Ken Vogel</b> in room 7 had 4 as well.  At the end of the day, <b>tomek</b> ended with 
1703.72 points, good for 9th place in highest overall point total and a 300-point lead, not to mention a new high rating of 3450 to 
take over the number one ranking from <b>SnapDragon</b>.
</p>

<p>
Meanwhile, a few coders in Division 2 had submitted all three problems, but even fewer of them had all three of their submissions 
pass system testing.  <b>quickly</b> barely beat out newbie <b>anev</b>, who bolstered his score with three successful challenges, 
to win Division 2 with a total of 1097.02 points.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>LevelUp</b>
</font>
<A href="Javascript:openProblemRating(1930)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505612" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      216 / 222 (97.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      191 / 216 (88.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>goongas</b> for 248.19 points (2 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      215.47 (for 191 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The best and pretty much only way to solve this problem is to loop through the array of experience required until the experience 
required is greater than the amount you have, and return the difference.  The only real danger to watch out for is to make sure that 
you don't return 0 if you advance exactly to a given level.  There was an example case that tested for this, however, and most Division 
2 coders did perfectly well on this problem.
</p>

<pre>
    i = 0;
    while (received &gt;= expNeeded[i])
        i++;
    return expNeeded[i] - received;
</pre>

<font size="+2">
<b>RecurrenceRelation</b>
</font>
<A href="Javascript:openProblemRating(1915)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505612" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      110 / 222 (49.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      41 / 110 (37.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>majia</b> for 416.13 points (13 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      289.46 (for 41 correct submissions)
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
      137 / 147 (93.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      95 / 137 (69.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 245.76 points (3 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195.17 (for 95 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This one was hard on both Division 1 and Division 2 coders for its wordiness.  However, once you managed to parse through the maze 
of equations and subscripts, the algorithm turned out to be fairly straightforward.
</p>

<p>
Given K coefficients and K initial terms, we can iteratively generate terms via the recurrence relation</p>
<pre>
x<sub>n</sub> = c<sub>K-1</sub> * x<sub>n-1</sub> + c<sub>K-2</sub> * x<sub>n-2</sub> + ... + c<sub>0</sub> * x<sub>n-K</sub>
</pre>
<p>
where n is some integer greater than or equal to K.  Note that n and K are different quantities.  K is fixed because it is the number of 
coefficients in the recurrence relation, and n is variable, which enables us to define x<sub>n</sub> in terms of the K terms that come before it.
</p>

<p>
Then, the algorithm starts by filling an array of length K with the initial conditions modulo 10, i.e., if the original array was 
{35, -64, 1000}, you would fill the array with {5,6,0}.  If N is the index of an object inside the initial conditions, then return it.   
Otherwise, we can perform an iterative process to get to the required term.  First calculate what the next term should be modulo 10, 
via the recurrence relation and the last K terms.  Then, we remove the first term of the array and add our new term to the end, until 
we reach the term that is asked for, and then we just return it.
</p>

<pre>
    int last[];
    initialize last to initial mod 10

    for (j = K; j &lt;= N; j++) {
        int sum = 0;
        for (i = 0; i &lt; K; i++)
            sum += coefficients[i] * last[i];
        sum = (((sum % 10) + 10) % 10);
        for (i = 0; i &lt; K - 1; i++)
            last[i] = last[i + 1];
        last[K - 1] = sum;
    }
    return last[K - 1];
</pre>

<p>
Taking the modulo 10 remainder at every step is necessary, because otherwise the numbers get very large very quickly, although if you 
really wanted to have the entire decimal expansion of the number, Java's BigInteger would do it.  Also, not returning negative numbers 
correctly and not correctly evaluating numbers in the initial conditions were other common mistakes.
</p>

<font size="+2">
<b>Poetry</b>
</font>
<A href="Javascript:openProblemRating(1835)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505612" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      39 / 222 (17.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 39 (28.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>yanivinbar</b> for 633.66 points (24 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      473.69 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The best way to solve this problem is in parts.  First, we want to determine the last word of each line.  Then, we want to determine the 
ending patterns of each last word, and then construct the rhyme scheme.
</p>
<p>
The first step is fairly easy, using Java's StringTokenizer, C++'s istringstream, or a tokenizing method of your own to extract the last 
word from any non-empty line.</p>

<p>
The four rules describing the ending pattern also suggest an algorithm for determining the ending pattern of a given word.  Loop from 
the end of the word backwards, until you hit a vowel, and then keep going until you hit the beginning of the word or a non-vowel.  Things 
to watch out for here are that the letter 'y' is not a vowel unless it is not at the beginning or the end of a word.  In addition, the comparison 
is case insensitive - the words "THIS" and "this" are the be considered exactly the same.
</p>

<p>
Once you have generated the ending patterns of each word, then simply run the algorithm described in the problem statement to generate 
the rhyme scheme, and return the rhyme scheme as a string.
</p>

<p>
It wasn't very hard algorithmically, and most of the failures resulted from mishandling of the letter 'y' at the end of a word.
</p>

<font size="+2">
<b>CityLink</b>
</font>
<A href="Javascript:openProblemRating(1864)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505612" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      550
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      101 / 147 (68.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      69 / 101 (68.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 536.51 points (4 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      361.75 (for 69 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first thing to note is that the upper limit on how long things might take is 2 million time units.  Thus, a simulation would have 
to be extremely efficient to work at all, and several coders challenged others successfully with timeout cases.  I haven't actually 
managed to find a simulation solution that works yet - maybe one of you out there can code one up.
</p>

<p>
A much faster method relies on some graph theory.  First, generate all possible distances between two cities.  No distance that is 
not in that set can be the minimum distance, because if all the cities are connected at time <i>t</i>, then there is an earlier time at 
which the configuration must be exactly the same.  The time it takes to connect two cities at (x1, y1) and (x2,y2) is max(abs(x2-x1), 
abs(y2-y1)) if the two cities do not share a coordinate.  If their x-coordinate is the same, then the time it takes is (abs(y2-y1) + 1) / 2, 
and if their y-coordinate is the same, then it will take (abs(x2-x1) + 1) / 2.</p>

<p>
At this point, there are a couple of ways to proceed.  One is to run the <i>Floyd-Warshall</i> shortest paths algorithm to start, and 
then to loop through all pairs and determine which pair takes the longest to be connected.  Or, you could sort the set of distances and 
run through them one at a time, checking whether they are connected at that time distance.
</p>

<p>
There are a couple of ways to do the connectedness check, given some time distance <i>d</i>.  One is to run a modified version of the 
Floyd-Warshall algorithm, which will, worst case, run in O(N^5) time.  With N = 50, this is undesirable but still may work in 
time - the worst case found took 5.5 seconds with one implementation of this algorithm. Code for this looks like:</p>

<pre>
    for each d in distances
        for (k = 0; k &lt; N; k++)
            for (i = 0; i &lt; N; i++)
                for (j = 0; j &lt; N; j++)
                    if (connected[i][k] &amp;&amp; connected[k][j])
                        connected[i][j] = 1;
        if all connected then return d
</pre>

<p>
A much faster solution goes as follows: at the start, assign each city a value equal to its index.  Whenever two cities get connected, 
we set one to the value of the other, so that every city that is connected gets the same value.  Thus, at any given time, any cities which 
have been connected at that time or previously have the same value.  Then the first time at which all of the cities have the same value is 
the earliest time at which all the cities are connected, and we return that time.
</p>

<pre>
    int cities[N] = {0, 1, ... , N - 1};
    for each d in distances {
        if cities a and b just connected at time d {
       for (i = 0; i &lt; N; i++) {
           if (cities[i] = cities[b]) cities[i] = cities[a];
       }
        }
   if cities[i] == cities[0] for all i
       return d;
    }
</pre>

<p>
Another solution combined the modified Floyd-Warshall above with binary search.  See <b>PMH</b>'s code in Room 1 for an 
implementation of this algorithm.
</p>

<font size="+2">
<b>Polynomials</b>
</font>
<A href="Javascript:openProblemRating(1852)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505612" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      40 / 147 (27.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 40 (22.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 723.38 points (19 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      548.30 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The bounds for this problem are high enough, at 1 million each, that a brute force solution will certainly time out.  And even if 
you don't brute force it, you still have to be careful.
</p>

<p>
First, we have to parse the equation.  Split the given equation string at the equals sign '=', then parse the left side and right side 
separately.  Each side is a number of terms, each separated by a plus sign.  Thus, you can split each by the '+' signs, and parse 
each term independently.  Each term is either of the form "ax^b" or "a", where a is from 0 to 9, inclusive, b is from 1 to 9, 
inclusive, and x is either 'x' or 'y'.  Something to watch out for is that the polynomial "6x^4+7x^4" reduces to "13x^4".
</p>

<p>
Only non-negative coefficients are allowed in each polynomial.  Thus, if f(x) is a non-constant polynomial, then as x increases, 
f(x) will also, and the same goes for y.  We can then use the fact that it is monotonically increasing to do a binary search - loop 
through each x value and do a binary search on the y values.  Given some value of x, there will be at most one value of y greater 
than or equal to zero that satisfies the equation g(y) = f(x) if both polynomials are non-constant, and vice versa.  This is because 
if there is some value of y that solves it, no greater or smaller value of y will have the same value of g(y).
</p>
<p>
If the search fails, then there is no lattice point with that x coordinate.  Otherwise, the y coordinate that you find is the only one 
possible, and so you increment your count.  Also, you have to consider special cases where either or both polynomials are constant - 
if only one is constant, then you must loop over the other polynomial, and if both are constant, you simply check for equality, because 
then the equation will be satisfied at every point.  This approach has a runtime of about O(N log N), or 20 million iterations, which 
will pretty much barely run in time.   In the pseudocode below, find(x) and find(y) are functions which use binary search on the x 
and y values to find a value that works. <b>benetin</b> in room 5 was the only coder I found who used this solution, which failed 
because it mishandled one of the special cases.
</p>

<pre>
    parse equation;
    if both sides constant {
        if left side == right side
            return (xmax + 1) * (ymax + 1)
        else return 0
    }
    else if left side constant {
        //use binary search to find an x that works
        if find(x)
            return (ymax + 1)
        return 0
    }
    else if right side constant {
        if find(y)
            return (xmax + 1)
        return 0
    }
    else {
        count = 0;
        for (i = 0; i &lt;= xmax; i++) {
            if find(y)
                count++;
        }
        return count;
    }
</pre>

<p>
Another approach using monotonicity is to keep two temporary values x and y, setting them to 0 at first.  If f(x) is less than g(y) at 
the current x and y, increment x.  If f(x) is greater than g(y), then increment y, and if they are equal, increment your return value, 
as well as both x and y.  Again, you must check for the special cases as in the above example. This runs in O(N).   Almost all, if not all, 
of the coders who correctly solved the 1000 used this solution.
</p>

<pre>
    parse equation;
    worry about special cases as above;
    x = 0, y = 0, count = 0;
    while (x &lt;= xmax &amp;&amp; y &lt;= ymax) {
        if (f(x) &lt; g(y))
       x++;
   else if (g(y) &lt; f(x))
       y++;
   else {
       x++;
       y++;
       count = count + 1;
   }
    }
    return count;
</pre>

<p>
The approach that <b>SnapDragon</b> and others used, which should have worked, was to use a map that kept track of how many 
times a given value of f(x) appeared.  Pseudocode for this appears below:
</p>
<pre>
    parse equation;
    for (i = 0; i &lt;= xmax; i++)
        map[f(i)]++;
    ret = 0;
    for (i = 0; i &lt;= ymax; i++)
        ret += map[g(i)];
    return ret;
</pre>

<p>
This solution does not even have to consider the special cases of constant polynomials on either side.  However, they unfortunately 
failed due to running over TopCoder's 64MB memory limit for certain large test cases, puzzlingly returning "segmentation fault" 
instead of an out of memory error.
</p>

<p>
<img src="/i/m/antimatter_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="275071" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
