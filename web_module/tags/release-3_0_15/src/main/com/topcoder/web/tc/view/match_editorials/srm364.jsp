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
    <A href="/stat?c=round_overview&er=5&rd=10778">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516061" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 364</span><br />Tuesday, September 4, 2007
<br /><br />



<h2>Match summary</h2> 

<p> 
After nearly a month since the previous SRM, SRM 364 kicked off in high gear with 1164 competitors ready for action.  The long break did not seem to affect these brave souls, and many were shouting "Woohoo!" as their code passed the system tests.  At the end of the challenge phase, <tc-webtag:handle coderId="15511417" context="algorithm"/>, <tc-webtag:handle coderId="22651527" context="algorithm"/>, and <tc-webtag:handle coderId="8355516" context="algorithm"/> were standing on top of the leaderboard.  However, all three cried out "D'oh!" as system tests took them out of contention.  With two challenges and strong times on all three problems, <tc-webtag:handle coderId="15206296" context="algorithm"/> took home the top spot for his first SRM win, followed closely by <tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="20018722" context="algorithm"/> (regaining his red color).  <tc-webtag:handle coderId="8362207" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/> rounded out the top 5.

</p><p>

In Division 2, <tc-webtag:handle coderId="22659060" context="algorithm"/> took home the gold with solid times on all three problems, including the fastest medium and hard problems.  <tc-webtag:handle coderId="20163806" context="algorithm"/>'s two successful challenges vaulted him into second, with <tc-webtag:handle coderId="273434" context="algorithm"/>, <tc-webtag:handle coderId="22672561" context="algorithm"/>, and <tc-webtag:handle coderId="22628688" context="algorithm"/> coming in close behind. 

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8152&amp;rd=10778" name="8152">MorselikeCode</a></b> 

</font> 

