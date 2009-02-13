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
    <A href="/stat?c=round_overview&er=5&rd=10899">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517222" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 1C</span><br />Saturday, September 1, 2007
<br /><br />



<h2>Match summary</h2>

<p>
Online Round 1C of the 2007 TopCoder Collegiate Challenge was a bit better attended than Rounds 1A and 1B, with 514 participants.
The problem set was somewhat different from the previous two rounds as well, with the first two problems easier and
the last problem harder. As a result, the cutoff was quite high - 306.61 points - so correct solutions
on both easy and medium were needed to advance. The top spots were taken by the 11 coders who correctly
solved the hard problem. Among them was <tc-webtag:handle coderId="19849563" context="algorithm"/>
in first place, <tc-webtag:handle coderId="7421158" context="algorithm"/> in second, and 
<tc-webtag:handle coderId="8365685" context="algorithm"/> in third.
</p>
 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7296&amp;rd=10899" name="7296">DifDif</a></b>

</font>

<A href="Javascript:openProblemRating(7296)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517222" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      495 / 514 (96.30%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      483 / 495 (97.58%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bugzpodder</b> for 247.85 points (2 mins 39 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      206.02 (for 483 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>The most straightforward solution of this problem is to brute force all possible next values of the sequence
and see which one will produce 0 in the last difference sequence. The tricky part of such a solution is to set
correct limits on the answer. Example 3 shows that the answer can be as large as 1,023,000. It's also not hard
to see, that the answer can be as small as -1,023,000 (it's enough to negate all numbers in example 3 to obtain
the test with such an answer). So we can make a guess that it will be enough to brute force the answer
from -1,023,000 to 1,023,000, inclusive. Now it's possible to implement a working solution using this guess.
The Java code below works for 0.870 seconds in the worst case:
</p>

<pre>
public int predict(int[] seq) {
    int N = seq.length;
    int[] A = new int[N+1];

    // brute force next value
    for (int x = -1023000; x <= 1023000; x++) {
        // append next value to the end of the sequence
        for (int i=0; i < N; i++)
            A[i] = seq[i];

        A[N] = x;

        // calculate the bottom difference sequence
        for (int i=0; i < N; i++)
            for (int j=0; j < N-i; j++)
                A[j] = A[j+1] - A[j];

        // if it consists of 0, then we found the answer
        if (A[0] == 0) return x;
    }

    return -1;
}
</pre>

<p>
Of course, this solution is far from safe, because we just made a guess and didn't find any proof of it. In order
to obtain safer and faster solution, let's do some simple math. If we take the sequence (5, -4, 12, 23) from the problem
statement, append unknown number x to its end and generate all difference sequences, we'll get the following
triangle:
</p>

<pre>
5     -4    12    23    x
   -9    16    11    x-23
      25    -5    x-23-11
         -30   x-23-11-(-5)
            x-23-11-(-5)-(-30)
</pre>

<p>
We see that, in order to calculate the value in the bottom difference sequence, we need to subsequently
subtract from x numbers 23, 11, -5 and -30, i.e. the rightmost numbers from the rows of the original triangle.
As we wish the bottom value to be 0, we need to set x as the sum of all subtracted numbers. So we can
just generate the original triangle and sum the rightmost numbers from all its rows to get the answer.
The implementation of this approach is pretty short:
</p>

<pre>
public int predict(int[] seq) {
    int res=0, N = seq.length;

    for (int i=0; i < N; i++) {
        res += seq[N-i-1];
        for (int j=0; j < N-i-1; j++)
            seq[j] = seq[j+1] - seq[j];
    }

    return res;
}
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7312&amp;rd=10899" name="7312">Prefixes</a></b>

</font>

<A href="Javascript:openProblemRating(7312)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517222" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      366 / 514 (71.21%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      302 / 366 (82.51%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ACRush</b> for 477.69 points (6 mins 11 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      325.39 (for 302 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
As the algorithm for producing the desired partition is described in the problem statement, we just
need to implement it. The constraints are quite low, so the implementation can be completely straightforward.
One iteration of the algorithm's cycle can be implemented as follows.
In order to find the longest prefix that appears in at least 2 unassigned strings, we simply iterate
through all prefixes of all unassigned strings. For every prefix we iterate through all unassigned
strings and check in how many of them it appears. From those prefixes that appear in 2 or more
strings we choose the longest one. If there are many longest prefixes, we prefer the lexicographically
first among them, as we need to list the groups with the same-length common prefix alphabetically.
After the prefix is chosen, we form the group of all unassigned strings with this prefix, listed
alphabetically, make all these strings assigned and proceed with the next iteration of the algorithm.
</p>

<p>Commented Java code follows:</p>

<pre>
public String[] prefixList(String[] protein) {
    // add all strings to a list and sort it alphabetically
    List<String> list = Arrays.asList(protein);
    Collections.sort(list);

    List<String> res = new ArrayList<String>();

    // while there is at least 1 unassigned string
    while (list.size() > 0) {
        String bestPrefix = "";

        // iterate through all unassigned strings
        for (int i=0; i < list.size(); i++)
            // iterate through all prefixes of i-th string
            for (int j=0; j < list.get(i).length(); j++) {
                String prefix = list.get(i).substring(0, j+1);

                // if current prefix is shorter than the best one
                // or if they have the same length and current prefix
                // is later alphabetically, then we can skip current prefix
                if (prefix.length() < bestPrefix.length()) continue;
                if (prefix.length() == bestPrefix.length() &&
                    prefix.compareTo(bestPrefix) > 0) continue;

                // calculate, how many strings have current prefix
                int cnt=0;
                for (int k=0; k < list.size(); k++)
                    if (list.get(k).startsWith(prefix)) cnt++;

                // if there is only one string with current prefix,
                // then we should skip it
                if (cnt < 2) continue;

                bestPrefix = prefix;
            }

        // make next group
        List<String> next = new ArrayList<String>();
        for (int i=0; i < list.size(); i++)
            // if the string starts from the needed prefix
            if (list.get(i).startsWith(bestPrefix))
                // then add it to the group
                res.add(list.get(i));
            else
                // else leave it for future iterations
                next.add(list.get(i));

        // follow the group by the string of dashes
        String s = "";
        for (int i=0; i < bestPrefix.length(); i++)
            s += "-";

        res.add(s);

        list = next;
   }

   // convert result list to array and return it
   return res.toArray(new String[]{});
}
</pre> 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4432&amp;rd=10899" name="4432">CircleCount</a></b>

</font>

<A href="Javascript:openProblemRating(4432)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517222" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      46 / 514 (8.95%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      11 / 46 (23.91%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Per</b> for 629.44 points (25 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      496.32 (for 11 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
I'll describe the solution of this problem in three steps.
</p>
<p><i>Step 1 - Getting rid of cyclicity.</i></p><p>As cars are on the circular track, we always have two possible directions
to move a car to its destination - clockwise and counterclockwise. If the track was straight, we would always have
one direction instead of two. Let's try to make track straight in order to simplify the problem. To do this, we
iterate through all possible cars and assume for each car that it will be moved earlier than all other cars to
its unloading position. If there's no way to move the car in any of 2 directions, we simply skip it, otherwise
we move the car to its unloading position and consider the situation after this. As the car is already moved,
it won't be moved anymore, so it will always block one of 2 possible movement directions for all other cars.
It means, that we can "cut" the track at the unloading position of the car and treat it as straight after this.
The example below illustrates this idea:</p>
<pre>
    e A E B                 e A E b
  a         D             a         D

  G         b     ---->   G         B     ---->   D F d f c g C G a e A E

  C         F             C         F

    g c f d                 g c f d

 initial track          car b was moved          equivalent straight track
</pre>

<p><i>Step 2 - Investigating configurations without solution.</i></p>
<p>Now, given a configuration on the straight track,
let's investigate when it won't have any solution. We define <i>car interval</i> as the interval of the track
between the start and finish positions of the car. Suppose that one car interval completely lies inside the other car
interval, like in the example below:
<pre>
. . a . . B . . b . . A . .
    *-----------------*
          *-----*
</pre>
<p>It's obvious in this case, that car b will always block the path for car a, so configurations with one car interval
inside another are always not solvable.</p>
<p>Let's call two car intervals <i>badly overlapped</i> it they have points in common, are not one inside another, and
one interval starts from a lowercase letter and another starts from an uppercase letter. Two possible cases
of bad overlap are illustrated below:</p>
<pre>
. . a . . B . . A . . b . .      . . A . . b . . a . . B . .
    *-----------*                    *-----------*
          *-----------*                    *-----------*
</pre>
<p>
In the first case if we first move car a, it will then block the path for car b, and vice versa, if we first move car b,
it will block the path for car a. In the second case cars a and b initially block the paths for each other. We see
that configurations with bad overlap are also now always not solvable.
</p>
<p>Now let's prove that if the configuration doesn't contain two intervals, one of which is inside another, and doesn't contain
bad overlaps, than it is solvable. We consider the graph with the set of vertices consisting of all cars. Two vertices
are connected by an edge, if the corresponding car intervals have common points. Let's call every connected component
of this graph a <i>group</i>. For example, the configuration "ABaCbcdeDfEF" has two groups -- one of cars a, b, c and
another of cars d, e, f.</p>
<p>By definition, two car intervals from different groups don't have common points, so each group occupies
a separate part of the track. If we sort the intervals within one group in increasing order of their start positions,
the finished positions of the intervals will also be sorted in increasing order (as no interval lies inside another).
Taking the absence of bad overlaps into account, we see that every group has the following (unique) solution:</p>
<ul>
<li>if car intervals within the group starts from lowercase letters, we need to subsequently move the cars
from right to left (for example, for the group "deDfEF" we need to move cars in order f, e, d);</li>
<li>if car intervals within the group starts from uppercase letters, we need to subsequently move the cars
from left to right (for example, for the group "ABaCbc" we need to move cars in order a, b, c).</li>
</ul>
<p>So, the configuration is solvable if and only if it doesn't contain two intervals, one of which is inside another, and doesn't contain
bad overlaps. Now let's count the number of solutions.</p>

<p><i>Step 3 - A bit of combinatorics.</i></p>
<p>Let the configuration consists of k groups, numbered from
1 to k, and i-th group contains L<sub>i</sub> cars. The solution for each group is unique, but for all
configuration there can be many possible solutions, as moves for different groups can be mixed together
in any possible order. So every solution can be described by the sequence of L<sub>1</sub> + L<sub>2</sub> + ...
+ L<sub>k</sub> numbers from 1 to k, where each number i indicates one move for i-th group. The valid sequences
are exactly those which contain L<sub>i</sub> entries of number i for every i from 1 to k, inclusive.
This looks like some well known combinatorial object, so let's check the latest <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=combinatorics">tutorial</a>
about the basics of combinatorics. Here (in the section on "permutations with repetition") we will see that the
number of different solutions is described by the formula (L<sub>1</sub> + L<sub>2</sub> + ... + L<sub>k</sub>)! / 
(L<sub>1</sub>! * L<sub>2</sub>! * ... * L<sub>k</sub>!).</p>

<p>Commented Java implementation of the solution follows:</p>

<pre>
public final long INF = 10000000000l;
    
// this class represents one car interval
class Interval {
    char lC, rC;
    int l, r;
    public Interval(int l, char lC, int r, char rC) {
        this.l = l;
        this.lC = lC;
        this.r = r;
        this.rC = rC;
    }
}

// number of solutions for the straight track
public long cnt(String S) {
    // find all intervals
    Interval[] ints = new Interval[S.length()];
    int intCnt = 0;
    for (int i=0; i < S.length(); i++)
        for (int j=i+1; j < S.length(); j++)
            if (Character.toUpperCase(S.charAt(i)) == Character.toUpperCase(S.charAt(j)))
                ints[intCnt++] = new Interval(i, S.charAt(i), j, S.charAt(j));

    // try to find one interval inside another
    for (int i=0; i < intCnt; i++)
        for (int j=0; j < intCnt; j++)
            if (ints[i].l < ints[j].l && ints[j].r < ints[i].r)
                return 0;
                    
    // try to find bad overlap
    for (int i=0; i < intCnt; i++)
        for (int j=0; j < intCnt; j++)
            if (Math.max(ints[i].l, ints[j].l) < Math.min(ints[i].r, ints[j].r) &&
                Character.isLowerCase(ints[i].lC) != Character.isLowerCase(ints[j].lC))
                return 0;
                    
    // construct graph and its transitive closure
    boolean[][] adj = new boolean[intCnt][intCnt];
        
    for (int i=0; i < intCnt; i++)
        adj[i][i] = true;
            
    for (int i=0; i < intCnt; i++)
        for (int j=0; j < intCnt; j++)
            if (Math.max(ints[i].l, ints[j].l) < Math.min(ints[i].r, ints[j].r))
                adj[i][j] = true;
                    
    for (int k=0; k < intCnt; k++)
        for (int i=0; i < intCnt; i++)
            for (int j=0; j < intCnt; j++)
                if (adj[i][k] && adj[k][j])
                    adj[i][j] = true;
                        
    // find groups
    boolean[] used = new boolean[intCnt];
    int[] L = new int[S.length()];
    int cnt = 0;
    for (int i=0; i < intCnt; i++) {
        if (used[i]) continue;
        for (int j=0; j < intCnt; j++)
            if (adj[i][j]) {
                L[cnt]++;
                used[j] = true;
            }
        cnt++;
    }

    // find count of solutions
    long res = 1, X = 0;
    for (int i=0; i < cnt; i++)
        for (int j=0; j < L[i]; j++) {
            res *= (++X);
            res /= (j + 1);
            if (res >= INF) return INF;
        }
            
    return res;
}

public int countOrder(String c) {
    long res = 0;
        
    // iterate through the first car to move
    for (int i=0; i < c.length(); i++)
        for (int j=i+1; j < c.length(); j++)
            if (Character.toUpperCase(c.charAt(i)) ==
                Character.toUpperCase(c.charAt(j))) {
                // check, whether car can be moved
                boolean ok1 = true, ok2 = true;
                    
                for (int k=i+1; k < j; k++)
                    if (Character.isLowerCase(c.charAt(k)))
                        ok1 = false;
                            
                for (int k=0; k < i; k++)
                    if (Character.isLowerCase(c.charAt(k)))
                        ok2 = false;
                            
                for (int k=j+1; k < c.length(); k++)
                    if (Character.isLowerCase(c.charAt(k)))
                        ok2 = false;
                            
                // if car can be moved, than solve the problem on the straight track
                if (ok1 || ok2) {
                    String S = (Character.isLowerCase(c.charAt(i)) ?
                    c.substring(j+1) + c.substring(0, i) + c.substring(i+1, j) :
                    c.substring(i+1, j) + c.substring(j+1) + c.substring(0, i));
                            
                    res += cnt(S);
                    if (res >= INF) return -1;
                }
            }
                
    return (res > 2000000000 ? -1 : (int)res);
}
</pre>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
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
