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
    <A href="/stat?c=round_overview&er=5&rd=10738">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514948" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Algorithm Round 1A</span><br>Saturday, April 7, 2007
<br><br>


<h2>Match summary</h2> 


As everyone involved knew for a few days, this round was supposed to be the toughest of the 
Round 1 groups. With roughly the same number of reds as the other two groups combined,
and with a rating of 1617 necessary to be expected to qualify, this surely was a tough crowd.
One mistake could mean elimination, one challenge case could make the difference between
advancing and dropping out of the tournament.
<br /><br /> 

With 79 contestants solving the hard problem the expectations were fulfilled, if not exceeded.
The round was tough and everyone tried their best. 
<tc-webtag:handle coderId="19849563" context="algorithm"/> was leading the pack into the Challenge
phase, but in the end he only placed second &ndash; all thanks to 
<tc-webtag:handle coderId="10574855" context="algorithm"/>'s five successful challenges.
The third place went to <tc-webtag:handle coderId="7421158" context="algorithm"/>.
<br /><br />

While the top of the field was full of the usual suspects, the rest of the division summary
wasn't all red and yellow. Many lower-rated coders were able to gain more than enough
points to beat the odds and advance to the next round. Congratulation to all the advancers,
and see you all in Round 2!
<br /><br />
 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7571&amp;rd=10738" name="7571">Turnpike</a></b> 

</font> 

