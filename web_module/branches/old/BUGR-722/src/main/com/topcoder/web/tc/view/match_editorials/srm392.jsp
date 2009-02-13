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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
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
    <A href="/stat?c=round_overview&er=5&amp;rd=11126">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520162" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 392</span><br />Thursday, March 6, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
Division 1 was won by
<tc-webtag:handle coderId="19849563" context="algorithm"/> who showed the
best time on both the 500-pointer and the 1000-pointer. The second place
went to
<tc-webtag:handle coderId="7442498" context="algorithm"/>, and the third was
gained by
<tc-webtag:handle coderId="10574855" context="algorithm"/>, thanks to his
two successful challenges.
<tc-webtag:handle coderId="11829284" context="algorithm"/> and
<tc-webtag:handle coderId="9906197" context="algorithm"/> came in fourth and
fifth, both regaining a rating of 3000+ and a target sign.
</p>
<p>
Division 2 was won by
<tc-webtag:handle coderId="22703092" context="algorithm"/>, who was 
closely followed by
<tc-webtag:handle coderId="22692050" context="algorithm"/> and
<tc-webtag:handle coderId="22637798" context="algorithm"/>. Along with
<tc-webtag:handle coderId="12028511" context="algorithm"/> and
<tc-webtag:handle coderId="22687201" context="algorithm"/>, those are
the only five contestants who were able to solve all three problems correctly.
</p>
<p>
In Division 1, during both the challenge phase and the system tests,
a lot of 500-pointer and 1000-pointer solutions failed the tests with
maximal possible inputs (N=200000 for the medium, and N=10<sup>18</sup> for the
hard). Let this be a reminder for all of us to check our solutions on "max
tests" every time.
</p>
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8707&amp;rd=11126" name="8707">AverageCandyLifetime</a></b> 
</font> 
<A href="Javascript:openProblemRating(8707)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520162" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      728 / 776 (93.81%)
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      704 / 728 (96.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dinoj18</b> for 248.74 points (2 mins 1 secs)
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.63 (for 704 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The average lifetime of the candies is the sum of their lifetimes divided by
the number of the candies. The natural approach for this problem is to
calculate these two values. In can be done by iterating over the given
array <b>eatenCandies</b> just once. The following Java code is a correct
solution for the problem:

<pre>private final int[] months = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

public double getAverage(int[] eatenCandies) {
    int lifetime = 0;
    int sum = 0;
    int number = 0;
    for (int i = 0; i &lt; 12; i++) {
        lifetime += months[i];
        sum += eatenCandies[i] * lifetime;
        number += eatenCandies[i];
    }
    return sum * 1.0 / number;
}</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8706&amp;rd=11126" name="8706">TwoStringMasks</a></b> 
</font> 
<A href="Javascript:openProblemRating(8706)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520162" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      197 / 776 (25.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      36 / 197 (18.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>WeiYi</b> for 460.84 points (8 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258.54 (for 36 correct submissions) 
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
      516 / 614 (84.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      278 / 516 (53.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 246.20 points (3 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      157.72 (for 278 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, suppose neither <b>s1</b> nor <b>s2</b> start with an asterisk.
If they start with different letters, the correct answer is "impossible",
because after any replacements the strings will still start with different
letters.
Otherwise, if they start with the same letter, we can remember that the
answer must start with this letter and remove this letter from both strings.
</p>
<p>
Similarly, we can consecutively remove letters from the endings of the strings,
(and if we notice different letters on the endings, the answer is "impossible").
</p>
<p>
After doing so, we will have two strings, at least one of which starts with
an asterisk (otherwise we could remove one more letter from the beginning), 
and at least one of which ends with an asterisk (otherwise we could remove
one more letter from the ending).
</p>
<p>
If one of the strings is an asterisk ("*"), than the answer is the other
string with its asterisk removed (better to say, replaced with an empty
string).
</p>
<p>
Otherwise, we have one string starting with an asterisk (say, <b>s2</b>) and
the other string ending with an asterisk (<b>s1</b>). Remove the asterisks
from both strings. Now the
answer is the shortest string that starts with <b>s1</b> and ends with
<b>s2</b> (possibly, there is an overlapping of <b>s1</b> and <b>s2</b>).
</p>
<p>
The shortest string with a given prefix and a given suffix can be found
using
<a href="/tc?module=Static&d1=tutorials&d2=stringSearching">Knuth-Morris-Pratt Algorithm</a>
in linear time. However, constraints of this problem allowed to solve this
subproblem using a slower algorithm. The easiest approach is to find the
largest length of the overlapping part of <b>s1</b> and <b>s2</b>. Just
try all possible lengths from 0 to the length of <b>s1</b> and check whether
the corresponding number of last characters of <b>s1</b> are equal to the
corresponding first characters of <b>s2</b>. If they are equal then we can
make this letters the overlapping part of <b>s1</b> and <b>s2</b>. Obviously,
the string with the largest overlapping part is the shortest string that
starts with <b>s1</b> and ends with <b>s2</b>.
</p>
<p>
An
<a href="/stat?c=problem_solution&rm=269302&rd=11126&pm=8706&cr=14768757">implementation</a>
of this approach was coded by
<tc-webtag:handle coderId="14768757" context="algorithm"/>.
</p>
<p>
Also worthy of mentioning is a witty
<a href="/stat?c=problem_solution&rm=269327&rd=11126&pm=8706&cr=11854576">solution</a>
by
<tc-webtag:handle coderId="11854576" context="algorithm"/>
who used the Java built-in regular expressions.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8561&amp;rd=11126" name="8561">QuasiLatinSquares</a></b> 
</font> 
<A href="Javascript:openProblemRating(8561)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520162" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      23 / 776 (2.96%)
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 23 (56.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ripatti</b> for 590.79 points (28 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      460.08 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Division 2 coders were asked to find the lexicographically smallest QuasiLatin
square, a natural generalization of Latin square. However, the generalization
wasn't really important, because the correct answer for any <b>n</b> and
<b>d</b> looks like this:
<table align="center" border="0" cellpadding="5" cellspacing="2">
<tr><td width="11%">0</td><td width="11%">0</td><td width="11%">0</td><td width="11%">0</td><td width="11%">1</td><td width="11%">2</td><td width="11%">3</td><td width="11%">...</td><td width="11%"><b>d</b>-1</td></tr>
<tr><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>2</td><td>3</td><td>...</td><td><b>d</b>-1</td></tr>
<tr><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>2</td><td>3</td><td>...</td><td><b>d</b>-1</td></tr>
<tr><td>0</td><td>0</td><td>0</td><td rowspan="6" colspan="6" align="center" bgcolor="silver">Latin square of size <b>d</b></td></tr>
<tr><td>1</td><td>1</td><td>1</td></tr>
<tr><td>2</td><td>2</td><td>2</td></tr>
<tr><td>3</td><td>3</td><td>3</td></tr>
<tr><td>:</td><td>:</td><td>:</td></tr>
<tr><td><b>d</b>-1</td><td><b>d</b>-1</td><td><b>d</b>-1</td></tr>
</table>
</p>
<p>
Thus, the problem could be reduced to finding the lexicographically smallest
Latin square of size <b>d</b>.
</p>

<p>However, this reduction wasn't necessary, because even the generalized
problem can be solved in reasonable time using a simple backtracking algorithm.
A pseudocode implementation of it is shown below.

<pre>
boolean search(i, j) {
    for (int v = 0; v &lt; <b>d</b>; v++) {
        a[i][j] = v;

        <i>Consider row </i>i<i> of matrix </i>a
        <i>Count </i>p<i>, the number of different digits in cells </i>a[i][0]<i> through </i>a[i][j]
        <i>We need to put </i><b>d</b>-p<i> more digits, and we only have </i><b>n</b>-j-1<i> cells</i>
        <i>If there is not enough cells for the digits</i>
            continue;

        <i>Consider column </i>j<i> of matrix </i>a
        <i>Count </i>q<i>, the number of different digits in cells </i>a[0][j]<i> through </i>a[i][j]
        <i>We need to put </i><b>d</b>-q<i> more digits, and we only have </i><b>n</b>-i-1<i> cells</i>
        <i>If there is not enough cells for the digits</i>
            continue;

        <i>if </i>(i, j)<i> is the last cell</i>
            return true;
        if search(<i>next cell after </i>(i, j))
            return true;
    }
    return false;
}
</pre>
</p>

<p>
The nature of the lexicographically smallest Latin squared of size <b>d</b>
strongly depends on <b>d</b>. When <b>d</b> is a power of two, the desired
Latin square is not only symmetrical, but it also follows a wonderful pattern:
</p>
<center>a[i][j] = i xor j</center>

<p>
On the other hand, for <b>d</b>=5, 7, 9, and 10 (and many larger values
that weren't considered in the given problem), the answer is not symmetrical
with respect to the main diagonal.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8705&amp;rd=11126" name="8705">RoundAboutCircle</a></b> 
</font> 
<A href="Javascript:openProblemRating(8705)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520162" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      327 / 614 (53.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      262 / 327 (80.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 473.93 points (6 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      324.56 (for 262 correct submissions)
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's try to calculate the score of the player, when starting from all possible
initial cells. Then the answer to the problem is the maximum of all <b>N</b>
such values.
</p>

<p>
Start emulating the process from initial cell number 1. The token will
make some moves and finally reach a cell that was already visited before.
Look at the piece of the path, from the first visitation of that cell to
the second visitation. This is a loop. Calculate the length of this loop
<i>L</i>
(the number of the cells in it), and for each cell in the
loop, store that the score when
starting from this cell is <i>L</i> (indeed, if we start in this cell, the
token will travel along the loop and reach the initial cell, thus giving
score <i>L</i>).
</p>

<p>
Now let's look at the cells of the considered path that come before the loop.
What if we start from the cell right before the loop? The score in this case
will be <i>L</i>+1. Starting from the previous cell leads to the score of
<i>L</i>+2, and so on. Iterate over all the cells that come before the loop
and calculate this scores.
</p>

<p>
By now, we've gathered all the useful information about all the cells on
the path starting from 1. But we need to process all the cells outside this
path as well.
</p>

<p>
Select any cell that doesn't belong to this path. Start emulating the
process from this cell. We will reach one of the following situations:
</p>

<ul>
<li>We will reach a cell that was already visited during this emulation
<li>We will reach a cell that was already processed during previous emulations
</ul>

<p>
In the first case, we should do the same procedure as we did above for the path
starting from 1.
</p>

<p>
In the second case, we reach a cell C processed before, so we already know
the score when starting from cell C. Then the score for the cell before C is
equal to the score for C plus 1. The score for the previous cell is the score
for C plus 2 etc. Iterate over the entire path in backwards direction and
calculate all the scores in this fashion.
</p>

<p>
Repeat the above procedure for all cells that haven't been processed until
there are no such cells left.
</p>

<p>
Note that each cell is processed exactly once in the proposed algorithm, thus
the overall working time is <i>O</i>(<i>N</i>).
</p>

<p>
Coders should be aware that implementing this algorithm (or a similar one) in
a recursive fashion can lead to stack overflow. It is good to know the default
stack size of your language. It is also good to know how to avoid recursive
functions in hazardous situations (roughly speaking, using your own stack).
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8536&amp;rd=11126" name="8536">EquiDigitNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8536)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520162" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      120 / 614 (19.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 120 (43.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 891.22 points (10 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      591.07 (for 52 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, since the number 999...9 is an equidigit number, the answer to the
problem always has the same length as the input <b>N</b>. Let's denote this
length <i>m</i>. Also for simplicity let's check whether <b>N</b> is already
equitigit, and return <b>N</b> if it is. So now we need to find the smallest
equidigit number of length <i>m</i> that is strictly greater than <b>N</b>.
</p>

<p>
As this desired number is greater than <b>N</b>, let's denote <i>p</i> the
position of the leftmost digit in which this number differs from <b>N</b>.
Also, let's denote <i>q</i> the digit of this number in the position <i>p</i>.
</p>

<p>Iterate over all posible values of <i>p</i> and <i>q</i>. Having fixed
<i>p</i> and <i>q</i>, the task is to find the smallest equidigit number
satisfying the following conditions:
</p>

<ul>
<li>Its length is <i>m</i>
<li>Its first <i>p</i>-1 digits are those of number <b>N</b>
<li>Its <i>p</i>-th digit is <i>q</i>
</ul>

<p>
Now iterate over <i>v</i> from 1 to 10, that is the number of different digits
in the desired equidigit number.
</p>

<p>
When we have fixed <i>m</i>, <i>v</i> and several first digits of the
desired number, the next digit can be found easily according to a greedy
algorithm. Indeed, iterate over all possible values for the next digit, and
select the smallest value, such that setting it into the current position
doesn't make the number of different digits used exceed <i>v</i> and doesn't
make the amount of each digit exceed <i>m/v</i>.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/darnley_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21971539" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
