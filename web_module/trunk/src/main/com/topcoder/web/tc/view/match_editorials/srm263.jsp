<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

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
<%--
<tc-webtag:forumLink forumID="505001" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505762">Discuss this match</A></div>
<span class="bodySubtitle">SRM 263</span><br>Wednesday, September 14, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
For Division 1 coders, Wednesday's SRM proved to be quite challenging.
krijgertje took home the gold on a problem set with a 500-pointer solved
by only 44 coders, and a 1050-pointer
solved by no one. The problem set didn't sit well with tomek, whose
resubmission of the easy problem (and unsuccessful attempt at
solving the medium using a probabilistic algorithm) dropped his rating
to 2996, causing him to lose his target for the first time in two years.</p><p>
Meanwhile in Division 2, loveislife breezed through all three problems in a
whopping 33 minutes and made two successfully challenges, beating second-place
finisher onyx by over 65 points. Newcomers eric0 and elimgta took third and
fourth place, respectively.
</p>
<H1>
The Problems
</H1>
<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4772&amp;rd=7997" name="4772">Party</a></b>
</font>
<A href="Javascript:openProblemRating(4772)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      221 / 342 (64.62%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183 / 221 (82.81%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>vlad_D</b> for 242.05 points (5 mins 11 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      166.03 (for 183 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The fastest way to solve this problem is to build a table of which
people know which names, and simply walk through each handshake from first to
last, updating the values in the table. The table can be stored as a two
dimensional array of boolean values, or as an array (or map) of integer sets.
Java code follows:
<pre>
public double averageNames(int n, int[] personA, int[] personB) {
  boolean[][] know = new boolean[n][n];
  for (int i=0; i < n; ++i)
    know[i][i] = true; // everyone knows their own name
  for (int i=0; i &lt; personA.length; ++i)
    for (int j=0; j &lt; n; ++j)
      if (know[personA[i]][j] || know[personB[i]][j])
        know[personA[i]][j] = know[personB[i]][j] = true;
  double total = 0;
  for (int i=0; i &lt; n; ++i)
    for (int j=0; j &lt; n; ++j)
      if (i != j && know[i][j])
        total += 1;
  return total / n;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4781&amp;rd=7997" name="4781">DVDPlayer</a></b>
</font>
<A href="Javascript:openProblemRating(4781)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      142 / 342 (41.52%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      104 / 142 (73.24%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>yiming</b> for 462.72 points (8 mins 11 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      278.07 (for 104 correct submissions)
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
      292 / 315 (92.70%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      270 / 292 (92.47%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>haha</b> for 239.44 points (6 mins 1 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      175.12 (for 270 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
To solve this problem, we must keep track of the matchings between DVDs and DVD
cases (including the DVD player, which can be treated as if it were a case).
Most solutions used a mapping of strings onto strings (HashMap&lt;String,
String&gt; in Java, or map&lt;string, string&gt; in C++) to keep track of this
mapping. It didn't matter whether the map's keys were the DVDs or the cases --
your program keeps track of the locations of DVDs in the first version, and the
contents of the DVD cases in the second version. Java code follows:

<pre>
public String[] findMovies(String[] moviesWatched) {
  Map&lt;String, String&gt; pos = new HashMap&lt;String, String&gt;(); // DVDs are the keys
  for (int i=1; i &lt; moviesWatched.length; ++i) {
    if (pos.containsKey(moviesWatched[i]))
      pos.put(moviesWatched[i-1], pos.get(moviesWatched[i]));
    else
      pos.put(moviesWatched[i-1], moviesWatched[i]);
  }
  List&lt;String&gt; ans = new ArrayList&lt;String&gt;();
  for (String s : pos.keySet()) {
    if (s.equals(moviesWatched[moviesWatched.length-1])
        || pos.get(s).equals(s)) continue;
    ans.add(s + " is inside " + pos.get(s) + "'s case");
  }
  String[] ans2 = ans.toArray(new String[0]);
  Arrays.sort(ans2);
  return ans2;
}
</pre>
</p>
<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=1776&amp;rd=7997" name="1776">Deque Sort</a></b>
</font>
<A href="Javascript:openProblemRating(1776)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      44 / 342 (12.87%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 44 (52.27%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>phoenixinter</b> for 870.73 points (5 mins 14 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      632.93 (for 23 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To start off, you know that the contents of each deque will need to always be
sorted, since they have to be combined into a single, sorted list at the end.
As it turns out, this problem can be solved with a simple greedy solution. All
you need are two arrays of ints to keep track of the first and last elements of each deque you've
created. Then you iterate through each element in data, and decide if you can
safely push it onto the front or back of any preexisting deque. You can safely push
<i>data[i]</i> onto the front of deque <i>d</i> if and only if there are no
numbers strictly between <i>data[i]</i> and <i>d.front</i> anywhere in the
data; the same is true about pushing onto the back of a deque. If you can't
safely push the number onto any deque, you have to create a new deque with it.
C++ code follows:
<pre>
int minDeques(vector&lt;int&gt; data) {
  vector&lt;int&gt; fronts, backs;
  for (int i=0; i < data.size(); i++) {
    bool hasBeenPushed = false;
    for (int j=0; j &lt; fronts.size(); j++) {
      bool isSafe = true;
      if (data[i] &lt; fronts[j])
        for (int k=0; k &lt; data.size(); k++)
          if (data[i] &lt; data[k] &amp;&amp; data[k] &lt; fronts[j])
            isSafe = false;
      if (isSafe) {
        fronts[j] = data[i];
        hasBeenPushed = true;
        break;
      }
      isSafe = true;
      if (data[i] &gt; backs[j])
        for (int k=0; k &lt; data.size(); k++)
          if (data[i] &gt; data[k] &amp;&amp; data[k] &gt; backs[j])
            isSafe = false;
      if (isSafe) {
        backs[j] = data[i];
        hasBeenPushed = true;
        break;
      }
    }
    if (!hasBeenPushed) {
      fronts.push_back(data[i]);
      backs.push_back(data[i]);
    }
  }
  return fronts.size();

</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1845&amp;rd=7997" name="1845">HardDequeSort</a></b>
</font>
<A href="Javascript:openProblemRating(1845)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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

      97 / 315 (30.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      44 / 97 (45.36%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 453.88 points (9 mins 14 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      274.41 (for 44 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
The only difference between this problem and DequeSort is that duplicate values are
permitted in HardDequeSort's data. Because of this, the greedy solution outlined
above will fail on inputs such as {3,6,0,9,6,3}. To solve this version, you can make a
copy of the input into a new list, sort this list, and remove all duplicates from it.
The elements of this new list ({0,3,6,9} for the above example) now correspond to the smallest, second smallest,
third smallest, etc. values that we observe in data. From here, you need to calculate
the largest deque that can be built which contains every instance of the
<i>n</i> smallest observed values. In the example above, you could successfully
build a deque out of all the 0's, and out of all the 0's and 3's, but it's
impossible to build a sorted deque with all the 0's, 3's, and 6's (processed in
the order specified in data, e.g. {3,6,0,6,3}). Afterwards, you simply increment the number of deques
you've built by one, remove all the 0's and 3's from the input data, and repeat
this process until the input data is empty.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4778&amp;rd=7997" name="4778">Robot Race</a></b>
</font>
<A href="Javascript:openProblemRating(4778)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1050
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 315 (0.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      0 / 2 (0.00%)
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
There were two parts to the solution of this problem. First, you have to figure
out how many seconds it would take for any robot to obtain any token on the
board. This time matrix can be built by running a breadth-first search of the
board starting at each robot. Once the time matrix is calculated, the second
part of this problem reduces to figuring out which tokens on a robot's list
will be impossible for him to reach in time. This seems hard at first, because
robot "a" might end up collecting token "X" even if robot "b" could reach it
faster, <i>if</i> robot "b" finds a higher-valued token for himself that he can
safely collect.</p><p>To solve this problem, imagine what would happen if every
robot attempted to collect his $100 token. Either every robot will end up with
a different token, in which case they all take home $100, or there will be at
least one token that is desired by multiple robots. Let's say robots "a" and
"b" both value token "X" at $100, but "a" can reach it within five seconds
while "b" takes seven seconds. At this point, robot "b" knows that he will never be
able to acquire token "X" -- either "a" will be holding the token by the time
"b" arrives, or another robot even faster than "a" will be holding it.
Therefore, "b" can cross his top choice, token "X", off his list. He then repeats the process,
now hoping to be the first one to collect his $99 token. Every time that
multiple robots desire the same token, one of them realizes that he will never
reach it in time. Therefore, this process is guaranteed to eventually
terminate.</p><p>For more information, try a Google search on [<a
href="http://www.google.com/search?q=stable%20marriage%20algorithm">stable
marriage algorithm</a>].
</p>
<p>
<img src="/i/m/LunaticFringe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="288584" context="algorithm"/><br />
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
