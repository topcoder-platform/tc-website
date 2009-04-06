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
    <A href="/stat?c=round_overview&er=5&rd=10672">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506238" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 348</span><br>Wednesday, May 9, 2007
<br><br>



<h2>Match summary</h2> 

<p>
The turnout for this match -- 839 competitors -- was the lowest since January, however
that couldn't stop it from being very exciting, as usual. Division 1 was 
won by <tc-webtag:handle coderId="10574855" context="algorithm"/>, with
a 200+ point gap over second place <tc-webtag:handle coderId="7442498" context="algorithm"/>
 and third place <tc-webtag:handle coderId="144400" context="algorithm"/>.
<br /><br /> 

Relatively standard easy and medium problems led to many coders being able
to approach the hard, and to very tight standings at the top after the coding
phase. However, as most of the hards failed during either the challenge or
the system test, only 12 coders got the hard right, and only 8 of them
got all three problems. The challenge phase was quite eventful as some of the 
competitors tried to improve their ranking, but the most notable change was 
<tc-webtag:handle coderId="144400" context="algorithm"/> losing his (ultimately) 
second place due to an unsuccessful challenge.
<br /><br /> 

Division 2 was won by newcomer 
<tc-webtag:handle coderId="22680746" context="algorithm"/>, 
jumping well into division 1 for the next match. He was followed
by <tc-webtag:handle coderId="21348911" context="algorithm"/>
and <tc-webtag:handle coderId="22660722" context="algorithm"/>.
<br /><br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7752&amp;rd=10672" name="7752">OptimalList</a></b> </font> <A href="Javascript:openProblemRating(7752)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506238" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      401 / 434 (92.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      361 / 401 (90.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Samlik</b> for 247.72 points (2 mins 44 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.23 (for 361 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem is strongly tied with the notion of the 
<a href="http://en.wikipedia.org/wiki/Cartesian_coordinate_system">Cartesian coordinate system</a>.
That is, no matter how complicated the sequence of instructions is, the location of the
grandma's house is uniquely determined by two integer numbers, called coordinates &mdash; how many
blocks should Billy walk horizontally (east or west) and how many blocks should he
walk vertically (north or south). Let's call the first number <i>dx</i>, and the
second number <i>dy</i>.
<br /><br />

We'll make <i>dx</i> positive if Billy needs to
walk east and negative if he needs to walk west (i.e., <i>dx</i>=-3 means
he needs to go 3 blocks west); positive <i>dy</i> will correspond to walking north.
To calculate <i>dx</i> then we need just to subtract the number of 'W's in the
input string from the number of 'E's in it, <i>dy</i> will be the number of 'N's
minus the number of 'S's.
<br /><br />

Once we've determined the coordinates of grandma's house, it becomes easier to
find the shortest path: we know the moves we should do horizontally (if <i>dx</i>
is positive, we need to walk only east, and not west, or else the path would not
be shortest; a similar argument applies in other cases) and vertically, so we're
practically there. The only thing left to do is to find the alphabetically first
sequence of moves &mdash; but that's straightforward: 'E's go before 'N's and 'S's,
'W's go after 'N's and 'S's.
<br />
<br />

See <tc-webtag:handle coderId="251184" context="algorithm"/>' <a href="/stat?c=problem_solution&rm=264737&rd=10672&pm=7752&cr=251184">solution</a> for
an example of implementing this approach.
<br /><br />

