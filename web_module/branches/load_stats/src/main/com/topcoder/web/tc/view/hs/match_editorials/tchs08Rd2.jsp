<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=11151&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="519104" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS08 Online Round 2</span><br />Saturday, January 19, 2008
<br /><br />


<h2>Match summary</h2> 

<p>
The online round 2 of TCHS tournament 2008 was a bit more exciting than round 1, because non-zero score was not enough
to advance this time. It turned out that even two solved problems did not guarantee advancement. So the coders needed
to show their best to either have two fast problems, or have some challenges, or solve the hard. Fortunately, the
problems were not very difficult with more than 50 coders solving all three problems correctly.

</p>

<p>
After the challenge phase <tc-webtag:handle coderId="22663117" context="hs_algorithm"/> took the lead, thanks to
solid time on all three problems, and +150 on challenges. <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>
had a better score on each problem, but was not so successful during the challenge phase, so he came in second.
And <tc-webtag:handle coderId="14768757" context="hs_algorithm"/> who already has an amazing 2800+ rating in 
Algorithm competition finally turned yellow in High School, coming third despite his 1000 resubmit, thanks to two 
successful challenges.
</p>
 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8554&amp;rd=11151" name="8554">QueryFilter</a></b>

</font>

<A href="Javascript:openProblemRating(8554)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      168 / 178 (94.38%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      144 / 168 (85.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Zuza</b> for 249.50 points (1 mins 17 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      229.43 (for 144 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Basically all we need for this problem is standard data structures. Most modern languages,
including those available at TopCoder, have powerful libraries that can do most of
the work.
</p>

<p>
The code in Java follows. It uses <tt>TreeSet</tt> to keep words that appear in query.
It both removes duplicates, because it is <tt>Set</tt>, and sorts the words alphabetically,
because it is <tt>OrderedSet</tt>. To quickly look up whether the word is common, it
is convenient to store all words in another <tt>Set</tt>.
</p>

<pre>
    public String[] preprocess(String query, String[] common) {
        StringTokenizer st = new StringTokenizer(query);
        Set&lt;String&gt; words = new TreeSet&lt;String&gt;();
        Set&lt;String&gt; commonWords = new HashSet&lt;String&gt;();
        commonWords.addAll(Arrays.asList(common));
        while (st.hasMoreTokens()) {
            String s = st.nextToken();
            if (!commonWords.contains(s)) {
                words.add(s);
            }
        }
        return words.toArray(new String[words.size()]);
    }
</pre>

<p>
To learn the way to do similar things in C++ you can read C++ STL tutorial
<a href="/tc?module=Static&d1=tutorials&d2=standardTemplateLibrary">part 1</a> and
<a href="/tc?module=Static&d1=tutorials&d2=standardTemplateLibrary2">part 2</a>.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8580&amp;rd=11151" name="8580">TriangularSubsequence</a></b>

</font>

<A href="Javascript:openProblemRating(8580)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      141 / 178 (79.21%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      109 / 141 (77.30%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ahyangyi</b> for 493.94 points (3 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      403.25 (for 109 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First let us note that the definition of the triangular sequence doesn't use the order on its elements.
So if we reorder elements of a triangular sequence arbitrarily, we still get a triangular sequence.
</p>

<p>
Let the numbers x, y and z satisfy 
0 &lt; x &le; y &le; z. To check whether they satisfy the triangular inequality
it is sufficient to check whether x + y &gt; z. Indeed, y + z &ge; x + z &gt; x, 
and x + z &ge; x + y &gt; y, so the only non-trivial inequality is whether x + y &gt; z.
</p>

<p>
Now let us have a criteria that the sequence b[0], b[1], ..., b[n-1] where
b[0] &le; b[1] &le; ... &le; b[n - 1],
is triangular without checking all triples of indices. If n &le; 2, the sequence is
triangular for sure, so let n &ge; 3.
It is necessary that b[0] + b[1] &gt; b[n - 1]. It is also sufficient, indeed,
since for any 0 &le; i &lt; j &lt; k &lt; n we have 
b[i] + b[j] &ge; b[0] + b[1] &gt; b[n - 1] &ge; b[k]. Therefore, for n &ge; 3 the sequence
b[0] &le; b[1] &le; ... &le; b[n-1] is triangular if and only if b[0] + b[1] &gt; b[n - 1]
</p>

<p>
Let us sort all elements of the given sequence, let a[0] &le; a[1] &le; ... &le; a[n-1]. 
Consider the optimal triangular subsequence
a[i<sub>1</sub>], a[i<sub>2</sub>], ..., a[i<sub>m</sub>] where 0 &le; i<sub>1</sub> &lt; i<sub>2</sub> &lt; ... &lt; i<sub>m</sub> &lt; n. 
Note that the subsequence a[i<sub>m</sub>-m+1], a[i<sub>m</sub>-m+2], ..., a[i<sub>m</sub>] is also triangular, because
a[i<sub>m</sub>-m+1]+a[i<sub>m</sub>-m+2] &ge; a[i<sub>1</sub>]+a[i<sub>2</sub>] &gt; a[i<sub>m</sub>] and it has the same length. Thus
we only have to consider contiguous subsequences of the sorted original sequence. 
The O(n<sup>2</sup>) solution is immediate - check all i and j such that 0 &le; i &lt; n and
i + 2 &le; j &lt; n, and for each pair check whether a[i] + a[i+1] &gt; a[j]. 
Among those subsequences that satisfy 
the inequality choose the longest one. The code follows.
</p>
<pre>
    public int longest(int[] a) {
        Arrays.sort(a);
        int n = a.length;
        int r = Math.min(a.length, 2);
        for (int i = 0; i &lt; n; i++) {
            for (int j = i + 2; j &lt; n; j++) {
                if (a[i] + a[i + 1] &gt; a[j]) {
                    if (j - i + 1 &gt; r) {
                        r = j - i + 1;
                    }
                }
            }
        }
        return r;
    }
