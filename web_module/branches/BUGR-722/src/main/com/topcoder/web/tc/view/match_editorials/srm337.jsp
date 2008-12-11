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
    <A href="/stat?c=round_overview&er=5&rd=10661">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506227" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 337</span><br>Saturday, February 3, 2007
<br><br>

<h2>Match summary</h2>

This match was a mix of some classical but tough hard problems with a couple of ad-hoc
and tricky (but less difficult) easy and medium problems. The trickyness, however, led
to an entertaining challenge phase, with the top 3 in each division earning at least +50 points from challenges.
<br /><br />
Division 1 got off to a quick start as some coders breezed through the first two problems, though
many had to put on the brakes and spend a little extra time in one or both of the problems to get the 
corner cases worked out right. As they moved on to the hard problem, most coders put in a fair amount of time but only
11 could get some points out of it -- and none of them too quickly -- because of the detailed
code required. At the end, <tc-webtag:handle coderId="11829284" context="algorithm"/>
took home the win by less than 30 points, thanks to his three successful challenges.
<tc-webtag:handle coderId="10574855" context="algorithm"/> came in second, despite not particularly fast solutions on the easy and the hard, thanks to +125 on challenges
and the fall of some rivals' solutions. <tc-webtag:handle coderId="15878380" context="algorithm"/> followed in third with one successful challenge
and a solid performance on all three problems.
<br /><br />
In Division 2, many coders finished all three problems correctly and it all came down to challenges. <tc-webtag:handle coderId="20280511" context="algorithm"/> had an impressive challenge round, earning +550 points to secure first place with a wide margin. Second place went to <tc-webtag:handle coderId="15511417" context="algorithm"/>, with +225 and a fast solution on
the hard. Third went to <tc-webtag:handle coderId="22671864" context="algorithm"/>, who solved all problems quickly but racked up "only" +125 in the challenge phase.
<br /><br />

