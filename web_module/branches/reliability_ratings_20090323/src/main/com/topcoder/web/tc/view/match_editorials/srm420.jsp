<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 420 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13511">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523673" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 420</span><br />Thursday, October 2, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
The hard problem in division 1 involved both dynamic programming and a greedy aspect,
and as such problems go, there were many submissions, and many of them were then
successfully challenged. For the spectators, this was the only excitement during
the challenge phase, as the other two problems had a very high success rate.
</p>

<p>
The final results won't really surprise anyone: 
<tc-webtag:handle coderId="10574855" context="algorithm"/>
scored his next (already 47th!) match victory, 
second place went to
<tc-webtag:handle coderId="20812309" context="algorithm"/>
and third to
<tc-webtag:handle coderId="251074" context="algorithm"/>.
Fourth place finish was enough for
<tc-webtag:handle coderId="13351270" context="algorithm"/>,
even so his new rating exceeded 3000, and he is now one
of the ten "targets".
</p> 

<p>
In division 2, solving the hard problem was the key to victory.
The top three places went to the only three coders with all problems solved:
<tc-webtag:handle coderId="20292244" context="algorithm"/>,
<tc-webtag:handle coderId="22723031" context="algorithm"/>,
and
<tc-webtag:handle coderId="22689645" context="algorithm"/>.
The best newcomer,
<tc-webtag:handle coderId="22736920" context="algorithm"/>,
was leading until his medium submission was challenged,
which moved him into fourth place.
</p>

<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9914&amp;rd=13511" name="9914">DeckRearranging</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9914)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      652 / 739 (88.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      625 / 652 (95.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Sunny_05</strong> for 249.35 points (1 mins 27 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.66 (for 625 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Imagine that we are solving the task manually. We have the old deck of cards in front of us,
and a set of instructions how to insert them into the new deck.
</p>

<p>
Instead of keeping the new deck of cards as a stack, we can arrange them into a row, with
the top card on the left and the bottom one on the right. Now, whenever inserting a new
card, we count from the left until we find the right place where it should be inserted,
place the new card there, and shift the remaining cards one position to the right.
</p>

<p>
This exact approach is easily implemented using a simple array.
Note that the resulting algorithm is very similar to the simple sorting algorithm InsertSort.
Java code follows.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> String rearrange(String deck, <font color="#298a52"><strong>int</strong></font>[] above) {
    <font color="#298a52"><strong>int</strong></font> N = above.length;
    <font color="#298a52"><strong>char</strong></font>[] newDeck = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>char</strong></font>[N];
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) {
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> j=i; j&gt;above[i]; j--) newDeck[j]=newDeck[j-<font color="#ff00ff">1</font>];
      newDeck[above[i]]=deck.charAt(i);
    }
    String result = <font color="#ff00ff">&quot;&quot;</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) result += newDeck[i];
    <font color="#a52829"><strong>return</strong></font> result;
  }
</pre>

<p>
Exercise: Did you find this task too easy? Then find and implement a solution that is faster than
quadratic in the number of cards.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10058&amp;rd=13511" name="10058">YearProgressbar</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10058)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      453 / 739 (61.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      327 / 453 (72.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>darrenctwhk</strong> for 484.84 points (5 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      283.75 (for 327 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As with all progress bars, the actual value shown is computed as 100 * (time elapsed) / (total time).
The "100 *" part converts the fraction of elapsed time into percentage.
</p>

<p>
Total time is easy to compute: 365 days for non-leap years, 366 for leap years.
</p>

<p>
Actually, the smallest unit given in the input are minutes, so it makes sense to compute both
the elapsed time and the total time in minutes, so that all intermediate values are integers. 
(The value of the fraction remains the same regardless of the units we choose, it is only
important to use the same unit both in the numerator and in the denumerator.)
</p>

<p>
A day has 24 hours, each hour has 60 minutes. Thus a non-leap year has 365*24*60 and a leap
year has 366*24*60 minutes.
</p>

<p>
Now we need to compute the elapsed time. This is a bit more tricky, but the idea remains the same.
We have to sum these times:
</p>