</pre>

<p>
Though O(n<sup>2</sup>) is more than sufficient for the given constraints, there exists a faster
algorithm. Let us give its sketch, leaving details to the reader. For each i from 0 to n - 1
let us find right(i) - maximal possible j such that a[i], ..., a[j] is triangular. It is clear
that right(i + 1) &ge; right(i), so if we know right(i) we only need to consider j from right(i)
to n - 1, and if a[i], ..., a[j] is not triangular, neither is a[i], ...,  a[j + k] for any k &gt; 0,
so we can stop searching as soon as we find j such that a[i], ..., a[j] is not triangular.
So if we maintain two indices i and j, such that a[i], ..., a[j] is the longest contiguous 
triangular subsequence starting at a[i], we only need to increase i and j. Therefore it can be implemented in
O(n). Combined with O(n log n) for sorting, it gives O(n log n) algorithm for the problem.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8553&amp;rd=11151" name="8553">UnfixedArrangements</a></b>

</font>

<A href="Javascript:openProblemRating(8553)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      68 / 178 (38.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      59 / 68 (86.76%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>sluga</b> for 989.45 points (2 mins 56 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      671.55 (for 59 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem has a lot of solutions of various asymptotic time. We will consider some of them,
from worse to better.
</p>

<p>
First let us try to use the fact that we have n, k &le; 20, so we can run subset dynamic programming.
Let us call the way to assign numbers from 1 to n to some of the k positions a <em>partial arrangement</em>.
Let i run from 0 to k, and m from 0 to 2<sup>n</sup>-1. Denote as a[i][m] the number of partial
unfixed arrangements that have numbers assigned to positions from 1 to i, inclusive, where m is
the mask of the used numbers: the j-th bit of m is set to 1 if j is used in the arrangement.
Clearly, a[0][0] = 1, and a[0][m] = 0 for m &ne; 0.
</p>
<p>
To learn a[i][m] we run through all j such that the j-th bit is set in m, and if j &ne; i we add
a[i-1][m <tt>xor</tt> (1 &lt;&lt; (j-1))] to a[i][m] (here x <tt>xor</tt> y means bitwise exclusive or
of x and y).
The answer to the original problem is the sum of a[k][m] for all m.
</p>
<p>
This solution runs in O(nk2<sup>n</sup>) which may a bit too slow for the given constraints.
Some coders used the fact that the number of possible inputs is small, and precalculated all
answers. But actually there are ways to speed up the algorithm to make it run in time.
</p>
<p>
For example, we may note that the first index i is not needed - given m we can learn how
many positions are already assigned in the partial arrangement counting the bits in m.
This gives us O(n2<sup>n</sup>) solution which already passes system tests. But we can do better.
Let us now switch to solutions that are polynomial in n and k.
</p>
<p>
Consider all arrangements of k from n (not necessarily unfixed). This number is n(n - 1)(n - 2)...(n - k + 1).
Denote this numbers as a[n][k].
Some of them have fixed point, so they need not 
be counted. The number of arrangements that
have fixed point at 1 (1 is put to slot 1) is a[n - 1][k - 1] since we must arrange n - 1 number left to k - 1 slots left.
So is the number of arrangements that have fixed point 2, ..., fixed point k. So we must subtract k * a[n - 1][k - 1] from a[n][k]. 
</p>
<p>
But we have subtracted some arrangements more than once - those that have two or more fixed points. 
There are a[n-2][k-2] arrangements that have fixed points at both 1 and 2, the same number of arrangements 
have fixed points at both 1 and 3, etc. The number of ways to choose 2 positions from k is called 
<em>choose 2 from k</em> and is equal to the corresponding <a target="_blank" href="http://en.wikipedia.org/wiki/Binomial_coefficient">binomial
coefficient</a>. Let us denote it as c[k][2], so we must add back c[k][2] * a[n - 2][k - 2].
But we have now added some arrangements more than once, those that have at least 3 fixed points...
</p>
<p>
The generalization of such reasoning is <a target="_blank" href="http://en.wikipedia.org/wiki/Inclusion-exclusion">inclusion-exclusion principle</a>. 
Using it, we have the answer be equal to sum for t from 0 to k of (-1)<sup>t</sup> * c[k][t] * a[n - t][k - t].
</p>
<p>
This solution can be implemented in O(nk) using <a href="http://en.wikipedia.org/wiki/Pascal_triangle">Pascal triangle</a>
to calculate c[n][k], or even in O(k) if we note the formulas c[k][t + 1] = c[k][t] * (k - t) / (t + 1)
and a[n - t - 1][k - t - 1] = a[n - t][k - t] / (n - t), so we have a way to get the next term from the previous one in O(1).
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/andrewzta_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11829284" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
