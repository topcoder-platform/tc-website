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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12174">Match Overview</A><br />
    <tc-webtag:forumLink forumID="521286" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 402</span><br />Saturday, May 24, 2008
<br /><br />



<h2>Match summary</h2>

<p>
Being conflicted with IPSC, the first SRM after TCO08 still attracted 1301 coders.
</p>

<p>
In Division 1 competitors faced a rather difficult problem set. Being the only coder who got 1000+ points,
<tc-webtag:handle coderId="10574855" context="algorithm"/> won the first place, 
followed by <tc-webtag:handle coderId="8394868" context="algorithm"/>, the only coder who solved the hard problem except <tc-webtag:handle coderId="10574855" context="algorithm"/>.
The third place went to 
<tc-webtag:handle coderId="9964455" context="algorithm"/>, thanks to his 7 successful challenges on the medium.
</p>

<p>
Division 2 was won by a newcomer 
<tc-webtag:handle coderId="22733480" context="algorithm"/>, with fast submissions on all three problems. He could have still won the match
even without all his 5 successful challenges! He was followed by 
<tc-webtag:handle coderId="22672296" context="algorithm"/>
and
<tc-webtag:handle coderId="22682908" context="algorithm"/>.
</p>
 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8310&amp;rd=12174" name="8310">WordAbbreviation</a></b>

</font>