<ul>
<li>All the days in previous months.
<li>Previous days in the given month.
<li>The time (hours and minutes) elapsed in the given day.
</ul>

<p>
Java code follows.
</p>

<pre>
  <font color="#298a52"><strong>static</strong></font> String[] months = { <font color="#ff00ff">&quot;January&quot;</font>, <font color="#ff00ff">&quot;February&quot;</font>, <font color="#ff00ff">&quot;March&quot;</font>, <font color="#ff00ff">&quot;April&quot;</font>, <font color="#ff00ff">&quot;May&quot;</font>, <font color="#ff00ff">&quot;June&quot;</font>, <font color="#ff00ff">&quot;July&quot;</font>, <font color="#ff00ff">&quot;August&quot;</font>, <font color="#ff00ff">&quot;September&quot;</font>, <font color="#ff00ff">&quot;October&quot;</font>, <font color="#ff00ff">&quot;November&quot;</font>, <font color="#ff00ff">&quot;December&quot;</font> };
  <font color="#298a52"><strong>static</strong></font> <font color="#298a52"><strong>int</strong></font>[] days = {<font color="#ff00ff">31</font>, <font color="#ff00ff">28</font>, <font color="#ff00ff">31</font>, <font color="#ff00ff">30</font>, <font color="#ff00ff">31</font>, <font color="#ff00ff">30</font>, <font color="#ff00ff">31</font>, <font color="#ff00ff">31</font>, <font color="#ff00ff">30</font>, <font color="#ff00ff">31</font>, <font color="#ff00ff">30</font>, <font color="#ff00ff">31</font>};
  <font color="#298a52"><strong>boolean</strong></font> isLeap(<font color="#298a52"><strong>int</strong></font> y) { <font color="#a52829"><strong>if</strong></font> (y%<font color="#ff00ff">400</font>==<font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">true</font>; <font color="#a52829"><strong>if</strong></font> (y%<font color="#ff00ff">100</font>==<font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">false</font>; <font color="#a52829"><strong>if</strong></font> (y%<font color="#ff00ff">4</font>==<font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">true</font>; <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">false</font>; }
  <font color="#298a52"><strong>int</strong></font> daysInMonth(<font color="#298a52"><strong>int</strong></font> m, <font color="#298a52"><strong>int</strong></font> y) { <font color="#a52829"><strong>if</strong></font> (m==<font color="#ff00ff">2</font> &amp;&amp; isLeap(y)) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">29</font>; <font color="#a52829"><strong>return</strong></font> days[m-<font color="#ff00ff">1</font>]; }
  <font color="#298a52"><strong>int</strong></font> getMonth(String name) { <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">12</font>; i++) <font color="#a52829"><strong>if</strong></font> (name.equals(months[i])) <font color="#a52829"><strong>return</strong></font> i+<font color="#ff00ff">1</font>; <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">0</font>; }

  <font color="#298a52"><strong>public</strong></font> <font color="#298a52"><strong>double</strong></font> percentage(String currentDate) {
    String[] tokens = currentDate.split(<font color="#ff00ff">&quot;[ ,:]&quot;</font>);
    <font color="#298a52"><strong>int</strong></font> month = getMonth(tokens[<font color="#ff00ff">0</font>]);
    <font color="#298a52"><strong>int</strong></font> day = Integer.parseInt(tokens[<font color="#ff00ff">1</font>]);
    <font color="#298a52"><strong>int</strong></font> year = Integer.parseInt(tokens[<font color="#ff00ff">3</font>]);
    <font color="#298a52"><strong>int</strong></font> hour = Integer.parseInt(tokens[<font color="#ff00ff">4</font>]);
    <font color="#298a52"><strong>int</strong></font> minute = Integer.parseInt(tokens[<font color="#ff00ff">5</font>]);

    <font color="#298a52"><strong>double</strong></font> daysInYear = <font color="#ff00ff">365</font>; <font color="#a52829"><strong>if</strong></font> (isLeap(year)) daysInYear += <font color="#ff00ff">1</font>;
    <font color="#298a52"><strong>double</strong></font> daysElapsed = <font color="#ff00ff">0</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> m=<font color="#ff00ff">1</font>; m&lt;month; m++) daysElapsed += daysInMonth(m,year);
    daysElapsed += day-<font color="#ff00ff">1</font>;
    daysElapsed += hour / <font color="#ff00ff">24.</font>;
    daysElapsed += minute / <font color="#ff00ff">24.</font> / <font color="#ff00ff">60.</font>;
    <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">100</font> * daysElapsed / daysInYear;
  }
</pre>

<p>
An alternate solution: Some of the allowed programming languages include libraries for working
with dates and times. These can be used to solve the given task for us. However, one has to
be careful not to fall into the subtle trap of locale settings, time zones, daylight saving times,
etc. See 
<tc-webtag:handle coderId="11948829" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=298860&amp;rd=13511&amp;pm=10058&amp;cr=11948829">submission</a>
for a pretty short solution.
</p>

<p>
Exercise 1 (easy): Our solution above is linear in the number of months. Adjust it so that it will run in constant time.
</p>

<p>
Exercise 2 (harder): Write a program that will read three dates D1 &lt; D2 &lt; D3 and output the percentage of time
that elapsed from the interval [D1,D3] at the moment D2. Your program should run in constant time, and be able to handle
arbitrary inputs, even such where D1 and D3 are hundreds of years apart.
</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9916&amp;rd=13511" name="9916">PrettyPrintingProduct</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9916)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      71 / 739 (9.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 71 (7.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Lowe</strong> for 667.34 points (22 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      528.12 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This task consisted of two almost separate parts: getting the first 5 digits right, and getting the
tail (last 5 non-zero digits + the number of zeroes) right.
</p>

<p>
We will start with the tail part.
</p>

<p>
First, remember that every positive integer has a unique prime factorization, and the prime
factorizations multiply. That is, if <strong>p</strong> is a prime, the prime factorization of <strong>X</strong>
contains <strong>p<sup>k</sup></strong>, and the prime factorization of <strong>Y</strong> contains <strong>p<sup>l</sup></strong>, 
then the prime factorization of <strong>XY</strong> will contain <strong>p<sup>k+l</sup></strong>.
</p>

<p>
What we need is to find the values <strong>a</strong> and <strong>b</strong> such that the given <strong>C</strong> has the 
form 2<sup><strong>a</strong></sup> * 5<sup><strong>b</strong></sup> * <strong>F</strong>, for some <strong>F</strong> that is not divisible by 2 or 5. 
</p>

<p>
This can easily be done by processing all the numbers in the given range. For each of them 
we can (just using simple division) find the largest power of 2 and 5 that divides it, and
then add all these powers to get <strong>a</strong> and <strong>b</strong>, respectively.
</p>

<p>
Once we have <strong>a</strong> and <strong>b</strong>, we know the number of zeroes at the end of <strong>C</strong>.
How? The number of zeroes is the largest power of 10 that divides <strong>C</strong>.
And as 10=2*5, that power is simply <strong>z</strong>=min(<strong>a</strong>,<strong>b</strong>).
</p>

<p>
Now we can find the last 5 non-zero digits. Finding the last 5 digits of a number <strong>X</strong> (in base 10)
is equivalent to finding the value (<strong>X</strong> mod 10<sup>5</sup>).
In our case, our number <strong>X</strong> is (<strong>C</strong> with trailing zeroes removed), that is,
<strong>C</strong>/10<sup><strong>z</strong></sup>. Or, equivalently, 2<sup><strong>a</strong>-<strong>z</strong></sup> *
5<sup><strong>b</strong>-<strong>z</strong></sup> * <strong>F</strong>.
</p>

<p>
We can compute the values <strong>a</strong> and <strong>b</strong> and the last five non-zero digits at the same time.
For each number in the given range, first divide it by 2 and 5 (while possible) and increment 
<strong>a</strong> and <strong>b</strong>. Multiply all the remaining parts, modulo 10<sup>5</sup>, to get (<strong>F</strong> mod
10<sup>5</sup>). At the end, compute <strong>z</strong>, and then multiply the value of (<strong>F</strong> mod
10<sup>5</sup>) by the remaining power of 2 or 5.
</p>

<p>
Now what remains is to find the first 5 digits &ndash; that is, an approximate value of <strong>C</strong>.
Simple multiplication (e.g., using doubles) is not the way to go here, as the result can be way
larger than what the range of doubles supports. This can be fixed by keeping the exponent small.
For example, after each multiplication, while the current result has more than 5 digits to the
left of the decimal point, divide it by 10. 
</p>

<p>
We will show an almost equivalent approach, based on a neat trick 
that can be used in situations like this one: logarithms.
In this writeup, we will use the base-10 logarithm and we will denote it log().
</p>

<p>
For any integer k we have log(10<sup>k</sup>)=k.
Logarithm (with a base greater than 1) is an increasing function. Therefore for any integer
X between 10<sup>k</sup> and 10<sup>k+1</sup> 
we have k &lt; log(X) &lt; k+1.
</p>

<p>
Therefore logarithm can be handy to compute the number of digits of any X.
More precisely, all the numbers in [10<sup>k</sup>,10<sup>k+1</sup>) have logarithms
in [k,k+1), and their number of digits is k+1. Thus number_of_digits(X) = 1 + floor(log(X)).
</p>

<p>
Logarithms are additive. That is, log(ab) = log(a)+log(b) for any positive a,b.
Thus, in our task, we can compute <strong>L</strong>=log(<strong>C</strong>) as the sum of logarithms of all
numbers in the given range.
</p>

<p><i>
One geek joke comes to my mind at this point:
<br/>
The Flood is over and the ark has landed. Noah lets all the animals out and says, "Go forth and multiply."
<br/>
A few months later, Noah decides to take a stroll and see how the animals are doing. Everywhere he looks he finds baby animals. Everyone is doing fine except for one pair of little snakes. "What's the problem?" askes Noah.
"Cut down some trees and let us live there", say the snakes.
<br/>
Noah does as they say. Several weeks later, Noah checks on the snakes again. Lots of little snakes, everybody is happy. Noah asks, "Want to tell me how the trees helped?"
<br/>
"Certainly", say the snakes. "We're adders, so we need logs to multiply." 
</i></p>

<p>
We now know that 10<sup><strong>L</strong></sup> = <strong>C</strong>. 
Then, 10<sup><strong>L</strong>-floor(<strong>L</strong>)</sup> = <strong>C</strong> / 10<sup>floor(<strong>L</strong>)</sup>.
If we divide <strong>C</strong> by a power of 10, the digits remain the same, only the decimal point
shifts. In this case, <strong>L</strong>-floor(<strong>L</strong>) is in [0,1), therefore the result is in [1,10).
</p>

<p>
Using similar reasoning, 10<sup><strong>L</strong>-floor(<strong>L</strong>)+4</sup> has the same digits
as <strong>C</strong>, and its value is in [10000,100000). Therefore the first five digits of <strong>C</strong>
can be computed as floor(10<sup><strong>L</strong>-floor(<strong>L</strong>)+4</sup>).
</p>

<p>
Java code follows. We use logarithms to estimate the number of digits in <strong>D</strong>.
If it is small enough, we compute it exactly, otherwise we use the approaches from
this writeup to get its first and last few digits.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> String prettyPrint(<font color="#298a52"><strong>int</strong></font> A, <font color="#298a52"><strong>int</strong></font> B) {
    <font color="#298a52"><strong>int</strong></font> twos=<font color="#ff00ff">0</font>, fives=<font color="#ff00ff">0</font>;
    <font color="#298a52"><strong>long</strong></font> D=<font color="#ff00ff">1L</font>, MOD=(<font color="#298a52"><strong>long</strong></font>)Math.pow(<font color="#ff00ff">10</font>,<font color="#ff00ff">12</font>);
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=A; i&lt;=B; i++) {
      <font color="#298a52"><strong>int</strong></font> tmp=i;
      <font color="#a52829"><strong>while</strong></font> (tmp%<font color="#ff00ff">2</font>==<font color="#ff00ff">0</font>) { tmp/=<font color="#ff00ff">2</font>; twos++; }
      <font color="#a52829"><strong>while</strong></font> (tmp%<font color="#ff00ff">5</font>==<font color="#ff00ff">0</font>) { tmp/=<font color="#ff00ff">5</font>; fives++; }
      D *= tmp;
      D %= MOD;
    }
    <font color="#298a52"><strong>int</strong></font> zeroes = Math.min(twos,fives);
    twos-=zeroes; fives-=zeroes;
    <font color="#a52829"><strong>while</strong></font> (twos--&gt;<font color="#ff00ff">0</font>) { D *= <font color="#ff00ff">2</font>; D %= MOD; }
    <font color="#a52829"><strong>while</strong></font> (fives--&gt;<font color="#ff00ff">0</font>) { D *= <font color="#ff00ff">5</font>; D %= MOD; }

    <font color="#298a52"><strong>double</strong></font> logProduct = <font color="#ff00ff">0</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=A; i&lt;=B; i++) logProduct += Math.log10(<font color="#ff00ff">1.</font>*i);
    logProduct -= zeroes;

    <font color="#a52829"><strong>if</strong></font> (logProduct&lt;<font color="#ff00ff">11.5</font> &amp;&amp; D&lt;(<font color="#298a52"><strong>long</strong></font>)Math.pow(<font color="#ff00ff">10</font>,<font color="#ff00ff">10</font>)) {
      <font color="#a52829"><strong>return</strong></font> D + <font color="#ff00ff">&quot; * 10^&quot;</font> + zeroes;
    } <font color="#a52829"><strong>else</strong></font> {
      logProduct = logProduct - (<font color="#298a52"><strong>int</strong></font>)logProduct + <font color="#ff00ff">4</font>;
      <font color="#298a52"><strong>int</strong></font> first = (<font color="#298a52"><strong>int</strong></font>)(Math.pow(<font color="#ff00ff">10.</font>,logProduct));
      <font color="#a52829"><strong>return</strong></font> first + <font color="#ff00ff">&quot;...&quot;</font> + (D % <font color="#ff00ff">100000</font>) + <font color="#ff00ff">&quot; * 10^&quot;</font> + zeroes;
    }
  }
</pre>

<p>
Exercise: When we find the values <strong>a</strong> and <strong>b</strong> such that C = 2<sup><strong>a</strong></sup> * 5<sup><strong>b</strong></sup> * <strong>F</strong>, 
is it possible that <strong>b</strong> &gt; <strong>a</strong>?
</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9917&amp;rd=13511" name="9917">SolitaireSimulation</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9917)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      575 / 600 (95.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      546 / 575 (94.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Burunduk1</strong> for 247.99 points (2 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192.96 (for 546 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As the class name suggests, simulation was enough to solve this task.
</p>

<p>
Approach 1: Heavy artillery. Use a map to assign turn numbers to visited states. 
Whenever a state appears for the second time, thanks to the map we will find this
out. The difference in turn numbers of both occurrences is the length of the
period.
</p>

<pre>
  vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; step(vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; prev) {
    vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; next(<font color="#ff00ff">1</font>, prev.size() );
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#298a52"><strong>int</strong></font>(prev.size()); i++) <font color="#a52829"><strong>if</strong></font> (prev[i]&gt;<font color="#ff00ff">1</font>) next.push_back( prev[i]-<font color="#ff00ff">1</font> );
    sort( next.begin(), next.end() );
    <font color="#a52829"><strong>return</strong></font> next;
  }

  <font color="#298a52"><strong>int</strong></font> periodLength(vector &lt;<font color="#298a52"><strong>int</strong></font>&gt; heaps) {
    map&lt; vector&lt;<font color="#298a52"><strong>int</strong></font>&gt;, <font color="#298a52"><strong>int</strong></font>&gt; visited;
    sort( heaps.begin(), heaps.end() );
    <font color="#298a52"><strong>int</strong></font> time = <font color="#ff00ff">0</font>;
    visited[ heaps ] = time++;
    <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">1</font>) {
      heaps = step( heaps );
      <font color="#a52829"><strong>if</strong></font> (visited.count( heaps )) <font color="#a52829"><strong>return</strong></font> time - visited[ heaps ];
      visited[ heaps ] = time++;
    }
  }
