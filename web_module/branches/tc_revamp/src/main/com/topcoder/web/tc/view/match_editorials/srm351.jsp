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
    <A href="/stat?c=round_overview&er=5&rd=10675">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506241" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 351</span><br>Tuesday, May 29, 2007
<br><br>



<h2>Match summary</h2> 

<p> 
1275 coders have registered for the last SRM before the summer. 
<tc-webtag:handle coderId="10574855" context="algorithm"/> won the contest and held a new rating record - 3700 rating points, incredible! 
<tc-webtag:handle coderId="251074" context="algorithm"/> surpassed <tc-webtag:handle coderId="19849563" context="algorithm"/> during the challenge phase and took the second place. 
<tc-webtag:handle coderId="19849563" context="algorithm"/> remained with the third.
<br />
<br />

In Division 2 the battle for top spots was centered on solving the hard problem. 
Among the 15 top coders 12 didn't solve the medium.  
Even <tc-webtag:handle coderId="15533368" context="algorithm"/> who finished third had only two solved problems. 
<tc-webtag:handle coderId="10426716" context="algorithm"/> from Bulgaria took the first place and <tc-webtag:handle coderId="22682266" context="algorithm"/> took the second. 
Both solved all three problems. 
The two other coders who solved all three problems are <tc-webtag:handle coderId="22652138" context="algorithm"/>, who finished fourth line, and <tc-webtag:handle coderId="22672928" context="algorithm"/>, in 17th.
<br />
<br />
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6764&amp;rd=10675" name="6764">RoomNumber</a></b> 
</font> 
<A href="Javascript:openProblemRating(6764)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506241" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      603 / 662 (91.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      401 / 603 (66.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>emotionalBlind</b> for 249.46 points (1 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      206.60 (for 401 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The most tricky part of the problem is converting given integer room number into an array of digits. 
This part could be done automatically, using language-specific function that converts integer into a string. 
Another way to do this is to code such an algorithm manually. 
The idea of the algorithm is to divide the given integer by 10 until it equals zero. 

<br />
<br />

Having the room number in the form of char array we can calculate how many times each character appears in the array.

<br />
<br />

The final part of the solution is to take care of the '6' and '9' digits. 
The easiest way to do this is to replace all '9' digits with the '6' digits and consider that each set contains two '6' digits. 
<br /><br />

You can see <tc-webtag:handle coderId="22631114" context="algorithm"/>'s solution as a reference:

<pre>
    numberOfSets(int roomNumber)  
    {  
        int P[10]; 
        for (int I = 0; I &lt; 10; I++) 
            P[I] = 0; 
        for (; roomNumber &gt; 0; roomNumber /= 10) 
            P[roomNumber % 10]++; 
        P[6] += P[9]; 
        if (P[6] % 2) 
            P[6] = P[6] / 2 + 1; 
        else 
            P[6] = P[6] / 2; 
        int Max = 0; 
        for (int I = 0; I &lt; 9; I++) 
            Max &gt;?= P[I]; 
        return Max; 
    } 
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7773&amp;rd=10675" name="7773">CoinsExchange</a></b> 
</font> 
<A href="Javascript:openProblemRating(7773)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506241" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      289 / 662 (43.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 289 (17.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>srele</b> for 454.73 points (9 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      311.10 (for 52 correct submissions) 
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
      467 / 536 (87.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192 / 467 (41.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 244.13 points (4 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178.44 (for 192 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The main idea of this problem is very easy: we need to do exchanges in the proper order. 
But understanding the order and the realization itself plunged coders into trouble. 
It is not very hard to show that the proper exchange order could be generated by the following strategy:

<ol>
<li>
If we have not enough gold coins we should get them from superfluous silver. 
If we lack silver to do this, we should get silver from superfluous bronze first. 
</li>
<li>If we have not enough silver coins we should get them from superfluous gold. 
If there is no extra gold we should get silver from bronze.
</li>
<li>If we have not enough bronze coins we should get them from the superfluous silver. 
If we lack for silver to do this, we should get silver from superfluous gold first. 
</li>
</ol>

<tc-webtag:handle coderId="9906197" context="algorithm"/> has a very good implementation of this strategy. Here is his code:

<pre>
  int countExchanges(int G1, int S1, int B1, int G2, int S2, int B2) { 
    int ret=0; 
    while(G1&lt;G2) { 
      if(S1&gt;=11) S1-=11,G1+=1,++ret; 
      else if(B1&gt;=11) B1-=11,S1+=1,++ret; 
      else return -1; 
    } 
    while(S1&lt;S2) { 
      if(G1&gt;G2) G1-=1,S1+=9,++ret; 
      else if(B1&gt;=11) B1-=11,S1+=1,++ret; 
      else return -1; 
    } 
    while(B1&lt;B2) { 
      if(S1&gt;S2) S1-=1,B1+=9,++ret; 
      else if(G1&gt;G2) G1-=1,S1+=9,++ret; 
      else return -1; 
    } 
    return ret; 
  }  
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4844&amp;rd=10675" name="4844">InsertSort</a></b> 
</font> 
<A href="Javascript:openProblemRating(4844)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506241" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      52 / 662 (7.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 52 (38.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>I-I</b> for 963.24 points (5 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      641.66 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, let's reinterpret the problem. 
During the move operation described in the problem statement we will 
erase the taken number but will not put it back into the array. 
We will continue such operations until the remaining array is sorted. 
It is quite evident that these two problems are equivalent. 
<br /><br />

Accordingly, with the new problem interpretation we should find the 
non-decreasing subsequence with the maximal sum of its element. 
After that erase all elements that are not in the subsequence using the modified move operation. 
And this will be the optimal sort.
<br />
<br />

We can find the non decreasing subsequence with the maximal sum of its element using dynamic programming. Let A[n] be a maximal sum of elements of non decreasing subsequence 
in the case if n is a last taken element. A[n] could be calculated with the following formula: 

<pre>
    A[n] = Max(A[i], (i &lt; n) and (theArray[i]&lt;=theArray[n])) + theArray[n];
</pre>

The answer for the initial problem will be the sum of all elements in theArray minus the maximum element in the array A.
<br /><br />

Here is <tc-webtag:handle coderId="22680345" context="algorithm"/>'s solution that illustrates this idea:


<pre>
    public int calcMinimalCost(int[] theArray) 
    { 
        int[] f = new int[theArray.Length]; 
        int res = 0; 
        for (int i = 0; i &lt; theArray.Length; i++) 
        { 
            f[i] = theArray[i]; 
            for (int j = 0; j &lt; i; j++) 
            { 
                if (theArray[j] &lt;= theArray[i]) f[i] = Math.Max(f[i], f[j] + theArray[i]); 
            } 
            res = Math.Max(res, f[i]); 
        } 
        res = -res; 
        for (int i = 0; i &lt; theArray.Length; i++) res += theArray[i]; 
        return res; 
    }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7772&amp;rd=10675" name="7772">BoxesArrangement</a></b> 
</font> 
<A href="Javascript:openProblemRating(7772)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506241" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      126 / 536 (23.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      90 / 126 (71.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>konqueror</b> for 464.36 points (7 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      319.10 (for 90 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be solved with  dynamic programming. 
Let's D[N<sub>A</sub>][N<sub>B</sub>] [N<sub>C</sub>][Q][K] will be a maximal number of 
never moved boxed in the final configuration, if the first N<sub>A</sub>+ N<sub>B</sub>+ N<sub>C</sub> boxes 
contain N<sub>A</sub> 'A' boxes, N<sub>B</sub> 'B' boxes and N<sub>C</sub> 'C' boxes, the box with the 
index N<sub>A</sub>+ N<sub>B</sub>+ N<sub>C</sub>-1 has Q color and there are K-1 boxes of the same color 
being exactly before it.
<br />
<br />

If we have value for D[N<sub>A</sub>][N<sub>B</sub>][N<sub>C</sub>][Q][K] there are three variants for 
the box with the index N<sub>A</sub>+ N<sub>B</sub>+ N<sub>C</sub>. They can be either 'A', or 'B' or 'C'. 
By adding up each of these boxes we will get value for the longer prefix of the boxes. 
Iterating this process we will find the answer for the problem.
<br /><br />

On the contest <tc-webtag:handle coderId="7581406" context="algorithm"/> thought out pretty similar approach for this problem. 
You can use his <a href="/stat?c=problem_solution&rm=264929&rd=10675&pm=7772&cr=7581406">solution</a> as reference.
<br /><br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7247&amp;rd=10675" name="7247">NewMagicSquare</a></b> 
</font> 
<A href="Javascript:openProblemRating(7247)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506241" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      73 / 536 (13.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 73 (50.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 814.49 points (14 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      584.90 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem has at least three principally different solutions. We will examine two of them. 
<br /><br />

Let's forget for a while that all numbers in one row should be in increasing order. We will only follow the condition that all numbers in a row before a pre-filled cell A be less than A and all numbers in the row after the A be greater than A. Let's find among all such solutions the one that is lexicographically first. 
It's not difficult to see that this solution is the solution for our problem as well. 
<br />
<br />

Now, for each cell, let's list all values that it could theoretically take. For the cells in the row without a pre-filled cell it will be [1..25] set. For the cells that come before the pre-filled cell A in the row, it will be [1..A-1] set. And for the cell that come after the pre-filled cell A in the row, it will be [A+1..25] set. 
Next, let's build a bipartite graph where the first part is cells and the second is numbers 1..25. Build the edges from each cell A to all the theoretically allowable values (we've calculated these sets above). At the last step we need to find a lexicographically smallest <a href=" http://en.wikipedia.org/wiki/Maximum_matching#Matchings_in_bipartite_graphs"> maximum matching</a> in this graph. 
This maximum matching will be the answer for the whole problem. You can see <tc-webtag:handle coderId="11829284" context="algorithm"/>'s <a href=" /stat?c=problem_solution&rm=264908&rd=10675&pm=7247&cr=11829284">code</a> as an example of this solution. 
<br />
<br />

The key for one more solution is a greedy approach. 
First, we have to find any filled square that meets the problem statement. Second, we should improve the algorithm to get the lexicographically smallest answer. Let's find a pre-filled cell A that contains maximal value and has non-filled cells on the right. Let's get a maximal number B that hasn't been placed yet. We can safely put B to the very right of the row with cell A. 
We also can do the same with the smallest filled cell that has non-filled cells on the left and smallest non-placed number. Repeating these two operations we will fill the entire square. But this solution is not lexicographically first. 
To get a lexicographically smallest solution we should iterate over all cells in the order and check all remaining numbers for them in the increasing order. If the solution exists after we place some number we can leave this number. 
Otherwise we should try the next. 
You can use <tc-webtag:handle coderId="9906197" context="algorithm"/>'s <a href=" /stat?c=problem_solution&rm=264929&rd=10675&pm=7247&cr=9906197">code</a> as an example of that solution. He uses a little different approach but the main idea is same.
<br />
<br />
</p>




<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
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
