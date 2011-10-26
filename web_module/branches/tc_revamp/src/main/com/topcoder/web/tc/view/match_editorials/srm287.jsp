<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505853" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 287</span><br>Saturday, February 4, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
In Division 1 we saw a match dominated by coders from Poland. During the coding phase
monsoon took the lead with the fastest submission on the hard problem. However, 
his solution to the easy problem was successfully challenged and in the end of the
challenge phase kedaizd was on the top of the division summary. But the system tests
changed the results once again when kedaizd lost his easy problem too. In the end
monsoon won the match, with marek.cygan in second and kedaizd in third. Thanks to
twelve successful challenges natori was able to take the fourth place without solving
the hard problem.
</p> 

<p>
Division 2 had a pretty tough round. The medium problem seemed to be much easier than
it really was, and the hard problem was... well, hard. In the end, only two coders got
the hard problem right, and what's worse, different mistakes claimed all submitted
solutions to the medium problem. The final results were determined by the challenge phase.
The first two places were safely taken by the two coders who solved the hard problem,
zwdant and Rahenri. ZUTI made seven successful challenges and finished third.
</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5975&amp;rd=9808" name="5975">CustomerStatistics</a></b> 
</font> 
<A href="Javascript:openProblemRating(5975)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505853" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      366 / 441 (82.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      303 / 366 (82.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>srikary</b> for 248.34 points (2 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      188.44 (for 303 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
A straightforward way how to solve this task is to sort the customer list
and then in one loop count the number of occurences of each name.
See <a
href="/stat?c=problem_solution&rm=247560&rd=9808&pm=5975&cr=15898218">Rahenri's
solution</a> for an implementation of this approach.
</p>

<p>
Another possibility is to use some library data structure, such as TreeMap in
Java or map in C++. The advantage of this approach is that there are less special
cases to consider, and thus less chances to make a mistake.
</p>

<pre>
#define FOREACH(it,cont) for (it=(cont).begin(); it!=(cont).end(); ++it)

vector&lt;string&gt; reportDuplicates (vector&lt;string&gt; customerNames) {
  map&lt;string,int&gt; occurs;
 
  // count the number of occurences for each customer 
  for (unsigned i=0; i&lt;customerNames.size(); i++)
    occurs[ customerNames[i] ]++;

  vector&lt;string&gt; result;

  // process all records in the map "occurs", each time we have a duplicate, report it
  FOREACH(it,occurs) {
    if (it-&gt;second &gt; 1) { // more than one occurence
      stringstream sout;
      sout &lt;&lt; (it-&gt;first) &lt;&lt; " " &lt;&lt; (it-&gt;second);
      result.push_back( sout.str() );
    }
  }
  return result;
}

</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6013&amp;rd=9808" name="6013">TwoEquations</a></b> 
</font> 
<A href="Javascript:openProblemRating(6013)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505853" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      113 / 441 (25.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 113 (0.00%) 
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

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      296 / 381 (77.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      33 / 296 (11.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 245.14 points (14 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      153.15 (for 33 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
I admit that this problem was nasty. Really nasty. And while it was meant to be a tough lesson
that being careful pays off, I didn't expect it to be this hard.
Thus I decided that in this case explaining the idea of the solution simply isn't enough.
I will start this editorial with some thoughts on how to tackle problems like this one.
</p>

<p>
First and most important, don't reinvent the wheel! If you know that a problem is both
classical and tricky, it has been solved correctly oh so many times long before you 
tried to solve it in the SRM. Don't be afraid to consult online references such as
<a href="http://mathworld.wolfram.com/">MathWorld</a>, or even use Google to look
for a discussion on the topic in question.
</p>

<p>
Only when you are really left "on your own", start working out all the tricky details.
Again, don't be afraid. This time, don't be afraid to put away the keyboard and
grab a pen and a paper. Work out all the necessary details before you start coding,
make sure you didn't forget anything, double-check your thoughts. Speed does not help
if your solution fails.
</p>

<p>
If the problem contains different types of work, start with coding the simple, mechanical
parts. In this case, the first step should be parsing the input. The simplest way is to
split the equation as follows: <code>String[] F = first.split("[()+*=XY ]+");</code>

Then you simply convert the non-empty strings in F into numbers.
Next, write the output routine and a function to compute the greatest common divisor (in
case your programming language doesn't have it built-in).
</p>

<p>
Now we can get to the important part, solving the equations.
</p>

<p>
First of all, note that an equation "0*X + 0*Y = c" has no solutions for c&ne;0, and 
for c=0 each pair (X,Y) is a solution.
</p>

<p>
Now suppose that we have an equation "a*X + b*Y = c" such that (a,b)&ne;(0,0).
The set of solutions of each such equation corresponds to a line in the XY plane.
(More exactly, if b&ne;0, the line is the graph of the function Y = -(a/b)*X + (c/b), 
otherwise it is a vertical line with X = c/a.)
</p>

<p>
The first outline of our algorithm:
</p>

<ol>
<li>If one of the equations is of the form "0*X + 0*Y = c" with c&ne;0, return "NO SOLUTIONS".
<li>If one of the equations is of the form "0*X + 0*Y = 0", return "MULTIPLE SOLUTIONS".
(The other equation has got an infinite number of solutions, and all of them satisfy this 
equation as well.)
<li>Solve the case when both equations correspond to lines.
</ol>

<p>
Hopefully you now noted that we <b>can't</b> swap steps 1 and 2. The second step depends on the
first one, we have to be sure that the other equation is solvable. Swapping these two steps
was a very common mistake in the SRM.

</p>

<p>
We are left with the case that the solutions correspond to lines. Again, there are three cases:
</p>

<ol>
<li>The lines are not parallel, thus there is exactly one intersection.
<li>The lines are parallel but not identical, there is no solution.
<li>The lines are identical, there are infinitely many solutions.
</ol>

<p>
There are different possibilities how to distinguish between these cases, I prefer vectors.
It can be easily seen that the vector [a,b] is perpendicular to the line determined by
"a*X + b*Y = c". Thus: (the lines "a*X + b*Y = c" and "d*X + e*Y = f" are parallel) iff
(vectors [a,b] and [d,e] are parallel) iff (their vector product ae-bd is zero).
</p>

<p>

In the case that the lines are not parallel, we can find the one solution, e.g., by
elimination:
</p>

<p>
If we multiply the first equation by (-d), the second one by a, and add the results together,
we get: "Y*(ae-bd) = (af-cd)".
</p>

<p>
Similarly, we can multiply the first equation by e, and the second one by (-b), we get:
"X*(ae-bd) = (ce-bf)".
</p>

<p>
Clearly, as (ae-bd) is not zero, we just found the unique solution: X=(ce-bf)/(ae-bd),
Y=(af-cd)/(ae-bd). We only have to simplify it and print it.
</p>

<p>
If the lines are parallel, we have to tell whether they are identical, in other words whether
one of the equations is a multiple of the other one. This can be simply done by checking
whether the vector product of [a,b,c] and [d,e,f] is zero.

</p>

<p>
(If you are not comfortable with vectors, you can substitute X=0 or Y=0 into the first equation,
compute one solution of the first equation, and check whether it satisfies the other equation.)
</p>

<h4>A tricky solution</h4>

<p>
Note that in the general case when there is one solution, the values of X and Y have (before the reduction)
the same denominator. Also, it can be shown that for the allowed input values the magnitude of the denominator
and also the magnitudes of both numerators don't exceed 200.
</p>

<p>
Thus, let S = { u/v ; -200&le;u&le;200, 1&le;v&le;200 }. We already know that if the system of equations
has exactly one solution, both X and Y for the solution lie in S. Also, it can easily be shown that any
valid equation other than "0*X + 0*Y = c" for c&ne;0 has more than one solution in S. 

</p>

<p>
It follows that we can simply write three nested loops to check all "candidates", and in the end
count the solutions we found.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6015&amp;rd=9808" name="6015">FixedSizeSums</a></b> 
</font> 
<A href="Javascript:openProblemRating(6015)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505853" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      18 / 441 (4.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 18 (11.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zwdant</b> for 447.61 points (32 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      434.12 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This was a pretty straightforward dynamic programming problem. With a different (easier)
medium problem I would expect that more coders should be able to solve this one.
</p>

<p>
The combinatorial object described in the problem statement is called <i>integer
partitions</i>. In this case we are interested in partitions with a fixed number of
elements. 
</p>

<p>
The common trick in almost all combinatorial problems is to generate the answer
sequentially. In this problem, we can start by asking the question: what is the first
element of the partition? 
</p>

<p>
To answer this question quickly, we have to count the partitions. In this case there are more
suitable ways of doing it, we will present one of them. 
Let C(N,K,L) be the count of partitions that have K elements that sum up to N,
and the first (largest) element is L. 

</p>

<p>
For example, for N=8 and K=3 we have C(8,3,1)=0, C(8,3,2)=0, C(8,3,3)=1, C(8,3,4)=2,
C(8,3,5)=1, C(8,3,6)=1, C(8,3,7)=0, and C(8,3,8)=0. 
</p>

<p>
If we knew the values C(N,K,L) for all L, we could easily find the first element of the
partition we seek: simply start with L=N and decrease it until you find enough partitions.
</p>

<p>
The rest of the partition can be determined in a very similar way. Note that the rest
of the partition is a partition of N-L into K-1 elements, where
the first element can range from 1 to L. Moreover, we can easily compute the new
index of this smaller partition.
</p>

<p>
For example, for N=8, K=3 and index=3 we have:
<ul>

<li>There are 0 partitions with the first element &ge; 8.
<li>There are 0+0 = 0 partitions with the first element &ge; 7.
<li>There are 0+0+1 = 1 partitions with the first element &ge; 6.
<li>There are 0+0+1+1 = 2 partitions with the first element &ge; 5.
<li>There are 0+0+1+1+2 = 4 partitions with the first element &ge; 4. These partitions
will have indices ranging from 0 to 3. Thus in the partition we seek the first element is 4.
Out of all partitions starting with the element 4 the one we seek has the index 1. (We
subtracted the count of partitions starting with a greater element.)
</ul>
</p>

<p>
Now we are left in a situation where N=4, K=2, index=1 and the last element was 4.
<ul>
<li>C(4,2,4)=0, thus there are no partitions where the next element is 4.
<li>C(4,2,3)=1, thus there is one partition where the next element is 3, this is not enough.
<li>C(4.2.2)=1, and we are (almost) done. The resulting partition is 8=4+2+2.
</ul>
</p>

<p>
The remaining question is how to compute the values C(N,K,L). The idea behind the answer
will be remarkably similar to the ideas used above. Look at any partition of N into K elements such
that the first element is L. If we remove the first element, we get a partition of N-L into 
K-1 elements such that the first element is at most L. This gives the general recurrence 
equation:
</p>

<p>
C(N,K,L) = C(N-L,K-1,1) + C(N-L,K-1,2) + ... + C(N-L,K-1,L)
</p>

<p>
We may use dynamic programming or memoization to compute all the values C(N,K,L). Afterwards,
we determine the elements of the sought partition one by one. C++ code follows.
</p>

<pre>
  int C[160][160][160];

  string kthElement(int sum, int count, int index) {
    memset(C,0,sizeof(C));
    
    // fill in the table, first the base case...
    for (int i=1; i&lt;=sum; i++) C[i][1][i]=1;
    // ... then the general case
    for (int c=2; c&lt;=count; c++)
      for (int s=c; s&lt;=sum; s++)
        for (int l=1; l&lt;=s-c+1; l++)
          for (int k=1; k&lt;=l; k++)
            C[s][c][l] += C[s-l][c-1][k];

    // count all partitions of sum into count parts
    int all = 0;
    for (int i=1; i&lt;=sum; i++) all += C[sum][count][i];

    // if there are not enough of them, return an empty string
    if (all &lt;= index) return "";

    stringstream sres;
    sres &lt;&lt; sum &lt;&lt; "=";

    int remains = sum, last = sum;
    for (int i=0; i&lt;count; i++) {
      // determine the i-th element of the partition:
      // start with the value of the previous element,
      // decrease it until you find enough partitions

      int element = last+1, seen = 0;
      while (seen &lt;= index) { element--; seen += C[remains][count-i][element]; }

      // output the new element and update the current state
      sres &lt;&lt; (i?"+":"") &lt;&lt; element;
      index -= (seen - C[remains][count-i][element]);
      remains -= element;
      last = element;
    }

    return sres.str();
  }

</pre>

<p>
Exercise. The time complexity of this solution is Theta(sum^3 * count). Find a way to improve it
to Theta(sum^2 * count).
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5973&amp;rd=9808" name="5973">MooresLaw</a></b> 
</font> 
<A href="Javascript:openProblemRating(5973)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505853" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      247 / 381 (64.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      116 / 247 (46.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Revenger</b> for 434.94 points (5 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      318.15 (for 116 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There were essentially two different ways of solving this problem. In both of them, we will start
by formalizing the problem statement. Suppose that we have a task that would take Y years to
complete on a computer bought today. Let <code>f(t)</code> be the computation time on a computer bought after 
t years. We were told that f(t) is an exponential function such that <code>f(0)=Y</code> and
<code>f(1.5)=Y/2</code>. 
Thus clearly <code>f(t) = Y / 2^(-t/1.5)</code>.
</p>

<p>
Our goal is to find a non-negative waiting time w such that the total time of the waiting and
the computation is minimal. This time can be computed as <code>w + f(w)</code>.

</p>

<h4>The calculus approach</h4>

<p>
We want to find the minimum of the function <code>g(t) = t + Y / 2^(-t/1.5)</code>. 
In general, the minimum occurs in a point where the derivative of this function is zero.
We have <code>g'(t) = 1 + Y / 2^(-t/1.5) * (-log 2) / 1.5</code>, where <code>log</code>
is the natural logarithm. Solving for <code>g'(t) = 0</code> gives a unique solution

<code>t = (-1.5) * log_2 ( 1.5 / (Y*log 2) )</code> and we are almost done.
</p>

<p>
Why almost? First, we should check that this is really a local minimum. This should be clear
from the nature of the problem, formally it can be done by computing the second derivative
in that point.
</p>

<p>
The second issue is more important. In this problem we are only interested in non-negative
values of t (we can't start the computation sooner than now). 
If the function g reaches its minimum for a negative value of t, the minimal value
for non-negative values of t will clearly be achieved for t=0.
</p>

<p>
(This could be discovered by carefully testing your solution on boundary cases. If you forgot
to check for negative t, for Y=1 you got a result of less than 0.5 years. This is obviously
wrong, as even a computer bought after half a year still needs more than 0.5 years to complete
the task.)
</p>

<h4>The numeric approach</h4>

<p>
We will now describe a method of finding the minimum of a function known under the name <i>ternary
search</i>. First, we will introduce the method in general.
</p>

<p>
Let [a,b] be a closed interval and let f be a function defined on this interval. Moreover, f must
be such that there is a point c in the interval [a,b] such that f is decreasing on [a,c] and 
increasing on [c,b]. We want to find the values c and f(c), i.e., the minimum of f on the given
interval.
</p>

<p>
We will approximate c by repeatedly shrinking the interval in which we search. Each iteration
looks as follows:
</p>

<ol>
<li>Compute the values x=(2*a+b)/3 and y=(a+2*b)/3. (Note that the values x and y split the interval
[a,b] into three equal parts, hence the name ternary search.)
<li>Compute f(x) and f(y).
<li>If f(x) &gt; f(y), the new interval will be [x,b]. Otherwise, the new interval is [a,y].
</ol>

<p>
Why does this method converge on the value we seek? Note that in the third step we drop one third
of the search interval. We have to prove that it doesn't contain the point where f is minimal. 
For the first case: suppose that c&lt;x. But this means that on the whole [x,y] f has to be
increasing, and thus we must have f(x)&lt;f(y). As this is not the case, we know that c&ge;x,
and thus we may really drop the interval [a,x) from our search.
</p>

<p>(If you are not sure whether you understand it correctly, try drawing a picture of the situation,
and/or read <a href="http://forums.topcoder.com/?module=Thread&threadID=506787&mc=21">this
thread</a> with a more detailed explanation.)</p>

<p>
Note that if originally b-a=L, then after N iterations we have a search interval of the length
L*(2/3)^N. Already for N=60 this is approximately 3*L*10^(-11).
</p>

<p>
In our current problem, we want to find the minimum of the function g (defined above) on the
interval [0,infinity). Clearly it is enough to search in the interval [0,Y], as we know that
waiting for more than Y years won't give us an optimal solution. And we can easily verify (or guess)
that the function g satisfies the conditions for ternary search to apply. To find the solution
we simply iterate the search until we have a result that's precise enough:
</p>

<pre>
  double speed(double delay) { 
    return Math.pow(2.0,delay / 1.5); 
  }
  
  double necessaryTime(double taskLength, double delay) { 
    return delay + taskLength / speed(delay); 
  }

  public double shortestComputationTime(int years) {
    double taskLength = years;
    double mn = 0, mx = taskLength;
    for(int i=0; i&lt;1000; i++) {
      double t1 = mn*2/3 + mx/3;
      double t2 = mn/3 + mx*2/3;
      if (necessaryTime(taskLength,t1) &lt; necessaryTime(taskLength,t2)) mx=t2; else mn=t1;
    }

    return necessaryTime(taskLength,mn);
  }

</pre>

<h4>The Eryx approach</h4>

<p>
Guess the form of the function g and use the values from the problem statement to find the constants
such that g interpolates them. See <a href="/stat?c=problem_solution&rm=247537&rd=9808&pm=5973&cr=8355516">Eryx's solution</a>.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6005&amp;rd=9808" name="6005">CoinGame</a></b> 
</font> 
<A href="Javascript:openProblemRating(6005)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505853" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      27 / 381 (7.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 27 (44.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>monsoon</b> for 940.23 points (7 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      633.95 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Also this problem admitted several different approaches to solving it. We will present some of them.
We will concentrate on the main problem: given two sequences, determine the probability that the first
one will occur earlier than the second one. The rest of the problem is easy.
</p>

<p>
Clearly we can't afford to repeatedly throw coins and wait for HHTHTHTTTH to appear, we have to
think of something more clever.
</p>

<p>
Observation 1. Let L be the length of the given sequences. Suppose that we have a game in progress
and that at least L throws were already made. Then the probability that the first player will win
depends only on the outcome of the last L-1 throws.
</p>

<p>
This observation leads to the conclusion that any allowed game can be in one of roughly 500 different
states. This number is still quite large, we have to think of something better. We will start with
an example.
</p>

<p>
Observation 2. Suppose that the first player waits for HHTHTHH, and the second one waits for HHHTHHH.
Let p be the probability
that the first player wins given that the last six throws were TTTTTH. Let q be the probability
that the first player wins given that the last six throws were HTTTTH. Then p=q. This is because
in the current situation the first throw is useless, no player may use it in his sequence.
</p>

<p>
How to formalize the above observation? Let P be the set containing all prefixes of the two input strings.
Then the state of the game is uniquely determined by the longest element of P that is the suffix of the
sequence of previous throws. In other words, the state of the game tells us which player may use more 
previous throws, and how many of them. 
</p>

<p>
(For the example in Observation 2, the state of the game corresponds to the string H &ndash; no player
can use earlier throws to form his sequence. If the last six throws were TTHHHT, the state would be
HHHT.)
</p>

<p>
We only have roughly 20 states in the game. Let's look at what happens to the state of the game when 
we throw a next coin.
</p>

<p>
For any string S let crop(S) be the longest suffix of S that is in P. Thus if S contains enough previous 
throws, crop(S) is the corresponding state. If we are in the state Z (that doesn't correspond to either
player winning the game), after the next throw we will move either to crop(Z+'H'), or to crop(Z+'T').
</p>

<p>
Using this information we may find the probability that player 1 wins as follows:
</p>

<p>
We will simulate the game and for each state keep the probability that after the current number of throws
we are in this state. We can easily build a |P| times |P| matrix A such that multiplying the vector
of probabilities by A corresponds to one step of our simulation. But then 2^200 steps of the simulation
correspond to multiplying by B=A^(2^200). The matrix B can be computed using 200 matrix multiplications
using repeated squaring. And 2^200 coin throws is quite a lot.
</p>

<h4>Gaussian elimination</h4>

<p>

The above approach alone probably wasn't fast enough to solve the largest inputs, however, with some time
spent on optimizing your solution it could be made fast enough to (barely) pass the system tests.
</p>

<p>
However, if you see a simulation like this one, you should always ask: Can I compute the exact solution
the simulation converges to? Usually, the answer is positive. 
</p>

<p>
For each state (i.e., for each prefix Q in P) let prob(Q) be the probability that from the state Q the
first player will win the game. We want to know the value prob(""), and we can get it by computing all the
values prob(Q) at the same time. 
</p>

<p>
For each state we can write one linear equation that describes what happens when we throw a coin in this
state. As an example, consider the situation from Observation 2, the players wait for HHTHTHH and
HHHTHHH, respectively. For the state HHH we get the equation: prob("HHH") = 0.5*prob("HHH") + 0.5*prob("HHHT").
For the state H we get: prob("H") = 0.5*prob("HH") + 0.5*prob(""). For the state HHTHTH we get:
prob("HHTHTH") = 0.5 + 0.5*prob(""). 
</p>

<p>
In this way we construct a set of |P| linear equations with |P| variables. These equations have an unique
solution that can be found using <a href="http://mathworld.wolfram.com/GaussianElimination.html">Gaussian
elimination</a>. A (somewhat numerically stable) piece of code follows.

</p>

<pre>
  // initialize the matrix with C = |P| rows
  double A[][] = new double[C][C+1]; 
  for (int i=0; i&lt;C; i++) for (int j=0; j&lt;=C; j++) A[i][j] = 0.0;

  // fill in the equations
  for (int i=0; i&lt;C; i++) {
    if (P[i].equals( firstString )) { A[p][p]=1.0; A[p][C]=1.0; continue; }
    if (P[i].equals( secondString )) { A[p][p]=1.0; A[p][C]=0.0; continue; }

    String T1 = crop( P[i]+'H' ), T2 = crop( P[i]+'T' );
    int x1 = getIndex( P, T1 ), x2 = getIndex( P, T2 );

    A[p][p] += 1.0; A[p][x1] -= 0.5; A[p][x2] -= 0.5;
  }

  // create a triangular matrix
  for (int col=0; col&lt;C; col++) {
    double max=1e-12; int kde=-1;

    // select a row where the element has the largest magnitude
    // note that for the first row, the first column will be selected
    for (int row=col; row&lt;C; row++) {
      if (A[row][col] &gt; max) { max=A[row][col]; kde=row; }
      if (-A[row][col] &gt; max) { max=-A[row][col]; kde=row; }
    }
    // won't happen here, we have a regular set of equations
    if (kde==-1) return -47; 

    // swap the selected row into its proper place
    if (kde&gt;col) for (int c2=col; c2&lt;=C; c2++) { 
      double x=A[col][c2]; A[col][c2]=A[kde][c2]; A[kde][c2]=x; 
    }
    if (A[col][col]&lt;0) for (int c2=col; c2&lt;=C; c2++) A[col][c2]=-A[col][c2];

    // subtract a suitable multiple of our row from the other ones
    for (int row=col+1; row&lt;C; row++) {
      double mul = A[row][col] / A[col][col];
      for (int c2=col; c2&lt;=C; c2++) A[row][c2] -= mul * A[col][c2];
    }
  }

  // substitute the values
  for (int col=C-1; col&gt;=0; col--) {
    A[col][C] /= A[col][col];
    for (int row=0; row&lt;col; row++) A[row][C] -= A[row][col] * A[col][C];
  }

</pre>

<h4>Even more maths</h4>

<p>
The game is known under the name "Penney ante", and it is described e.g. in 
chapter 8.4 of the book Concrete Mathematics by Graham, Knuth and Patashnik.
The probability that the first player wins can be computed in an even more
simple way, by simply examining the patterns.
Look at <a href="/stat?c=problem_solution&rm=247528&rd=9808&pm=6005&cr=7502813">monsoon's
solution</a> for a clean implementation of this solution.
</p><div class="authorPhoto">
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
     <jsp:param name="level1" value="privatelabel"/>
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