</pre>

<p>
Approach 2: Use <a href="http://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare">Floyd's cycle finding algorithm</a>.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> <font color="#298a52"><strong>int</strong></font> periodLength(<font color="#298a52"><strong>int</strong></font>[] heaps) {
    ArrayList&lt;Integer&gt; slow = <font color="#a52829"><strong>new</strong></font> ArrayList&lt;Integer&gt;();
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;heaps.length; i++) slow.add(heaps[i]);
    Collections.sort(slow);
    ArrayList&lt;Integer&gt; fast = slow;

    <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">true</font>) {
      slow = step(slow);
      fast = step(fast);
      fast = step(fast);
      <font color="#a52829"><strong>if</strong></font> (slow.equals(fast)) {
        <font color="#298a52"><strong>int</strong></font> period = <font color="#ff00ff">0</font>;
        <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">true</font>) {
          slow = step(slow);
          period++;
          <font color="#a52829"><strong>if</strong></font> (slow.equals(fast)) <font color="#a52829"><strong>return</strong></font> period;
        }
      }
    }
  }
</pre>

<p>
Approach 3: Just store all visited states in an array, and for each new state traverse the entire array
and check whether it already occured. Thanks to how this game works, even such solutions would pass
with plenty of time left.
</p>

<p>
To see that the first two approaches work in time, it is enough to note that the states of the game
are simply <a href="http://www.research.att.com/~njas/sequences/A000041">integer partitions</a>
of the number of cards, which is at most 50. The number 50 has only 204,226 different partitions, 
so this is an upper bound on the number of states we have to visit until one repeats.
</p>

