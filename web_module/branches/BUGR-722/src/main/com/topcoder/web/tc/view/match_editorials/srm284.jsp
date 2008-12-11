<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505798" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 284</span><br>Saturday, January 21, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
In Division 1, the problems were much easier compared to SRM 283, making coders vulnerable to any fault.
Five targeteers competed in the SRM, with only three of them staying in 3000+ after the event.
In a tough competition, Eryx, bmerry, radeye and rem finished at places from second to fifth, 
and misof got home his 7th SRM win.
Taking into account Petr's weak performance, this allowed misof to climb at the first position in overall TC rating.
Congratulations!
</p>
<p>
In Division 2, only 3 coders were able to get the hard problem correct. 
veskok won the Division by more than 80 points, followed by newcomers Tigran and AlixM. 
royappa, Archimedean1 and ourziks took the next three places.
</p>
<p>
It is worth mentioning that radeye updated his 
<a href="http://radeye.com/srmwin.html">SRM Overall Winners</a> page after staying idle for 11 SRMs. 
Petr won 5 of these 11 and passed his first milestone of 10 wins.
</p>
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6011&amp;rd=8081" name="6011">Truckloads</a></b> 
</font> 
<A href="Javascript:openProblemRating(6011)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      378 / 446 (84.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      339 / 378 (89.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gauravj116</b> for 249.45 points (1 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.70 (for 339 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem you need to follow the instructions in the statement and utilize some recursion. 
If numCrates is not greater than loadSize, we return 1.
Otherwise we split the crates into 2 smaller piles and recursively call our method for these piles.
If numCrates is even, each of the smaller piles will contain (numCrates / 2) crates. 
If numCrates is odd, smaller piles will contain (numCrates / 2)  and ((numCrates + 1)/ 2) crates.
Java code follows:
<pre>
int numTrucks(int numCrates, int loadSize) {
    if (numCrates <= loadSize) return 1;
    return (numTrucks(numCrates/2, loadSize) + numTrucks((numCrates + 1)/2, loadSize));
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2267&amp;rd=8081" name="2267">Measures</a></b> 
</font> 
<A href="Javascript:openProblemRating(2267)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      193 / 446 (43.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      90 / 193 (46.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Archimedean1</b> for 458.07 points (8 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      293.10 (for 90 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Low constraints for this problem allow us to apply a simple brute-force solution. 
We iterate throw all allowed numbers of beats per measure in ascending order (from 2 to 10). 
For each such number K, we check each of the first K beats for being an valid first beat for a measure. 
Lets look closely at this check.
</p>
<p>
To check whether the starting the first full measure from the f-th beat (with bpm beats per measure) is valid, 
we do the following: 
<li>Find the total number of measures. 
If the first beat of the first measure is f, and the total number of beats is N, the number of full measures will be 
(N-f)/bpm. If we don't have any full measures, our check should return false.</li>
<li>Find the total number of measures with a non-stressed first beat. 
Our check should return true if this number is not greater than 1/5 of total measures.</li>
Java code follows:
<pre>
boolean check(int[] loudness, int bpm, int f) {
    int total = (loudness.length - f) / bpm;
    if (total <= 0) return false;
    int bad = 0;
    while (f + bpm <= loudness.length) {
        boolean isBad = false;
        for (int i = 0; i < bpm; i++) isbad |= (loudness[first] < loudness[f + i]);
        if (isBad) bad++;
        f += bpm;
    } 
    return (bad * 5 <= total);
}

</pre>

</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4435&amp;rd=8081" name="4435">SnakeCount</a></b> 
</font> 
<A href="Javascript:openProblemRating(4435)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      21 / 446 (4.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 21 (14.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>veskok</b> for 587.20 points (28 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      504.81 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First of all, imagine we have found a head of a snake and want to check whether this snake is really valid. 
To do this, we run a DFS starting from the head, marking all visited cells and moving only to orthogonally adjacent pixels. 
At each step, if current cell has more than 1 non-visited neighbour, the snake is invalid.
If we don't have unvisited neighbours anymore, we count the total number of visited cells. 
If it is less than 3 or greater than 20 - the snake isn't valid again. 
The last step is to check whether the picture contains a non-visited snake-colored pixel, which is adjacent to a visited one.
(this can be done by a simple brute-force check over all diagonally adjacents pairs of cells). 
f we can't find any such pair (and we passed all previous checks), we count the snake as "valid".
</p>
<p>
As soon as we are able to figure whether a pixel is a head of a valid snake, we can use brute force for the remaining part of the problem.
We try all pixels as a possible head of a snake and count the total number of "valid" snakes using the algo we described above.
Since every snake will be counted twice (once for each of its ends), return the total number of divided by 2. 
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4811&amp;rd=8081" name="4811">TriCount</a></b> 
</font> 
<A href="Javascript:openProblemRating(4811)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      257 / 342 (75.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      241 / 257 (93.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 249.01 points (1 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      166.89 (for 241 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
At the first glance, the problem can be solved by three nested loops iterating from minLength to maxLength and 
counting the total number of triangles:
<pre>
int ans = 0;
for (int i = minLength; i < maxLength + 1; i++)
    for (int j = minLength; j < maxLength + 1; j++)
        for (int k = minLength; k < maxLength + 1; k++)
            if (i + j > k) ans++;
return ans;
</pre>
This code is definitely wrong, because it will count some triangles more than once (for example, triangle (minLength, minLength, minLength + 1) will be counted thrice).
To avoid this, we can represent each triangle by its side lengths sorted in ascending order. The code will change to:
<pre>
int ans = 0;
for (int i = minLength; i < maxLength + 1; i++)
    for (int j = i; j < maxLength + 1; j++)
        for (int k = j; k < maxLength + 1; k++)
            if (i + j > k) ans++;
return ans;
</pre>
This code will return the correct value for small inputs, so we need to make it faster for bigger ones. 
First of all, there is no need to continue the innermost loop as soon as k is greater or equal than (i + j). 
Another possible optimization is to stop as soon as we have found enough triangles:

<pre>
int ans = 0;
for (int i = minLength; i < maxLength + 1; i++)
    for (int j = i; j < maxLength + 1; j++) {
        for (int k = j; k < Math.min(maxLength + 1, i + j); k++)
            ans++;
        if (ans > 1000000000) return -1;
        }
return ans;
</pre>
The last step is to see that the innermost cycle increments <b>ans</b> once at each step, 
so the number of steps can be found as (Math.min(maxLength + 1, i + j) - j):
<pre>
<b>
int ans = 0;
for (int i = minLength; i < maxLength + 1; i++)
    for (int j = i; j < maxLength + 1; j++) {
        ans += (Math.min(maxLength + 1, i + j) - j);
        if (ans > 1000000000) return -1;
        }
return ans;
</b>
</pre>

</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4847&amp;rd=8081" name="4847">Smooshing</a></b> 
</font> 
<A href="Javascript:openProblemRating(4847)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      200 / 342 (58.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      96 / 200 (48.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 454.36 points (9 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      320.28 (for 96 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The best way to solve this problem is to strictly follow all instructions given in the statement.
First of all, parse the input text and distinguish all identifiers from a "plain" text
saving all idetifiers in a map structure along with their frequencies.
Such parsing shouldn't be a problem for a regular TC member.
The next step (assigning an abbreviation to each of identifiers) is the trickiest part of the problem. 
One may try to apply smooshing operation to the input, but this is a bad choice. 
Replacing identifiers with abbreviations, which may be equal to other identifiers, can cause a big mess.
On the other hand, we don't need the smooshed text at all, we only need to know how much shorter it will be.
As soon, as only smooshing identifiers may change the length of the text, knowing the abbreviation for each identifier is more than enough.
Having that, for each identifier we can compute the difference between its length and the length of its abbreviation.
Multiplying each difference by the frequency of the identifier and adding all these numbers, 
we get the total difference between the input text and its smooshed version.
</p>
<p>
Lets return now to assigning abbreviations.
Instead of replacing identifiers in the text, we will keep all used abbreviations in a set.
For each identifier, we build an abbreviation (as it described in the statement), calculate the difference between identifier's length
and abbreviation's length, and add the abbreviation to our set.
And last but not the least, calculate the total difference as described above and return the total value.
See <a href="/tc?module=MemberProfile&cr=8357090">misof</a>'s
<a href="/stat?c=problem_solution&rm=247410&rd=8081&pm=4847&cr=8357090">solution</a> 
for a clear implementation of the algorithm.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2355&amp;rd=8081" name="2355">CantorSet</a></b> 
</font> 
<A href="Javascript:openProblemRating(2355)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505798" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      800 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      126 / 342 (36.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 126 (65.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 788.35 points (3 mins 27 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      563.26 (for 82 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Lets look closely at the process described in the statement. 
At step 1, we are to remove the open middle third of [0, 1], i.e. - all numbers from (1/3, 2/3).
In other words, we are to remove all numbers which have '1' at the first place after comma in ternary notation
(except 1/3, which can be written as "0.1" in ternary).
Then we remove middle thirds for intervals [0, 1/3] and [2/3, 1], i.e. - remove all numbers which have '1' at the second place, and so on.
Again, we don't remove numbers like 1/9, or 2/3 + 1/9 = 7/9, which have their only '1' as the last digit ("0.01" and "0.21" in ternary, respectively).
In other words, to be removed from the Cantor's set before the K-th step, the number must contain a '1' among the first K digits in ternary notation
and contain some non-zero digits after it.
</p>
<p>
To check whether the number has '1' as the first digit in ternary notation, we can just multiply the number by 3.
After such multiplication, [0, 1] interval transforms into [0, 3] interval, and its middle third (1/3, 2/3) transforms into (1,2).
So, if the result is greater than 1 and less than 2, the number has '1' as the first digit in ternary notation and will be thrown out of Cantor's set at the first iteration.
To check whether the second digit is '1', we take the fractional part of the result, multiply it by 3, 
check whether it is between 1 and 2, and so on.
The only exclusion from our rule are numbers which have exactly one '1' in their ternary notation, and don't have any non-zero digits 
after this '1' (like "0.1", "0.021", "0.22222221"). 
But neither of these numbers can be specified as a finite sequence of digits in decimal, therefore neither of them can be a valid input
for our problem. This allows us to say the number is thrown out of Cantor's set at the step K as soon as we find a '1' in its ternary notation at position 'K'.
</p>
<p>
The only thing left is multiplicating a number by 3. This can be done digit-by-digit, see <a href="/tc?module=MemberProfile&cr=8355516">Eryx</a>'s
<a href="/stat?c=problem_solution&rm=247411&rd=8081&pm=2355&cr=8355516">solution</a> for a clean implementation.
</p><div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
