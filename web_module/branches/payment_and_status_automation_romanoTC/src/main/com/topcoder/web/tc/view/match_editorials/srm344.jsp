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
    <A href="/stat?c=round_overview&er=5&rd=10668">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506234" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 344</span><br>Wednesday, March 28, 2007
<br><br>



<h2>Match summary</h2> 

Considering the success rates of my previous SRMs, this time I really needed
something on the simple side. So we got a relatively simple SRM, with
quite a lot of coders scoring on all three problems. Finishing on top was 
<tc-webtag:handle coderId="19849563" context="algorithm"/>, who was very
fast on both the medium and the hard and quick on challenges. He was followed by 
<tc-webtag:handle coderId="251074" context="algorithm"/> and 
<tc-webtag:handle coderId="14970299" context="algorithm"/>. 
The top three finishers got +150 on challenges, putting them way 
ahead of the pack.
<br /><br />

On the contrary, Division 2 had only three people who solved all three problems:
<tc-webtag:handle coderId="22675208" context="algorithm"/> in first place, 
<tc-webtag:handle coderId="20187495" context="algorithm"/> in second place and 
<tc-webtag:handle coderId="22675110" context="algorithm"/> in fourth.
Three challenges compensated <tc-webtag:handle coderId="22645811" context="algorithm"/> for the flawed easy and earned him
third place.
<br /><br />
 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7576&amp;rd=10668" name="7576">Chessboard</a></b> 

</font> 