<p>
The fact that the third solution works in time is related to how the game behaves &ndash;
it tends to reach a roughly "triangular" state (such as "1,2,3,4") quickly.
The game is called <a href="http://en.wikipedia.org/wiki/Bulgarian_solitaire">Bulgarian solitaire</a>.
Follow the link for an overview of research related to this game.
</p>

<p>
Exercise: Find the absolutely worst test case, i. e., one that forces Approach 1 to visit as many
states as possible. How would you make sure your case really is the worst one?
(Hint: Find a way how to compute pre-period and period lengths for all states at the same time.)
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9915&amp;rd=13511" name="9915">RedIsGood</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9915)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      356 / 600 (59.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      284 / 356 (79.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 492.10 points (3 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      345.51 (for 284 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The important thing to realize here is that when playing the game, the optimal decision
at any moment depends only on the current set of remaining cards &ndash; and not on
the current balance. This is because our goal is always the same: play the rest of the
game in such a way that our expected profit from the rest of the game is maximized.
</p>

<p>
And moreover, at any moment we only have two options to choose from: either stop
or play on. And we just argued that the decision whether to play or to stop depends
only on the number of red and black cards that remain in the deck.
</p>

<p>
Let E(R,B) be the expected profit from a game with R red and B black cards, if we play
optimally. What are the two options we have at the beginning? If we stop playing, our profit is zero.
If we play on, we flip the first card. With probability R/(R+B) it is red. In this
case, we gain a dollar, and are left with a game with R-1 red and B black cards. 
In the other case, we lose a dollar and are left with R red and B-1 black cards.
Thus the expected profit if we play on is ( R * (E(R-1,B) + 1) + B * (E(R,B) - 1) ) / (R+B).
If this value is positive, it is better to play, if it is negative, it is better to stop
immediately.
</p>

