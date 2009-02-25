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
<tc-webtag:forumLink forumID="505860" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 294</span><br>Saturday, March 25, 2006
<br><br>

<span class="bigTitle">Match summary</span>

 

<p>
SRM 294 attracted a record-breaking 1029 participants.
Boosted by 4 successful challenges, <b>Petr</b> scored his third Division 1
victory out of the last five matches,
followed closely by <b>bmerry</b> and <b>haha</b> in second and third place.
In Division 2, <b>martin_joerg</b> held on to first place with 3 successful
challenges, followed by Multifarious in second place with 2,
and <b>jerschneid</b> in third.
</p>

 

<H1>
The Problems
</H1>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6109&amp;rd=9815" name="6109">ThreeCardMonte</a></b>

</font>

<A href="Javascript:openProblemRating(6109)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505860" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      555 / 599 (92.65%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      529 / 555 (95.32%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mythruby</b> for 249.23 points (1 mins 35 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      212.48 (for 529 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
To solve this problem, you just need to keep track of where the ace is
after every swap.
Use an int to store the position of the ace (0, 1, or 2), and initialize
it to 1.
Then, for each character in <b>swaps</b>, update the position.
Afterward, return the appropriate letter ("L", "M", or "R") corresponding to
the final position of the ace.
</p>

<p>
The following Java code implements this algorithm:
</p>

<pre>
    int pos = 1;

    for (int i = 0; i &lt swaps.length(); i++)
        switch (swaps.charAt(i)) {
            case 'L': if (pos != 2) pos = 1-pos; break; // swap 0 and 1
            case 'E': if (pos != 1) pos = 2-pos; break; // swap 0 and 2
            case 'R': if (pos != 0) pos = 3-pos; break; // swap 1 and 2
	    case 'F':                            break; // do nothing
        }

    switch (pos) {
        case 0: return "L";
        case 1: return "M";
        case 2: return "R";
    }
</pre>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6114&amp;rd=9815" name="6114">Shuffling</a></b>

</font>

<A href="Javascript:openProblemRating(6114)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505860" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      292 / 599 (48.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      198 / 292 (67.81%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mythruby</b> for 462.34 points (8 mins 14 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      268.29 (for 198 correct submissions)

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

      389 / 430 (90.47%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      338 / 389 (86.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>oldbig</b> for 245.36 points (3 mins 55 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      177.96 (for 338 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem is similar to ThreeCardMonte, except that it more difficult to
update the position of the ace.
First, we'll look at how to update the position when the value of the shuffle
is positive (because that case is easier), and then we'll look at how to reuse
that logic to implement a negative shuffle.
</p>

<p>
Take another look at the left half of the figure from the problem statement:
</p>

<div align="center">
<img src="/i/srm/srm294.gif" alt="" />
</div>

<p>
There are two cases when the position of the card doesn't change:
when the ace is one of the bottom n cards,
and when it is one of the top n cards.
If the ace is in the bottom half of the deck, but not one of the bottom n
cards, then we can update its position with the following arithmetic:
</p>

<pre>
    pos = (pos-n) * 2 + n+1;
</pre>

<p>
If the ace is in the top half of the deck, but not one of the top n
cards, then we can update its position with the following arithmetic:
</p>

<pre>
    pos = (pos - cards/2) * 2 + n;
</pre>

<p>
That's all there is to updating the position of the ace for a positive shuffle.
To reuse this logic to implement a negative shuffle, make use of the fact
that a negative shuffle is equivalent to cutting the deck exactly in half
(swapping the top and bottom halves of the deck), and then performing a
positive shuffle (with the absolute value).
</p>

<p>
The Java code below implements this solution, including cutting the cards
when the shuffle value is negative:
</p>

<pre>
    int pos = 0;

    for (int i = 0; i &lt shuffles.length; i++) {

        int n = shuffles[i];

        // convert a "negative" shuffle into a "positive" shuffle
	// by swapping the two halves of the deck
        if (n < 0) {
            if (pos < cards/2)
                pos += cards/2;
            else
                pos -= cards/2;
            n = -n;
        }

        if (pos < n) {
	    // ace is in the bottom n cards
	    // its position doesn't change
	}
        else if (pos < (cards/2)) {
	    // ace is in the bottom half, above the first n cards:
	    pos = (pos-n) * 2 + n+1;
	}
        else if (pos < (cards-n)) {
	    // ace is in the top half, below the last n cards:
	    pos = (pos - cards/2) * 2 + n;
	}
	else {
	    // ace is in the top n cards
	    // its position doesn't change
	}
    }

    return pos;
</pre>




<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6115&amp;rd=9815" name="6115">Palindromist</a></b>

</font>

<A href="Javascript:openProblemRating(6115)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505860" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      100 / 599 (16.69%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      6 / 100 (6.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>jerschneid</b> for 733.86 points (18 mins 35 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      581.57 (for 6 correct submissions)

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

      311 / 430 (72.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      165 / 311 (53.05%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>andrewzta</b> for 469.05 points (7 mins 23 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      336.20 (for 165 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Palindromist was no problem for coders familiar with dynamic programming.
The basic idea of dynamic programming is to pose a difficult task in terms
of smaller versions of the same task.
You solve the smallest tasks first, and use those results to solve the
later tasks.
</p>

<p>
Here, the task is to add spaces to a sequence of letters, attempting to
separate them into a list of legal words.
The work you do for this task is to loop over all the words in the list,
and see which ones match the beginning of the string.
For each one that matches, you now have a smaller version of the same
task: break the rest of the string (after the word you just matched) into
a sequence of words.
</p>

<p>
If you attempt to solve this problem in a "forward" manner, starting with
the complete string and using recursion to solve the smaller tasks,
your solution will have an exponential running time.
The reason is that there may be several different ways to arrive at the same
smaller task, and your program will end up doing the <i>same work</i> many
times.
And each time it does this work, it may be solving the same even smaller task
many times.
A carefully crafted test case will cause such a solution to time out, and
you can be certain that the system tests will include such a test case.
</p>

<p>
Using the dynamic programming approach, you solve the problem "backwards",
starting with the smallest tasks.
In this case that would mean starting with a single-character string, the last
letter of the palindrome you are attempting to form.
You store the best (smallest lexicographically) solution of each task in an
array.
If there is no solution, that's OK, just store some illegal value in order
to record that fact.
You proceed to solve larger and larger tasks (the last 2 characters, the
last 3, the last 4, etc.).
The key point here is that each time you match a word, you don't have to
recurse on the remaining characters in the string, <i>because you have already
solved that task</i>.
You just look up the answer in the array of solutions you have been keeping.
</p>

<p>
The problem does state that you can form a palindrome in either of two
ways: by repeating the last character of the input or not.
This just means that you run your algorithm twice, once with each of the
strings, and return the better solution.
</p>

<p>
For a clear implementation of this algorithm, see <b>andrewzta</b>'s
solution.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6022&amp;rd=9815" name="6022">DigitByDigit</a></b>

</font>

<A href="Javascript:openProblemRating(6022)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505860" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      57 / 430 (13.26%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      38 / 57 (66.67%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>haha</b> for 842.19 points (12 mins 48 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      577.74 (for 38 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The key to solving DigitByDigit is to realize that the optimal strategy for any
state depends <i>only</i> on the number of blank spaces, and not on the
digits that have already been placed.
For example, in the states "___", "0_3_6_9", and "_55_55_", your goal is always
the same: of the next three digits, try to get the highest one in the leftmost
space and the lowest one in the rightmost space.
The existing digits will, of course, affect the expected value, but not the
optimal digit-placing strategy.
</p>

<p>
You can solve this problem by building a table of results for the solution
to the problem with each number of blank spaces.
For the n-digit solution, you store the expected values for each of the
n digits.
For example, in the 1-digit solution, the expected value of that digit is 4.5.
The expected values of the digits in the 2-digit solution are 5.75 and 3.25.
</p>

<p>
Given the expected values of the n-digit solution, you can compute the expected
values of the (n+1)-digit solution as follows.
For each possible value of the next digit ('0' through '9'), attempt to place
it in each of the n+1 positions.
For each position, compute the expected value of the (n+1)-digit number, and
keep track of which position yields the greatest result.
Computing the expected value of the (n+1)-digit number (with one digit already
placed) is easy, because you can just look up in your table the expected values
of the other n-digits.
Once you have determined optimal placements for each of the 10 possible digits,
you can compute the expected value for each place in the (n+1)-digit number
by taking the average value of that place for each of the 10 possible cases.
</p>

<p>
For example, the values 5.75 and 3.25 of the 2-digit solution can be computed
by averaging the 10 values in each of the 2 columns below
(because each case is equally likely to occur):
</p>

<pre>
    0: 4.5 0
    1: 4.5 1
    2: 4.5 2
    3: 4.5 3
    4: 4.5 4
    5: 5 4.5
    6: 6 4.5
    7: 7 4.5
    8: 8 4.5
    9: 9 4.5
</pre>

<p>
Forming a 3-digit number would lead to the following 10 cases
after placing the first random digit:
</p>

<pre>
    0: 5.75 3.25 0
    1: 5.75 3.25 1
    2: 5.75 3.25 2
    3: 5.75 3.25 3
    4: 5.75 4 3.25
    5: 5.75 5 3.25
    6: 6 5.75 3.25
    7: 7 5.75 3.25
    8: 8 5.75 3.25
    9: 9 5.75 3.25
</pre>

<p>
The expected values for the digits of the 3-digit solution in the example
above can be computed by taking the average of each column.
You may notice that the values in each of the 10 cases above are always
sorted from largest to smallest, and this is no accident.
No optimal solution would lead to a digit having a lower expected value than
one of the digits to its right.
This suggests a shortcut to the algorithm above.  Instead of trying each digit
in each position, you can determine its position simply by finding the two
values it falls between.
</p>

<p>
Once you have computed a table of solutions, all you need to do is count
the number of '_' characters in the input, select the corresponding solution,
and compute the expected value by multiplying the value of each digit (either
given in the input or by replacing a '_' character with a value from your
table) and multiplying it by the power of 10 corresponding to the position.
For example, the expected value of "_55_" is:
</p>

<pre>
    3.25 * 1
  + 5    * 10
  + 5    * 100
  + 5.75 * 1000
</pre><div class="authorPhoto">
    <img src="/i/m/legakis_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
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
