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
    <A href="/stat?c=round_overview&er=5&rd=10010">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506005" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 330</span><br>Wednesday, December 13, 2006
<br><br>

<h2>Match summary</h2>


Registration for this match closed with 786 registrants, a relatively low number compared to recent SRMs, but excitement
was high nonetheless thanks to the participation of 5 targets, including the top 4 highest-rated coders in TopCoder's algorithm standings. After the room assignments were done, we were thrilled to see the ultimate challenge in
room 1 with both <tc-webtag:handle coderId="10574855" context="algorithm"/> and
<tc-webtag:handle coderId="144400" context="algorithm"/>
together.
<br />
<br />
In Division 1 <tc-webtag:handle coderId="10574855" context="algorithm"/> got the lead in the coding
phase thanks to fast solid submissions in all problems, including the fastest submission in the hard.
<tc-webtag:handle coderId="310333" context="algorithm"/>
was near the victory thanks to his challenges, but
a successful one by <tc-webtag:handle coderId="10574855" context="algorithm"/> left him in second
place. To complete the podium was
<tc-webtag:handle coderId="19849563" context="algorithm"/>
, who had a good problem-solving night but lost a couple of
points in the challenge phase.
<br />
<br />
Division 2 was a similar story, with <tc-webtag:handle coderId="19852194" context="algorithm"/>
taking the lead thanks to a strong peformance in the coding
phase. <tc-webtag:handle coderId="15053601" context="algorithm"/>, in second place, and 
<tc-webtag:handle coderId="15088978" context="algorithm"/>, in third, were both within
 a successful challenge of the win.

<H1>The Problems</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7263&amp;rd=10010" name="7263">Sortness</a></b>
</font>

