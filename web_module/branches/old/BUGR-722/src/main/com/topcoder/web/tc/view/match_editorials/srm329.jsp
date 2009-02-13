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
    <A href="/stat?c=round_overview&er=5&rd=10009">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506004" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 329</span><br>Saturday, December 9, 2006
<br><br>

<h2>Match summary</h2> 

<p>
Over 1100 coders registered for this round. In division 1, <tc-webtag:handle coderId="251074" context="algorithm"/> was first to submit all three problems, but eventually the current TCO and TCCC champion <tc-webtag:handle coderId="10574855" context="algorithm"/> took  first place, scoring over 1500 points in the coding phase and securing his victory with a successful challenge. <tc-webtag:handle coderId="144400" context="algorithm"/> took second place, thanks to 150 points scored in the challenge phase, and <tc-webtag:handle coderId="251074" context="algorithm"/> took third place in the final ranking.
<br /><br />
In division 2, <tc-webtag:handle coderId="22221928" context="algorithm"/> came in first with an impressive 1250 points, followed by newcomer <tc-webtag:handle coderId="22661749" context="algorithm"/>. The third place went to <tc-webtag:handle coderId="22653291" context="algorithm"/>. All three advanced to Division 1.
<br /><br />
The rating gap between <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/> decreased by 7 points, and the gap between Russian Federation and Poland increased by some 15 points.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7290&amp;rd=10009" name="7290">VowelEncryptor</a></b>
</font>
<A href="Javascript:openProblemRating(7290)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506004" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      524 / 573 (91.45%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      463 / 524 (88.36%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>charsi420</b> for 248.30 points (2 mins 21 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.76 (for 463 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The algorithm here is quite straightforward: for every word in the input array, remove all vowels from it and either store the result in the output array or, if no letter is left, copy the original word to the output array. There are several possible approaches to removing all vowels from a word. 
<br />
<br />
In Java, one of the easiest ways to process a word would be the following:

<pre>
String noVowels = text[i].replaceAll("[aeiou]","");
text[i] = noVowels.equals("") ? text[i] : noVowels;
</pre>

In C++, one of the possible approaches would be:

<pre>
string::iterator it = partition(text[i].begin(), text[i].end(), isVowel);
if (it != text[i].end())
    text[i].erase(text[i].begin(), it);
</pre>

Where <tt>isVowel</tt> is a predicate that checks whether the provided char is a vowel.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7243&amp;rd=10009" name="7243">RailroadSeatNumeration</a></b>
</font>
<A href="Javascript:openProblemRating(7243)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506004" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      420 / 573 (73.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      122 / 420 (29.05%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>UdH-WiNGeR</b> for 452.76 points (9 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286.05 (for 122 correct submissions) 
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
      480 / 486 (98.77%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      308 / 480 (64.17%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Michael_Levin</b> for 241.53 points (5 mins 21 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.96 (for 308 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First, one could notice that for every seat, its number in the international numeration is always larger than it is in the domestic numeration. Thus, if every element in the input array is a valid seat number in both international and domestic numerations, we can safely return <tt>"AMBIGUOUS"</tt>. If the data is not ambiguous, we can either determine which numeration method is used in the input array and convert the array to the international numeration, or return <tt>"BAD DATA"</tt> if the provided numbers don’t fit into any numeration. Pseudocode follows.

<pre>
bool isInternational = true
bool isDomestic = true
for each x in tickets:
    isInternational = isInternational AND (x/10 == 1..9) AND (x%10 == one of 1, 3, 4, 6)
    isDomestic = isDomestic AND (x == 1..36)
if isInternational AND isDomestic:
    return "AMBIGUOUS"
if isInternational:
    return string representation of tickets
if isDomestic:
    for i = 0 .. number of tickets - 1:
        tickets[i] -= 1
        tickets[i] = (tickets[i] / 4 + 1) * 10 + (tickets[i] % 4) * 2 + (tickets[i] % 4 &lt; 2)
    return string representation of tickets
return "BAD DATA"
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6010&amp;rd=10009" name="6010">ProbabilisticTranslator</a></b>
</font>
<A href="Javascript:openProblemRating(6010)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506004" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      46 / 573 (8.03%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 46 (26.09%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>goons_will_rule</b> for 575.11 points (29 mins 28 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      486.34 (for 12 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved using a dynamic programming (DP) approach. Let <tt>n</tt> be the total number of words in the text. When we have translated the first <tt>k</tt> words of the text, translation of the other <tt>(n - k)</tt> words depends only on the translation of the <tt>k</tt><sup>th</sup> word and doesn’t depend on translation of the first <tt>(k - 1)</tt> words. In other words, the only information that is needed to translate the last <tt>(n - k)</tt> words is the translation variant that was chosen for the <tt>k</tt><sup>th</sup> word. Thus the following recurrence relation can be used to solve this problem:

<pre>
f<sub>k, t</sub> = maximum over all possible t’ (f<sub>k - 1, t’</sub> + frequency<sub>t’, t</sub>)
</pre>
<tt>f<sub>k, t</sub></tt> is the fidelity of translation of the first <tt>k</tt> words if the <tt>k</tt><sup>th</sup> word is translated as <tt>t</tt>. <tt>f<sub>k - 1, t’</sub></tt> is the fidelity of translation of the first <tt>(k - 1)</tt> words if the <tt>(k - 1)</tt><sup>th</sup> word is translated as <tt>t’.</tt> <tt>frequency<sub>t’, t</sub></tt> is the frequency of the corresponding pair of words. The answer for the problem is <tt>max(f<sub>n, t</sub>)</tt> where <tt>t</tt> can be any translation variant of the last word of the text.
<br />
<br />
Since the total number of words in the text doesn’t exceed <tt>50 * 50 / 2 = 1250</tt>, the number of possible translations for any word is less than <tt>50 / 2 = 25</tt>, we need at most 25 operations to calculate any <tt>f<sub>k, t</sub></tt>, and the total number of operations to solve the problem is less than <tt>1250 * 25 * 25 = 781250</tt> if we use arrays to store values of <tt>f<sub>k, t</sub></tt> and frequencies. It is also possible to store those values in <i>maps</i>, which may make the code shorter but slightly slower.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5955&amp;rd=10009" name="5955">LogCutter</a></b> </font> <A href="Javascript:openProblemRating(5955)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506004" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      198 / 486 (40.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      126 / 198 (63.64%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>andrewzta</b> for 447.80 points (9 mins 56 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.04 (for 126 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First thing to notice here is that DP approach with <tt>O(K * C)</tt> complexity won’t work here because it is too slow and may require too much memory. On the other hand, if we knew the length of the longest piece of the log, we could easily find the minimum number of cuts needed, as well as the smallest coordinate of the first cut, for the given number of allowed cuts. This can be done by a greedy algorithm that maximizes the length of the last piece of the log, then maximizes the length of the last but one piece, and so on. The reason to start with the last (rightmost) piece here is that such an approach minimizes the length of the leftmost piece, which is equal to the coordinate of the leftmost cut. If the greedy algorithm ends up with no more than <tt>(C&nbsp;+&nbsp;1)</tt> pieces, then it is possible to cut the log with the given length of the longest piece, otherwise a larger length of the longest piece is needed.
<br />
<br />
Assume that we have a function <tt>firstCut(maxPart)</tt> that returns the smallest possible coordinate of the first cut when the maximum allowed length of a piece of the log is <tt>maxPart</tt>, or zero, if it is impossible to cut the log into pieces that are not longer than <tt>maxPart</tt> using at most <tt>C</tt> cuts. We can implement such function using the greedy approach described above. Then we can find the minimum value of <tt>maxPart</tt> using binary search taking into account that <tt>maxPart</tt> can vary in range from <tt>1</tt> to <tt>L</tt>. Pseudocode follows.

<pre>
left = 1
right = L
while left &lt; right:
    v = (left + right) / 2
    first = firstCut(v)
    if first == 0:
        left = v + 1
    else:
        right = v
return left + " " + firstCut(left)
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6845&amp;rd=10009" name="6845">RPSChamps</a></b> </font> <A href="Javascript:openProblemRating(6845)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506004" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 486 (13.79%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      60 / 67 (89.55%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 822.34 points (8 mins 54 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      567.34 (for 60 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem involves simple dynamic programming and some probability theory. 
<br />
<br />
Let <tt>P<sub>a, b</sub></tt> be the probability that in a round with <tt>(a + b)</tt> players <tt>a</tt> of them will cast Scissors and the other <tt>b</tt> players will cast Paper. We can calculate values of <tt>P<sub>a, b</sub></tt> using the following recurrence relation:

<pre>
P<sub>0, 0</sub> = 1
P<sub>a &lt; 0, b</sub> = P<sub>a, b &lt; 0</sub> = 0
P<sub>a, b</sub> = 1/3 * P<sub>a - 1, b</sub> + 1/3 * P<sub>a, b - 1</sub>
</pre>

Now, let <tt>f<sub>n</sub></tt> be the expected number of rounds in a tournament with <tt>n</tt> participants.
Let’s see what happens if <tt>a</tt> players cast Scissors and <tt>b</tt> players cast Paper in the first round of a tournament with <tt>n = (a + b)</tt> players, where both <tt>a</tt> and <tt>b</tt> are positive integers. The probability of such result of the first round is <tt>P<sub>a, b</sub></tt>, and the expected total number of rounds in the tournament would be <tt>1 + f<sub>a</sub> + f<sub>b</sub></tt>. Since there are 3 possible figures in the game, <tt>3 * P<sub>a, b</sub></tt> is the probability that after the first round the tournament will split into two subtournaments of <tt>a</tt> players and <tt>b</tt> players, so that the <tt>a</tt> players will take places <tt>1</tt> through <tt>a</tt>, and the other <tt>b</tt> players will take places <tt>(a + 1)</tt> through <tt>(a + b)</tt>. If we iterate over all possible pairs of <tt>a</tt> and <tt>b</tt> and add up the values of <tt>3 * P<sub>a, b</sub></tt>, we will get the probability of the first round of a tournament with <tt>n = (a + b)</tt> players not being replayed.

<pre>
P<sub>no replay</sub> = sum for each i = 1 .. n - 1 (3 * P<sub>i, n - i</sub>)
</pre>

The following recurrence relation can be used to calculate <tt>f<sub>n</sub></tt> if we know the value of <tt>f<sub>N - 1</sub></tt>.

<pre>
f<sub>n</sub> = P<sub>replay</sub> * (1 + f<sub>n</sub>) + sum for each i = 1 .. N - 1 (3 * P<sub>i, N - i</sub> * (1 + f<sub>i</sub> + f<sub>n - i</sub>))
</pre>

 P<sub>replay</sub> is the probability of the first round being replayed, which is equal to <tt>1 - P<sub>no replay</sub></tt>. We can transform the last relation for <tt>f<sub>n</sub></tt> as follows:

 <pre>
f<sub>n</sub> * P<sub>no replay</sub> = P<sub>replay</sub> + sum for each i = 1 .. N - 1 (3 * P<sub>i, N - i</sub> * (1 + f<sub>i</sub> + f<sub>n - i</sub>))
</pre>

And here is a Java solution that implements the described approach.

<pre>
public double numberOfMoves(int N) {
    double P[][] = new double[N+2][N+2];
    P[0][0] = 1;
    for (int i = 0; i &lt;= N; i++) {
        for (int j = 0; j &lt;= N; j++) {
            P[i][j + 1] += P[i][j] * 1/3.;
            P[i + 1][j] += P[i][j] * 1/3.;
        }
    }

    double f[] = new double[N]; // f[i] = number of moves for i+1 players.

    f[0] = 0;
    for (int i = 1; i &lt; N; i++) {
        f[i] = 0;
        double p = 0; // probability of no replay
        for (int j = 1; j &lt; i+1; j++) {
            // j players beat the other i + 1 - j players
            p += 3 * P[j][i + 1 - j];
            f[i] += 3 * P[j][i + 1 - j] * (f[j - 1] + f[i - j]);
        }

        f[i] += 1;
        f[i] /= p;
    }
    
    return f[N-1];
}

</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/dmytro_big3.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7546003" context="algorithm"/><br />
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
