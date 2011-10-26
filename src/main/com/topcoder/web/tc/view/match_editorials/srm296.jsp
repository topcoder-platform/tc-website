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
<tc-webtag:forumLink forumID="505862" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 296</span><br>Monday, April 3, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
This was one of the last SRMs before the ACM-ICPC World finals in San Antonio. 
Petr, who earned 2 gold medals in his two ACM finals, added another SRM win to his perfect record.
krijgerje was second, almost 400 points from Petr, while bmerry, misof and xOberon rounded out the top five.
</p> 
<p>
In Division 2, first-timer tuan won a really tough race against otoc (1948 points against 1940), followed by Gevor, ikabiljo and 
cypressx. All these coders will compete in Div 1 next time.
</p> 
 
<H1> 
The Problems
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6084&amp;rd=9817"
name="6084">EratosthenSieve2</a></b> 
</font> 
<A href="Javascript:openProblemRating(6084)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505862"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
    320 / 421 (76.01%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    279 / 320 (87.19%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>cypressx</b> for 246.89 points (3 mins 11 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    177.09 (for 279 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
Choosing the proper data structure is the key for this problem.
The problem asks you to take a ordered list of numbers, 
remove a number of elements from the middle of this list,
and return the k-th element in the resulting list.
All these operations are supported by LinkedList (java, std::list for C++):
<pre>
public class EratosthenSieve2 {
     public int nthElement(int n) {
       List<Integer> lst = new LinkedList();
       for (int i = 0; i < 1000; i++) lst.add(i + 1);
       for (int i = 2; i <= 10; i++) {
         int pos = 0;
         while (pos < lst.size() - i + 1) {
           pos += (i - 1);
           lst.remove(pos);
         }
       }
       return lst.get(n - 1);
     }
}
</pre>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6082&amp;rd=9817"
name="6082">DollSets</a></b> 
</font> 
<A href="Javascript:openProblemRating(6082)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505862"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
    250 / 421 (59.38%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    101 / 250 (40.40%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>cypressx</b> for 491.11 points (3 mins 50 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    373.04 (for 101 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
The first thing to do in this problem is to sort the input list. 
Then, you can apply the greedy approach, looking at dolls in increasing order from the smallest 
one and checking if you can form a set containing the current one.
If you can - form it, and mark both dolls as "used". 
The correctness of this approach can be proven by contradiction 
(assume that the greedy approach fails at some point, choose the smallest doll on which it fails and prove that you can't build anything better than greedy does).
Java implementation of this approach follows:
</p>

<pre>
  public int maximumQuantity(int[] data, int K) {
    Arrays.sort(data);
    boolean[] used = new boolean[data.length];
    int ans = 0;
    for (int i = 0; i < data.length; i++) if (!used[i]) {
      for (int j = i + 1; j < data.length; j++) if (!used[j] && data[j] == K * data[i] && !used[i]) {
        used[j] = used[i] = true;
        ans++;
        break;
      }
    }
    return ans;
  }
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6085&amp;rd=9817"
name="6085">NewAlbum</a></b> 
</font> 
<A href="Javascript:openProblemRating(6085)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505862"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
    217 / 421 (51.54%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    19 / 217 (8.76%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Hutafeng</b> for 967.21 points (5 mins 15 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    635.79 (for 19 correct submissions) 
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
    290 / 305 (95.08%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    67 / 290 (23.10%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>marek.cygan</b> for 244.87 points (4 mins 7 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    185.72 (for 67 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
This problem looked misleadingly easy, so a lot of coders missed some special cases and failed it.
Only 23 % of D1 and less than 10% of D2 submissions passed system tests.
</p>
<p>
Coders had two major possibilities - write a simple DP-solution or 
shoot for a constant-time solution. 
The former is easier and faster, the latter is challenging.
</p>
<p>
The first choice was simple for experienced topcoders. 
Keep an array representing the optimal answer for each number of songs between 1 and <b>nSongs</b>.
The base for the DP will be the case with 0 songs, which obviously requires 0 disks.
Then iterate from smaller numbers to larger ones, trying to fit every possible number of songs on a disk:
</p>
<pre>
int[] res = new int[nSongs + 1] ;
int realCapacity = (cdCapacity + 1) / (length + 1) ;
for (int i = 1; i <= nSongs; i++) {
  res[i] = 100000000 ;
  for (int j = 1; j <= Math.min(realCapacity, i); j++)
  if (j % 13 != 0)
    res[i] = Math.min(res[i], 1 + res[i - j]) ;
}
return res[n];
</pre>
<p>
If you are bored with DP, the problem can be solved in another way.
First, compute the maximal number of songs which can be written on a CD (taking into account the non-divisible-by-13 rule).
Then, greedily write all songs and see how many songs are written on the last disk.
If the number of songs on the last disk is not divisible by 13, we are done.
If it is divisible, need to change the number of songs on this disk. 
To reduce it, you'll need another disk to write the song (because all previous disks already full).
To increase the number of songs on this disk, you need to get one song from any other disk.
This is always possible with an exception for two cases - either you have exactly one disk (so there is no "other" disk to take a song from),
or all other disks have exactly 1 song more than the last one (so moving the song will not change anything).
Clearly, the latter 2 cases require 1 disk more than we expected.
See Petr's <a href="http://www.topcoder.com/stat?c=problem_solution&rm=248156&rd=9817&pm=6085&cr=10574855">solution</a> for a clean implementation of this approach.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6086&amp;rd=9817"
name="6086">StringReplacements</a></b> 
</font> 
<A href="Javascript:openProblemRating(6086)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505862"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
    174 / 305 (57.05%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    83 / 174 (47.70%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Petr</b> for 441.36 points (10 mins 38 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    258.05 (for 83 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be split in two parts. 
First, you need to know how many 'a's, 'b's and 'c's will be generated from the first letter after N steps.
Second, you need only those letters which are between left and right characters.
Lets solve these parts one by one.
</p>
<p>
The first part can be solved using Dynamic Programming. The state for this DP will be (letter, t = number of seconds left), 
and the result will be an array of 3 integers (representing the number of 'a's, 'b's and 'c's in the final string received from letter after t seconds). 
If letter c is replaced by string "ABC", then f(c, n) will 
be equal to the sum of f(A, n - 1) + f(B, n - 1) + f(C, n - 1):
<pre>
  int[][] move = {{0, 2, 1}, {1, 0, 0}, {1, 2, 1}};
  long[][][] memo = new long[nSeconds + 1][3][3];
  long[] total(int level, int what) {
    if (memo[level][what][0] != -1) return memo[level][what];
    Arrays.fill(memo[level][what], 0);
    if (level == 0) {
      memo[level][what][what] = 1;
      return memo[level][what];
    }
    for (int i = 0; i < 3; i++) {
      long[] r = total(level - 1, move[what][i]);
      for (int j = 0; j < 3; j++) memo[level][what][j] += r[j];
    }
    return memo[level][what];
  }

</pre>
</p>
<p>
One can easily see that any single-letter string will become a string 
of 3<sup>k</sup> characters after k seconds.
For example, let the input string be "a".
Since each 'a' is replaced by "acb", then each of 'a', 'c' and 'b' will end up in a string of 3<sup>k - 1</sup> characters after (k - 1) replacements.
Therefore the first 3<sup>k - 1</sup> characters of the answer will be the characters received from string "a" after (k - 1) replacements,
next 3<sup>k - 1</sup> characters will be received from "c", and, finally, 
the last 3<sup>k - 1</sup> characters will be received from "b".
In other words, "a" will create the substring [0, 3<sup>k - 1</sup>) of the final string,
"c" will create the substring [3<sup>k - 1</sup>, 2*3<sup>k - 1</sup>), and "b" will create the last third ([2*3<sup>k - 1</sup>, 3<sup>k</sup>)).
To find the answer for string "a" and k replacements, we find the intersections of [left, right] with each of three substrings. 
For each of these intersections, we recursively proceed to the case with the smaller time left, and sum up the results:
<pre>
  long[] solve(int level, int what, long left, long right) {
    if (left >= right) 
  return new long[3];
    if (left <= 0 && right >= Math.pow(3, level)) 
  return total(level, what);
    long[] ans = new long[3];
    long tot = 0;
    for (int i = 0; i < 3; i++) {
      long[] add = solve( level - 1, 
    move[what][i], 
    Math.max(0, left - tot), 
    Math.min(right - tot, Math.round(Math.pow(3, level - 1))));
      tot += Math.pow(3, level - 1);
      for (int j = 0; j < 3; j++) ans[j] += add[j];
    }
    return ans;
  }
</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6191&amp;rd=9817"
name="6191">ColoredBricks</a></b> 
</font> 
<A href="Javascript:openProblemRating(6191)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505862"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
    66 / 305 (21.64%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    25 / 66 (37.88%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>AdrianKuegel</b> for 687.28 points (21 mins 19 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    536.72 (for 25 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
Lets start from dissecting this problem into parts. 
First, given two bricks, we need to check whether they look the same.
Second, given the coloring of a brick, we need to find the fastest time to make all bricks look exactly the same as this coloring. 
Third, we need to optimize this approach a bit to make it run within 2 seconds.
Now lets go through these steps one by one.
</p>
<p>
First, to determine whether two bricks look the same we need to check every possible rotation of a brick.
This is the same as to find every all bricks which look the same as "012345". 
My way to go here was to emulate two basic rotations of the brick and construct all possible rotations using these basic ones:
<pre>
int[] rotateLeft = {3, 0, 1, 2, 4, 5};
int[] rotateFront = {5, 1, 4, 3, 0, 2};
int[] apply(int[] o, int[] what) {
  int[] ans = new int[6];
  for (int i = 0; i < 6; i++) ans[i] = o[what[i]];
  return ans;
  }
....
  for (int i1 = 0; i1 < 4; i1++) 
    for (int j1 = 0; j1 < 4; j1++) 
  for (int k1 = 0; k1 < 4; k1++) {
    int[] pos = new int[6];
      for (int i = 0; i < 6; i++) res[i] = i;
      for (int i = 0; i < i1; i++) res = apply(res, rotateLeft);
      for (int i = 0; i < j1; i++) res = apply(res, rotateFront);
      for (int i = 0; i < k1; i++) res = apply(res, rotateLeft);
      } // The rotation will be stored in <b>res</b>.
....
</pre>
Of course, there existed other ways. For example, misof was lucky to have a nice box nearby, so he just precoded all possible rotations. 
Anyway, if you want compare two boxes, you need to apply all possible rotations to one box, leaving the other one immovable, 
and compare the colors of all faces after each rotation.
</p>
<p>
The next step is to find the optimal repainting of one brick into another. 
This also can be done with the list of transformations mentioned above. 
Rotate one of the bricks and compute the number of different faces between the bricks (the second brick isn't rotated).
The rotation with the smallest number of non-equal faces wins. 
To find the best answer for all bricks, 
iterate through all 7<sup>6</sup> possible colorings of a brick. 
For each coloring, iterate through all rotations of all input bricks, sum the optimal repaitings for each brick and return the minimal of these sums.
Its worth mentioning that the best answer may require repainting at least one face on each brick, 
so we can't just check the N colorings of our bricks, and must verify all 7<sup>6</sup> choices.
Now lets look how this process can be optimized.
</p>
<p>
First, we can save all possible rotations in an array - so we don't need to generate them all the time.
Second, we may try the same coloring several times. 
To avoid this, hash all colorings into ints and save each coloring (with all possible rotations) in an array of boolean.
Third, we can optimize the process of finding the answer for each of the colorings.
The simple way to code this is the following:
<pre>
int ans = 6 * N;
for each coloring {
  int sum = 0;
  for brick i between 0 and N - 1{
  int opt = 6;
  for each rotation j
    opt = min(opt, score for brick i with rotation j)  
  sum += opt
  }
  ans = min(ans, sum)
  }
</pre>
This code requires 7<sup>6</sup> * N * 24 comparisons of bricks (each brick comparison takes 6 int comparisons), 
and for each of these comparisons we need to perform a rotation of a brick.
The way to speed it up is to rotate the coloring only instead of rotating each of the bricks (keeping the best result for each brick):
<pre>
int ans = 6 * N;
for each coloring {
    int[] res = new int[N]; // Fill this array with big values
  for each rotation j
  rotate the coloring to get new coloring v
  for brick i between 0 and N - 1{
    int val = score for brick i and coloring v
    res[i] = min(res[i], val)
    }
  }
  ans = min(ans, sum of all values in res)
  }
</pre>
Here, we need the same number of comparisons (7<sup>6</sup> * N * 24), but a much smaller number of rotations (7<sup>6</sup> * 24).
This is more than enough to make it work in time even for slow java and C#.
</p><div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">

  By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
