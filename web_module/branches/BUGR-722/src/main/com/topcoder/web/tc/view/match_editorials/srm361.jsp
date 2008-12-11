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
    <A href="/stat?c=round_overview&er=5&rd=10773">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516058" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 361</span><br>Wednesday, August 1, 2007
<br><br>



<h2>Match summary</h2> 

<p>
This match, with the money prizes sponsored by TopCoder itself, attracted 1109 coders, including 5 targets.
They faced a tricky set of problems in both divisions. Unfortunately, due to an error in one of the problems, the results
from Division 2 had to be removed from the statistics.
</p> 
<p>
In Division 1, the submissions started to pop up very quickly with many competitors solving the 250 problem in less than 5 minutes. Soon after that,
the solutions for the 500 started to come up, but surprisingly most of them were from blue and yellow coders, with the higher rated coders taking their time.
That's often a sign that there is some non-obvious trickiness in the problem, and this time was no exception. Most of the quick submisions were later brought down
in the challenge phase and system tests.</p>
<p>
With around 30 minutes before the end of the coding phase, <tc-webtag:handle coderId="10574855" context="algorithm"/> submitted his third problem, and seemed
to be in a comfortable situation to win the match. But very soon after his initial submission he spotted a small bug and was forced to resubmit, which made him lose the lead.
After the eventful challenge phase and the system tests, there were three targets <tc-webtag:handle coderId="19849563" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/>, and
<tc-webtag:handle coderId="272072" context="algorithm"/> in the top four, but it was <tc-webtag:handle coderId="19929536" context="algorithm"/> who claimed the win, and came very close to regaining his
target status as well. Congratulations!
</p>
<p>
Even though it won't show up in their profiles, the top performers in Division 2 did a great job on this difficult set, and I'm confident it won't take them long to move up to Division 1, this time for good.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8019&amp;rd=10773" name="8019">SearchBox</a></b> </font> <A href="Javascript:openProblemRating(8019)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516058" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      491 / 541 (90.76%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      122 / 491 (24.85%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tstan436</b> for 245.52 points (3 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      183.32 (for 122 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
String matching is a common, and well known problem. Many more or less sophisticated algorithms exist. But here, with a text no longer than 50 characters, the simplest naive algorithm is more than sufficient. Let's forget for a moment about the "Whole Word" part and look how the search alone can be implemented.</p>
<pre>
<font color="#804040"><b>return</b></font> text.indexOf(search, start);
</pre>
<p>Luckily Java already has a method that does exactly what we need; the <b>String.indexOf(String, int)</b> method will find the first occurrence of <b>search</b> inside <b>text</b> starting from the index <b>start</b>, and even return -1 if the match is not found.</p>
<p>Of course one can achieve the same with just two loops and comparing character after character, but I would recommend using the built-in functions of your language whenever it's possible for a few reasons:
<ul>
    <li>You use code that is well tested, and very unlikely to contain bugs.</li>
    <li>It's easy to tell at the first glance what a line of code does. It's very important especially when the code doesn't work as we expected. You don't want to spend precious seconds wondering if there really should be "&lt;" or "&lt;=", or randomly trying to add or subtract 1 somewhere to make it work.</li>
    <li>The code gets shorter and faster to type. I would say that's a secondary advantage and writing correct code is what really saves  time -- still, in TopCoder matches every second has  value.</li>