<A href="Javascript:openProblemRating(8152)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516061" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      496 / 564 (87.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      467 / 496 (94.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>rajesh105.04</b> for 249.42 points (1 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      196.65 (for 467 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

To solve this problem, we split the <b>message</b> into its individual letters, and then search through the <b>library</b> for the letter associated with them.  If we find the coded letter in the library, we append that to the returned string.  If the coded letter is not in the library, we instead append a '?'.  With at most 25 encoded letters in the <b>message</b>, and only 50 possible encodings, this can easily be done without further optimization.  Java code for this follows:
<pre>public String decrypt(String[] library, String message)
{
 String words[] = message.split(" ");
 String ret = "";
 for(int i=0; i &lt; words.length; i++)
 {
  char next = '?';
  for(int j=0; j &lt; library.length; j++)
   if(words[i].equals(library[j].substring(2)))
   { next = library[j].charAt(0);
    break;
   }
  ret += next;
 }
 return ret;
}
</pre>

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8060&amp;rd=10778" name="8060">Paintball</a></b> 

</font> 

<A href="Javascript:openProblemRating(8060)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516061" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      600 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      184 / 564 (32.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      148 / 184 (80.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>narri</b> for 468.44 points (16 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      293.12 (for 148 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      300 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      469 / 509 (92.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      454 / 469 (96.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kp7</b> for 269.17 points (9 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      186.06 (for 454 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

    To help Bart out with his game's leaderboard, we need to first determine the scores of each individual player.  If a player splattered a teammate, then he receives -1 point; otherwise, the player gains 1 point, and the splattered player loses 1 point.  Once this part is done, we obtain the team scores by summing the scores of their individual players.  We then sort the teams (paying attention to alphabetical order), and process the teams one by one.  For each team, we sort the team's players in order, and output those.  <tc-webtag:handle coderId="11888756" context="algorithm"/>'s fastest solution is a very good illustration of this method.
</p>
<p>
    An alternate way to do this is to create a data structure containing a player's name, score, team, and team score.  By providing a way to compare two of these data structures, we can put all of the data in and do one sort.  Then we process the entries one by one and output the answer easily.  <tc-webtag:handle coderId="22641658" context="algorithm"/>'s solution is a nice example of this.



</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8062&amp;rd=10778" name="8062">PowerPlants</a></b> 

</font> 

<A href="Javascript:openProblemRating(8062)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516061" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      42 / 564 (7.45%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      18 / 42 (42.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>narri</b> for 905.50 points (9 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      592.93 (for 18 correct submissions) 

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

      340 / 509 (66.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      277 / 340 (81.47%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 493.65 points (3 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      365.94 (for 277 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

With N=16 in the worst case, the constraints allow for an O(2<sup>N</sup> * N<sup>2</sup>) algorithm.  We can represent the state using a <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">bitmask</a>, where the i-th bit is 1 if the plant is operational, and 0 if the plant is not.  We can then use <a href="/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming </a> to solve the problem.  From any given state, we can quickly calculate the costs of powering each unpowered plant by looping through all powered plants, and taking the cheapest cost.  If at any time we have at least <b>numPlants</b> plants powered, we compare that cost to the minimum found so far.  Iterating over all possible moves, we will eventually obtain the minimum cost path.  A Java solution in this light follows:

<pre>public int minCost(String[] connection, String curPowered, int numPlants)
{
 int N = connection.length;
 int costs[][] = new int[N][N];
 
 for(int i=0; i &lt; N; i++)
 for(int j=0; j &lt; N; j++)
  costs[i][j] = connection[i].charAt(j)&lt;='9'?connection[i].charAt(j)-'0'
            :connection[i].charAt(j)-'A'+10;
 int dpTable[] = new int[1 &lt&lt N];
 
 Arrays.fill(dpTable, 10000);
 
 int curMask = 0;
 for(int i=0; i &lt; N; i++)
    if(curPowered.charAt(i)=='Y')
        curMask |= 1 &lt&lt i;
 
 dpTable[curMask] = 0;
 int ret = 10000;
 for(int i=1; i &lt (1 &lt&lt N); i++)
 {
  int g=0, h=i;
  while(h &gt 0)  // g counts the number of powered plants
  {
   h = h & (h-1);
   g++;
  }
  if(g &gt;=numPlants)
  {
   ret = Math.min(ret, dpTable[i]);
   continue;
  }
 
  for(int j=0; j &lt; N; j++)
   if((i & (1 &lt&lt j))==0)
   { 
    int lowCost = 10000; // lowCost is the lowest cost to power j
    for(int k=0; k &lt; N; k++)
        if((i & (1 &lt&lt k))!=0)
             lowCost = Math.min(lowCost, costs[k][j]);
    dpTable[i | (1 &lt&lt j)] = Math.min(dpTable[i | (1 &lt&lt j)],
                         lowCost+dpTable[i]);
   }
 }
 return ret;
}
</pre> 
<p>
Although this code runs in time under these constraints, a larger value of N (N=21, for instance) would not be feasible.  However, there is an O(N * 2<sup>N</sup> + N<sup>2</sup>) solution for this problem, which runs in time for N=21 in Java (as well as for N=22 in about 1.3 seconds for C++).  This solution is omitted here, so that the reader may discover it for himself, but my code with this complexity is available in the practice room.

</p> 



</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7375&amp;rd=10778" name="7375">YankeeSwap</a></b> 

</font> 

<A href="Javascript:openProblemRating(7375)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516061" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      40 / 509 (7.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      37 / 40 (92.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>domino</b> for 761.62 points (17 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      572.52 (for 37 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

First, let us consider the simpler problem of determining what gifts each guest would end up with, regardless of how the gifts are swapped.  Starting with the last person, we see that they can choose a gift with no unhappiness, simply by swapping to get it (or not swapping if they already have it).  Thus, we can remove that gift from the other guests' <b>preferences</b>, leaving the same problem (but with one fewer guest).  Following the same algorithm, we can quickly determine the gift that each guest will have at the end of an optimal YankeeSwap:
</p><p>

<pre>boolean used[] = new boolean[256];

String finalString = "";

for(int i=N-1; i&gt;-1; i--)
{
     int j=0;
     while(used[preferences[i].charAt(j)]) j++;
     finalString = preferences[i].charAt(j) + finalString;
     used[preferences[i].charAt(j)] = true;
}</pre>

<p> 

Once we have this optimal ending arrangement, the question is how to get there, fitting the swapping constraints.  The most common approach involved a greedy brute force (similar to what is seen in <tc-webtag:handle coderId="8362207" context="algorithm"/>'s fastest solution).  Assume that we have found an optimal move for the first i-1 guests.  Since each following guest will act greedily (as seen in the code above), we try each possible move for guest i, and follow it with a greedy solution for the remaining guests.  If this yields the same finalString as seen above, then we accept this move and move on to the next guest; otherwise, we try the next move.  Since the following guests must act to minimize their own unhappiness, this guarantees that we will arrive at the finalString, and that the string we return conforms to the rules.  

</p><p> 

Alternatively, we start with Guest i, and find the guest who is holding the gift he wants.  We then take that person's final gift, and find the person who is holding it.  Continuing this pattern, we will eventually either return to Guest i, or find some Guest j with j&lt;i.  In the first case, Guest i can do nothing, and his gift will eventually come to him.  In the latter case, then Guest i must swap with Guest j in order to receive his gift, and his move is uniquely determined.  See <tc-webtag:handle coderId="10395795" context="algorithm"/>'s <a href="http://forums.topcoder.com/?module=Message&messageID=860776">post</a> for a nice proof that this works, and <tc-webtag:handle coderId="7433858" context="algorithm"/>'s solution for an example of this approach.

</p><p> 

Finally, we can essentially start with finalString, and work our way back to the initial configuration.  This is based on the fact that a previous guest who wants the gift you are holding will make a move to hold the optimal gift for you to hold (either the gift that you directly want, or a gift that will eventually lead to your gift).  The moves made during this backwards conversion are the same moves that would be done during the Swap.  See <tc-webtag:handle coderId="20018722" context="algorithm"/>'s solution for a clear implementation of this strategy, or see <tc-webtag:handle coderId="272072" context="algorithm"/>'s solution for a very interesting recursive implementation of this approach.

</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />
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
