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
    <A href="/stat?c=round_overview&er=5&rd=10657">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506223" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 333</span><br>Thursday, January 4, 2007
<br><br>

<h2>Match summary</h2> 

If someone asked me to characterize the problem sets (for both divisions) in one sentence, I would
say "pay attention to details, it will pay off twice.&quot; This time my goal was to make a problem set
that would lead to an interesting challenge phase. And so it was --but let's start at the beginning.
<br /><br />
Most Division 1 coders started the day by opening the easy problem &ndash; a string parsing problem
where the most difficult part was to check whether a part of the string represents a valid date.
When it comes to dates and times, it's good to be careful, and so it took a while until we saw
the first submission. (Its author was no surprise at all. Try to guess and verify it below.)
In the next few minutes, we saw a plenty of submissions on the easy problem and then... nothing.
<br /><br />

Almost half an hour into the coding phase <tc-webtag:handle coderId="301395" context="algorithm"/> was the first to submit the hard problem,
with no submissions on the medium yet. His solution didn't even pass some of the examples,
but it was apparently enough to get the top competitors thinking "umm, did I miss some easy way how 
to solve it?" (A notable fact is that <tc-webtag:handle coderId="301395" context="algorithm"/>'s 1000 survived for a surprisingly long part
of the challenge phase. Was nobody willing to take the risk and challenge it?)
<br /><br />
Three minutes later we saw the first submissions of the medium problem. In a matter
of seconds, four coders submitted their solutions. It's almost unbelievable how balanced the 
top coders are.
<br /><br />
At 52 minutes into the competition <tc-webtag:handle coderId="11829284" context="algorithm"/> submitted his solution for the hard problem and
took the lead, being the first person to complete the set... or not? Sadly for him, testing
revealed a hidden bug in his 1000, and eight minutes later he had to resubmit.
<br />
<br />
Submissions continued to pour in. When the coding phase ended, the coders could take a look at the
division summary, only to discover that none of the competing targets had submitted the hard
problem -- in fact, the best performance among the targets was <tc-webtag:handle coderId="10574855" context="algorithm"/>'s, who was in 22nd place.
<br /><br />
But that was all about to change when the challenge phase started. Day equal to zero?
A string of zeroes ending just outside of T? The volume of a 1&times;1&times;1 pyramid?
The possibilities to gain points were almost endless, and many coders used them to
move up the ranklist. For example, <tc-webtag:handle coderId="8472826" context="algorithm"/>'s six successful challenges (and one wrong)
brought him to 6th place overall. Other good challengers were <tc-webtag:handle coderId="311664" context="algorithm"/> (7 good, 1 bad, 11th overall)
and <tc-webtag:handle coderId="22262451" context="algorithm"/> (5 good, 17th overall).
<br />
<br />
During the challenge phase the leader changed almost every minute. We saw <tc-webtag:handle coderId="11829284" context="algorithm"/> leading
the pack, then <tc-webtag:handle coderId="10428762" context="algorithm"/>, <tc-webtag:handle coderId="22058011" context="algorithm"/>, ... and in the last minutes of the challenge phase
<tc-webtag:handle coderId="7421158" context="algorithm"/> claimed the top spot for a while. But the contest wasn't over yet.
<br />
<br />
After the system tests we saw that only two coders had solved all three tasks: the SRM
winner and new target <tc-webtag:handle coderId="14970299" context="algorithm"/>, and fellow Russian <tc-webtag:handle coderId="11829284" context="algorithm"/>. Speaking of fellow Russians,
just look at the next three places: <tc-webtag:handle coderId="22058011" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="22641345" context="algorithm"/> are all from Russia, too.
Quite a day for them!
<br />
<br />
The Division 2 match was pretty similar to what was happening in Divion 1. The coders started off
with a pretty easy 250, then solved the same two problems as the Div1 easy and medium. The
Div1 medium / Div2 hard problem proved to be too tricky for this division &ndash; 
due to the time pressure, none of the 62 submissions was flawless. 
<br /><br />
Newcomer <tc-webtag:handle coderId="22014601" context="algorithm"/> was the first to submit both the easy and the medium problem. 
But with a tricky medium and hard, even this was not enough to win the division.
Several more experienced coders were much more successful in challenging, and the
challenge phase was what determined the top spots in the division.
<br />
<br />
A notable event were <tc-webtag:handle coderId="8598053" context="algorithm"/>'s challenges (9 good ones and a bad one)
which gave him 12th place overall with only the easy problem solved. 
<br />
<br />
The top three places were claimed by <tc-webtag:handle coderId="15709681" context="algorithm"/>, <tc-webtag:handle coderId="8471496" context="algorithm"/> and <tc-webtag:handle coderId="20538698" context="algorithm"/>. Each of them 
had to make at least 4 successful challenges to get to the top.
<br />
<br />

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7259&amp;rd=10657" name="7259">ChessboardPattern</a></b> 
</font> 
<A href="Javascript:openProblemRating(7259)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506223" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      532 / 580 (91.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      498 / 532 (93.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>MMLEI</b> for 249.26 points (1 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.98 (for 498 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

An easy problem to get everyone started. It can easily be seen that the 
constraints in the problem statement really define a chessboard-like pattern.
<br /><br />

Consider the squares (0,0) and (i,j). If (i+j) is even the squares have the
same symbol, if (i+j) is odd they have different symbols. Thus the symbol
at coordinates (i,j) depends only on the value (i+j) modulo 2. 
<br /><br />

In addition, we know that the symbol at (rows-1,0) is a dot. This gives us
enough information to fill the whole chessboard at once.
<br /><br />

Java code follows:

<pre>
  public String[] makeChessboard(int rows, int columns) {
    String[] result = new String[rows];
    for (int i=0; i&lt;rows; i++) result[i] = "";
    for (int i=0; i&lt;rows; i++)
      for (int j=0; j&lt;columns; j++) 
        if ( ((rows-i+j) % 2) == 0)
           result[i] += "X";
        else
           result[i] += ".";
    return result;
  }
</pre>

<br /><br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7291&amp;rd=10657" name="7291">BirthNumbersValidator</a></b> 
</font> 
<A href="Javascript:openProblemRating(7291)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506223" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      437 / 580 (75.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      147 / 437 (33.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ilyaraz</b> for 450.53 points (9 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      289.83 (for 147 correct submissions) 
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
      434 / 439 (98.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      281 / 434 (64.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 241.73 points (5 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194.16 (for 281 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This was an example of a real life problem. We can split the checking into several 
logical steps. And if we <b>can</b> do this, it's almost always a good idea to 
actually <b>do it</b>. The resulting code will be much less error prone.
<br /><br />

The things we need to check:

<ul>
<li>Is the number divisible by 11?</li>
<li>Does it contain a valid date?</li>
</ul>

The divisibility by 11 is simple to check &ndash; just convert the string to a 64-bit integer
and use the built-in modulo operator.
<br /><br />

For the validity of a date we will start by introducing some helper functions: 
The function <code>isLeap(year)</code> will compute whether the year is a leap year,
and the function <code>getDaysInMonth(month,year)</code> will return the number of days
in the given month. Note that we need to give the year as the second argument to handle
leap years properly.

<pre>
  boolean isLeap(int y) { return (y%4 == 0); }
  int[] daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  int getDaysInMonth(int m, int y) { if (m==2 &amp;&amp; isLeap(y)) return 29; return daysInMonth[m-1]; }
</pre>

Now we are ready to process the string:

<pre>
  public String[] validate (String[] test) {
    int N = test.length;
    String[] result = new String[N];

    for (int i=0; i&lt;N; i++) {
      result[i] = "NO";

      // check for divisibility
      long value = Long.parseLong(test[i]);
      if (value % 11 != 0) continue; // the answer remains NO

      // parse the stored date
      int year = Integer.parseInt( test[i].substring(0,2) );
      int month = Integer.parseInt( test[i].substring(2,4) );
      int day = Integer.parseInt( test[i].substring(4,6) );

      // adjust the parsed values
      year += 1900; if (year &lt;= 1906) year += 100;
      if (month &gt;= 50) month -= 50;

      // check whether the date is valid
      if (month &lt; 1 || month &gt; 12) continue;
      if (day &lt; 1 || day &gt; getDaysInMonth(month,year)) continue;

      result[i] = "YES";
    }
    return result;
  }
</pre>

By far the most common error was forgetting that neither day 00 nor month 00 (or 50) is a valid input.

<br /><br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7294&amp;rd=10657" name="7294">RepeatedPatterns</a></b> 
</font> 
<A href="Javascript:openProblemRating(7294)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506223" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      62 / 580 (10.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 62 (0.00%) 
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
      205 / 439 (46.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 205 (10.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>andrewzta</b> for 346.63 points (20 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      237.91 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This was one tough ad-hoc problem. The problem statement is short and simple, for
the whole time it is clear what to do, and almost clear how to do it. Still, to
more experienced coders the problem statement seems to scream "mind the details"!
Slowing down and making sure you didn't miss anything is a good investment whenever
you encounter a similar problem.
<br /><br />

So, let's approach the problem slowly. We will split the solution into four cases,
depending on whether the patterns <b>P1</b> and <b>P2</b> contain at least one '1'.
<br /><br />

The simplest case is when both <b>P1</b> and <b>P2</b> contain only '0's. In this case for any
<b>zeroCount</b> the answer is simply 0.

<pre>
  boolean P1zero = P1.matches("0*");
  boolean P2zero = P2.matches("0*");
  if (P1zero &amp;&amp; P2zero) return 0; // the sequence occurs at index 0
</pre>

Another simple case is when both <b>P1</b> and <b>P2</b> contain some '1's. In this case the longest
sequence of '0's will be pretty short. Clearly, it can not contain an entire pattern.
Thus, if there is a sequence of <b>zeroCount</b> '0's, it has to be a subsequence of <b>P1+P1</b>,
of <b>P1+P2</b>, of <b>P2+P1</b>, or of <b>P2+P2</b>. We find the earliest match (if any) and output it:

<pre>
  int checkString(String haystack, long zeroCount) {
    if (zeroCount &gt; haystack.length()) return -1;
    String needle=""; for (int i=0; i&lt;zeroCount; i++) needle += "0";
    return haystack.indexOf(needle);
  }

  // ...

  if ((!P1zero) &amp;&amp; (!P2zero)) {
    int x;
    x = checkString(P1+P1,zeroCount); if (x&gt;=0) return x;
    x = checkString(P1+P2,zeroCount); if (x&gt;=0) return x + 999999*P1.length();
    x = checkString(P2+P1,zeroCount); if (x&gt;=0) return x + 1000000*P1.length();
    x = checkString(P2+P2,zeroCount); if (x&gt;=0) return x + 2000000*P1.length() + P2.length();
    return -1;
  }
</pre>

If <b>P1</b> contains only '0's and <b>P2</b> contains some '1's, there are three cases:

<ul>
<li>If there are at least <b>zeroCount</b> '0's at the beginning, the answer is 0.
<li>Else, there may be a longer string of '0's that starts within the first occurence
of <b>P2</b>, contains 1,000,000 occurences of <b>P1</b> and the beginning of the second <b>P2</b>.
<li>If <b>zeroCount</b> exceeds the length of that substring, the answer is -1.
</ul>

<pre>
  // compute the information on the number of head/tail zeroes
  String zeroes="";
  int P1head=0, P1tail=0, P2head=0, P2tail=0;
  for (int i=1; i&lt;=50; i++) {
    zeroes += "0";
    if (P1.startsWith(zeroes)) P1head = i;    if (P1.endsWith(zeroes)) P1tail = i;
    if (P2.startsWith(zeroes)) P2head = i;    if (P2.endsWith(zeroes)) P2tail = i;
  }

  if (P1zero &amp;&amp; (!P2zero)) {
    // types of segments:
    // - at the beginning
    // - between two P2s
    int beginning = 1000000 * P1.length() + P2head;
    int between = P2tail + 1000000 * P1.length() + P2head;
    if (beginning &gt;= zeroCount) return 0;
    if (between &gt;= zeroCount) return 1000000 * P1.length() + P2.length() - P2tail - 1;
    return -1;
  }
</pre>

The last remaining case is when <b>P2</b> has only '0's and <b>P1</b> has some '1's. In this case
S will contain an arbitrarily long zero substring, the trick is to find whether it occurs soon 
enough... and for small <b>zeroCount</b> you also shouldn't miss the chance of seeing the 
substring before you even get to the first <b>P2</b>.
<br /><br />

Thus, first we check whether <b>P1+P1</b> contains a long enough substring. If not, the first
occurrence will be a substring of "tail zeroes in <b>P1</b> + several times <b>P2</b> + leading
zeroes in <b>P1</b>". We can easily compute the smallest number of <b>P2</b>s we need. 
Now all is left is to check whether this substring occurs early enough in S.
To avoid overflow, in my solution I used binary search to find the largest N such that T contains
a part of S(N).

<pre>
  long TEN_TO_SIXTEEN = 1; for (int i=0; i&lt;16; i++) TEN_TO_SIXTEEN *= 10;

  if ((!P1zero) &amp;&amp; P2zero) {
    // types of segments:
    // - inside P1 + P1
    // - between two P1s with sufficiently many P2s
    int x = checkString(P1+P1,zeroCount); if (x&gt;=0) return x;
    zeroCount -= P1tail;
    zeroCount -= P1head;

    long lo=0, hi=1;
    while (getLength(P1.length(), P2.length(), hi) &lt; TEN_TO_SIXTEEN) hi *= 2;
    while (hi-lo &gt; 1) {
      long med = (lo+hi)/2;
      if (getLength(P1.length(), P2.length(), med) &lt; TEN_TO_SIXTEEN) lo=med; else hi=med;
    }

    long mostP2s = hi;
    long needsP2s = (zeroCount + P2.length() - 1) / P2.length();
    if (mostP2s &lt; needsP2s) return -1;

    long index = needsP2s * 1000000 * P1.length() + (needsP2s * (needsP2s-1)) * P2.length() / 2 - P1tail - 1;
    if (index + zeroCount &gt; TEN_TO_SIXTEEN) return -1;
    return index;
  }
</pre>

Note that much shorter solutions are possible. E.g., in the solution presented above, many cases could
be merged together &ndash; but the price to pay makes it not worth the trouble in a real contest.
However, IMHO this problem is a great candidate for a shortest code contest... why don't you give it
a try? <code>:-)</code>

<br /><br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7295&amp;rd=10657" name="7295">ThreeBuses</a></b> 
</font> 
<A href="Javascript:openProblemRating(7295)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506223" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      20 / 439 (4.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 20 (25.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>not2knight</b> for 601.81 points (20 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      518.22 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

In this task we have to deal with probability in a setting when there is an infinite number 
of possible outcomes. In many such situations, geometry may help. 
<br /><br />

Before you start reading, scroll down to see the long and ugly code necessary to solve the
general case. After you are properly amazed, scroll back here and start reading the
solution <code>:-)</code>
<br />

<h4>Introduction</h4>

Let's start with a simple example. Suppose I have a stick 1 meter long. I break it in a random
place. What is the probability that both parts will be at least 40 cm long?
<br /><br />

We may draw a picture representing the stick:

<pre>
0                   50                  100
|---|---|---|---|---|---|---|---|---|---|
|       A       |   B   |       C       |
</pre>

If the breaking point falls into A or C, one of the sticks will be too short. On the other hand,
if the breaking point falls inside B, both sticks will be long enough. Thus the probability is
(length of B) / (length of the stick) = 20 / 100 = 20%.
<br />

<h4>Simplifying the problem</h4>

Clearly, Johnny has to spend (travel[0] + travel[1] + travel[2]) minutes traveling. We may
subtract these from timeLeft and forget about them from now on.

<br /><br />
If all values in wait[] are zero, the outcome is clear and we output it immediately.
<br />

<h4>One bus</h4>

If Johnny had to ride only one bus, we get a very similar problem. The stick will represent the
interval [0,W], and the good part of the stick will be the interval [0,min(timeLeft,W)]. 
<br /><br />

Note that we get this case when two of the values in wait[] are zero.
<br />

<h4>Two buses</h4>

Now it starts to become interesting. The possible outcomes can no longer be mapped to a stick.
Instead, we have to use two dimensions. Let WX and WY be the maximum wait times for the two 
buses. All possible outcomes of Johnny's trip correspond to points inside an axes-parallel 
rectangle with corners in [0,0] and [WX,WY]. Good outcomes will correspond to those points [x,y]
where x+y&le;timeLeft.
<br /><br />

Let's take a closer look at how the set of good outcomes looks like.
<br /><br />
<div align="center">
<img src="/i/srm/srm333/hard1.png" alt="srm333" />
<br/>
<img src="/i/srm/srm333/hard2.png" alt="srm333" />
<br/>
<img src="/i/srm/srm333/hard3.png" alt="srm333" />
</div>
<br /><br />

The lines "x+y = constant" are parallel and have a 45 degree angle with the x axis. The good
outcomes are those on this line and in the halfplane to the left of it. In the pictures the
good outcomes are in pink.
<br /><br />

The answer in this case, of course, is (pink area) / (rectangle area). In cases corresponding
to the images 1 and 3 we just need to compute the area of a right triangle, in the second case
a right trapezoid. Elementary school math is enough here. You may note that the second case
only occurs whenever one of the rectangle's dimensions exceeds twice the other.

<pre>
  double area(int x, int y, double sum) {
    if (sum &lt;= 0) return 0.0;
    if (x&gt;y) { int z; z=x; x=y; y=z; }
    double result = x*y;
    if (sum &lt;= x) result = 0.5*sum*sum; else
    if (sum &lt;= y) result = 0.5*(2*sum-x)*x; else
    if (sum &lt;= x+y) result = x*y - 0.5*(x+y-sum)*(x+y-sum);
    return result;
  }
</pre>

<h4>Three buses</h4>

The concept for the next step should be clear. All outcomes = a WX &times; WY &times; WZ box.
Good outcomes: everything on or below the plane x+y+z = timeLeft.
<br /><br />
<div align="center">
<img src="/i/srm/srm333/hard4.png" alt="srm333" />
</div>
<br /><br />

The problem is that computing the volume can be quite ugly, and the number of different
cases is much larger than before. 
Sure, there is an O(1) solution, but let's think how can we make our life easier.
<br /><br />

One possible trick: Consider an arbitrary horizontal cut through our box. Suppose that Y is the height
of the cut. What we get is a 2D version of our problem with x+z &lt;= timeLeft-Y. 
<br /><br />
<div align="center">
<img src="/i/srm/srm333/hard5.png" alt="srm333" />
</div>
<br /><br />

<i>(Now there's a way how to write a reasonable O(1) solution using high-school math only:
Find all vertices of the "good outcomes" polyhedron, put a horizontal cut through each of them,
and find a formula for the volume of each of the pieces you'll get. In the rest of this solution
we will show how to use calculus to obtain a solution that is way easier to implement.)
</i>
<br /><br />

Using the <code>area()</code> function as defined above, we can express the area of the cut as
<code>area(WX,XZ,timeLeft-Y)</code>.
<br /><br />
Now, the volume of the good part can be written as
<br /><br />
<div align="center">
<img src="/i/srm/srm333/hard6.png" alt="srm333" />
</div>
<br /><br />
Imagine that we start with the cut at Y=0, and now start to increase Y. How will
the area of the cut change? For a while it may be constant, then it will decrease,
until it's zero or we get to Y=WY. 
<br /><br />
Remember that there were 3 types of areas when handling the 2D situation. 
<i>(Umm, more precisely, there were 5 cases. The area can also be equal to the entire rectangle, or
it can be zero. To see an example when this happens, consider WX=WZ=10, WY=100 and
timeLeft=47.)</i>
<br /><br />
Repeat the above process (moving the cut from Y=0 upwards). When will the <b>type</b> of the area change?
Clearly, this will happen whenever the cut passes through a vertex of the 
"good outcomes" polyhedron. 
<br /><br />
Now our goal will be to cut the polyhedron into pieces so that in each piece
all cuts will have the same type. We can do this without even computing
where the polyhedron's vertices are. How?
<br /><br />
Note that all vertices of the "good outcomes" polyhedron had integer coordinates.
Suppose that we make a horizontal cut at each integer Y. This will divide the 
polyhedron into WY pieces, each 1 unit tall. 
Clearly, there are no vertices of the polyhedron inside any of the pieces.
<br /><br />
Now let's consider an arbitrary piece and take a closer look at the integral we are
computing.
Clearly, for the first case (area is a triangle) and the third case (area is all but a triangle)
<code>area(WX,XZ,Y)</code> is a quadratic function of <code>Y</code>.
For the second case (area is a trapezoid) 
<code>area(WX,XZ,Y)</code> is a linear function of <code>Y</code>.
<i>(For the two boundary cases <code>area()</code> is clearly a constant function.)</i>
This means that in each of the pieces we are integrating either a constant, a linear, or a quadratic function.
<br /><br />
And here comes the beauty. We don't have to know which case we integrate. 
The trick is to use <a href="http://mathworld.wolfram.com/SimpsonsRule.html">Simpson's Rule</a>
to compute the value of the integral. For general functions Simpson's Rule is just
an approximation of the integral, but for up to cubic polynomials the output is exact.
<br /><br />
In our situation, the rule is almost unbelievably simple.
For an at-most-cubic polynomial <code>f()</code> we have: <br/><br/>
<div align="center">
<img src="/i/srm/srm333/hard7.png" alt="srm333" />
</div>
<br /><br />
The complete code solving the general case is then just a few lines:

<pre>
  double cutAreas[] = new double[2*wait[0]+1];
  for (int x=0; x&lt;=2*wait[0]; x++) 
    cutAreas[x] = area(wait[1],wait[2],timeLeft-0.5*x);

  double volume = 0.0;
  for (int x=0; x&lt;wait[0]; x++)
    volume += (cutAreas[2*x] + 4*cutAreas[2*x+1] + cutAreas[2*x+2]) / 6;

  for (int i=0; i&lt;3; i++) volume /= wait[i];

  return volume;
</pre>

Amazing, isn't it?
<br /><br />
 

<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