</ul>
This only applies when you know, and are comfortable with, the functions you want to use. If you are not exactly sure what indexOf returns, it's probably faster just to use the two loops. Afterwards you can test it in the practice room and make sure you remember it the next time.
</p>
<p>Going back to the original problem, we still need to take care of the "Whole Word" option. We don't want to destroy our simple and clean code by adding dozens of if-s and hacks to handle corner cases, so we will use a simple trick instead.</p>
<pre>
<font color="#804040">1 </font><font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>int</b></font> find(String text, String search, String wholeWord, <font color="#2e8b57"><b>int</b></font> start) {
<font color="#804040">2 </font>        <font color="#804040"><b>if</b></font> (wholeWord.equals(<font color="#ff00ff">&quot;Y&quot;</font>)) {
<font color="#804040">3 </font>            search = <font color="#ff00ff">&quot; &quot;</font> + search + <font color="#ff00ff">&quot; &quot;</font>;
<font color="#804040">4 </font>            text = <font color="#ff00ff">&quot; &quot;</font> + text + <font color="#ff00ff">&quot; &quot;</font>;
<font color="#804040">5 </font>        }
<font color="#804040">6 </font>        <font color="#804040"><b>return</b></font>text.indexOf(search, start);<font color="#0000ff">//the general search function discussed above</font>
<font color="#804040">7 </font>}
</pre>
<p>If wholeWord is "N" we don't need to change anything, the indexOf function will do the work. If it's "Y" we surround the <b>search</b> by spaces, to make sure it won't match a word that is a substring of another word. Additionally we add a space to the beginning and to the end of the text, to make the words touching the edges surrounded by spaces too. The one question that might not be obvious here is: how does adding these space affects the starting and resulting indices? Luckily it doesn't change a thing, by adding a space to the beginning of the text, we make the starting index point one character before the original, and that's good because now we want to match a leading space too. In the same way the returned index is the index of a space before the matched word, which is fine, as the text has one character added at the beginning.</p>
<p>With the very low success rate on this problem, I guess the lesson is that, even if a problem looks easy, one should always stop and think before rushing into coding, and try to come up with a way to make the implementation as simple as possible.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8010&amp;rd=10773" name="8010">WhiteHats</a></b> </font> <A href="Javascript:openProblemRating(8010)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516058" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      365 / 541 (67.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      155 / 365 (42.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rogerbdly</b> for 470.65 points (7 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      339.86 (for 155 correct submissions) 
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
      481 / 493 (97.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      384 / 481 (79.83%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 247.98 points (2 mins 34 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.72 (for 384 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let's say there is a total <b>N</b> people, out of which <b>W</b> wear white hat. In that case, what should the <b>count</b> array look like? The answer is:
<OL>
    <LI>Exactly <b>W</b> elements are equal to <b>W</b>-1.</LI>
    <LI>Exactly <b>N</b>-<b>W</b> elements are equal to <b>W</b>.</LI>
</OL>
The first point corresponds to the people in white hats: they see all the white hats, except their own. The rest are the people in black hats and they can see all the <b>W</b> white hats.
</p>
<p>All that's left to do is check if the given array has the property described above, for some value of <b>W</b>. One of the ways to do that is to count the number of occurrences of each element in <b>count</b>, and then loop through all the possible values for <b>W</b>. The sample code follows.</p>
<pre>
<font color="#804040"> 1 </font><font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>int</b></font> whiteNumber(<font color="#2e8b57"><b>int</b></font> count[]){
<font color="#804040"> 2 </font>    <font color="#2e8b57"><b>int</b></font> N = count.length;
<font color="#804040"> 3 </font>    <font color="#2e8b57"><b>int</b></font> numbers[]= <font color="#804040"><b>new</b></font> <font color="#2e8b57"><b>int</b></font>[<font color="#ff00ff">51</font>]; <font color="#0000ff">//elements in count are between 0 and 50, inclusive.</font>
<font color="#804040"> 4 </font>    <font color="#804040"><b>for</b></font>(<font color="#2e8b57"><b>int</b></font> x:count) numbers[x]++;
<font color="#804040"> 5 </font>    <font color="#804040"><b>if</b></font>(numbers[<font color="#ff00ff">0</font>] == N) <font color="#804040"><b>return</b></font> <font color="#ff00ff">0</font>; <font color="#0000ff">//All hats are black.</font>
<font color="#804040"> 6 </font>    <font color="#804040"><b>for</b></font>(<font color="#2e8b57"><b>int</b></font> W=<font color="#ff00ff">1</font>;W&lt;numbers.length;W++){
<font color="#804040"> 7 </font>        <font color="#804040"><b>if</b></font>( numbers[W-<font color="#ff00ff">1</font>] == W &amp;&amp; numbers[W] == N-W ) <font color="#804040"><b>return</b></font> W;
<font color="#804040"> 8 </font>    }
<font color="#804040"> 9 </font>    <font color="#804040"><b>return</b></font> -<font color="#ff00ff">1</font>;  <font color="#0000ff">//No W was found.</font>
<font color="#804040">10 </font>}
</pre>
<p>You can see that the condition inside the second loop is a direct translation of the two points stated before. The corner case of <b>W</b>=0 is handled separately to avoid accessing numbers[-1]. As a side note, we can avoid the second loop altogether by noticing that <b>W</b> must be the maximal element in <b>count</b>, so that's the only value we really need to check.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8014&amp;rd=10773" name="8014">Election</a></b> </font> <A href="Javascript:openProblemRating(8014)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516058" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      32 / 541 (5.91%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 32 (0.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sejert</b> for 0.00 points (47 mins 22 secs) 
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
<p>
This is the problem that caused the division 2 rating changes to be reverted. It has an incorrect greedy solution that is so appealing that myself, 
three problem testers, and 15 coders during the match coded it in the same, flawed way. Only after the match was it pointed out in the forum that the
way it distributes the votes is not always optimal.
</p>
<p>
As of this writing, I still don't know how to write a correct solution, so I would love to hear from someone who managed that.
If anyone is interested in the reference solution used during the match, here is the analysis I wrote before I knew that it didn't work.
Treat finding a flaw in the logic as an exercise.
</p>
<font color="red">Warning: The solution below is not correct and left over only for educational purpose</font>
<p>Let's define an array <b>finalOrder</b> that will contain the final candidates ranking, according to our wishes. Since it must match the <b>wishList</b>, for every element <b>k</b> where <b>p = wishList[k]</b> is not -1, <b>finalOrder[p] = k</b>. Now, what about the candidates where <b>wishList</b> is equal to -1? We don't care where they end up, but since we are looking for the solution with the minimal number of additional votes, it's never optimal to change the relative order which they are already in. Take a look at the following example.
<p>
<table border="1">
    <tr><td><b>candidate name  </b></td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td></tr>
    <tr><td><b>current position</b></td><td>3</td><td>1</td><td>0</td><td>4</td><td>2</td></tr>
    <tr><td><b>wished position </b></td><td>?</td><td>0</td><td>?</td><td>3</td><td>?</td></tr>
    <tr><td><b>final position  </b></td><td>4</td><td>0</td><td>1</td><td>3</td><td>2</td></tr>
</table>
<p>
The initial ordering is (C, B, E, A, D). Now we want to have the candidate B on the place 0, and the candidate D on the place 3, which makes the ordering look like (B, _, _, D, _). Since there is no point in changing the order of candidates (C,E,A), we put them in the same order on the free spots, which finally gives (B, C, E, D, A). The pseudocode generating the <b>finalOrder</b> can look like this:
</p>
<pre>
<font color="#804040"> 1 </font><font color="#2e8b57"><b>int</b></font>[] generateFinalOrder( <font color="#2e8b57"><b>int</b></font>[] currentOrder, <font color="#2e8b57"><b>int</b></font>[] wishList) {
<font color="#804040"> 2 </font>    <font color="#2e8b57"><b>int</b></font>[] finalOrder={-<font color="#ff00ff">1</font>};
<font color="#804040"> 3 </font>    <font color="#2e8b57"><b>boolean</b></font>[] used = {<font color="#ff00ff">false</font>}; <font color="#0000ff">//array used to mark the candidates that were already placed on a position.</font>
<font color="#804040"> 4 </font>    <font color="#804040"><b>for</b></font>(i=<font color="#ff00ff">0</font>; i&lt;wishList.length; i++) <font color="#804040"><b>if</b></font>(wishList[i] != -<font color="#ff00ff">1</font>) {  <font color="#0000ff">//first filling the elements with fixed positions.</font>
<font color="#804040"> 5 </font>        finalOrder[wishList[i]] = i;
<font color="#804040"> 6 </font>        used[i] = <font color="#ff00ff">true</font>;
<font color="#804040"> 7 </font>    }
<font color="#804040"> 8 </font>    <font color="#804040"><b>for</b></font>(i=<font color="#ff00ff">0</font>; i&lt;finalOder.length; i++) { <font color="#0000ff">//now filling all the empty spots</font>
<font color="#804040"> 9 </font>        <font color="#804040"><b>if</b></font>( finalOrder[i] != -<font color="#ff00ff">1</font> ) <font color="#804040"><b>continue</b></font>; <font color="#0000ff">//alredy filled</font>
<font color="#804040">10 </font>        <font color="#804040"><b>for</b></font>(j=<font color="#ff00ff">0</font>; j&lt;currentOrder.length; j++){
<font color="#804040">11 </font>            candidate = currentOrder[j];
<font color="#804040">12 </font>            <font color="#804040"><b>if</b></font>( !used[candidate] ) { <font color="#0000ff">//the highest ranked candidate that wasn't placed so far.</font>
<font color="#804040">13 </font>                finalOrder[i] = candidate;
<font color="#804040">14 </font>                used[candidate] = <font color="#ff00ff">true</font>;
<font color="#804040">15 </font>                <font color="#804040"><b>break</b></font>; <font color="#0000ff">// breaking the j loop.</font>
<font color="#804040">16 </font>            }
<font color="#804040">17 </font>        }
<font color="#804040">18 </font>    }
<font color="#804040">19 </font>    <font color="#804040"><b>return</b></font> finalOrder;
<font color="#804040">20 </font>}
</pre>
<p>
The <b>currentOrder</b> here holds the indices of the candidates, sorted by decreasing number of votes (and a tie-breaker as in the problem statement). What this function does is first place the candidates according to the <b>wishList</b> and than fill the empty spots with the remaining candidates, without breaking the ordering from the <b>currentOrder</b>. It can be also implemented with a lesser complexity, but with no more than 50 candidates it doesn't really matter.
</p>
<p>Now that we have determined the final ordering, computing the minimum required number of additional votes becomes quite simple. Just look at the candidates starting from the end. Obviously we don't need to add any votes to the candidate who's meant to end the last. For the second to last we need only as many votes as are needed to overcome the last one -- and so on, for all the others, every time we add the minimal number of votes needed to overcome the previous candidate (keeping the tie-breaker rule in mind). The total number of votes we added is the final answer. The code follows.</p>
<pre>
<font color="#804040"> 1 </font><font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>int</b></font> votesNeeded(<font color="#2e8b57"><b>int</b></font>[] votes, <font color="#2e8b57"><b>int</b></font>[] wishList) {
<font color="#804040"> 2 </font>    <font color="#2e8b57"><b>int</b></font> result = <font color="#ff00ff">0</font>;
<font color="#804040"> 3 </font>    <font color="#2e8b57"><b>int</b></font>[] currentOrder = <font color="#008080">...</font> <font color="#0000ff">//Just a sorting, so the code ommited.</font>
<font color="#804040"> 4 </font>    <font color="#2e8b57"><b>int</b></font>[] finalOrder = generateFinalOrder( currentOrder, wishList); <font color="#0000ff">//the function described above.</font>
<font color="#804040"> 5 </font>    <font color="#804040"><b>for</b></font>(i = finalOrder.length - <font color="#ff00ff">2</font>; i &gt;= <font color="#ff00ff">0</font>; i--){  <font color="#0000ff">//starting from the second to last and moving backwords</font>
<font color="#804040"> 6 </font>        <font color="#2e8b57"><b>int</b></font> a = finalOrder[i];
<font color="#804040"> 7 </font>        <font color="#2e8b57"><b>int</b></font> prev = finalOrder[i+<font color="#ff00ff">1</font>];
<font color="#804040"> 8 </font>        <font color="#804040"><b>if</b></font>( votes[a] &lt; votes[prev] ){
<font color="#804040"> 9 </font>            result += votes[prev] - votes[a]; <font color="#0000ff">//adding votes to make a and prev have the same number;</font>
<font color="#804040">10 </font>            votes[a] = votes[prev];
<font color="#804040">11 </font>        }
<font color="#804040">12 </font>        <font color="#804040"><b>if</b></font>( votes[a] == votes[prev] &amp;&amp; a &gt; prev ){ <font color="#0000ff">//if needed adding one more vote to satissfy the tie-breaker.</font>
<font color="#804040">13 </font>            result ++;
<font color="#804040">14 </font>            votes[a]++;
<font color="#804040">15 </font>        }
<font color="#804040">16 </font>    }
<font color="#804040">17 </font>    <font color="#804040"><b>return</b></font> result;
<font color="#804040">18 </font>}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8009&amp;rd=10773" name="8009">ReverseDistance</a></b>
</font>
<A href="Javascript:openProblemRating(8009)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516058" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      246 / 493 (49.90%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      38 / 246 (15.45%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 443.28 points (10 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      239.37 (for 38 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem had a short and simple statement, and as often happens a solution that was short, simple... and incorrect.
Many coders went for a solution that tries every number, computes its reverse, and checks the difference between them. While this is obviously correct, 
the running time is what causes the problem. The key observation is that even though the input is at most 1000000, the answer can be as big as twelve digits. That makes
it impossible to simply try all the possibilities.</p>
How not to get trapped by a problem like this? There is no definite answer but there are few hints that could help you avoid it.
<OL>
    <li>It is Div 1 medium. It's a vague argument, as problem difficulty is a highly subjective matter. But still most of the time D1 medium requires
    more than a simple loop and reversing numbers.</li>
    <li>Take a quick peek at the division summary. As I already mentioned in the introduction, if there are a lot of submissions from lower rated coders but many reds, including targets,
    are still working on it, it's a hint that there is more to the problem than meets the eye.</li>
    <li>Return value is a String. Again, it's very vague, but it might suggest that the writer is mean enough to hide the actual result range.</li>
    <li>And the most important hint is left to the end. Read all the examples at least once. There was a case with the input "900" and the output "101001",
    so the output has twice as many digits as the input. If you could extrapolate it to &quot;900000&quot; and "100001000001" it gives you a clear answer that brute force won't work,
    and an excellent challenge case as a bonus!</li>
</OL>
<H4>The "divide in two" solution</H4>
<p>
Try and write your equation in a manner:
<pre>
   a b c d e f g h
 - h g f e d c b a
 ------------------
   i j k l m n o p
</pre>
Where each letter represents a single digit (imagine that numbers are aligned with leading zeros to have the same length).
The same thing can be written as:
<pre>
   i j k l m n o p  
 + h g f e d c b a
 ------------------
   a b c d e f g h
</pre>
We know the ijklmnop part, as that's what we are given. Now imagine you know the dcba. From the equation above you can see the mnop + dcba = efgh --
well, not exactly but the last four digits of  mnop + dcba are efgh. So if we already know mnop and we assumed that we know dcba, we can easily compute the
efgh. And now, when we have efgh we can reconstruct the whole abcdefgh!
</p>
<p>
The remaining question is: where to take the first half of the number from? Just brute force it. Since it's only half of the digits, the number of options is small enough
to check them all. You still need to code it carefully, to handle cases like odd number of digits and tom make sure it runs fast enough. The fairly simple, working Java solution follows:
</p>
<pre>
<font color="#804040"> 1 </font><font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>class</b></font> ReverseDistance {
<font color="#804040"> 2 </font>   <font color="#2e8b57"><b>final</b></font> <font color="#2e8b57"><b>long</b></font> rev(<font color="#2e8b57"><b>long</b></font> x){
<font color="#804040"> 3 </font>       <font color="#2e8b57"><b>long</b></font> r =<font color="#ff00ff">0</font>;
<font color="#804040"> 4 </font>       <font color="#804040"><b>while</b></font>(x&gt;<font color="#ff00ff">0</font>){
<font color="#804040"> 5 </font>           r=r*<font color="#ff00ff">10</font>+x%<font color="#ff00ff">10</font>;
<font color="#804040"> 6 </font>           x/=<font color="#ff00ff">10</font>;
<font color="#804040"> 7 </font>       }
<font color="#804040"> 8 </font>       <font color="#804040"><b>return</b></font> r;
<font color="#804040"> 9 </font>   }
<font color="#804040">10 </font>
<font color="#804040">11 </font>   <font color="#2e8b57"><b>int</b></font> len(<font color="#2e8b57"><b>long</b></font> x){
<font color="#804040">12 </font>       <font color="#2e8b57"><b>int</b></font> r=<font color="#ff00ff">0</font>;
<font color="#804040">13 </font>       <font color="#804040"><b>while</b></font>(<font color="#ff00ff">true</font>){
<font color="#804040">14 </font>           r++;
<font color="#804040">15 </font>           x/=<font color="#ff00ff">10</font>;
<font color="#804040">16 </font>           <font color="#804040"><b>if</b></font>(x==<font color="#ff00ff">0</font>)<font color="#804040"><b>return</b></font> r;
<font color="#804040">17 </font>       }
<font color="#804040">18 </font>   }
<font color="#804040">19 </font>
<font color="#804040">20 </font>   <font color="#2e8b57"><b>public</b></font> String find(<font color="#2e8b57"><b>int</b></font> difference) {
<font color="#804040">21 </font>       <font color="#804040"><b>for</b></font>(<font color="#2e8b57"><b>long</b></font> p=<font color="#ff00ff">0</font>;p&lt;<font color="#ff00ff">200000</font>;p++){
<font color="#804040">22 </font>           <font color="#2e8b57"><b>long</b></font> rp = rev(p);
<font color="#804040">23 </font>           <font color="#2e8b57"><b>long</b></font> q = rp+difference;
<font color="#804040">24 </font>           <font color="#2e8b57"><b>int</b></font> len = len(p);
<font color="#804040">25 </font>          <font color="#804040"><b>for</b></font>(<font color="#2e8b57"><b>int</b></font> totalLen = <font color="#ff00ff">2</font>*len-<font color="#ff00ff">1</font>;totalLen&lt;=<font color="#ff00ff">2</font>*len;totalLen++){
<font color="#804040">26 </font>           String qs = <font color="#ff00ff">&quot;&quot;</font>+q;
<font color="#804040">27 </font>           <font color="#804040"><b>while</b></font>(qs.length()&gt;totalLen-len)qs = qs.substring(<font color="#ff00ff">1</font>);
<font color="#804040">28 </font>           <font color="#804040"><b>while</b></font>(qs.length()&lt;totalLen-len)qs = <font color="#ff00ff">&quot;0&quot;</font>+qs;
<font color="#804040">29 </font>           <font color="#2e8b57"><b>long</b></font> y = Long.parseLong(p+qs);
<font color="#804040">30 </font>           <font color="#804040"><b>if</b></font>(y-rev(y)==difference)<font color="#804040"><b>return</b></font> <font color="#ff00ff">&quot;&quot;</font>+y;
<font color="#804040">31 </font>          }
<font color="#804040">32 </font>       }
<font color="#804040">33 </font>       <font color="#804040"><b>return</b></font> <font color="#ff00ff">&quot;NONE&quot;</font>;
<font color="#804040">34 </font>   }
<font color="#804040">35 </font>}
</pre>
<H4>The greedy solution</H4>
<p>
When I thought about this problem for the first time I wanted to allow inputs as big as 2,000,000,000, so the solution described above won't work on it.
I coded up a solution that is entirely based on greedily picking digits, starting from the outmost ones and moving towards the middle. It's not that elegant,
as there were quite a few cases to handle to make it work, so I'll just sketch the idea rather than giving a full solution.
</p>
<p>
Assume that a number looks like azb where a and b are single digits and z is a sequence of digits.
The reverse of it looks like bya, where y is the reverse of z. Furthermore, assume that azb has the same number of digits as bya (bya can have leading zeros),
and that azb &gt; bya. That gives an equation:
<pre>
  a z b
- b y a
-------
  d x f
</pre>
Lets look just at the last digits b - a = f, since if azb &gt; bya then a &gt;= b as well. The last digit equation is actually
10 + b - a = f. We can rewrite it as <br/>
a - b = 10 - f<br/>
It can have a few results, but remember that we are looking for the smallest number that results in the <b>difference</b>, so we want the digit a to be as small as possible.
In that case we can set it to:<br/>
a = 10 - f <br/>
b = 0 <br/>
Now look at the right-most digits. Since we already know that a - b = 10 - f, then the digit d must be either 10 - f or 9 -f. If it's not, the difference can not be achieved, and you should return "NONE".
If it is, we can consider a and b as computed and move to computing z and y in the same manner. As I said there are more details into it, but that should be enough to give you an
idea of how to construct a fully working solution.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8025&amp;rd=10773" name="8025">WeighingScale</a></b> </font> <A href="Javascript:openProblemRating(8025)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516058" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      25 / 493 (5.07%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 25 (36.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zhuzeyuan</b> for 604.25 points (27 mins 3 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      503.73 (for 9 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The solution for this problem is quite complicated so I'll just start from the basic observations, and see how it goes from there...</p>
<H4>Iteration 1</H4>
Removing all the difficult bits from the statement we get <i>"bla bla bla, return the number of different pairs of weights that, bla, bla, bla."</i> There is only around 1100 of these pairs, so it seems doable to check them one by one.
<pre>
<font color="#804040">1 </font><font color="#2e8b57"><b>int</b></font>[] count(String[] measures, <font color="#2e8b57"><b>int</b></font> A, <font color="#2e8b57"><b>int</b></font> B){
<font color="#804040">2 </font>    <font color="#2e8b57"><b>int</b></font>[] result = {<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>};
<font color="#804040">3 </font>    n = measures.length;
<font color="#804040">4 </font>    <font color="#804040"><b>for</b></font>( {C, D} in {<font color="#ff00ff">0</font>..n-<font color="#ff00ff">1</font>}^<font color="#ff00ff">2</font> ){ <font color="#0000ff">//all pairs of indices</font>
<font color="#804040">5 </font>        <font color="#804040"><b>if</b></font>( {A,B} &amp; {C, D} != {} ) <font color="#804040"><b>continue</b></font>; <font color="#0000ff">//A and B are already taken</font>
<font color="#804040">6 </font>        <font color="#804040"><b>if</b></font>( something ) increment one position in result.
<font color="#804040">7 </font>    }
<font color="#804040">8 </font>    <font color="#804040"><b>return</b></font> result;
<font color="#804040">9 </font>}
</pre>
<H4>Iteration 2</H4>
Now we can look a bit closer at what exactly we need to check for each of the pairs.
<blockquote>
    <i>The number of different pairs of weights you can put on the right pan to make it lighter than the left pan, the number of pairs to make both pans the same weight, and the number of pairs to make the left pan lighter.</i>
</blockquote>
Keeping in mind that each weight can have only one of the three values -- 10, 20, or 30 grams. We can again check all the 81 combinations and directly see which side of the scale is heavier. The difficult bit is checking if the combination of the values is possible to achieve, considering the results in <b>measures</b>, but for now let's just focus on the part we know how to do.
<pre>
<font color="#804040"> 1 </font><font color="#0000ff">//... We are inside the C,D loop</font>
<font color="#804040"> 2 </font>possibleOutcomes = {<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>};
<font color="#804040"> 3 </font><font color="#804040"><b>for</b></font>( {w1,w2,w3,w4} in {<font color="#ff00ff">10</font>,<font color="#ff00ff">20</font>,<font color="#ff00ff">30</font>}^<font color="#ff00ff">4</font> ){
<font color="#804040"> 4 </font>   <font color="#0000ff">//Somehow checks if weights A,B,C,D can tak values w1,w2,w3,w4 respectively:</font>
<font color="#804040"> 5 </font>   <font color="#804040"><b>if</b></font>( !possible({A,B,C,D}, {w1,w2,w3,w4}) ) <font color="#804040"><b>continue</b></font>;
<font color="#804040"> 6 </font>   <font color="#804040"><b>if</b></font>( w1 + w2 &gt; w3+ w4 ) possibleOutcomes[<font color="#ff00ff">0</font>] = <font color="#ff00ff">1</font>; <font color="#0000ff">//left heavier</font>
<font color="#804040"> 7 </font>   <font color="#804040"><b>if</b></font>( w1 + w2 == w3+ w4 ) possibleOutcomes[<font color="#ff00ff">1</font>] = <font color="#ff00ff">1</font>; <font color="#0000ff">//same</font>
<font color="#804040"> 8 </font>   <font color="#804040"><b>if</b></font>( w1 + w2 &lt; w3+ w4 ) possibleOutcomes[<font color="#ff00ff">2</font>] = <font color="#ff00ff">1</font>; <font color="#0000ff">//left lighter</font>
<font color="#804040"> 9 </font>}
<font color="#804040">10 </font><font color="#804040"><b>if</b></font>( sum(possibleOutcomes) == <font color="#ff00ff">1</font> ){ <font color="#0000ff">//checking if there is only one possible outcome</font>
<font color="#804040">11 </font>   result += possibleOutcomes;
<font color="#804040">12 </font>}
</pre>
So we loop through {w1,w2,w3,w4} and, ignoring the combinations that are not possible, compare the total weight of the left pan with the right pan.  
The line number 10 implements the sentence <i>"You should only consider the pairs that make the result unambiguously predictable based on the results in <b>measures</b>."</i> If we are able to predict the outcome unambiguously, that means that the left pan was always in the same relation to the right pan, thus <b>possibleOutcomes</b> has only a single 1 in it. The last step is to increment the <b>result</b> on the correct position.
<H4>Iteration 3</H4>
Now the solution is almost ready and we still haven't had to do anything difficult! The only part left is a function checking if the weights with indices {A,B,C,D} can have values {w1,w2,w3,w4}. That's the time when we need to take a closer look at the <b>measures</b> matrix. It should be obvious that if we have two weights <b>x</b> and <b>y</b> and <b>measures[x][y] == '+'</b> than for sure <b>x</b> doesn't weigh 10 grams, nor <b>y</b> weigh 30 grams.
Moreover, if we have a weight <b>z</b> such as <b>measures[y][z] == '+'</b>, then there is no other way to assign values than 
(x = 30; y = 20; z = 10). To check the possible values for all the weights we can do the following:
<ul>
    <li>initialize possibleWeights[measures.length][3] to make all the elements <b>true</b>.</li>
    <li>For each node x run a dfs that traverses only the '+' and '=' edges. The dfs returns a maximum number of pluses it found on a single path from x.</li>
    <li>If dfs returns 0 it doesn't give us any new knowledge about the value of x. If it returned 1 we can set possibleWeights[x][0]=false (index zero represents 10 grams, 1 - 20 gram, etc),
    as it can not be 10 grams if it's heavier than something else. When the dfs returns 2 we can set both  possibleWeights[x][0] and  possibleWeights[x][1] to false, which leaves
    30 grams as the only possible value. Note the it can't return anything above 2, as if it did there is a bug in our code.</li>
    <li>Do the same as previously, but now run through '-' and '=' edges and update the possibleWeights matrix accordingly.</li>
</ul>
Now our code looks like this :
<pre>
<font color="#804040"> 1 </font><font color="#2e8b57"><b>int</b></font> dfs( <font color="#2e8b57"><b>int</b></font> p, <font color="#2e8b57"><b>char</b></font> sign, <font color="#2e8b57"><b>boolean</b></font>[]used) {
<font color="#804040"> 2 </font>  <font color="#804040"><b>if</b></font>(used[p]) <font color="#804040"><b>return</b></font> <font color="#ff00ff">0</font>;
<font color="#804040"> 3 </font>  used[p] = <font color="#ff00ff">true</font>;
<font color="#804040"> 4 </font>  <font color="#2e8b57"><b>int</b></font> res = <font color="#ff00ff">0</font>;
<font color="#804040"> 5 </font>  <font color="#804040"><b>for</b></font>(<font color="#2e8b57"><b>int</b></font> q=<font color="#ff00ff">0</font>; q &lt;n ;q++){
<font color="#804040"> 6 </font>      <font color="#0000ff">//Edges with '=' don't add anything to the result, edges '+' or '-' do.</font>
<font color="#804040"> 7 </font>    <font color="#804040"><b>if</b></font>(measures[p][q] == <font color="#ff00ff">'='</font> ) res = max(res, dfs( q, sign, used));
<font color="#804040"> 8 </font>    <font color="#804040"><b>if</b></font>(measures[p][q] == sign ) res = max(res, <font color="#ff00ff">1</font> + dfs( q, sign, used));
<font color="#804040"> 9 </font>  }
<font color="#804040">10 </font>  <font color="#804040"><b>return</b></font> res;
<font color="#804040">11 </font>}
<font color="#804040">12 </font>
<font color="#804040">13 </font>
<font color="#804040">14 </font><font color="#2e8b57"><b>int</b></font>[] count(String[] measures, <font color="#2e8b57"><b>int</b></font> A, <font color="#2e8b57"><b>int</b></font> B){
<font color="#804040">15 </font>    <font color="#2e8b57"><b>int</b></font>[] result = {<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>};
<font color="#804040">16 </font>    possibleWeights = {{<font color="#ff00ff">true</font>}};
<font color="#804040">17 </font>    <font color="#804040"><b>for</b></font>( x =<font color="#ff00ff">0</font>; x&lt;n; x++ ){
<font color="#804040">18 </font>        <font color="#2e8b57"><b>int</b></font> plusDepth = dfs(x, <font color="#ff00ff">'+'</font>, <font color="#804040"><b>new</b></font> <font color="#2e8b57"><b>boolean</b></font>[n]);
<font color="#804040">19 </font>        <font color="#2e8b57"><b>int</b></font> minuDepth = dfs(x, <font color="#ff00ff">'-'</font>, <font color="#804040"><b>new</b></font> <font color="#2e8b57"><b>boolean</b></font>[n]);
<font color="#804040">20 </font>        <font color="#0000ff">//updating possibleWeight[x] based on the dephts; </font>
<font color="#804040">21 </font>    }
<font color="#804040">22 </font>   <font color="#0000ff">//   ...</font>
<font color="#804040">23 </font>   <font color="#0000ff">//   Inside the loop with the four possible weight values </font>
<font color="#804040">24 </font>    <font color="#804040"><b>if</b></font>( ! possibleWeights[A][w1] ||  ! possibleWeights[B][w2] ||
<font color="#804040">25 </font>        possibleWeights[C][w3] ||  ! possibleWeights[D][w4] ) <font color="#804040"><b>continue</b></font>;
<font color="#804040">26 </font>    <font color="#0000ff">//the rest as before</font>
<font color="#804040">27 </font>}
<font color="#804040">28 </font>
</pre>
And that's all. It wasn't so hard, was it?<br/>
<i>System> slex is compiling the 1000-point problem.</i><br/>
<i>System> slex is testing the 1000-point problem.</i><br/>
<i>System> slex is testing the 1000-point problem.</i><br/>
<i>System> slex is testing the 1000-point problem.</i><br/>
<i>System> slex is testing the 1000-point problem.</i><br/>
Oops it disagrees on the example 3. Is it a wrong example test (again)? ...
<H4>Iteration 4</H4>
Back to the drawing board. Let's look at example 3.
<blockquote><pre>
3)

{"??+?", "???+", "-???", "?-??"}
0
1
Returns: {1, 0, 0 }
We know that w0 &gt; w2 and w1 &gt; w3 thus w0+w1 must be heavier than w2+w3.
</pre></blockquote>
So, we have only one pair of weights to consider {2,3}, our possibleWeights table looks like:
<br>
<br>
<table border="1">
    <tr><td><b>  </b></td><td>10 grams</td><td>20 grams</td><td>30 grams</td></tr>
    <tr><td><b>weight 0</b></td><td>false</td><td>true</td><td>true</td></tr>
    <tr><td><b>weight 1</b></td><td>true</td><td>true</td><td>false</td></tr>
    <tr><td><b>weight 2</b></td><td>false</td><td>true</td><td>true</td></tr>
    <tr><td><b>weight 3</b></td><td>true</td><td>true</td><td>false</td></tr>
</table>
<p>
So in example we can have 30+20 &gt; 20+10, which makes the left pan heavier, but we can also have 20+20 == 20+20, which makes the both pans the same weight.
But wait! How can both w0 and w1 be 20 if the measures says that w1&gt;w2? Well it can't be, it's just that our program doesn't know it yet.</p>
<p>
The example shows that it's not only important what values a single weight can have, but also if all the four values together match the relation defined by <b>measures</b>.
To fix that we introduce one more matrix, Relation[n][n], where each cell can have one of the 4 values:
<UL>
    <LI>'+' - the i-th weight is heavier than the j-th weight.</LI>
    <LI>'-' - the i-th weight is lighter than the j-th weight.</LI>
    <LI>'=' - both weights have the same weight.</LI>
    <LI>'?' - the two weights are not correlated.</LI>
</UL>
Looks familiar, doesn't it? It is a transitive closure of the <b>measure</b> matrix. To compute it we can again run n pairs of dfs's, just the same way as we did for computation of <b>possibleWeights</b>, only this time we are not interested in how deep we can go, but in what weights we can reach.
After this is done, we check for every pair from {A,B,C,D} and corresponding weights from {w1,w2,w3,w4} if the values match the relation.

</p>
<pre>
<font color="#804040"> 1 </font>    <font color="#2e8b57"><b>private</b></font> <font color="#2e8b57"><b>boolean</b></font> check(<font color="#2e8b57"><b>int</b></font> a, <font color="#2e8b57"><b>int</b></font> b, <font color="#2e8b57"><b>int</b></font> w1, <font color="#2e8b57"><b>int</b></font> w2) {
<font color="#804040"> 2 </font>        <font color="#804040"><b>if</b></font> (Relation[a][b] == ?)
<font color="#804040"> 3 </font>            <font color="#804040"><b>return</b></font> <font color="#ff00ff">true</font>; <font color="#0000ff">//no relation</font>
<font color="#804040"> 4 </font>        <font color="#804040"><b>if</b></font> (Re[a][b] == <font color="#ff00ff">'-'</font> &amp;&amp; w1 &gt;= w2)
<font color="#804040"> 5 </font>            <font color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;
<font color="#804040"> 6 </font>        <font color="#804040"><b>if</b></font> (Re[a][b] == <font color="#ff00ff">'='</font> &amp;&amp; w1 != w2)
<font color="#804040"> 7 </font>            <font color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;
<font color="#804040"> 8 </font>        <font color="#804040"><b>if</b></font> (Re[a][b] == <font color="#ff00ff">'+'</font> &amp;&amp; w1 &lt;= w2)
<font color="#804040"> 9 </font>            <font color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;
<font color="#804040">10 </font>        <font color="#804040"><b>return</b></font> <font color="#ff00ff">true</font>;
<font color="#804040">11 </font>    }
<font color="#804040">12 </font>
<font color="#804040">13 </font>    <font color="#0000ff">/**</font><font color="#6a5acd"> This gets {A,B,C,D}, {w1,w2,w3,w4} *</font><font color="#0000ff">*/</font>
<font color="#804040">14 </font>    <font color="#2e8b57"><b>private</b></font> <font color="#2e8b57"><b>boolean</b></font> check(<font color="#2e8b57"><b>int</b></font>[] ind, <font color="#2e8b57"><b>int</b></font>[] w) {
<font color="#804040">15 </font>        <font color="#804040"><b>for</b></font> (<font color="#2e8b57"><b>int</b></font> i = <font color="#ff00ff">0</font>; i &lt; ind.length; i++)
<font color="#804040">16 </font>            <font color="#804040"><b>for</b></font> (<font color="#2e8b57"><b>int</b></font> j = i + <font color="#ff00ff">1</font>; j &lt; ind.length; j++) {
<font color="#804040">17 </font>                <font color="#804040"><b>if</b></font> (ind[i] == ind[j])
<font color="#804040">18 </font>                    <font color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;
<font color="#804040">19 </font>                <font color="#804040"><b>if</b></font> (!check(ind[i], ind[j], w[i], w[j]))
<font color="#804040">20 </font>                    <font color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;
<font color="#804040">21 </font>            }
<font color="#804040">22 </font>        <font color="#804040"><b>return</b></font> <font color="#ff00ff">true</font>;
<font color="#804040">23 </font>    }
<font color="#804040">24 </font>
</pre>

Adding this check in the inner-most loop makes the solution pass. That was basically the reference solution, and the thought process behind it.
You can see the similar structure in <tc-webtag:handle coderId="272072" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265701&rd=10773&pm=8025&cr=272072">code</a> from the match.
</p>
<br /><br />






<div class="authorPhoto">
    <img src="/i/m/slex_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8382018" context="algorithm"/><br />
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
