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
<tc-webtag:forumLink forumID="505865" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 299</span><br>Saturday, April 22, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<P>In division 1 liympanda took his first SRM victory, closely followed by 
Im2Good (one failed challenge from first place) and tomek. For a long time 
though it looked like ACRush would go home with the victory, but after failing 
one of the last system cases on the hard problem, he fell back. The problem set 
contained two fairly standard problems which caused little trouble for most reds 
and yellows, while the third problem stumped a lot of coders. There were also a 
lot of challenges, mainly time-outs on the medium problem. 
</P>
<P>Division 2 also saw a hard last problem that had many submissions but where 
few passed. First place was taken by Aesop thanks to a successful challenge, 
closely followed by first timers taral and dan19. A notable first timer was also 
the TCO "Pick Me" contest winner davidyang, solving the first two problems and 
almost making it to division 1. </P>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6038&amp;rd=9820" name="6038">TemperatureScales</a></b> 
</font> 
<A href="Javascript:openProblemRating(6038)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505865" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      378 / 449 (84.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      342 / 378 (90.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>chenll</b> for 249.43 points (1 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.86 (for 342 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This is, obviously, a pure math problem. One way to solve the problem is to 
first convert the desired temperature t to a neutral scale where the freezing 
point is 0 and the boiling point is 1. That is, we scale down the range between 
boiling and freezing from b1-f1 to 1. Then we scale it up again, but this time 
from 1 to b2-f2. We end up with a one-liner: 
<PRE>
return ((double) (t-f1) / (b1-f1)) * (b2-f2) + f2;
</PRE>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6041&amp;rd=9820" name="6041">Projections</a></b> 
</font> 
<A href="Javascript:openProblemRating(6041)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505865" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      346 / 449 (77.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      253 / 346 (73.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>niebieski</b> for 490.77 points (3 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369.38 (for 253 correct submissions) 
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
      388 / 397 (97.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      361 / 388 (93.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 249.50 points (1 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      223.16 (for 361 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<P>Let <I>fcnt</I> and <I>rcnt</I> be the number of occupied columns and rows in 
the frontal and right projection, respectively (i.e. the number of 'x' in front 
and right).</P>
<P>It should be clear that the only cells that can be occupied are those lying 
on the intersections of the columns marked as occupied in the frontal projection 
and the rows marked as occupied in right projection. Basic combinatorics tells 
us that the total number of such intersections are <I>fcnt</I> * <I>rcnt</I>. 
Obviously all these cells can be occupied, so the maximum possible number of 
occupied cells is this product.</P>
<P>To find the minimum value, one should first realize that it must be at least 
the maximum of <I>fcnt</I> and <I>rcnt</I>, since we can actually see that many 
cells being occupied just by looking at the frontal and right projection. It 
turns out this value is the answer also. To see this, assume that the frontal 
projection tells us column 1, 3 and 6 are occupied, while the right projection 
tells us row 2 and 4 are occupied. If we let a cell on column 1 lie on row 2, 
and the cell on column 3 lie on row 4, the right projection picture is 
fulfilled, and we can place the cell in column 6 on either row 2 or 4.</P>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6040&amp;rd=9820" name="6040">StrangeParticles</a></b> 
</font> 
<A href="Javascript:openProblemRating(6040)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505865" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      187 / 449 (41.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 187 (4.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ihsahn</b> for 608.74 points (26 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      455.25 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<P>The reason this problem has such a low success rate was most likely because 
the examples in the problem statement were trivial and could be solved by any 
greedy algorithm. Greedy doesn't work however, since the order in which the 
particles collide does matter. Also, we can try all possible orderings of 
collisions since there are way too many permutations. </P>
<P>We can build a graph of the input, where each node corresponds to a particle. 
Let there be a directed edge from node x to node y if x can make y disappear. 
The key to solve the problem is to realize that all cycles in this graph can be 
merged. That is, if particle A can make B disappear, B can make C disappear and 
C can make A disappear, then we can treat particles A, B and C as just one 
particle. It's obvious that we can, at any time, let all particles except one in 
a cycle disappear. We can also make the entire merged particle disappear if some 
particle outside this merged particle can eliminate one of the particles inside 
the cycle. </P>
<P>There are many ways to merge all cycles in a directed graph. The fastest 
algorithm is to use two DFS searches to find all strongly connected components 
(see <A 
href="/stat?c=problem_solution&amp;rm=248351&amp;rd=9820&amp;pm=6040&amp;cr=21749340">DmitryKorolev's</A> 
solution for an implementation of this), even though using the Floyd-Warshall 
algorithm is faster to code. </P>
<P>When all cycles have been merged, we end up with a DAG (directed acyclic 
graph) where each node correspond to a particle or merged particles. The 
solution is then simply the number of root nodes in this DAG. The particles in 
these root nodes obviously can't disappear, but all other particles can. For 
instance, if a root node in the DAG contains merged particles, we can eliminate 
all of them except one. If an intermediate node in the DAG contains merged 
particles, we first eliminate all of them except the one particle that can be 
eliminated by a parent node in the DAG. See the writer's solution in the 
practice room for a clean implementation of this solution, using Floyd-Warshall. 
</P>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6043&amp;rd=9820" name="6043">PalindromePartition</a></b> 
</font> 
<A href="Javascript:openProblemRating(6043)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505865" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      311 / 397 (78.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202 / 311 (64.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 538.18 points (4 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      404.93 (for 202 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<P>Let <I>s</I> be the input string concatenated. We will solve the problem by 
induction over the length of <I>s</I>; that is, we will first find the least 
number of partitions required to partition the first character of <I>s</I>, then 
the two first characters, then the three first characters etc. </P>
<P>Obviously, the number of partitions required to partition only the first 
character of <I>s</I> is 1, since a single character is always a palindrome. Now 
consider the general case: we want to find the least number of partitions 
required to partition the first <I>k</I> characters of <I>s</I>. By induction, 
we can assume we have already solved the problems for all lengths less than 
<I>k</I>. The idea is to find all palindromes in <I>s</I> ending at position 
<I>k</I>, and for each such partition check what the least number of partitions 
required for <I>k</I> would be if that palindrome was the last one. </P>
<P>Example: Let <I>k</I> be 8 and the first 8 characters of <I>s</I> be 
BACABABA. There are three palindromes ending at character 8, namely ABABA, ABA 
and A. Now consider each such palindrome as the last palindrome in a palindrome 
partition of the first 8 characters of <I>s</I>. The remainder of the string 
would then be BAC, BACAB and BACABAB, respectively. Since we, by induction, 
already know the optimal solutions for these strings (which happens to be 3, 1 
and 3, respectively), we can deduce that the best final palindrome for <I>k</I> 
= 8 was ABA and that 2 partitions are required to partition the first 8 
characters. </P>
<P>The approach above requires two nested for-loops: an outer loop looping 
<I>k</I> from 1 to the length of <I>s</I>, and an inner loop looping over all 
substrings in <I>s</I> ending at position <I>k</I>. This inner loop must also 
verify that the substring is indeed a palindrome, and this must be done very 
fast, since an O(n^3) algorithm ought to time out. We can solve this by 
precalculating all substrings in <I>s</I> that are palindromes. Then this check 
will be done in O(1), and the whole solution will run in O(n^2). </P>
<P>To precalculate the palindromes, let isPalin(x,y) be a function returning 
true if the substring in <I>s</I> starting at position <I>x</I> of length 
<I>y</I> is a palindrome. Obviously, if <I>y</I> is 1 the function always 
returns true, and if <I>y</I> is 2 the function returns true only if the 
<I>x</I>'th and <I>x</I>+1'th character of <I>s</I> are the same. For the 
general case, the function should return true if the <I>x</I>'th and 
<I>x</I>+y-1'th character are the same <I>and</I> isPalin(x+1,y-2) is true (a 
string is a palindrome if the first and the last character are identical and the 
characters in between form a palindrome). </P>
<P>See <A href="/stat?c=problem_solution&amp;rm=248339&amp;rd=9820&amp;pm=6043&amp;cr=269554">my 
solution</A> for a fairly clean implementation of this </P>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6039&amp;rd=9820" name="6039">Wizards</a></b> 
</font> 
<A href="Javascript:openProblemRating(6039)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505865" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      37 / 397 (9.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 37 (40.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Im2Good</b> for 662.50 points (22 mins 53 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      472.99 (for 15 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<P>Logic puzzles similar to this problem often appear in magazines and 
elsewhere. There are many versions involving hats and people (usually prisoners) 
not seeing their own hat. The exact condition differs, but the solution ideas 
are often similar. Of course, since this is a programming problem, the whole 
procedure must be "mechanized", which can be quite a lot harder. The solution 
presented below is the approach taken by most coders. It's the perhaps most 
natural one, in that it tries to simulate the wizards' pondering. </P>
<P>Common knowledge among the wizards is the total number of hats of each color 
available. Let a <I>hat configuration</I> be a valid distribution of the hats 
among the wizards (where the input parameter hatsOnWizard is the configuration 
we're actually trying to find the answer for). The general solution idea is as 
follows: </P>
<P>As illustrated by the first example, for some hat configurations one wizard 
knows immediately the color of his hat. Since the wizards are perfect logicians, 
those hat configurations are known to everyone. If one of these configurations 
includes hatsOnWizard, we're done - (at least) one wizard will shout out the 
color of his hat. Otherwise all wizards know that the actual configuration is 
not one of these. From this a new set of hat configurations can be calculated 
for which some wizard will know the color of his hat. If hatsOnWizard include 
one of these configurations, we're done. Otherwise we keep on until we gather no 
new information. If the hatsOnWizard configuration has never appeared, no wizard 
will ever know the color of his hat. </P>
<P>An example of this idea will illustrate this: Let the total number of hats be 
(7 8 9) and the number of wizards 18 (this is the last example in the problem 
statement). If hatsOnWizard was (1 8 9), (7 2 9) or (7 8 3), some wizard would 
immediately know the color his hat. If this it not the case, then some other 
configurations will cause a wizard to know the color of his hat. Consider the 
configuration (2 7 9) for instance. A wizard with the first hat would think 
something like this: "Hmm, I see (1 7 9). I obviously can't have hat 3, since 
there are no more of those available. Can I have hat 2? Then the actual 
configuration would be (1 8 9). But that configuration has been ruled out, since 
someone would have known his hat already on the first question! Hence I must 
have hat 1." From this reasoning we can deduce that the configuration (2 7 9) is 
a configuration that would be solved in two questions. Other configurations that 
would be solved in two questions (with similar reasoning) are (2 8 8), (6 3 9), 
(7 3 8), (6 8 4) and (7 7 4). On the third question, the configuration (5 4 9) 
would be found, because here a wizard with the second hat would know he can't 
have hat 1 because that would yield the configuration (6 3 9), which was ruled 
out above. </P>
<P>In pseudo-code, this would look like this. For a somewhat clean 
implementation, see my solution in the practice room. </P>
<PRE>
      // Let q[hatConfig] be the number of question required
      // for hatConfig to be found. Initialize to infinity
      currentQuestion = 1
      while true
         newInformationFound = false
         foreach hatConfig X in allHatConfigurations
            foreach hatColor Y
               // Let wizard with hat of color Y ponder
               possibilities = 0
               foreach potentialColor Z
                  let X' = configuration X minus color Y plus color Z
                  if X' is valid and q[X'] &lt; currentQuestion
                     possibilities++
               if possibilities = 1 begin
                  q[X] = currentQuestion
                  newInformationFound = true
               end
            end foreach
         end foreach
         if q[hatsOnWizard] &lt; infinity
            return q[hatsOnWizard]
         if newInformationFound == false
            return -1         
         currentQuestion++         
      end while
   </PRE>
<P>I choose to represent a hat configuration as an integer, allocating 4 bits 
for each hat color (since there would be no more than 15 hats of each color). 
This allows me to declare q as a simple array. It would probably also work to 
use an int[] and let q be a hash table. </P>
<P>Some performance considerations: In the code above, I loop over all valid hat 
configuration for each question. The total number of configuration could be 
roughly 16<SUP>4</SUP>, so if the number of question requires were a lot, this 
might take a time. It turns out that the system test never had a case requiring 
more than 13 question, so this is no problem. During the contest, I had no idea 
what the upper limit was, so instead of looping through all hat configurations 
each time, I only looped through those that were added in the last question 
(since those were the only ones providing new information). </P>
<P>However, there exist a <I>much</I> shorter solution to this problem though, 
which doesn't take hat configurations into account at all. During the limited 
time I had for this writeup I failed to understand why it works. See <A 
href="/stat?c=problem_solution&amp;rm=248340&amp;rd=9820&amp;pm=6039&amp;cr=10600282">Mojito1's 
solution</A> for a clean implementation of this approach. </P><div class="authorPhoto">
    <img src="/i/m/Yarin_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
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