<p>
In the previous paragraph we silently ignored the cases where one of R and B is zero.
For these situations we clearly have E(R,0)=R and E(0,B)=0.
</p>

<p>
What we just got is a recurrence relation that can be used to compute any value E(R,B)
in O(RB) time. The last trick needed to get a working solution was to observe that 
a 5000 by 5000 array of doubles is too large to fit into memory. Luckily, all values
E(R+1,*) can be computed from all values E(R,*) only. Therefore we can reduce the
memory requirements to O(B) by just keeping the last two rows of the array in memory.
</p>

<p>
Java code follows.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> <font color="#298a52"><strong>double</strong></font> getProfit(<font color="#298a52"><strong>int</strong></font> R, <font color="#298a52"><strong>int</strong></font> B) {
    <font color="#298a52"><strong>double</strong></font>[][] best = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>double</strong></font>[<font color="#ff00ff">2</font>][B+<font color="#ff00ff">1</font>];
    Arrays.fill(best[<font color="#ff00ff">0</font>],<font color="#ff00ff">0</font>);
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> r=<font color="#ff00ff">1</font>; r&lt;=R; r++) {
      best[r%<font color="#ff00ff">2</font>][<font color="#ff00ff">0</font>]=r;
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> b=<font color="#ff00ff">1</font>; b&lt;=B; b++)
        best[r%<font color="#ff00ff">2</font>][b] = Math.max(<font color="#ff00ff">0</font>,
            (<font color="#ff00ff">1.</font>*r/(r+b))*(best[ <font color="#ff00ff">1</font>-(r%<font color="#ff00ff">2</font>) ][b] + <font color="#ff00ff">1</font>)
            +
            (<font color="#ff00ff">1.</font>*b/(r+b))*(best[ r%<font color="#ff00ff">2</font> ][b-<font color="#ff00ff">1</font>] - <font color="#ff00ff">1</font>)
        );
    }
    <font color="#a52829"><strong>return</strong></font> best[R%<font color="#ff00ff">2</font>][B];
  }
