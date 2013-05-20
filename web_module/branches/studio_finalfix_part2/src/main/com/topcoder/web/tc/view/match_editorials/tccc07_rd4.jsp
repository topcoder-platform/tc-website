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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=3&rd=10924">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517547" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 4</span><br />Saturday, September 22, 2007
<br /><br />



<h2>Match summary</h2>

 

<p>

This was a very important match for the 140 coders that had the opportunity to
earn a trip to Disney World, the chance to compete in the onsite rounds and the
possibility to meet lots of other TopCoders. After the coding phase,
<tc-webtag:handle coderId="251074" context="algorithm"/>, who had the fastest
time on both the medium and the hard, was in first position. He was two
challenges away from <tc-webtag:handle coderId="7581406" context="algorithm"/>
in second place and a less comfortable 4 challenges away from <tc-webtag:handle coderId="10574855" context="algorithm"/> in third place.
During the challenge phase <tc-webtag:handle coderId="10574855" context="algorithm"/> made 5
successful challenges in a row, taking the lead. But he made another 3
unsuccessful challenges before looking at the score board. Two last challenges
couldn't help and <tc-webtag:handle coderId="251074" context="algorithm"/> won
the round, leaving <tc-webtag:handle coderId="10574855" context="algorithm"/> in
second place and <tc-webtag:handle coderId="15812946" context="algorithm"/> in
third place after <tc-webtag:handle coderId="7581406" context="algorithm"/>'s
hard was successfully challenged. Congratulations to <tc-webtag:handle coderId="251074" context="algorithm"/> and everybody else who made it onsite!

</p>

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8149&amp;rd=10924" name="8149" onClick="return (false);">FrabonacciTree</a></b>

</font>

