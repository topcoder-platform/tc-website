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
    <A href="/stat?c=round_overview&er=5&rd=10742">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514949" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Algorithm Round 1B</span><br>Tuesday, April 10, 2007
<br><br>


<h2>Match summary</h2> 

 
Round 1B of the TCO07 was characterized by three very approachable problems, but all of them had pitfalls that were very easy to stumble into.  With pass rates of 41%, 21% and 29%, this round was about careful coding, thinking through your algorithms, and massive opportunities during the challenge phase.
<br />
<br />
<tc-webtag:handle coderId="144400" context="algorithm"/> took the win with quick times on all 3 problems, followed by <tc-webtag:handle coderId="20286298" context="algorithm"/>, who submitted the fastest 1000 pointer.  Both of these leaders had a solid 5 challenges to give them a comfortable lead.  However, neither could have anticipated the scare they got from <tc-webtag:handle coderId="7340263" context="algorithm"/>, whose astounding 14 successful challenges compensated for a low score on the 1000 to catapult him into 3rd place.  This places him in joint 4th place on the all-time list of <a href="http://www.topcoder.com/stat?c=successful_challenges">Challenge Success for a Single Match</a>, a list he also holds the 1st  and joint 7th place on.  What is notable about his performance is that he managed to earn points from challenges on all 3 problems.  Normally the great challenge phase performances are based on a corner case on a single problem, but <tc-webtag:handle coderId="7340263" context="algorithm"/> managed to break submissions of all 3 problems, and avoided too many failed challenges while he was it.  <tc-webtag:handle coderId="9906197" context="algorithm"/> grabbed 4th spot, defying the trend by actually <i>losing</i> 25 points on a generally profitable challenge phase.  <tc-webtag:handle coderId="15812946" context="algorithm"/> got 5th with solid submissions and 200 from challenges.
<br /><br />
The huge number of failed solutions and successful challenges meant that only 275 people achieved a positive score and advanced to Round 2.  On the flip side, 63 contestants managed to qualify on the basis of challenges alone.

 
<H1> 
The Problems 
</H1>
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7671&amp;rd=10742"
name="7671">AntiPalindrome</a></b> 
</font> 
<A href="Javascript:openProblemRating(7671)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514949" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      478 / 532 (89.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      195 / 478 (40.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 245.63 points (3 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      179.05 (for 195 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This problem was solvable by a very simple greedy algorithm.  The difficulty lay in trying to prove to yourself that the technique would always work.  I'm going to state the algorithm (which is very straightforward), and then work through the observations that convince us that such a simple process will work.
<br /><br />

<b>To construct an anti-palindrome using the letters in s, sort s alphabetically.  Then start with an empty string, and repeatedly remove the first possible letter from s and add it to the end of the new string.  Always use the first letter in s, unless it would directly break our new string being an anti-palindrome.  In this case, use the next available letter.  If there are no alternative letters left in s, return "".</b>
<br /><br />
So simple!  Here's the code:
<pre>
<font color="blue">for</font> (<font color="blue">int</font> i = 0; i < N; i++) aCount[s[i] - 'a']++; <font color="green"><i>// Count the letters</i></font>
<font color="blue">char</font>[] cRet = <font color="blue">new char</font>[N];
<font color="blue">for</font> (<font color="blue">int</font> i = 0; i < N; i++) {
    <font color="green"><i>// Find the next available character j, which does not conflict with N-i-1</i></font>
    <font color="blue">int</font> j = 0;
    <font color="blue">while</font> (j < 26 && (aCount[j] == 0 || cRet[N - i - 1] - 'a' == j)) j++;
    <font color="blue">if</font> (j == 26) <font color="blue">return</font> "";
    <font color="green"><i>// Add the letter j to position i, and remove one j from our count of letters</i></font>
    cRet[i] = (char)('a' + j);
    aCount[j]--;
}
<font color="blue">return new string</font>(cRet);</pre>

But <b>why</b> does this work?  In order to prove it works, we need to evaluate 2 properties.  Does it always return the alphabetically earliest anti-palindrome?  And does it only return an empty string when no solution at all is possible?
<br /><br />

The algorithm always uses the alphabetically first letter in each position, unless doing so would immediately prevent our result from being an anti-palindrome.  So our return will always be alphabetically first.
<br /><br />

The second property is harder to prove.  What if our algorithm leads us into a "dead end" that could have been avoided by choosing a different letter earlier in the process?  Let's look closer at the conditions under which the algorithm will return a blank string.  Divide the word (of <b>N</b> letters long) into <b>(N+1)/2</b> <i>slots</i>.  The first slot would be indices <b>0</b> and <b>N-1</b>.  The next slot would be indices <b>1</b> and <b>N-2</b> etc, until we reach the middle slot which comprises either the middle letter or the middle 2 letters, depending if <b>N</b> is odd or even.  Each of the <b>(N+1)/2</b> slots can only hold 1 copy of a given letter, otherwise the resulting word will not be an anti-palindrome, due to a matching pair of letters existing in opposite locations.  Therefore, if there are more than <b>(N+1)/2</b> instances of a single letter, there won't be enough slots to distribute the letters into, and it is impossible to form an anti-palindrome.
<br /><br />

Also, observe that the algorithm will simply add the alphabetically first <b>(N+1)/2</b> characters to our new word - there are no letters in corresponding opposite positions yet - so we just add the letters alphabetically without restriction.
<br /><br />

If our algorithm returns a blank string, the follow criteria have to be met:
<ul><li>We must be attempting to add a character at index <b>i</b>, where <b>i&ge;(N+1)/2</b>, because the first half of our new word is unconstrained and cannot trigger the condition to return a blank string.</li>
<li>We must have only 1 letter, character <b>c</b> left to add to our new word.</li>
<li>Since we're trying to add at index <b>i</b>, and cannot add <b>c</b>, then index <b>N-i-1</b> must also contain character <b>c</b>.</li>
<li>Since the first <b>(N+1)/2</b> letters of our new word are simply the alphabetically first <b>(N+1)/2</b> characters of our original word, and we still have some of character <b>c</b> left, every position from <b>N-i-1</b> to <b>(N+1)/2-1</b> inclusive must be character <b>c</b>.</li></ul>

Consider how many instances of character <b>c</b> we must have to fulfill these 4 criteria:
<ul><li>In the first half of the word, character <b>c</b> occurs from indices <b>N-i-1</b> to <b>(N+1)/2-1</b> inclusive.</li>
<li>We only have character <b>c</b> left, and still need to fill indices <b>i</b> to <b>N-1</b> inclusive.</li></ul>

Adding these 2 values together yields a total of <b>(N+1)/2+1</b> instances of character <b>c</b>.  As we showed earlier, if there are more than <b>(N+1)/2</b> instances of a single letter, there will be insufficient slots to distribute them into, and so if our algorithm returns a blank string, it does so correctly.
<br /><br />

That's quite a lot of proof to go through for a 250pt problem!  However, as has been discussed in many editorials already, one of the skills of a good TopCoder contestant is being able to quickly convince yourself whether a given algorithm will work without the need for formal proofs.
<br />
<br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7520&amp;rd=10742" name="7520">NavalBattle</a></b> 
</font> 
<A href="Javascript:openProblemRating(7520)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514949" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      214 / 532 (40.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 214 (21.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tmyklebu</b> for 428.52 points (12 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295.40 (for 45 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

The heart of this problem was trying to identify whether or not a configuration of battleships exist that is consistent with the results that Alice has given Bob.  Trying to identify precisely which response from Alice was invalid was something of a distraction.  Once you've written an algorithm to determine whether or not a set of responses is plausible, you can merely rerun that algorithm on the first 1,2,3...,N of Alice's responses until you find an invalid set.

<pre>
<font color="blue">for</font> (<font color="blue">int</font> i = 0; i < shots.Length; i++) {
    <font color="blue">int</font>[] someShots = <font color="blue">new int</font>[i+1];
    Array.Copy(shots, someShots, i+1);
    if (!bLegal(someShots, answers.Substring(0, i+1))) <font color="blue">return</font> i - 1;
}
<font color="blue">return</font> -1;</pre>

How do we determine if a set of responses is legal?
<br /><br />

First, iterate through Alice's responses and map them to an array indexed by location, marking hits and misses.  If Alice is queried about the same location twice, and gives 2 different responses, we know that her results are inconsistent, and can return immediately.
<br />
<br />

We also need to remember the restriction that at least one battleship must exist on the board.  If her results do not leave <i>shipLength</i> connected cells that could contain a ship, she must have lied and we are done.
<br /><br />

At this point we need to actually delve into the details of how the battleships could possibly be arranged.  There's a nice recursive relationship that helps us solve this problem very easily.
<br /><br />

The cells from <b>i</b> to <b>j</b> inclusive can be legal if either:
<ul><li>i>j (we are looking at 0 cells)
<br><i>or</i></li>
<li>Cell <b>i</b> can be empty, and the cells from <b>i+1</b> to <b>j</b> can be legal.
<br><i>or</i></li>
<li>A battleship can be placed from <b>i</b> to <b>i+shipLength-1</b>, <b>i+shipLength</b> can be empty, and the cells from <b>i+shipLength+1</b> to <b>j</b> can be legal</li></ul>

It's that simple!  The physical implementation of the algorithm could be done as recursion with short circuit boolean logic, recursion with memoization, or dynamic programming.  If you wrote a recursive solution which evaluated all 3 above conditions on each call, the runtime would be exponential and it would timeout on cases with large <i>fieldLength</i>s and small <i>shipLength</i>s.
<br /><br />

Seven lines of code for a recursive solution with short circuit boolean logic (it returns as soon as ONE condition is true):

<pre><font color="blue">private bool</font> bLegalCells(<font color="blue">int</font> i, <font color="blue">int</font> j) {
    <font color="green"><i>// Are there 0 cells?</i></font>
    <font color="blue">if</font> (j < i) <font color="blue">return true</font>;
    <font color="green"><i>// Can i be empty, and i+1..j is legal?</i></font>
    <font color="blue">if</font> (!bHit[i] && bLegalCells(i + 1, j)) <font color="blue">return true</font>;
    <font color="green"><i>// Can we have a ship at i, a space at i+shipLength, and the rest is legal?</i></font>
    <font color="blue">if</font> (i+shipLength-1<=j) {
        <font color="blue">for</font> (<font color="blue">int</font> k = i; k < i+shipLength; k++) <font color="blue">if</font> (bMiss[k]) <font color="blue">return false</font>;
        <font color="blue">if</font> (i + shipLength <= j && bHit[i + shipLength]) <font color="blue">return false</font>;
        <font color="blue">return</font> bLegalCells(i + shipLength + 1, j);
    }
    <font color="green"><i>// None of the conditions were satisfied</i></font>
    <font color="blue">return false</font>;
}</pre>

So, if it was such a straightforward problem, why only a 21% success rate?  More than half of the competitors didn't take into account that if Alice gave contradictory information about a single square (reporting a hit and miss on the same square), then she must have lied.  Many failed implementations stored an array of Alice's responses per cell, but simply overwrote her old response with her new one, losing the crucial information that Alice had cheated.
<br /><br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7672&amp;rd=10742"
name="7672">AmbiguousWatch</a></b> 
</font> 
<A href="Javascript:openProblemRating(7672)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514949" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      112 / 532 (21.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      33 / 112 (29.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 920.24 points (8 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      639.36 (for 33 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This 1000pt problem required no advanced algorithm knowledge to solve - just some logic and high school algebra.  To make things clearer, whenever I refer to a clock's hand position, I will refer to it base 60, in the same way that a minute hands works.  0 is vertical upwards, 15 is horizontal to the right etc.
<br /><br />

Let's do a bit of analysis on what constitutes an "ambiguous time".  Defining some terms:
<br /><br />
<b>H</b> is the hour hand's position.  <b>0</b>&le;<b>H</b><<b>60</b><br />
<b>M</b> is the minute hand's position.  <b>0</b>&le;<b>H</b><<b>60</b>
<br /><br />

If the hour hand is at position <b>H</b>, the minute hand's position <b>M</b> will be <b>(H*12)-60k</b>, where <b>k</b> is an integer, <b>0</b>&le;<b>k</b>&le;<b>11</b><br />
<b>M=12*H-60k</b>
<br /><br />

For an ambiguous time, since either hand could be the minute hand or the hour hand, this constraint has to hold true regardless of how we label the minute hand and hour hand <b>M</b> and <b>H</b>.
<br /><br />
Let's call the hands' positions <b>a</b> and <b>b</b>.  We know that both of the above relationships are true.  So:

<pre><b>b=12*a-60*k
a=12*b-60*n
b=12*(12*b-60*n)-60*k
b=144*b-60*(12*n+k)</b>        (Replace 12*n+k with just k for convenience)<b>
143*b=60*k
b=(60/143)*k</b></pre>

We now have a generating function to generate all hand positions which lead to ambiguous times.  We can just loop from k=0 to k=143, calculate the hour and minute values for each k, and determine if it falls into the range specified by <i>startTime</i> and <i>finishTime</i>.  Right?
<br /><br />

If it's that straightforward, why a meager 29% success rate?  Once again, there was one little catch on this problem that threw out the majority of competitors.  There is a second condition to determine if a clock is ambiguous:  The hands have to be interchangeable, and changing the hands around <i>has to alter the time</i>.  When the hands are in the precise same location, only the first condition has been met, not the second.  The hands <i>are</i> interchangeable, but changing them does not alter the time, hence the clock doesn't give an ambiguous time.  Removing these values from the return could be done either by comparing the calculated values of <b>hour</b> and <b>minute</b> (with an epsilon, we <i>are</i> dealing with doubles...), or by removing every 13th generated value (you could see this pattern if you observed the generated series or did a bit more algebra).
<br />
<br />

Code follows (<b>iStart</b> and <b>iEnd</b> are <i>int</i>s representing the start and end times in minutes)

<pre><font color="blue">int</font> iRet = 0;
<font color="blue">for</font> (<font color="blue">double</font> k = 0; k < 143; k++) {
    <font color="blue">double</font> dHour = (k * 60 / 143) % 60;
    <font color="blue">double</font> dMin = (dHour * 12) % 60;
    <font color="blue">if</font> (Math.Abs(dHour - dMin) > 0.001 && dHour * 12 > iStart 
        && dHour * 12 < iEnd) iRet++;
}
<font color="blue">return</font> iRet;</pre>
<br /><br />





<div class="authorPhoto">
    <img src="/i/m/HiltonLange_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="10428762" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