<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7406&amp;rd=10661" name="7406">Palindromize2</a></b>
</font>
<A href="Javascript:openProblemRating(7406)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506227" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
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
      568 / 647 (87.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      531 / 568 (93.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>exod40</b> for 249.23 points (1 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      212.40 (for 531 correct submissions)
    </td>
  </tr>
</table></blockquote>


This problem was fairly easy, with examples covering almost every possibility. Most coders were able to eventually solve it,
though many solutions took a while to appear.
<br /><br />

The basic idea was to iterate every pair of "matching" letters in the
palindrome (the first one with the last one, the second one with the one before the last one, etc) and see
if it needed to be corrected. If that was the case, it could always be corrected by changing exactly one of
the letters to the other. Of course, to make it lower alphabetically, you always wanted to use the first of
the two letters in the alphabet.
<br /><br />

For a detailed implementation see <tc-webtag:handle coderId="20036294" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&cr=20036294&rd=10661&pm=7406">solution</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7417&amp;rd=10661" name="7417">CardStraights</a></b>
</font>
<A href="Javascript:openProblemRating(7417)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506227" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      376 / 647 (58.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      91 / 376 (24.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>.Bibby.</b> for 468.32 points (7 mins 29 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      266.78 (for 91 correct submissions)
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
      478 / 497 (96.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      264 / 478 (55.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ctgPi</b> for 246.06 points (3 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      184.38 (for 264 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem proved very tricky for coders of both divisions, with many flawed solutions failing both
in the challenge phase and in system tests. Coders who could see the problem's many corner cases were able to rack up many
points in challenges.
<br /><br />

There are many correct approaches to solving the problem, all more or less alike. The first thing
to notice is that you can always use all jokers, so you must do so. There are 2 cases, either the
straight is made only with jokers or it starts in a regular card (this overlooks the fact that is not valid
to use a joker after a 1000000, but since we can also place jokers at the beginning there is no problem
with that).
<br /><br />

The first step for implementation is to parse the input, count the jokers, and sort the regular cards, eliminating
the repeats (which are of course useless). Initialize the maximum in the number of jokers, and then
try a straight starting in each of your regular cards. Construct the longest straight that starts there
in the following way: If you have the next necessary card, use it; if not, use a joker. When you have
neither a card nor a joker left, take that length and update the running maximum. Finally, just
return the maximum.
<br /><br />

To see this approach implemented check out <tc-webtag:handle coderId="21223451" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&cr=21223451&rd=10661&pm=7417">code</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7407&amp;rd=10661" name="7407">AnagramList</a></b>
</font>
<A href="Javascript:openProblemRating(7407)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506227" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      52 / 647 (8.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 52 (55.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ice-man</b> for 772.26 points (20 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      598.39 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>

This was a classical but tough problem for a Division 2 hard, and the unusual point total may have frightened some coders  -- nevertheless, many were able to get it right, including some with plenty of time
to spare.
<br /><br />

The idea for this problem was based on mathematical knowledge. To avoid processing
a lot of permutations (anagrams) that are not needed, the idea is to get a character of the solution at a time,
from left to right. Since you can easily count the number of possible anagrams for a given set of letters -- if
you have n letters it's n!/(a<sub>1</sub>!*...*a<sub>k</sub>!) where a<sub>i</sub> is the number of times a given
letter appears (for instance, the number of permutations/anagrams of string "aaabbc" is 6!/(3!*2!*1!)).
<br /><br />

With this in mind, we know that the total number of anagrams that start with an A can be calculated by removing
an A from the original set and using the expression above. If <b>i</b> is less than that total, then we know
that the result starts with an A, and we can calculate the rest recursively. If not, then we should try some
other letter (B, then C, etc, ignoring the ones that do not appear in the current set) and keep adding the
number of further anagrams that start with that letter to a running total until it exceeds <b>i</b>. The last
one we used to make it exceed <b>i</b> is the letter to use, and then solve recursively
by substracting the previous total (right before <b>i</b> was exceeded) to <b>i</b> for reindexing things.
<br /><br />

See <tc-webtag:handle coderId="20280511" context="algorithm"/>'s recursive
<a href="http://www.topcoder.com/stat?c=problem_solution&cr=20280511&rd=10661&pm=7407">implementation</a> or
<tc-webtag:handle coderId="15511417" context="algorithm"/>'s iterative
<a href="http://www.topcoder.com/stat?c=problem_solution&cr=15511417&rm=263488&rd=10661&pm=7407">one</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7473&amp;rd=10661" name="7473">BuildingAdvertise</a></b>
</font>
<A href="Javascript:openProblemRating(7473)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506227" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      292 / 497 (58.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177 / 292 (60.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lovro</b> for 488.56 points (4 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      315.97 (for 177 correct submissions)
    </td>
  </tr>
</table></blockquote>

There were many ways to solve this problem, so I will outline one that I did not see when I reviewed some of the faster solutions.
<br /><br />

Let's start with an obvious divide & conquer O(N^2) solution. First, find (one of) the smallest building i.
Now we know that the rectangle is either that high with the whole width or is entirely to the left or to the
right of that building, so we have two smaller instances of the same problem which we can recursively solve.
Of course, for a base case, if the skyline is empty (has width = 0) we just return 0.
<br /><br />

Now, this has O(N^2) running time because we need O(N) to search for the minimum height in each subproblem
(always represented by an interval). As you can read in
<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor#Range_Minimum_Query_(RMQ)">this
tutorial</a>, the input can be preprocessed in linear time to find such a minimum in logartihmic time, getting
to an overall runtime of N log N, which was enough to solve the problem.
<br /><br />

If you don't know about RMQ or don't want to implement that, you can just sort the buildings by height and
process them from shortest to tallest, adding the x coordinate to a set of already processed buildings (which
is to be initialized with -1 and n as borders). When processing the building at x with height h, we seek the
maximum element less than x (mn) in the set and the minimum element greater than x (mx), so we know the width of the
greatest rectangle we can make of height h that passes through x will have a width of (mx-mn-1), so we update
our current best result with (mx-mn-1)*h. This is the same as the first presented algorithm (try to see why for yourself)
and has an N log N runtime (for this to be true, we need a set that provides insertion and looks for upper bound and lower
bound in logarithmic time, which at least C++ set and Java TreeSet have). Java code for this approach follows
(here <tt>proc</tt> is the function that generates the input):

<pre>
class bd implements Comparable {
	public long h; int x; public bd(long h, int x) { this.h=h; this.x=x; }
	public int compareTo(Object o) { return (int)(h-((bd)o).h); }
}
public long getMaxArea(int[] hh, int n) {
	long[] h=proc(hh,n);
	bd[] bds=new bd[n];
	for(int x=0;x&lt;n;++x) bds[x]=new bd(h[x],x);
	Arrays.sort(bds);
	SortedSet&lt;Integer&gt; s=new TreeSet&lt;Integer&gt;();
	long r=0; s.add(-1); s.add(n);
	for(bd b : bds) {
		int mn=s.headSet(b.x).last(),mx=s.tailSet(b.x).first();
		r=Math.max(r,b.h*(mx-mn-1));
		s.add(b.x);
	}
	return r;
}
</pre>

There were several other approaches ranging from linear time and space to N log<sup>2</sup> N; you can find many
solutions with different methods in the <a href=http://www.topcoder.com/stat?c=round_overview&er=5&rd=10661>match overview</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7418&amp;rd=10661" name="7418">CountPalindromes</a></b>
</font>
<A href="Javascript:openProblemRating(7418)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506227" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      27 / 497 (5.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 27 (40.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pashka</b> for 620.83 points (25 mins 47 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      483.25 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

This was a classical problem that proved to be tough enough. Even though many coders quickly saw that
a solution involved dynammic programming (or memoized recursion) and had several minutes to work on
it, only 11 coders were able to get a correct solution before the coding phase ended.
<br /><br />

The easiest way to see the problem is this: Construct the palindrome from the edges (left and right) to
the center. At all times, you must match each letter with its corresponding letter of the other half.
Suppose you currently have something like "abcd" on the left side and "fedcba" on the right side -- you need to add something on the left side that starts with "fe.&quot; In this fashion, we'll keep track of the side that has more letters and try to compensate for them by adding to the other side. We also need to keep track of the maximum number of letters we have left so that we don't go over.
<br /><br />

Restrict the function: At all times you have the maximum number of letters (between 0 and 100), the side
where the exceeding part is (left or right) and the exceeding string. Since the exceeding string is always
a prefix of a word in <b>words</b> for the left side or a suffix for the right side, there are 50x15 possibilities.
With this we get an overall domain of 101x2x50x15 = 151500, which is pretty reasonable.
<br /><br />

First, the base case: If the exceeding (sub)string is a palindrome, then the currently running total is a
palindrome, so we add 1. If the maximum number of letters is less than zero, then we return 0, because
the currently running total is not valid.
<br /><br />

For the recursive case, we iterate all words and see if they match the current exceeding string, and if
they do, we recursively try what happens if we append this to the proper side and add the number of
palindromes that result from doing that to the result (see that we have two cases here --
either the exceeding string is longer than the used word, so we only have shortened it but keep exceeding in
the same side, or it is longer, which means we have to switch sides). This process can be done
50x15 times (50 to iterate all words and 15 to check if it matches the exceeding part), getting an overall
running time of 151500x50x15 = 113625000. This may seem like a little much to rely on, but a quick look at the function will
make you realize that many parts of the domain will never be visited, so the actual runtime will be much lower
than the upper bound. If you do some sorting you could get this 50x15 reduced to 50+15, but it requires
some intricate work and preprocessing. Also, if you preprocessed for the possible matchings of each pair of words,
you could cut this upper bound down by a constant of 1/15.
<br /><br />

See the <a href="http://www.topcoder.com/stat?c=problem_solution&cr=15881985&rd=10661&pm=7418">solution</a>
<tc-webtag:handle coderId="15881985" context="algorithm"/> used for a clear example of implementation.
<br /><br />

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