<A href="Javascript:openProblemRating(7263)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506005" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      349 / 372 (93.82%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      344 / 349 (98.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>chouxiaowen</b> for 248.17 points (2 mins 26 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      220.14 (for 344 correct submissions)

    </td>

  </tr>

</table></blockquote>

The easiest approach was to iterate every number, calculating its sortness and then adding up
all results, divide by the length of the input sequence, and that's it. This could be done
with 2 simple loops as illustrated by <tc-webtag:handle coderId="19852194" context="algorithm"/>'s
<a href=http://www.topcoder.com/stat?c=problem_solution&rm=263018&rd=10010&pm=7263&cr=19852194>code</a>.
<br />
<br />
Thinking a little leads to a somewhat simpler implementation. If you realized the fact that
each pair of numbers was accounted only if they were disordered, and it was accounted
twice in the total, you could just add 2 to a running total for each pair that was
disordered and then divide by the length.
<br />
<br />

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7256&amp;rd=10010" name="7256">Arrows</a></b>

</font>

<A href="Javascript:openProblemRating(7256)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506005" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">

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

      303 / 372 (81.45%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      157 / 303 (51.82%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>leiz</b> for 440.19 points (4 mins 15 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      332.91 (for 157 correct submissions)

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

      362 / 367 (98.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      266 / 362 (73.48%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 247.98 points (2 mins 34 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      220.98 (for 266 correct submissions)

    </td>

  </tr>

</table></blockquote>

This problem was pretty straightforward, but required a careful implementation in order
to work with every detail. There are several ways to do it. You could iterate over all substrings
and then check if each of them was an arrow and, if it was, record its length. You could also
try extending every &gt; or &lt; as much as possible. The easiest way I've seen was to produce
every possible arrow (there are 4*50=200 of them, taking into account every type and length)
and then check if the arrow is present (since every language has an embedded function to look
for substrings in a string, this was a trivial task) and record the maximum length of a found
arrow. C++ code for this approach follows:

<pre>
int r=-1; string a,b;
for(int l=1;l&lt;=50;l++) {
   if ( s.find(a+"&gt;") != -1 ) r=l;
   if ( s.find(a+"&lt;") != -1 ) r=l;
   if ( s.find(b+"&gt;") != -1 ) r=l;
   if ( s.find(b+"&lt;") != -1 ) r=l;
   a+="-"; b+="=";
}
return r;
</pre>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7257&amp;rd=10010" name="7257">NextPalindromicNumber</a></b>

</font>

<A href="Javascript:openProblemRating(7257)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506005" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      169 / 372 (45.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      43 / 169 (25.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>wongiseng</b> for 916.12 points (8 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      556.48 (for 43 correct submissions)

    </td>

  </tr>

</table></blockquote>

Noting the possible sizes of the input, its pretty clear that thinking on numbers
was not the way to go. Even if you have big integer arithmetic already coded (or
use Java), adding 1 to the lower bound until a palindromic number is found was too
slow (a simple input of 25 9s followed by 25 0s lead to 10<sup>25</sup> iterations).
<br />
<br />
The approach that's left is to think on the form of the palindromic numbers. First
we can see that the biggest number of a given length (all nines) is a palindromic
number. This means that, if we treat that case separately (which is pretty easy,
because in those cases the answer is 100...001 with as little zeroes as needed
to have greater length) we are left with a case in which the return has exactly the
same length as the input.
<br />
<br />
Now, let's suppose we have both the input number and the answer, and we seek, from
left to right, the first position at which they differ. Of course, the
digit in that position in the result must be strictly greater than the digit in the
input. We also want that position to be as far to the right as possible, to keep
the result low. The lowest palindromic number that has the first half equal to the
input is the result of taking that half and appending its reversed form (if the
number of characters in the input n is odd), then taking the first (n-1)/2 characters,
then the middle character, and then the first (n-1)/2 again, but reversed. If this
number is greater than the input, we are done. If not, we have to add 1 to the middle
or both middle (in case n is even) digits and we are done (you can see this will surely
result in a number greater than the input).
<br />
<br />
Wait! What if the middle or both middle digits are 9? Well, in that case, we turn them to
zero and add 1 to the first character to the left and the first to the right. If those
are also zero, we turn them to zero and move again to the left and right.
<br /><br />
An example of the behavior as explained so far:<br/>
Input: 123999456<br />
First result: 123999321<br />
Since this is not greater than the input, we continue.

<pre>
123999321      ->   123909321     ->   123000321  -> 12400421
    ^                  ^ ^               ^   ^
middle digit        move to the
                   right and left
</pre>

Note that eventually you'll reach a non-9 number because the input is not all 9s, so
if the first result IS all 9s, it will be greater than the input and you'll return
that without reaching the "increase the middle" part. For a clear solution, see
<tc-webtag:handle coderId="11880662" context="algorithm"/>'s
<a href=http://www.topcoder.com/stat?c=problem_solution&rm=263018&rd=10010&pm=7257&cr=11880662>implementation</a>.
<br /><br />


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7255&amp;rd=10010" name="7255">PrefixFreeSubsets</a></b>
</font>

<A href="Javascript:openProblemRating(7255)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506005" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      227 / 367 (61.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      176 / 227 (77.53%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Triple_M</b> for 496.59 points (2 mins 21 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      332.21 (for 176 correct submissions)

    </td>

  </tr>

</table></blockquote>


This problem had a pretty simple theoretical solution that lead to a lot of different
implementations. The basic idea was to insert every word into a
<a href="http://en.wikipedia.org/wiki/Trie">trie</a>. Then you would simply have a tree
in which some nodes are marked (the ones in which a word ends). For those, you need
to find the number of subsets S such that no node in S has a predecessor in S (note
that in a trie predecessor nodes represent prefixes).
<br />
<br />
This can be done recursively. For a node, the number of subsets on the subtree that
starts on it is simply the product of the same function on all its childs, because
they are all prefix independent. If a node is marked (i.e., represents a word in
<b>words</b>) then add 1 to that product to represent the subset that contains that
word (since the word represented is a prefix of all its childs, there is no way to
combine those).
<br />
<br />
The actual implementation varied a lot from one coder to the other. As a trick, it
was good to notice that in a sorted (in lexicographic order) array, all prefixes
appear before their predecessors. Also, if the subsets are seen as subsequences of
the sorted sequence, each subset only needs to check consecutive elements to see
if it is prefix-free (think for a while on why this happens). This leads to a really
short dynammic programming solution. You can see <tc-webtag:handle coderId="10509376" context="algorithm"/>'s
<a href=http://www.topcoder.com/stat?c=problem_solution&rm=263006&rd=10010&pm=7255&cr=10509376>submission</a>
for a clear example of this refined approach.
<br /><br />


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6856&amp;rd=10010" name="6856">LongLongNim</a></b>
</font>

<A href="Javascript:openProblemRating(6856)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506005" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      103 / 367 (28.07%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      46 / 103 (44.66%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 864.48 points (11 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      563.37 (for 46 correct submissions)

    </td>

  </tr>

</table></blockquote>

This problem was inspired, of course, in the old good
<a href="http://en.wikipedia.org/wiki/Nim">Nim</a> with some simplified rules, but
also with a really really really long duration.
<br />
<br />
The way to solve the game is pretty easy. Since there are no ties and the game
is always finite, we know that for each <i>n</i> either there is a winning strategy
for the first player or there is a winning strategy for the second player. We'll call
<i>n</i> a winning (W) state if the player in turn wins when <i>n</i> coins are left and
losing (L) otherwise. Of course all <i>n</i> that are less than the minimum element in
<b>moves</b> are L. Then, each <i>n</i> is W if and only if there exists an element <i>m</i>
in <b>moves</b> that is less than or equal to <i>n</i> and such that <i>n</i>-<i>m</i> is
L (this means, there is a valid play that leaves a losing state to your rival). This
leads to a straightforward implementation which gets the fact calculated for every
<i>n</i> in O(<b>maxN</b>*<i>k</i>) where <i>k</i> is the number of elements on
<b>moves</b> (the <i>k</i> factor could even be eliminated by doing bit tricks). Since
<b>maxN</b> is insanely big, we need something even better.
<br />
<br />
The first thing to notice in the constraints is the 22 as the maximum move. This was
a big clue to the solution. As you can see from the previous paragraph, each <i>n</i>
only depends on the previous states <i>n</i>-<i>m</i> with <i>m</i> in moves. Since
the maximum <i>m</i> is 22, we can say <i>n</i> depends in the state of <i>n</i>-1,
...,<i>n</i>-22. This can be represented as a 22 character long string of W's and L's
(or as a binary number). Not only <i>n</i> depend only on that 22 character long string,
the entire behavior from that moment on depends only on those 22 characters, because
the string in which <i>n</i>+1 depends is simply appending the state of <i>n</i> at the
end and removing the first character (that becomes unnecessary, because is more than 22
away from <i>n></i>+1). Altogether, this means that after at most 2<sup>22</sup> numbers
there's an indentifiable cycle, which can be used to calculate the rest of the moves
without doing all the process. See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=262996&rd=10010&pm=6856&cr=10574855">code</a>
for a clear implementation.

<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
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
