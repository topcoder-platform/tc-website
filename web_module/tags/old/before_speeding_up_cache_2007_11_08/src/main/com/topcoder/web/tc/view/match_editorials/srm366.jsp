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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=4&rd=10781">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516063" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 366</span><br />Tuesday, September 18, 2007
<br /><br />



<h2>Match summary</h2>

<p>

The Division I coders got a relatively easy set today, so speed did matter a lot. The easy problem was a pretty straightforward one, which most coders solved within a few minutes. The medium problem looked like simple brute force, but a few tricky corner cases made the problem slightly harder. The hard problem seemed to be really easy, but after a clarification came a couple of coders had to resubmit it and lost a lot of points. Because it was a close race, the challenge phase was quite important for the final score. Although <tc-webtag:handle coderId="14886245" context="algorithm"/> was one of the people who had to resubmit the hard problem, he won the match because of his 5 successful challenges. Within a range of 50 points, <tc-webtag:handle coderId="19849563" context="algorithm"/> and <tc-webtag:handle coderId="13366203" context="algorithm"/> (a new red-ranked Indian) became 2nd and 3rd.<br />
<br />
In Division II coders faced an average easy problem, a slightly harder than usual medium, and a bit of a tricky hard problem, with only 12 correct submissions. The top 3 finishers are all newcomers: <tc-webtag:handle coderId="22686851" context="algorithm"/>, <tc-webtag:handle coderId="22695218" context="algorithm"/> and <tc-webtag:handle coderId="22695787" context="algorithm"/>.
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8171&amp;rd=10781" name="8171">SerialNumbers</a></b>

</font>