This approach can also be rephrased as the following greedy one: while
the current instructions string contains both 'W's and 'E's, remove one of each,
do the same for 'N's and 'S's. Sort the result and return as an answer. For an
implementation, see <tc-webtag:handle coderId="22647273" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264735&rd=10672&pm=7752&cr=22647273">code</a>.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7754&amp;rd=10672" name="7754">LostParentheses</a></b>
</font>
<A href="Javascript:openProblemRating(7754)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506238" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      270 / 434 (62.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      188 / 270 (69.63%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mi6091</b> for 486.14 points (4 mins 49 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      310.43 (for 188 correct submissions) 
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
      389 / 401 (97.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      344 / 389 (88.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 248.75 points (2 mins 1 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.36 (for 344 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem had several possible correct approaches. Arguably the easiest of
those was the following: the numbers before the first minus sign should
be added to the result, and the numbers after should be subtracted, as 
<a href="/stat?c=problem_solution&rm=264719&rd=10672&pm=7754&cr=22627975">coded</a>
by <tc-webtag:handle coderId="22627975" context="algorithm"/>. To understand
why this approach works, we need to prove two facts: that this result is
achievable, and that it is minimal possible. We can achieve that number by
putting brackets between consecutive minuses, as follows: 3+5+7-(2+3+10)-(99+57)-(22)-(2)-(3+4)
&mdash; that way all the numbers in the brackets are subtracted. We can't reduce
the result even further, as the numbers before the first minus get added to
the final result no matter how we put the brackets.
<br /><br />

If you've solved a lot of similar 'add-brackets' problems before, you
could easily skip this easy solution and go for a dynamic programming one.
That is, let's find the minimal possible and maximal possible values for
every substring of the input string that starts and ends with a number.
To find the minimum for a particular substring, we iterate over all
possibilities of which operator will be evaluated last. If that operator
is a '+', we need to take the minimum possible values of the strings
to the left of it and to the right of it, and add them. If it's a '-', we
need to take minimum on the left and maximum on the right. The maximum is computed
similarly. We can evaluate the minima and maxima in the order
of increasing substring length to be able to use previously computed
values, or we can implement the memoizing approach, like 
<tc-webtag:handle coderId="7442498" context="algorithm"/>
<a href="/stat?c=problem_solution&rm=264702&rd=10672&pm=7754&cr=7442498">did</a>.
For more information on dynamic programming, see the <a href="/tc?module=Static&d1=tutorials&d2=dynProg">tutorial</a>.
<br />
<br />

In fact, this problem allowed even some seemingly incorrect approaches
to pass. For example, you could make a mistake in the DP and not compute
the maxima, assuming the minimum can always be obtained by adding or
subtracting two minima, and still succeed because the method of putting brackets
that was discussed above when proving the greedy algorithm can indeed
be obtained by considering only minima.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7753&amp;rd=10672" name="7753">IncreasingSubsequences</a></b>
</font>
<A href="Javascript:openProblemRating(7753)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506238" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      47 / 434 (10.83%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 47 (44.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>macs</b> for 784.26 points (15 mins 50 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      572.72 (for 21 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
To solve this problem, one needed to think about how to tell if a
given increasing subsequence is maximal. The answer is not so complicated,
and is obtained by trying to unerase any other number: an increasing
subsequence is maximal, 
if all the numbers erased before its first number are not less than it,
all numbers erased after its last number are not greater than it,
and all numbers erased between any two its consecutive numbers are either
not greater than the first of those two, or not less than the second.
<br /><br />

One could then test all increasing subsequences, or even try to
write some backtracking solution, but both these methods will probably time out,
because the answer can be as high as about 86 million (try the sequence
3,2,1,6,5,4,9,8,7,...).
<br /><br />

But the nature of the problem &mdash; the fact that the maximality test can be
done separately for each segment between the two consecutive numbers of the
sequence &mdash; leads us to a dynamic programming solution. Let's define
<i>am</i>[<i>i</i>] as the number of maximal increasing subsequences of the 
first <i>i</i> elements of our sequence that end with exactly <i>i</i>-th 
element. To compute <i>am</i>[<i>i</i>], we first check if the <i>i</i>-th element
can start a maximal subsequence, by checking that no element before is less than it. If 
it can, we initialize <i>am</i>[<i>i</i>] with one, otherwise with zero. We then
check all the possible positions <i>j</i> of the previous element of the subsequence,
and if <i>i</i>-th element can follow <i>j</i>-th (i.e., the former is greater than the latter and no element
can be inserted in the middle), we increase <i>am</i>[<i>i</i>] by <i>am</i>[<i>j</i>].
To compute the final answer, we sum all the <i>am</i>'s for the positions that can
end a maximal subsequence &mdash; that is, for which no following number is greater.
<br />
<br />

See <tc-webtag:handle coderId="22680746" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264742&rd=10672&pm=7753&cr=22680746">solution</a>
for an implementation of this approach.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7760&amp;rd=10672" name="7760">RailwayTickets</a></b>
</font>
<A href="Javascript:openProblemRating(7760)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506238" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      249 / 401 (62.09%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      122 / 249 (49.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abikbaev</b> for 475.20 points (6 mins 33 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      313.73 (for 122 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The first thing to understand in this problem is that we should not
be overconcerned with assigning seats to passengers. The only thing that really
matters is that, at any time, there should be no more than <b>seats</b> than passengers
inside the train. To prove that, we'll simply allow every entering passenger that
has his request accepted
to sit at any unoccupied seat. Obviously this strategy will fail only if there
are more than <b>seats</b> than passengers traveling simultaneously.
<br />
<br />

So, long story short, we have a set of segments on a line and need to choose
a subset such that every point is covered by at most <b>seats</b> segments. In case
<b>seats</b> is equal to 1, this problem is called  an "Activity Selection Problem", and
its solution is described in the <a href="/tc?module=Static&d1=tutorials&d2=greedyAlg">tutorial</a>
on greedy algorithms. Try to read and understand the first part of that article (until "BioScore" caption)
before continuing with this editorial.
<br />
<br />

How to adapt that solution to work with a train with multiple seats? It turns out that
the same greedy approach works: we sort the passengers in the increasing
order of their exit (and not enter!) time, and then process them in the obtained
order and assign any passenger a seat while it's possible. Why does it work?
The proof is also similar to the one described in the above tutorial. Assume that at
some point we take passenger <i>i</i>, but not taking her could lead us to a better
solution &mdash; and the seat we give to passenger <i>i</i> is given to passenger <i>j</i>
instead. Let's consider the first such moment, i.e., let's assume that all passengers
that we placed earlier retain their seats. But since passenger <i>i</i> has exit time not later than passenger
<i>j</i> and all other remaining passengers, we can replace passenger <i>j</i> 
with passenger <i>i</i> without affecting the passengers placed later, and we don't affect
the passengers placed earlier by the choice of <i>i</i>, so we've obtained a correct solution
of the same size but still containing passenger <i>i</i>. So there can be no error in
following our greedy algorithm.
<br /><br />

The easiest way to check if adding the next passenger is possible, is to keep
the number of occupied seats for each unit segment of time (the segment from time <i>x</i>
to time <i>x</i>+1). For an implementation of this approach, see
<tc-webtag:handle coderId="20463878" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264706&rd=10672&pm=7760&cr=20463878">solution</a>.
<br /><br />

This problem also allows for a totally different greedy approach. At first,
we will accept all the requests, and try to simulate the train's travel.
At any moment of time, we will remember the exit times of the passengers
that are on the train. When some passenger enters the train, we will add his exit time
to the list. When he exits, we remove it. The only possible problem is that
after some passenger enters we might get more than <b>seats</b> passengers
onboard &mdash; that's when we need to reject some request. But whose request
we will reject? After some thinking we can deduce that we should reject the request
with the latest exit time of those currently onboard; the formal proof of
this fact is left to the reader. A solution implementing this approach
will also be quite simple, like 
<a href="/stat?c=problem_solution&rm=264706&rd=10672&pm=7760&cr=22628392">that</a> 
of <tc-webtag:handle coderId="22628392" context="algorithm"/>.
<br />
<br />

The main difficulty in this problem is that it also has a lot of incorrect
greedy approaches. For example, sorting by the starting time or choosing the shortest trip are
incorrect. To avoid falling into that trap, one needed to be either lucky or
capable of proving her solution. This is really a situation where one can't
be too careful.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7751&amp;rd=10672" name="7751">NormalizingTrees</a></b>
</font>
<A href="Javascript:openProblemRating(7751)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506238" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      55 / 401 (13.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 55 (21.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 770.47 points (16 mins 34 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      549.84 (for 12 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The first, straightforward step in the solution of this problem is to construct
the tree (the list of adjacent vertices for each vertex) given the 
input array.
<br /><br />

Then, let's try all possibilities for the root vertex. Assuming we've
chosen the root, we need to renumber all the vertices in such a way that 
the resulting vector is smallest lexicographically.
<br /><br />

First, the root should obviously be labeled 0, as it is the only possibility for
the resulting vector to have -1 at the 0th position. Then, all the root's children will
correspond to zeroes in the resulting vector, and thus we need to label them with
1 to <i>s</i> in some order &mdash; it is the only possibility for the resulting
vector to have zeroes at next <i>s</i> positions, in all other cases some of 
these numbers will be positive. Using the same argument we find that
we need to label the children of vertex 1 with next consecutive numbers, then children of vertex 2, etc.
The only freedom left is choosing the order of children at each step.
<br />
<br />

Consider the children of vertex 0. Their zeroes will be followed by the ones
of the children of vertex 1, and then by larger numbers. Thus, we need the number
of ones to be as big as possible, choosing the vertex with the greatest number of children
as the first child. Or, in other words, we need to sort the children of vertex 0
in the decreasing order of the number of their children. But what to do if several
of those numbers are equals? Then we need to check the number of children of the first child, etc.
<br />
<br />

All this sorting seems too complicated. But it turns out that we can
formulate the sorting criterion in a simple way. Assume our function
to find the lexicographically smallest description is called calc. Let's sort 
the children in the lexicographical order of the descriptions obtained 
by calling calc recursively for them, but with a slight modification: if one
of such descriptions is a starting segment of the other, the former should
be treated to be greater than the latter, and usually (for example,
like vectors are compared in C++ by default) it's the other way around. To achieve
that modification, we can append infinity to every description, then our sorting becomes
just the sorting of vectors.
<br />
<br />

It's not at all obvious why the above sorting works, but we'll omit the formal
proof because of its length and tediousness. To prove that for yourself,
try to understand step-by-step how the sequence for the parent is obtained from
the sequences for the children.
<br /><br />

<tc-webtag:handle coderId="144400" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264703&rd=10672&pm=7751&cr=144400">solution</a>
is an excellent implementation of the above approach, refer to it for the details.
<br /><br />
</p>



<div class="authorPhoto">
    <img src="/i/m/Petr_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
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