</pre>

<p>
Exercise 1: Let f(B) be the smallest R such that E(R,B) is positive. How does f look like? (Note that, perhaps surprisingly, f(B)&lt;B for most B.)
</p>

<p>
Exercise 2: How does g(R) = E(R,R) look like?
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9963&amp;rd=13511" name="9963">ChangeOMatic</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9963)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523673" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 600 (13.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      29 / 82 (35.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 728.61 points (18 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      487.27 (for 29 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


<p>
First, we'll show how to solve the case where <strong>inputValue</strong> is small.
</p>

<p>
In this case, a textbook dynamic programming approach can be used: For each amount between 1 and <strong>inputValue</strong>
we will compute the smallest number of coins necessary to give change for this amount. 
</p>

<p>
Additionally, we need to take care of the tie-breaking rule. Whenever there are multiple equally good ways
of providing change, we should prefer the one that uses the larger coins. A simple way how to implement 
this rule is to process the coins in order, and remember the largest coin that could've been used 
in the best solution found so far.
</p> 

<p>
The trouble here is that we need to distinguish between two cases. On one hand, if we have a coin worth 25,
we need the information that we can pay the sum 25 using a single coin. On the other hand, if 25 is what 
we want change for, we need the best way how to pay it using more than one coin.
</p>

<p>
The easiest solution is to store both values: bestPay[x] will be the best way to pay the sum x,
while bestChange will be the best way that uses more than one coin. 
</p>

<pre>
    <font color="#298a52"><strong>int</strong></font> N = outputValues.size(), B = outputValues[N-<font color="#ff00ff">1</font>], MAX = B*B + B + <font color="#ff00ff">47</font>;
    vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; bestPay(MAX), bestPayCoin(MAX), bestChange(MAX), bestChangeCoin(MAX);
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;MAX; i++) { bestPay[i]=i; bestPayCoin[i]=<font color="#ff00ff">0</font>; bestChange[i]=i; bestChangeCoin[i]=<font color="#ff00ff">0</font>; }
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> c=<font color="#ff00ff">1</font>; c&lt;N; c++) {
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=outputValues[c]; i&lt;MAX; i++) {
        <font color="#a52829"><strong>if</strong></font> (bestPay[i] &gt;= bestPay[ i-outputValues[c] ] + <font color="#ff00ff">1</font>)
          bestPay[i] = bestPay[ i-outputValues[c] ] + <font color="#ff00ff">1</font>,
          bestPayCoin[i] = c;
      }
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=outputValues[c]+<font color="#ff00ff">1</font>; i&lt;MAX; i++) {
        <font color="#a52829"><strong>if</strong></font> (bestChange[i] &gt;= bestPay[ i-outputValues[c] ] + <font color="#ff00ff">1</font>)
          bestChange[i] = bestPay[ i-outputValues[c] ] + <font color="#ff00ff">1</font>,
          bestChangeCoin[i] = c;
      }
    }