<A href="Javascript:openProblemRating(8171)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516063" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      367 / 446 (82.29%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      278 / 367 (75.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>IdNotFound</b> for 246.71 points (3 mins 17 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      188.23 (for 278 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This was mainly a problem that needed a careful implementation of the steps described in the problem statement. To do the sorting, we could use the standard libraries with our own compare function, or we could write our own sorting algorithm, for example <a href="/tc?module=Static&d1=tutorials&d2=sorting">Bubble sort</a>. The compare function should implement the steps descibed in the problem statement, using your own function to add the digits in a string. An example solution could look like:<br />
<pre>
boolean isSmaller(String a, String b) {
   if (a.length() != b.length())
      return a.length() &gt; b.length();
   if (sumOfDigits(a) != sumOfDigits(b))
      return sumOfDigits(b) &lt; sumOfDigits(a);
   return a.compareTo(b) &gt; 0;
}

int sumOfDigits(String x) {
   int s = 0;
   for(int i = 0; i &lt; x.length(); i++)
      if(x.charAt(i) &gt; '0' && x.charAt(i) &lt;= '9')
         s += x.charAt(i) - '0';
   
   return s;
}
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7973&amp;rd=10781" name="7973">ChangingSounds</a></b>

</font>

<A href="Javascript:openProblemRating(7973)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516063" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      241 / 446 (54.04%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      94 / 241 (39.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ryuwonha</b> for 488.62 points (4 mins 21 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      359.94 (for 94 correct submissions)

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

      418 / 439 (95.22%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      354 / 418 (84.69%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Jan_Kuipers</b> for 247.92 points (2 mins 36 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      222.33 (for 354 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The key to this problem is that it is a typical <a href="/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming</a> problem. To solve it you should make a 2-dimensional boolean array where element <i>i, j</i> indicates if you are able to play song <i>i</i> with sound level <i>j</i>. Initially, you set <i>0, beginLevel</i> to true, and then iterate through all songs and sound levels where for each song <i>i</i> you update the values at <i>i+1</i>. See the solution below for this approach.<br />
<br />
Alternatively, this problem could also be solved using recursion with memoization; see <tc-webtag:handle coderId="152614" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=266311&rd=10781&pm=7973&cr=152614">solution</a> for a clear implementation of this.
<pre>
public int maxFinal(int[] changeIntervals, int beginLevel, int maxLevel) {
   boolean[][] canHave = new boolean[changeIntervals.length+1][maxLevel+1];
   for(int i = 0; i &lt;= changeIntervals.length; i++)
      Arrays.fill(canHave[i], false);
   
   canHave[0][beginLevel] = true;
   for(int i = 0; i &lt; changeIntervals.length; i++) {
      for(int j = 0; j &lt;= maxLevel; j++) {
         if(canHave[i][j]) {
            if(j + changeIntervals[i] &lt;= maxLevel)
               canHave[i+1][j + changeIntervals[i]] = true;
            if(j - changeIntervals[i] &gt;= 0)
               canHave[i+1][j - changeIntervals[i]] = true;
         }
      }
   }
   
   int max = -1;
   for(int j = 0; j &lt;= maxLevel; j++)
      if(canHave[changeIntervals.length][j])
         max = j;
   
   return max;
}
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8177&amp;rd=10781" name="8177">PickGuitars</a></b>

</font>

<A href="Javascript:openProblemRating(8177)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516063" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      38 / 446 (8.52%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      12 / 38 (31.58%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ryuwonha</b> for 855.59 points (12 mins 5 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      597.91 (for 12 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Before one can solve this problem, some insights about the problem are needed. The first thing is that, as soon as we picked the first guitar, we no longer have a circle, but we can think about the guitars as if they were in a line.<br />
<br />
Now let's see if we can write a function <i>f(begin,end)</i>, that calculates the maximum score for guitars <i>begin</i> to <i>end</i>. First of all, we know that if <i>begin</i> &gt; <i>end</i>, we cannot pick any guitars anymore, so the return value will be 0. Otherwise, it is not hard to see that if we pick guitar <i>i</i> (where <i>begin</i> &lt;= <i>i</i> &lt;= <i>end</i>), our score for this range will be <i>sum - f(begin,i-1) - f(i+1,end)</i> (where <i>sum</i> is the sum of all guitar values from <i>begin</i> to <i>end</i>). So, if we want to calculate <i>f(begin,end)</i>, we can just loop over all <i>i</i>'s from <i>begin</i> to <i>end</i>, and returning the maximum value among them. To make sure this function will run in time, we should memoize the calculated values in a 2-dimensional array.<br />
<br />
Now that we have function that can determine the maximum value between a certain range, the last thing to do is decide which guitar we should choose first. As in function <i>f</i>, we can loop over all guitars <i>i</i> (out of <i>n</i> as a possibility for our first pick). If we pick guitar <i>i</i>, then we should place guitars <i>i+1</i> to <i>i-1</i> (in that order) in a new array and call our function <i>f</i> to find the maximum value that the other player will get in that range. Now our total value will be <i>sum - f(0,n-1)</i>, and finding the maximum of that in all values <i>i</i> gives us the answer.<br />
<br />
For a clean implementation of this solution, see <tc-webtag:handle coderId="22663606" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=266327&rd=10781&pm=8177&cr=22663606">solution</a>.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7747&amp;rd=10781" name="7747">GuitarConcert</a></b>

</font>

<A href="Javascript:openProblemRating(7747)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516063" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      386 / 439 (87.93%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      241 / 386 (62.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>marek.cygan</b> for 483.43 points (5 mins 17 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      357.29 (for 241 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

With a constraint of a maximum of 10 guitars, this problem looked quite easy for a Div 1 medium problem. Because 2^10 = 1024 easily runs within the time limit, we can brute force all possible combinations of guitars we might want to buy. To do this, we use bitmasks (see <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">this article</a> for more information about bitmasks). For each bitmask, we do the following:
<ol>
<li>Calculate the number of songs we can play with these guitars, and how many guitars we would need for it.</li>
<li>Check if the number of songs we can play is bigger than, or equal to, the maximum number of songs we could play in the best solution we have found so far. If it is bigger we can use this as the best solution, if it is smaller we do not.</i>
<li>If the number of songs we can play is equal to the best so far, we check if this solution uses less guitars. If it does, we use this as the best solution; if it uses more we don't.</li>
<li>If the number of guitars is also the same, then check if this solution is alphabetically smaller then the best solution so far.</li>
</ol>
Where most coders implemented the first 3 steps correct, a couple of coders failed on the 4th step. There were several ways to implement it, but the best way to do it (in my opinion) was the following:<br />
<br />
Before you do the brute force search, sort all guitars by name (and of course sort <b>guitarSongs</b> accordingly). Now, instead of using the rightmost bit to represent the first guitar in the list, we use the leftmost bit to represent it. This way, we are sure that if 2 bitmasks have the same number of bits, the greatest of the 2 will represent the list of guitars that comes first alphabetically. So in the loop there is no need to check for the alphabetically first items, we just check if either the number of songs is bigger then the best so far, or the number of songs is the same and the number of guitars is smaller or equal then the best so far. Because we try the bitmasks in increasing order, we are sure that we find the alphabetically first solution this way.
</p>
<p>
<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7827&amp;rd=10781" name="7827">LateForConcert</a></b>

</font>

<A href="Javascript:openProblemRating(7827)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516063" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      180 / 439 (41.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      98 / 180 (54.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>konqueror</b> for 824.74 points (13 mins 42 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      539.78 (for 98 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

While this problem could look like an adaption of a shortest path algorithm at first, it turned out that there is a much easier solution to the problem. If we think about it, a state can be defined as 4 integers: <i>(x, y, timeLeft, lastmove)</i>. We know that x and y can both be 49 at most, <b>timeLeft</b> can be 100 at most, and, because we can only make 4 different moves, lastmove will be between 0 and 3. So, if we make a 4-dimensional double table, it has a worst case size of 50*50*101*4 = 1010000, which is small enough to stay within time limits and memory bounds.<br />
<br />
Initially, we make sure that every element in the table is set to a big enough value (let's call it INF), and we set your initial position at <b>timeLeft</b> for all different moves to 0. Now we loop over all possible values, and for a certain state <i>(x, y, t, m)</i>, we can update the table as follows:
<pre>
for(int d = 0; d &lt; 4; d++)
   if(d == inv[m]) continue; // To make sure we do not go back
   switch(cityMap[y].charAt(x)) {
      case 'X':
      case 'C':
         continue;
      case '.':
      case 'Y':
         if(x+dirx[d] &gt; 0 && x+dirx[d] &lt; width &&
            y+diry[d] &gt; 0 && y+diry[d] &lt; height)
            table[x+dirx[d]][y+diry[d]][t-1][d] = Math.min(
                  table[x+dirx[d]][y+diry[d]][t-1][d],
                  table[x][y][t][d]);
      case 'S':
         if(x+dirx[d] &gt; 0 && x+dirx[d] &lt; width &&
            y+diry[d] &gt; 0 && y+diry[d] &lt; height)
            table[x+dirx[d]][y+diry[d]][t-1][d] = Math.min(
                  table[x+dirx[d]][y+diry[d]][t-1][d],
                  table[x][y][t][d] + speedingTicket);
      case 'T':
         if(x+dirx[d] &gt; 0 && x+dirx[d] &lt; width &&
            y+diry[d] &gt; 0 && y+diry[d] &lt; height) {
            table[x+dirx[d]][y+diry[d]][t-1][d] = Math.min(
                  table[x+dirx[d]][y+diry[d]][t-1][d],
                  table[x][y][t][d] + redLight);
            if(t &gt; 2)
               table[x+dirx[d]][y+diry[d]][t-2][d] = Math.min(
                     table[x+dirx[d]][y+diry[d]][t-2][d],
                     table[x][y][t][d]);
         }
   }
}
</pre>

Now, if we have updated all states, we can find the final answer by taking the lowest answer in the table for the concert hall position where <b>timeLeft</b> = 0, looking at all 4 directions (we don't care which way we entered the concert hall). If the smallest is INF, we couldn't reach the concert hall and we return -1. Otherwise, we return the lowest answer we've found.

</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/jthread_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11818890" context="algorithm"/><br />
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