<A href="Javascript:openProblemRating(7576)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506234" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      630 / 736 (85.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      300 / 630 (47.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ikicic</b> for 244.51 points (4 mins 16 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      171.42 (for 300 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem was pretty straightforward. By looking at the first character
of the input we could deduce the operation to be performed; performing
it led us to the fact that the coordinates could be obtained from the
cell number via dividing by 8. However, you had to be very careful to
avoid 'off-by-one' errors, and the system tests confirmed that. 
See <tc-webtag:handle coderId="20187495" context="algorithm"/>'s 
passing <a href="/stat?c=problem_solution&rm=264154&rd=10668&pm=7576&cr=20187495">solution</a> for the implementation details.

<br /><br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7625&amp;rd=10668" name="7625">SimpleRotationDecoder</a></b> 

</font> 

<A href="Javascript:openProblemRating(7625)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506234" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      183 / 736 (24.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      106 / 183 (57.92%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>MrBananaBrains</b> for 429.32 points (11 mins 56 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      256.68 (for 106 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The main difficulty about this problem was understanding all the details
about the encryption algorithm used. The key fact was that we knew the length
of the password - 3 letters. That yields only 26<sup>3</sup> = 26*26*26 = 17576
possible passwords, and leads us to the bruteforce approach. First, we iterate
over all possible passwords. For each password, we need to decrypt the text
and then to verify the original text. Once we've got a correct decryption
result we're done.
<br /><br />

To decrypt the text, we notice that if a + b = c (mod 27), then a = c - b (mod 27).
So we need to subtract the password from the text to get the original text.
We could go with subtraction, but if we'd like to avoid negative numbers we can 
notice that subtracting a number in range from 1 to 26 is just the same as 
adding a number from that range (because -1 = -1 + 27 = +26, -2 = -2 + 27 = +25, etc)
and continue with adding the password instead of subtracting it - but that's
not really important.
<br /><br />

Having decrypted the text, we need to carefully verify all the constraints
written in the first paragraph of the problem statement. For a neat implementation
of such verification, as well as of all the above technique, see 
<tc-webtag:handle coderId="22627742" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=264163&rd=10668&pm=7625&cr=22627742">solution</a>.
<br /><br />

This problem posted another interesting challenge: coming up with 
correct testcases, both for you during the challenge phase and for me
when preparing the contest. It's not so obvious how to achieve exactly
one correct possible decoding, so I did the following: add random letters 
one-by-one, and keep track of what passwords are already incorrect, what's the length
of the last word for each password and whether it contains a vowel or not.
That way I could quickly see if there's at least one possible password, and if
there's not I just took another random letter. As soon as exactly one password
could be correct, I stopped. 

<br /><br />
And let's end with a kind of shortest code contest: what is the shortest 
correct testcase?

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7540&amp;rd=10668" name="7540">QuantumAlchemy</a></b> 

</font> 

<A href="Javascript:openProblemRating(7540)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506234" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      83 / 736 (11.28%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      8 / 83 (9.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kp0t</b> for 593.35 points (27 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      522.75 (for 8 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

 

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

      381 / 522 (72.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      131 / 381 (34.38%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 476.45 points (6 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      324.91 (for 131 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

If our initial set contains the required substance 'X', we're done. If it
doesn't, we need to get it somehow... But wait! There's at most one way
to do it! If there's no reaction resulting in 'X', the answer is -1, and
if there is, this reaction must be done. So, instead of getting 'X', we
should focus on getting all the ingredients for that reaction.
<br /><br />

This simple idea, applied inductively, was the key to this problem. Let's
look at our transformations from the end to the beginning. 
Suppose we need to get <i>a</i> grams of substance <i>b</i> at some point.
In case we don't have such amount in our initial set, we need to get the
extra amount by applying the corresponding reaction &mdash; there's just
one, remember?
<br /><br />

So, essentially, we keep track of how many reactions we've already 
'unperformed', and the currently needed amounts of each substance.
If those amounts are already contained in the initial set, we're done.
If not, we take any of exceeding amounts and 'unperform' the 
corresponding reaction. We stop and return -1 if the total weight of needed
substances exceeds 50, for example. This will run in time because each
'unperforming' increases the total weight of needed substances. See
<tc-webtag:handle coderId="21971539" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&cr=21971539&rd=10668&pm=7540">solution</a>
for a sample implementation.
<br /><br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7252&amp;rd=10668" name="7252">VolleyballTournament</a></b> 

</font> 

<A href="Javascript:openProblemRating(7252)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506234" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      472 / 522 (90.42%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      289 / 472 (61.23%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Egor</b> for 241.27 points (5 mins 26 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      164.10 (for 289 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Each won match gives 3 won sets. Thus, wonSets - 3 * wonMatches gives the total 
number of won sets in the lost matches. In the same way, lostSets - 3 * lostMatches
gives the total number of lost sets in the won matches. Having noticed that,
we can now consider the won and lost matches separately. For example, let's
study the won matches (we've won them after all :)). Suppose we have <i>a</i>
matches, each having between 0 and 2 lost sets, and we know that we lost 
<i>b</i> sets in total. When is it possible to reconstruct the exact
distribution of the lost sets?

<br /><br />
Long story short, the answer is: when <i>b</i> is 0, 1, 2<i>a</i>-1 or 2<i>a</i>.
It's not so difficult to prove that, and we'll leave it as a math exercise for
the reader. Having that fact in our hands, we can construct a short solution,
like <a href="/stat?c=problem_solution&cr=14970299&rd=10668&pm=7252">that</a> of 
<tc-webtag:handle coderId="14970299" context="algorithm"/>.

<br /><br />
This problem, in fact, allows a more straightforward solution: just bruteforce
the amount of matches with each outcome. See <tc-webtag:handle coderId="20315020" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=264128&rd=10668&pm=7252&cr=20315020">code</a>
for a simple implementation.

<br /><br />

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7332&amp;rd=10668" name="7332">FairTournament</a></b> 

</font> 

<A href="Javascript:openProblemRating(7332)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506234" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      78 / 522 (14.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      66 / 78 (84.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Gluk</b> for 816.61 points (14 mins 8 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      589.23 (for 66 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem featured the classical DP-on-subsets technique. Suppose we've
already put the first <i>m</i> numbers of the permutation. All of them,
due to fairness restriction, are between 1 and <i>m</i>+<i>k</i>. On the 
other hand, all the remaining numbers will be at least <i>m</i>-<i>k</i>+1.
Thus, we must have already placed all numbers between 1 and <i>m</i>-<i>k</i>.
The only freedom we have is what <i>k</i> numbers from the range 
[<i>m</i>-<i>k</i>+1..<i>m</i>+<i>k</i>] were used.
<br /><br />

That nearly constitutes a DP solution. Let's define <i>amount</i>[<i>m</i>,<i>X</i>] (where
<i>m</i> is a number between 1 and <i>n</i>, and <i>X</i> is a subset of [<i>m</i>-<i>k</i>+1..<i>m</i>+<i>k</i>]
with <i>k</i> elements) as the 
amount of ways to put the first <i>m</i> numbers of the permutation in such a way
that all the numbers from the set <i>X</i> are used, as well as all the numbers less than or equal
to <i>m</i>-<i>k</i>. By looping over the value of the <i>m</i>-th number we can
find this amount by adding some amounts for smaller <i>m</i>'s. Or, if we
like the DP the other way, we could loop over the value of the <i>m+1</i>-st number
to add this amount to all the amounts on the next step that contain it.
<br /><br />

You need to be careful at the beginning and at the end of the permutation, 
but after some thinking
you could find out that these corners don't even need any special treatment.
However, what needed special treatment was the representation of the result.
As you were required to return a String and not a long, and the last example
featured a 21-digit answer with <i>k</i> equal to just one, it was quite obvious that
any standard numeric type could not hold such big numbers. Thus you had to
implement the addition of arbitrary-long numbers. Or, if you're using Java,
employ the BigInteger class.
<br /><br />

See <tc-webtag:handle coderId="251074" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264112&rd=10668&pm=7332&cr=251074">solution</a> for an
implementation of the all-by-myself approach, or <tc-webtag:handle coderId="21822659" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=264111&rd=10668&pm=7332&cr=21822659">solution</a> for
the BigInteger way.
<br /><br />






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