</pre>

<p>
Now, using this information, we can easily simulate the process described in the problem statement.
Note that to avoid timeouts we can not proceed one coin at a time. Instead, we will proceed one
coin <em>type</em> at a time. 
</p>

<p>
Let the array coinCounts[] contain the counts of coins after we exchanged the original banknote.
Then the simulation can look as follows:
</p>

<pre>
    <font color="#298a52"><strong>long</strong></font> <font color="#298a52"><strong>long</strong></font> result = <font color="#ff00ff">1</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> q=N-<font color="#ff00ff">1</font>; q&gt;<font color="#ff00ff">0</font>; q--) {
      result += coinCounts[q];
      remains = outputValues[q];
      coinCounts[ bestChangeCoin[remains] ] += coinCounts[q];
      remains -= outputValues[ bestChangeCoin[ remains ] ];
      <font color="#a52829"><strong>while</strong></font> (remains) {
        coinCounts[ bestPayCoin[remains] ] += coinCounts[q];
        remains -= outputValues[ bestPayCoin[ remains ] ];
      }
    }
</pre>

<p>
The last remaining issue is the fact that the input banknote can be huge. 
It seems obvious that if the initial banknote is large enough, at least one largest coin will be used in the optimal payment.
We will now show and prove what does "large enough" mean. 
</p>