<A href="Javascript:openProblemRating(8310)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521286" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      583 / 753 (77.42%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      482 / 583 (82.68%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>IlyaPonamarev</b> for 247.69 points (2 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      183.33 (for 482 correct submissions) 

    </td>

  </tr>

</table></blockquote>

<p>

This is a rather straightforward problem, which could be solved by following what the problem statement said.
Here is a complete solution in Java.

</p>

<pre>
int n = words.length;
String[] ans = new String[n];
for(int i = 0; i &lt; n; i++)
  for(int L = 1; L &gt;= words[i].length(); L++) {
    ans[i] = words[i].substring(0, L);
    boolean ok = true;
    for(int j = 0; j &lt; n; j++)
      if(i != j &amp;&amp; words[j].startsWith(ans[i]))
        ok = false;
    if(ok) break;
  }
return ans;
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8302&amp;rd=12174" name="8302">ConsecutiveNumbers</a></b>

</font>

<A href="Javascript:openProblemRating(8302)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521286" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      594 / 753 (78.88%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      146 / 594 (24.58%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>darthvadar</b> for 474.43 points (6 mins 40 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      367.58 (for 146 correct submissions) 

    </td>

  </tr>

</table></blockquote>

<p>
Though the solution behind this problem is rather easy, the problem was unfortunately considered to be ambiguous by many coders.
It would be more clear to say "Your little son was EXPECTED to write...", and to ask for "what are the all possible numbers your son might have erased, if he did everything correctly", and
finally "return an empty int[] if your son DEFINITELY did something wrong".
</p>

<p>
Sort all the integers and check adjacent ones. If the integer appears more than once, your son must have made a mistake, so
return an empty int[]. If the difference between a pair of adjacent integers is larger than 2, your son must have made a mistake, again.
</p>

<p>
Now the difference between two adjacent integers is at most 2. But be careful! There should be
AT MOST one pair with difference equal to 2. So immediately return an empty int[] if you see two.
</p>

<p>
Now, if there is a pair with difference 2, the son certainly have erased the number in the middle of this pair. Otherwise, there are two variants - he could erase
the numbers min-1 or max+1 (where min and max are the minimum and the maximum of input numbers). One more tricky thing is to treat the case of min=1 properly
(son wrote only positive integers and couldn't write 0). Here is a complete solution in Java.
</p>

<pre>
Arrays.sort(a);
for (int i = 0; i &lt; a.length-1; i++)
  if (a[i] == a[i+1] || a[i+1] &gt; a[i] + 2)
    return new int[] {};

int c = 0;
for (int i = 0; i &lt; a.length-1; i++)
  if (a[i+1] == a[i] + 2)
    c++;
if (c &gt; 1) return new int[] {};

for (int i = 0; i &lt; a.length-1; i++)
  if (a[i+1] == a[i] + 2)
    return new int[] {a[i] + 1};

if (a[0] == 1)
  return new int[] {a[a.length-1] + 1};

return new int[] {a[0] - 1, a[a.length-1] + 1};
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8590&amp;rd=12174" name="8590">RandomSort</a></b>

</font>

<A href="Javascript:openProblemRating(8590)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521286" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      142 / 753 (18.86%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      58 / 142 (40.85%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>alopha</b> for 927.49 points (8 mins 4 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      586.53 (for 58 correct submissions) 

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

      438 / 536 (81.72%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      334 / 438 (76.26%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>kia</b> for 247.51 points (2 mins 51 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      191.16 (for 334 correct submissions) 

    </td>

  </tr>

</table></blockquote>

<p>

This problem is quite educative. By directly following the definition of 
<a href="http://en.wikipedia.org/wiki/Expected_value">mathematical expectation</a>,
we could get the following recursive solution:

</p>

<pre>
double doit(int[] p) {
  double ans = 0;
  int tot = 0, t;
  for(int i = 0; i &lt; n; i++)
    for(int j = i+1; j &lt; n; j++)
      if(p[i] &gt; p[j]) {
        t = p[i]; p[i] = p[j]; p[j] = t;
        ans += doit(p);
        tot++;
        t = p[i]; p[i] = p[j]; p[j] = t;
      }
  if(tot == 0)
    ans = 0;
  else
    ans = ans / tot + 1;
  return ans;
}
</pre>

<p>
However, the solution would be too slow due to the fact that the same subproblem would be solved many times.
By memoization, each permutation will be in the parameter at most once in the recursive function, so the function will be called
at most 8!=40320 times.
</p>

<p>
But how to memoize permutations? There are already some  
<a href="http://forums.topcoder.com/?module=Thread&threadID=614511&start=0&mc=16">exellent posts</a> in the forum.

Coders using different languages can refer to <tc-webtag:handle coderId="20286298" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=20286298&rd=12174&pm=8590">C++ code</a>,
<tc-webtag:handle coderId="7452866" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=7452866&rd=12174&pm=8590">Java code</a>,
<tc-webtag:handle coderId="10428762" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=10428762&rd=12174&pm=8590">C# code</a> and
<tc-webtag:handle coderId="15498334" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=15498334&rd=12174&pm=8590">VB.NET code</a>.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8508&amp;rd=12174" name="8508">LargestGap</a></b>

</font>

<A href="Javascript:openProblemRating(8508)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521286" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      318 / 536 (59.33%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      124 / 318 (38.99%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>gawry</b> for 391.18 points (11 mins 22 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      246.88 (for 124 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
<b>Brute Force Solution</b>
</p>

<p>
Though the original problem forced a linear solution, after a discussion with testers, we finally decided to reduce the difficulty of
this problem (partially due to the fact that the 1000-pointer is quite difficult), 
by allowing an O(n<sup>2</sup> * logn) brute force solution. Probably the only trick here is hidden in this sentence:
"Return the smallest 0-based index among all characters in this block (indices are taken in the concatenated string)." That means
the correct answer for {"X..X.X..X"} is 0, instead of 8.
</p>

<p>
The fastest correct
<a href="/stat?c=problem_solution&cr=7390224&rd=12174&pm=8508">submission</a>
by <tc-webtag:handle coderId="7390224" context="algorithm"/> used this approach.
</p>

<p>
<b>Linear Solution</b>
</p>

<p>
As mentioned above, the original intended solution has a linear time complexity. The algorithm is essentially the same as the brute force one,
except that we're doing comparisons more cleverly. First we build a list of blocks and gaps, then check blocks one by one.
Suppose we're comparing resulting boards after removing two blocks <b>i</b> and <b>j</b>. Removing the <b>i</b>-th block merges two gaps of size 
<b>a</b> and <b>b</b>, removing the <b>j</b>-th block merges two gaps of size <b>c</b> and <b>d</b>, it's enough to compare <b>a+b</b> and <b>c+d</b>,
then <b>max(a,b)</b> and <b>max(c,d)</b>, and finally <b>min(a,b)</b> and <b>min(c,d)</b>.
</p>

<p>
For a clear implementation of this algorithm, see
<tc-webtag:handle coderId="11919691" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=297281&rd=12174&pm=8508&cr=11919691">code</a>.
You may also want to read his own
<a href="http://forums.topcoder.com/?module=Thread&threadID=614502&start=0&mc=9">post</a> on this problem.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8504&amp;rd=12174" name="8504">IncreasingSequence</a></b>

</font>

<A href="Javascript:openProblemRating(8504)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521286" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      38 / 536 (7.09%) 

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      2 / 38 (5.26%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>rem</b> for 470.71 points (29 mins 52 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      409.36 (for 2 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This is a tough 1000-pointer. Only top 2 coders of this SRM correctly solved this problem (what's more, both of them resubmitted their solution once).
</p>

<p>
<b>Minimizing the Last Number</b>
</p>

<p>Let <b>num(st,ed)</b> be the number formed by digits <b>st</b> to <b>ed</b>.
Suppose we're processing from left to right. Once we get a number <b>num(j,i)</b> by cutting the string after the <b>i</b>-th digit,
we have to make sure that <b>j</b> is as large as possible (recall that the next number must be larger than <b>num(j,i)</b>. 
The smaller <b>num(j,i)</b>, the more chance we have). 
This is a hint for dynamic programming:
let <b>f[i]</b> be the maximal possible <b>j</b> among all partitions of the first <b>i</b> digits, ending
with <b>num(j,i)</b>, then <b>f[i]</b> can be computed simply by enumerating every possible <b>j</b> and 
choose the maximal <b>j</b> that satisfies <b>num(f[j-1],j-1)</b> &lt; <b>num(j,i)</b>.
The following Java code computes the <b>f</b> array:

<pre>
int[] f = new int[n];
Arrays.fill(f, 0);
for(int i = 1; i &lt; n; i++)
  for(int j = 1; j &gt;= i; j++)
    if(less(f[j-1],j-1,j,i)) f[i] = j;
</pre>

<p>
From the definition above, the last number equals to <b>num(f[n-1], n-1)</b> 
(it may have leading zeros as well, so we can only say its value equals to <b>num(f[n-1], n-1)</b>). 
The code calls the function "less" O(n<sup>2</sup>) times,
so if we can manage to write an O(1) implementation of it, we can find the last number in quadratic time.
</p>

<p>
<b>Doing comparisons faster</b>
</p>

<p>
In the dynamic programming code above, we need a function "less" that takes four parameters 
<b>a</b>, <b>b</b>, <b>c</b> and <b>d</b> and returns true iff <b>num(a,b)</b> &lt; <b>num(c,d)</b>.
Here is a typical implementation in Java:
</p>

<pre>
boolean less(int a, int b, int c, int d) {
  a = Math.min(nz[a], b);
  c = Math.min(nz[c], d);
  int n1 = b - a + 1;
  int n2 = d - c + 1;
  if(n1 != n2) return n1 &lt; n2;
  int L = lcp[a][c];
  if(L &gt;= n1) return false;
  return s.charAt(a+L) &lt; s.charAt(c+L);
}
</pre>

<p>
We first skip leading zeros by moving <b>a</b> and <b>c</b> to their next non-zero positions (stored in <b>nz[a]</b> and <b>nz[c]</b>),
then calculate the number of digits of <b>num(a,b)</b> and <b>num(c,d)</b>. Without leading zeros, 
the number with strictly more digits is larger. When they have the same number of digits, don't compare digits from <b>a</b> and <b>c</b> one by one!
This increases the overall time complexity. Though in most cases the comparison could be finished quickly (when a mismatch found), there are
extreme cases to make it fail, as we can see in the match statistics.
</p>

<p>
A safer way to do this is already shown above. Precompute <b>lcp[a][c]</b>, the length of longest common prefix of two suffixes of the orignal string,
starting from <b>a</b> and <b>c</b>. This could be done in O(n<sup>2</sup>) time and space, where <b>n</b> is the number of digits in the input string.
Here is the Java code computing the <b>nz</b> array and <b>lcp</b> table:
</P>

<pre>
// the position of next zero, from each position
nz = new int[n];
nz[n-1] = n-1;
for(int i = n-2; i &gt;= 0; i--)
  nz[i] = (s.charAt(i) == '0' ? nz[i+1] : i);

// longest common prefix
lcp = new int[n+1][n+1];
for(int i = n-1; i &gt;= 0; i--)
  for(int j = n-1; j &gt;= 0; j--)
    lcp[i][j] = (s.charAt(i) == s.charAt(j) ? lcp[i+1][j+1]+1 : 0);
</pre>

<p>
<b>Other numbers</b>
</p>

<p>
Other numbers could be determined similarly. Let <b>g[i]</b> be the largest possible <b>j</b> so that it's possible
to partition digits <b>i</b> to <b>n-1</b>, beginning with <b>num(i,j)</b>, ending with a number
with value equal to <b>num(f[n-1], n-1)</b>. The code is rather similar:
</p>

<pre>
int[] g = new int[n];
Arrays.fill(g, -1);
for(int i = n-1; i &gt;= 0; i--) {
  if(nz[i] == nz[f[n-1]]) g[i] = n-1;
  else for(int j = i; j &lt; n-1; j++)
    if(g[j+1] &gt;= 0 &amp;&amp; less(i,j,j+1,g[j+1])) g[i] = j;
}
</pre>

<p>
With array <b>g</b>, we can easily get every number and thus the result:
</p>

<pre>
long ans = 1;
for(int i = 0; i &lt; n; i = g[i]+1) {
  System.out.println(s.substring(i, g[i]+1));
  long term = 0;
  for(int j = i; j &gt;= g[i]; j++)
    term = (term * 10 + s.charAt(j) - '0') % MOD;
  ans = ans * term % MOD;
}
</pre>

The overal time complexity is O(n<sup>2</sup>) which is fast enough when <b>n</b> &gt;= 2500.

<p>
<b>A Linear Solution</b>
</p>

<p>
To many coders' surprise, there exists a linear solution for this problem. The implementation is considerably longer than
the quadratic solution shown above, so I'm only giving the algorithm sketch.
</p>

<p>
The main idea is the same. We first see how to compute <b>f[i]</b> faster, in linear time.
Instead of "for every <b>i</b>, compute <b>f[i]</b>", we try another approach - 
"for every <b>j</b>, use <b>f[j]</b> to update
other elements it influences."
</p>

<p>
Suppose we're processing <b>f[j]=k</b>, 
then we can update <b>f[j+1]=max(f[j+1],k)</b> (rule 1), since we can always extend the last number one more digit.
What's more, for <b>i</b> satisfying <b>num(k,j)</b> &lt; <b>num(j+1,i)</b>, we can update
<b>f[i] = max(f[i], j+1)</b> (rule 2). There may be a lot of <b>i</b> satisfying this equality, but it's enough to
update the smallest <b>i</b>. Why? Once we update the smallest, larger ones will be automatically updated
LATER, by rule 1. We don't have to update them NOW.
</p>

<p>
Here comes the crucial part: given <b>k</b> and <b>j</b>,
how to find the smallest <b>i</b> so that <b>num(k,j)</b> &lt; <b>num(j+1,i)</b>? 
It's not hard to see,
we can find the smallest <b>i</b> in O(1) time, 
once we have <b>lcp[k][j+1]</b> mentioned above.
But wait! Precomputing <b>lcp</b> tables takes quadratic time and space, which now becomes the bottleneck.
</p>

<p>
Here is a technical solution: construct a 
<a href="http://en.wikipedia.org/wiki/Suffix_tree">suffix tree</a>(or 
<a href="http://en.wikipedia.org/wiki/Suffix_array">suffix array</a>) with
additional information, then
we can compute <b>lcp</b> values in O(1) time at runtime,
with the help of 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=lowestCommonAncestor">
RMQ and LCA</a>. 
Both suffix trees and suffix arrays could be constructed
in linear time (in this problem the alphabet is small), 
so we're able to compute the whole <b>f</b> array in linear time. The same technical applies to <b>g</b> too,
so the overal time complexity is linear.
</p>
<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11907556" context="algorithm"/><br />
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