<A href="Javascript:openProblemRating(7571)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514948" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      524 / 634 (82.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      329 / 524 (62.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>yava</b> for 247.66 points (2 mins 46 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      182.55 (for 329 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


This problem offered a wide variety of correct approaches, so everyone could choose 
the approach he or she is most comfortable with. We'll mention a few of these approaches.


<h4>Binary search for the answer</h4>


This is an optimization problem &ndash; the question we have to answer is of the form
&quot;find the smallest X such that a condition holds.&quot;<br />
<br />

Moreover, the problem has got the property that if the condition holds for some X, 
it will also hold for all values greater than X.
<br /><br />

Each time you find yourself in a similar situation, there is one natural question
you should ask: &quot;Given a fixed value X, can I find an efficient way to <em>verify</em>
whether the condition holds for my X?&quot;
<br />
<br />

Whenever the answer is positive, there is an efficient solution of the original task:
Use binary search on the set of possible answers to find the smallest answer such that the
condition holds.
<br /><br />

In our case, we know that the answer is greater than 0, and it is at most equal to
<b>pikeLength</b>. All that remains is finding an efficient way of checking whether there is
a solution that has all gaps smaller or equal to a given X.
<br /><br />

This is really simple. Imagine that we drive along the turnpike. Each time the current gap reaches
X, we place a new plaza. In this way we will ensure that no gap exceeds X, and we will use the
minimum number of new plazas. When we get to the end of the turnpike, we simply check whether
the number of new plazas exceeds the given limit <b>n</b> or not. 
<br /><br />

C++ code of this solution follows:

<pre>
class Turnpike {
public:
  bool check(int pikeLength, int n, const vector&lt;int&gt; &amp;plazas, int X) {
    int used = 0;
    for (int i=1; i&lt;int(plazas.size()); i++) {
      int thisGap = plazas[i]-plazas[i-1];
      while (thisGap &gt; X) {
        used++;
        thisGap -= X;
      }
    }
    return (used &lt;= n);
  }

  int unserviced(int pikeLength, int n, vector &lt;int&gt; plazas) {
    plazas.push_back(0); plazas.push_back(pikeLength);
    sort(plazas.begin(),plazas.end());
    int lo=0, hi=pikeLength;
    while (hi-lo &gt; 1) {
      int med = (lo+hi)/2;
      if (check(pikeLength,n,plazas,med)) hi=med; else lo=med;
    }
    return hi;
  }
};
</pre>

<h4>Linear search for the answer</h4>


In this case the set of possible answers was small. If someone was not comfortable with binary
search, there was an easy way out: just try all the answers!
<br /><br />

Binary search is nasty, and many less experienced coders fell into the trap of mishandling some
boundary cases, and so this approach is smarter than it may seem at a first glance.
Actually, the code below never took more than 1ms when I tested it in the practice room, 
so there was plenty of room for an even slower solution.
<br />
<br />

C++ code follows:

<pre>
class Turnpike {
public:
  bool check(int pikeLength, int n, const vector&lt;int&gt; &amp;plazas, int X) {
    int used = 0;
    for (int i=1; i&lt;int(plazas.size()); i++) {
      int thisGap = plazas[i]-plazas[i-1];
      while (thisGap &gt; X) {
        used++;
        thisGap -= X;
      }
    }
    return (used &lt;= n);
  }

  int unserviced(int pikeLength, int n, vector &lt;int&gt; plazas) {
    plazas.push_back(0); plazas.push_back(pikeLength);
    sort(plazas.begin(),plazas.end());
    for (int i=1; i&lt;=pikeLength; i++)
      if (check(pikeLength,n,plazas,i))
        return i;
  }
};
</pre>

<h4>Playing it safe with dynamic programming</h4>


Using dynamic programming, we can try all possible plaza placements, and be sure to pick
the optimal one. 
<br />
<br />

All the subproblems we will be solving look as follows: given a segment of the turnpike
and a maximum number of new plazas, what's the smallest possible maximal gap we can obtain?
<br /><br />

When solving such a subproblem, consider the last plaza before the end of the current
segment. This is either the last of the original plazas that lie inside the segment, or
we placed a new plaza somewhere between that original plaza and the end of the segment.
In each case, we know the length of the last gap, and for the rest of the segment 
we get a new, smaller subproblem of the same type.
<br /><br />

C++ code using memoization:

<pre>
int isPlaza[1024];
int memo[1024][108];

int solve(int L, int N) {
  // find the best solution for the segment 0..L
  // with at most N new plazas

  int &amp;res = memo[L][N];
  if (res &gt;= 0) return res;
  res = 987654321;
  if (L==0) return res=0;
  for (int prev=L-1; prev&gt;=0; prev--) {
    if (isPlaza[prev]) {
      res = min(res,max(L-prev,solve(prev,N)));
    } else {
      if (N&gt;0) {
        res = min(res,max(L-prev,solve(prev,N-1)));
      }
    }
    if (isPlaza[prev]) break;
  }
  return res;
}

class Turnpike {
public:
  int unserviced(int pikeLength, int n, vector &lt;int&gt; plazas) {
    plazas.push_back(0);
    plazas.push_back(pikeLength);
    sort(plazas.begin(),plazas.end());
    for (int i=0; i&lt;int(plazas.size()); i++) isPlaza[plazas[i]]=1;
    memset(memo,-1,sizeof(memo));
    return solve(pikeLength,n);
  }
};
</pre>

<h4>A greedy solution</h4>

One greedy solution can be based on the following observation: Once we know how many
plazas are placed into each of the original gaps, we can easily find an optimal placement
for them: in each gap they have to be spaced as evenly as possible. The resulting new gap
will be equal to <i>ceiling(original_gap / new_plazas + 1)</i>.
<br /><br />

We will now sequentially assign each of the new plazas to one of the original gaps.
The process will be simple: in each step, determine the original gap where the current
gap is largest. This is the value we need to decrease, and so we assign one more new
plaza to this original gap.
<br /><br />

With greedy solutions, a proof should always be a part of the solution. Often it is
really easy to find an incorrect greedy solution, and often you only discover this
after the system tests. 
<br /><br />

Glossary of terms in the proof:<br/>
Original gap: a gap between two consequent plazas given in the input (including 0 and <b>pikeLength</b>).<br/>
Current gap: the length of the (longest) gap after we placed some new plazas into an original gap.<br/>
Solution value: the length of the longest current gap.
<br /><br />

So let's now prove that our solution finds an optimal assignment of the plazas. 
We will do this by induction. For one new plaza this is clearly true. Now for the
induction step assume that our solution finds an optimal solution A for K new plazas.
How will the situation change if we have K+1 plazas to distribute?
<br /><br />

Consider some optimal solution B for K+1 new plazas. Let G be the set of gaps that have
less new plazas assigned than in solution A. If G is empty, we won.
If not, for each gap in G we can make the following observation:
<br /><br />

Consider the moment just before this gap got its last plaza in solution A.
At this moment, this original gap was having the longest current gap.
Let the length of that current gap be L. The value of solution A is at most L,
because before adding some plazas it was L. The value of solution B is at least L,
as for this original gap the current gap in B is at least L.
<br /><br />

This is only possible if the value of both solutions is exactly L. 
<br /><br />

Summary: Either G was empty, and our algorithm works, or G was non-empty.
In the second case we deduced that the optimal solution for K+1 plazas has
the same value as the optimal solution for K plazas. And clearly our
algorithm will produce a solution with this value &ndash; we take an
optimal solution with K plazas and add one new plaza somewhere. 
Thus our algorithm always finds an optimal solution.
<br /><br />


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7260&amp;rd=10738" name="7260">TableLabel</a></b> 

</font> 

<A href="Javascript:openProblemRating(7260)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514948" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      385 / 634 (60.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      168 / 385 (43.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Per</b> for 453.37 points (9 mins 18 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      293.69 (for 168 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The key observation for this problem: suppose someone told us how to split the element at [0][0] into its row
and column labels. At this moment either all row labels and column labels are uniquely determined,
or we discover that our &quot;someone&quot; lied and that this split doesn't lead to a solution.
<br /><br />

Why is that so? Consider only the first row of the table. We already know the row label for this row. 
This means that we can check whether all elements of this row start with our row label, and deduce
all column labels.
<br /><br />

The same can be done with the first column to deduce all row labels.
<br /><br />

Once we deduced all row and column labels, we may traverse the entire table and check whether all
the elements match. If yes, we found a solution.
<br /><br />

The last step is simple: There are only a few ways how to split the element at [0][0]. Try them all
and see how many of the ways lead to a valid solution. 
<br /><br />

C++ code follows:

<pre>
class TableLabel {
public:
  bool isPrefix(const string &amp;A, const string &amp;B) {
    if (A.size() &gt; B.size()) return false;
    string C( B.begin(), B.begin()+A.size() );
    return A==C;
  }

  bool isSuffix(string A, string B) {
    reverse(A.begin(),A.end());
    reverse(B.begin(),B.end());
    return isPrefix(A,B);
  }

  vector &lt;string&gt; labels(vector &lt;string&gt; input) {

    // process the input
    vector&lt; vector&lt;string&gt; &gt; table;
    int R = input.size();
    for (int r=0; r&lt;R; r++) {
      stringstream ss(input[r]);
      vector&lt;string&gt; row;
      string token;
      while (ss &gt;&gt; token) row.push_back( token );
      table.push_back( row );
    }
    int C = table[0].size();

    // table[][] now contains the table

    vector &lt;string&gt; res;

    for (int split=1; split &lt;= int(table[0][0].size())-1; split++) {
      // compute the values for [0][0]
      string row0 ( table[0][0].begin(), table[0][0].begin()+split );
      string col0 ( table[0][0].begin()+split, table[0][0].end() );

      // check and process row 0 and col 0
      vector&lt;string&gt; colLabels, rowLabels;
      bool allOK = true;
      for (int r=0; r&lt;R; r++) {
        if (table[r][0].size() &lt; col0.size()+1) { allOK = false; break; }
        if (!isSuffix(col0,table[r][0])) { allOK = false; break; }
        rowLabels.push_back( string( table[r][0].begin(), table[r][0].end() - col0.size() ) );
      }
      if (!allOK) continue;
      for (int c=0; c&lt;C; c++) {
        if (table[0][c].size() &lt; row0.size()+1) { allOK = false; break; }
        if (!isPrefix(row0,table[0][c])) { allOK = false; break; }
        colLabels.push_back( string( table[0][c].begin() + row0.size(), table[0][c].end() ) );
      }
      if (!allOK) continue;

      // check the entire table
      for (int r=0; r&lt;R; r++)
        for (int c=0; c&lt;C; c++)
          if (table[r][c] != rowLabels[r]+colLabels[c]) allOK = false;
      if (!allOK) continue;

      // record the solution
      if (res.empty()) {
        res.insert(res.end(),colLabels.begin(),colLabels.end());
        res.insert(res.end(),rowLabels.begin(),rowLabels.end());
      } else {
        res.clear(); res.push_back(&quot;multiple&quot;); return res;
      }
    }
    if (res.empty()) res.push_back(&quot;none&quot;);
    return res;
  }
};
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7316&amp;rd=10738" name="7316">Destruction</a></b> 

</font> 

<A href="Javascript:openProblemRating(7316)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514948" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      95 / 634 (14.98%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      79 / 95 (83.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 931.56 points (7 mins 48 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      648.24 (for 79 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The first important observation about the problem is that it scales. If the problem statement
contained the number 200.0 instead of 100.0, the solution would be almost exactly the same.
The only change would be that the places of all queries would be multiplied by two, and of
course also the answer would be twice as large.
<br /><br />

From this point on, we will consider a normalized version of the problem: the upper bound
on pressure will be equal to 1.
<br /><br />

Suppose that we want to find an optimal solution for T tests and at most D destructions.
Consider the first query we make. Let the pressure for this query
be X. There are two things that can happen: In the first case, the container breaks, in
the second case it doesn't.
<br /><br />

In the first case, we know that the exact pressure is in the interval [0,X], and we have
T-1 tests and at most D-1 destructions to find it. 
In the second case, the pressure is in the interval [X,1], and we have T-1 tests and
at most D destructions left.
<br /><br />

In both cases we have (almost) the same problem with lower constraints. We can solve each
of these problems recursively, and memoize the solutions. 
<br />
<br />

There are two reasons for the &quot;(almost)&quot; in the previous paragraph. One of them is the need
to scale the results appropriately. The other reason is the need to handle the upper bound
in a special way. Note that there is a difference between the two subproblems presented above.
In the first case we already know that at pressure X the container breaks. In the second case,
we may not know this.
<br /><br />

A conceptually clear way to solve this:
Let best[T][D][U] be the correct answer for the interval [0,1], T tests, at most D destructions
and U is 1 if we know that the container breaks at pressure 1.
Clearly the solution to the original problem is the value 100*best[numTests][numDestroyed][0].
We will compute the values best[T][D][U] using dynamic programming, or equivalently, using memoized
recursion.
<br />
<br />

We already described how to split best[T][D][U] into two subproblems. The first of them will
correspond to best[T-1][D-1][1], the second will correspond to best[T-1][D][U]. For each subproblem
we can compute the answer as a function of X &ndash; the place of the query. 
<br /><br />

We now have to find an optimal value of X. We want to minimize the larger of the two answers for
subproblems. Clearly this happens if they are both equal. This leads to a linear equation for X.
We compute the optimal X, and thus the answer to our original problem.
<br /><br />

C++ code follows:

<pre>
double memo[52][52][2];

double solve(int numTests, int numDestroyed, int knowsUpper) {
  double &amp;res = memo[numTests][numDestroyed][knowsUpper];
  if (res &gt;= 0.0) return res;
  res = 1.0;

  // handle the end of the computation
  if (numDestroyed == 0) return res = 0.5;
  if (numTests == 1 &amp;&amp; !knowsUpper) return res = 0.5;
  if (numTests == 1 &amp;&amp; knowsUpper) return res = 0.25;
  
  // handle the general case: solve two subproblems
  double prec1 = solve(numTests-1,numDestroyed-1,1);
  double prec2 = solve(numTests-1,numDestroyed,knowsUpper);

  // now solve the equation: prec1*x == prec2*(1-x)
  double x = prec2 / (prec1+prec2);
  return res = prec1 * x;
}

class Destruction {
public:
  double minError(int numTests, int numDestroyed) {
    for (int i=0; i&lt;52; i++) 
      for (int j=0; j&lt;52; j++)    
        for (int k=0; i&lt;2; k++)
          memo[i][j][k] = -1.0;
    return 100.0*solve(numTests,numDestroyed,0);
  }
};
</pre>

There is a solution that is simpler to implement. All we have to do is to convince ourselves that 
the optimal solution has the following property: Regardless of the outcomes of the probes, the
answer will always be exactly the same. 
<br /><br />

(The reasoning behind this observation is similar to the reasoning we used to find the optimal X &ndash;
if we were able to achieve a better precision in some cases, we could shift the probes slightly to 
&quot;distribute&quot; this gain and thus decrease all largest possible answers. Alternatively, we already have a proof of this observation: our DP solution above computes an
optimal solution, and it has this property.)
<br /><br />

One fixed experiment result can be described as a string of 'Y's and 'N's, where the i-th character
corresponds to the outcome of our i-th probe &ndash; 'Y' means that the container broke, 'N' that 
it didn't.
For each such string S we can determine an interval I<sub>S</sub> = [lo<sub>S</sub>,hi<sub>S</sub>]
such that the exact answer lies within I<sub>S</sub>.
Clearly the precision of the result after an experiment corresponding to S 
is the length of I<sub>S</sub> divided by 2.
<br /><br />

Suppose we use an optimal approach. Write down all strings that correspond to possible experiments,
and are maximal (i.e., no more tests are possible in the situation they describe).
If we now take a look at their corresponding intervals, the optimality of our approach 
enforces two properties:<br/>
&ndash; each two intervals are disjoint (except maybe for their endpoints)<br/>
&ndash; all the intervals have the same length, and the answer is a half of this length
<br /><br />

Now we can compute the answer without knowing the optimal solution. All we have to do is to 
count the valid strings, the answer we seek is 50.0 divided by their count. 
<br /><br />

To count the maximal strings, we will use one simple trick. Some of the strings have length 
equal to <b>numTests</b>, but some are shorter. Those correspond to situations when we ran 
out of containers to break. Now we can take each such string and append 'N's until its length
reaches <b>numTests</b>.
<br /><br />

Clearly this is a bijection. Note that if you have the modified string, you can
reconstruct the original string in the following way: Count the 'Y's. If their count is less
than <b>numDestroyed</b>, this is the original string. If it is equal, the original string
ends with the last 'Y'. 
<br /><br />

Thus we get the following equation:<br/>
the count of maximal strings = the count of strings of length <b>numTests</b> that contain at most
<b>numDestroyed</b> 'Y's
<br /><br />

One small twist and we are done. The twist is that in our problem the string &quot;NNN...N&quot; is special.
It corresponds to the case &quot;the answer exceeds 100.0&quot;, and thus the corresponding interval has
length zero. 
<br /><br />

Thus the number of interesting strings is &sum;<sub>i=1</sub><sup>numDestroyed</sup>
choose(numTests,i), where choose(N,K) is the binomial coefficient.
<br /><br />




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
            <jsp:include page="/public_right.jsp">
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