<A href="Javascript:openProblemRating(8149)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517547" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      137 / 140 (97.86%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      76 / 137 (55.47%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Revenger</b> for 241.20 points (5 mins 27 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      188.29 (for 76 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
We have to find directions between two nodes in a Frabonacci tree, a structure
closely resembling a Fibonacci tree. Doing this consists of two parts: finding
the two points, and finding the directions between them. It's not too hard to
solve both parts at the same time, but let's keep them separate for the purpose
of simplicity.
</p>

<p>
Suppose we have a function that gives us the directions from the root node to a
given node. Then we already have a path if we reverse the path to the first node
and concatenate the path to the second node. Here reversing just means replacing
every <tt><b>L</b></tt> or <tt><b>R</b></tt> with a <tt><b>U</b></tt>. But this
path will probably not be a shortest path. In order to make the path as short as
possible, we only need to use the directions from the point where both paths
diverge. So if we already have a function <tt><b>directionsTo()</b></tt>, the
solution is as follows:

<pre>
public String shortestPath(int n, int startIndex, int finishIndex) {
    String toStart = directionsTo(n, startIndex);
    String toFinish = directionsTo(n, finishIndex);
    while (toStart.length() &gt; 0 &amp;&amp; toFinish.length() &gt; 0 &amp;&amp;
           toStart.charAt(0) == toFinish.charAt(0)) {
        toStart = toStart.substring(1);
        toFinish = toFinish.substring(1);
    }
    return toStart.replaceAll(&quot;.&quot;, &quot;U&quot;) + toFinish;
}
</pre>
</p>

<p>
Now how do we find the directions from the root node to a given node? If the
given node has index 1, then it is the root node, and we return &quot;&quot;. If the index
of the node is small, we go left, and if it's large we go right. Here small
means less than or equal to the number of nodes in the left subtree plus one
(the root) and large means greater than small. The rest of the path we can do
recursively by subtracting the number of skipped nodes (1 for the root, plus
maybe the size of the left subtree) from our index.

<pre>String directionsTo(int n, long index) {
    if (index == 1) return &quot;&quot;;
    if (index &gt; nodesInTree(n - 2) + 1) {
        return &quot;R&quot; + directionsTo(n - 1, index - 1 - nodesInTree(n - 2));
    }
    return &quot;L&quot; + directionsTo(n - 2, index - 1);
}

long[] nodesInTree = new long[51];
long nodesInTree(int n) {
    if (n &lt; 2) return 1;
    if (nodesInTree[n] != 0) return nodesInTree[n];
    return nodesInTree[n] = 1 + nodesInTree(n - 1) + nodesInTree(n - 2);
}
</pre>

Remember that although <tt><b>index</b></tt> is an <tt><b>int</b></tt>, the size
of a tree can be more than fits in an <tt><b>int</b></tt>.
</p>

 <p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8205&amp;rd=10924" name="8205" onClick="return (false);">SausagesProductionScheduler</a></b>

</font>

<A href="Javascript:openProblemRating(8205)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517547" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      120 / 140 (85.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      45 / 120 (37.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bmerry</b> for 442.97 points (10 mins 28 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      289.56 (for 45 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In this problem we have to select an as large as possible subset from a given
set of items (recipes), while staying within certain constraints. Sounds like
knapsack, doesn't it? Except that we're actually filling two knapsacks at the
same time because we have to take both ingredients into account, and we also
have some freedom to change the size of our items (i.e. the amount of certain
ingredient used).

</p>

<p>
A first important observation to make is that we can almost completely ignore
the second ingredient because we always use <tt><b>100 - x</b></tt> of it per
sausage we make, where <tt><b>x</b></tt> is the amount we use of the first
ingredient. We only have to make sure we translate the constraints on the second
ingredient into constraints on the first ingredient. This means that, per
sausage, the minimal amount of ingredient-1 used is possibly increased to 100
minus the maximal amount of ingredient-2 that is used. And the maximal amount of
ingredient-1 used is possibly decreased to 100 minus the minimal amount of
ingredient-2 that is used. Also if we make <tt><b>n</b></tt> sausages, we have
to use at least <tt><b>100 * n - limit[1]</b></tt> of the first ingredient to
make sure we don't need to use more than <tt><b>limit[1]</b></tt> of the second
ingredient. From now on, we will only consider the amount of the first
ingredient we use. Let's call this ingredient meat.
</p>

<p>
After we've updated all the ranges of the recipes we are left with the following
problem: Find the maximal <tt><b>n</b></tt> such that we can select
<tt><b>n</b></tt> recipes that together allow us to use an amount of meat
that is at least <tt><b>100 * n - limit[1]</b></tt> and at most
<tt><b>limit[0]</b></tt>.
</p>

<p>
So given the number <tt><b>n</b></tt> of sausages we want to make, and the
amount <tt><b>x</b></tt> of meat we want to use, we need to know whether
there is some subset of recipes of size <tt><b>n</b></tt> that allows us to use
exactly <tt><b>x</b></tt> meat. Now let <tt><b>canMake[n][x]</b></tt> be a
boolean that tells us whether we can make <tt><b>n</b></tt> sausages, using
<tt><b>x</b></tt> meat. If, before considering recipe <tt><b>i</b></tt> we
have <tt><b>canMake[n][x] == true</b></tt>, then by considering recipe
<tt><b>i</b></tt> we know that <tt><b>canMake[n + 1][x + y]</b></tt> must be
<tt><b>true</b></tt> for every amount <tt><b>y</b></tt> of meat we can use
to for recipe <tt><b>i</b></tt>. After we've completely filled
<tt><b>canMake</b></tt> we can iterate through it to find the maximal number of
sausage we can make with an amount of used meat between <tt><b>100 * n -
limit[1]</b></tt> and <tt><b>limit[0]</b></tt>.
</p>

<p>
This solution has time complexity O(n * n * x * y), where n is the number of
recipes, x is the maximal total amount of meat and y is the number of
possible different amounts per sausage, i.e. at most 100. <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=266361&rd=10924&pm=8205&cr=10574855">solution</a>
is a clean implementation of this idea.
</p>

<p>There is also a solution with complexity O(n * n * x). The idea is not to try
every possible amount for every recipe, but instead, to find a range of possible
amounts and see if it overlaps with the range determined by the limits. Suppose
we have to use at least <tt><b>haveToUse</b></tt> gram of meat. Using a
specific recipe we can take care of part of this amount, but this also forces us
to use at least the minimal amount needed for this recipe. Now if we can find
the minimal amount of meat we must use (due to used recipes), based on the
fact that we have to use a certain amount of meat (due to the limits),
then we can check if we can use at least this amount. If we can, we know it's
possible to make the assumed number of sausages. So if
<tt><b>mustUse[i][n][haveToUse]</b></tt> is the amount of meat we are forced
to use if we need to use at least <tt><b>haveToUse</b></tt> to make
<tt><b>n</b></tt> sausages, while considering recipe <tt><b>i</b></tt>, the
recurrence relation we get is
<pre>mustUse[i][n][haveToUse] = min(
    mustUse[i + 1][n][haveToUse],
    mustUse[i + 1][n - 1][haveToUse - maxUsed[i]] + minUsed[i]);</pre>
</p>


<br/>
Here is a solution based on this idea:
<pre>
public class SausagesProductionScheduler {
    static final int INFINITY = 1000000;
    int n;
    int[] minUsed;
    int[] maxUsed;

    public int maxCount(String[] lowerPercentage, String[] upperPercentage,
                        int[] limits) {
        n = lowerPercentage.length;
        minUsed = new int[n];
        maxUsed = new int[n];

        for (int i = 0; i &lt; n; i++) {
            Scanner in1 = new Scanner(lowerPercentage[i]);
            Scanner in2 = new Scanner(upperPercentage[i]);
            minUsed[i] = in1.nextInt();
            maxUsed[i] = in2.nextInt();
            minUsed[i] = Math.max(minUsed[i], 100 - in2.nextInt());
            maxUsed[i] = Math.min(maxUsed[i], 100 - in1.nextInt());
        }

        memo = new int[100 * n + 1][n + 1][n];

        for (int nSausages = n; nSausages &gt; 0; --nSausages) {
            int haveToUse = 100 * nSausages - limits[1];
            int mustUse = mustUse(haveToUse, nSausages, 0);
            if (haveToUse &lt;= limits[0] &amp;&amp; mustUse &lt;= limits[0]) {
                return nSausages;
            }
        }

        return 0;
    }

    int[][][] memo;
    int mustUse(int haveToUse, int recipesToUse, int currentRecipe) {
        if (currentRecipe == n &amp;&amp; recipesToUse &gt; 0) return INFINITY;
        if (recipesToUse == 0) {
            if (haveToUse &gt; 0) return INFINITY;
            return 0;
        }
        if (haveToUse &lt; 0) haveToUse = 0;
        int mem = memo[haveToUse][recipesToUse][currentRecipe];
        if (mem != 0) {
            return mem;
        }

        int result = mustUse(haveToUse, recipesToUse, currentRecipe + 1);
        if (minUsed[currentRecipe] &lt;= maxUsed[currentRecipe]) {
            int used = mustUse(haveToUse - maxUsed[currentRecipe],
                               recipesToUse - 1, currentRecipe + 1) +
                minUsed[currentRecipe];
            result = Math.min(result, used);
        }
        return memo[haveToUse][recipesToUse][currentRecipe] = result;
    }
}
</pre>




<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8151&amp;rd=10924" name="8151" onClick="return (false);">CommonSubsequence</a></b>

</font>

<A href="Javascript:openProblemRating(8151)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517547" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      7 / 140 (5.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      6 / 7 (85.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bmerry</b> for 614.66 points (26 mins 15 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      519.94 (for 6 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
If finding a common subsequence makes you think of dynamic programming, you have
to be careful here because we're not looking for a longest common subsequence.
We're looking for the lexicographically last common subsequence. But wait! This
is TopCoder, aren't we supposed to be looking for the lexicographically first
common subsequence? Hehe, that would be a bit too easy because it would be the
empty string :-).
</p>

<p>
For now, ignore the fact that we have to return a suffix. We can just take the
suffix of our result at the end. What would be the first character of the
sequence we're looking for? Since we can choose the character with the largest
value that is present in both strings as our first character and it's impossible
to make a lexicographically larger string with another first character, that
must be our first character. So how many of those will be at the start of our
result string? There can't be more than the number of those characters present
in the string that has the least of them. But we certainly can choose that
number of those character as a subsequence. So we already know the first
character of our result and how many times it's repeated and we didn't even need
to cyclically shift either of the input strings.
</p>

<p>
So what will be the next character? Can we choose the second largest character
present in both strings? Yes we can, and this is where the shifting comes in. If
we shift one of the second largest characters to the end of both strings, we can
still have our common subsequence start with the number of largest character we
had decided on, and then take the last character of both shifted strings. We can
even possibly take more of them if there are more after the necessary characters
to start with. How many more does depend this time on the cyclic shift we use.
But if we only care about the number of (second largest) characters we use, it
can't hurt to put one of them at the end. And since any lexicographically
largest subsequence will have the maximal amount of largest characters, we can
greedily choose their number right now.
</p>

<p>
That's right, we can do it greedily. We just continue to append as many next
largest characters as possible. For every cyclic shift we first skip the
starting characters we've already decided on and then look for addition
characters with the value we're considering right now. Then we take the maximum
that's possible in both strings and continue. And when we're done, we just return the necessary suffix.
</p>

<p>
This solution might
seem O(c * n * n) where c is the number of different characters to consider and
n is the length of the input strings and the number of different cyclic shifts.
But since we consider every character only once as the last character in a
cyclic shift, it's actually O(n * n) which will run in time for n &lt;= 2500.
</p>

<p>Here's a solution that implements this idea:
<pre>
public class CommonSubsequence {
    int[] counts = new int[128];

    public String maxLex(String[] A, String[] B, int suffixLength) {
        String a = join(A);
        String b = join(B);

        StringBuilder result = new StringBuilder();
        for (char c = 126; c &gt;= 35; c--) {
            counts[c] = Math.min(maxCount(a, c),
                                 maxCount(b, c));
            for (int i = 0; i &lt; counts[c]; i++) {
                result.append(c);
            }
        }

        if (result.length() &gt; suffixLength) {
            return result.substring(result.length() - suffixLength);
        }
        return result.toString();
    }

    int maxCount(String s, char c) {
        int max = 0;
        int len = s.length();
        for (int shift = 0; shift &lt; len; shift++) {
            if (s.charAt((shift + len - 1) % len) != c) continue;

            int i = shift;
            for (char prev = 126; prev &gt; c; prev--) {
                int toFind = counts[prev];
                while (i &lt; shift + len &amp;&amp; toFind &gt; 0) {
                    if (s.charAt(i % len) == prev) toFind--;
                    i++;
                }
            }
            int found = 0;
            for (; i &lt; shift + len; i++) {
                if (s.charAt(i % len) == c) found++;
            }
            max = Math.max(max, found);
        }
        return max;
    }

    String join(String[] a) {
        StringBuilder result = new StringBuilder();
        for (String s: a) result.append(s);
        return result.toString();
    }
}
</pre>

There is also an O(c * n) solution. We can use the fact the fact that every time
we're skipping the same initial characters for a certain cyclic shift, so if we
remember the parts we already skipped for every cyclic shift, we only have to
skip the newly added characters. Also, we can count the number of characters
we're looking for, for every cyclic shift, in a single linear scan. We do this
by moving a <tt><b>from</b></tt> and a <tt><b>to</b></tt> index, increasing the
count when <tt><b>to</b></tt> moves over a looked-for character and decreasing
it when <tt><b>from</b></tt> sees one. Here's a solution that implements this
idea:

<pre>
public class CommonSubsequence {

    public String maxLex(String[] A, String[] B, int suffixLength) {
        String a = join(A);
        String b = join(B);
        int[] skippedA  = new int[a.length()];
        int[] skippedB  = new int[b.length()];

        for (int i = 0; i &lt; skippedA.length; i++) skippedA[i] = i;
        for (int i = 0; i &lt; skippedB.length; i++) skippedB[i] = i;

        StringBuilder result = new StringBuilder();

        for (char c = 126; c &gt;= 35; c--) {
            int n = Math.min(maxInRange(a, skippedA, c),
                             maxInRange(b, skippedB, c));
            if (n == 0) continue;

            for (int i = 0; i &lt; n; i++) {
                result.append(c);
            }
            updateSkipped(a, skippedA, c, n);
            updateSkipped(b, skippedB, c, n);
        }

        if (result.length() &gt; suffixLength) {
            return result.substring(result.length() - suffixLength);
        }
        return result.toString();
    }

    int maxInRange(String s, int[] skipped, char c) {
        int len = s.length();
        int result = 0;
        int from = 0, to = 0, count = 0;

        for (int i = 0; i &lt; len; i++) {
            while (from &lt; skipped[i]) {
                if (s.charAt(from % len) == c) count--;
                from++;
            }
            while (to &lt; i + len) {
                if (s.charAt(to % len) == c) count++;
                to++;
            }
            result = Math.max(result, count);
        }
        return result;
    }

    void updateSkipped(String s, int[] skipped, char c, int n) {
        int len = s.length();
        int from = 0, to = 0, count = 0;
        for (int i = 0; i &lt; len; i++) {
            while (from &lt; skipped[i]) {
                if (s.charAt(from % len) == c) count--;
                from++;
            }
            while (count &lt; n) {
                if (s.charAt(to % len) == c) count++;
                to++;
            }
            skipped[i] = to;
        }
    }

    String join(String[] a) {
        StringBuilder result = new StringBuilder();
        for (String s: a) result.append(s);
        return result.toString();
    }
}
</pre>

<p>Thanks, <tc-webtag:handle coderId="308953" context="algorithm"/>, for an
interesting problem set and congratulation to everybody who advanced to the
onsite rounds!
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/dskloet_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="19786437" context="algorithm"/><br />
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