<p>
Note that the proof was not necessary. Coders could've just guessed
that such a boundary exists, and implement a solution that does the dynamic programming until it almost reaches the time limit.
Such solutions, if done properly, did pass.
</p>

<p>
Lemma: If we have a set of N integers, some non-empty subset of it has a sum divisible by N.
</p>

<p>
Proof: Let the numbers be a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>N</sub>.
Consider the prefix sums: a<sub>1</sub>, a<sub>1</sub>+a<sub>2</sub>, ..., a<sub>1</sub>+...+a<sub>N</sub>
If some of them is divisible by N, we are done.
If not, two of them have to give the same remainder mod N, and then their difference is a subset divisible by N.
</p>

<p> 
Theorem: We have several coin types, and the largest of them has value B.
If we have to pay a sum S &ge; B(B-1) using the smallest possible number of
coins, then at least one coin with value B will be used.
</p>

<p>
Proof by contradiction: Assume the contrary. Thus every optimal way of paying S 
involves only coins worth B-1 or less. Pick one such way. As S &ge; B(B-1), this means 
that at least B coins were used. By our lemma, there is a non-empty subset of these 
coins with sum divisible by B. If we throw away these coins and replace them by the
 same amount in coins worth B each, we get a way of paying B using less coins than 
before. And thus we get a contradiction.
</p>

<p>
Corollary: For any S &ge; B(B-1) an optimal algorithm to pay S is "output a coin worth B, and then pay S-B optimally".
</p>

<p>
This means that for a huge inputValue we can output enough largest coins to decrease the remaining sum
to less than B(B-1), and then use the dynamic programming table to pay the rest optimally.
As B&le;1000, it is enough to have the DP table up to one million, which fits nicely into both the 
time and the memory limit.
</p>

<p>
Exercise: How tight is the "one million" bound? For B=1000, find the coin set that maximizes the largest sum 
that can only be paid optimally without using coins worth B.
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
