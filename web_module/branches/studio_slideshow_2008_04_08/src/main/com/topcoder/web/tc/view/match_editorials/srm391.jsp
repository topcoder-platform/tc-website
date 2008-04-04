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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=11125">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519980" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 391</span><br />Tuesday, February 26, 2008
<br /><br />



<h2>Match summary</h2>
 <p>This SRM attracted 1064 competitors. Div1 competitors confronted problems of relatively math flavor, while 
Div2 competitors confronted easy level 1 and level 2 problems but a very tough level 3, which leaded to no correct submission for it during the contest.</p>
<p>
In Div1 more than 20 competitors solved all three problems successfully. <tc-webtag:handle coderId="22629574" context="algorithm"/> got his first SRM win by a small gap of less than 4 points, followed by <tc-webtag:handle coderId="14946025" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/>. They all got their places mostly thanks to their fast 1000 points solutions.
</p>
<p>
In Div2 nobody solved all three problems just like the previous SRM due to the tough level 3 problem. <tc-webtag:handle coderId="22682913" context="algorithm"/> won with a very high score for level 1 and 2 problems and a plus of 100 points in challenge phase. <tc-webtag:handle coderId="22674888" context="algorithm"/> got the second place with a 200 points plus in challenge phase and <tc-webtag:handle coderId="20056044" context="algorithm"/> got the third place with 100 points plus in challenge phase.
</p>
 
 
 
<H1>
 
The Problems
 
</H1>
 
</p>
 
<font size="+2">
 
<b><a href="/stat?c=problem_statement&amp;pm=8620&amp;rd=11125" name="8620">SnowyWinter</a></b>
 
</font>
 
<A href="Javascript:openProblemRating(8620)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519980" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
 
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
 
      501 / 617 (81.20%) 
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      423 / 501 (84.43%) 
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>nitdgp</b> for 249.27 points (1 mins 32 secs) 
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Average Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      199.69 (for 423 correct submissions)
 
    </td>
 
  </tr>
 
</table></blockquote>
 
<p>
Based on the constraint that the points only range from 0 to 10000, we can get a very simple solution. Considering that there are at most 10000 unit segments, we use an array of size 10000 to record whether each unit segment has been covered while processing all the reports one by one. After that, we just need count the number of covered unit segments. See <tc-webtag:handle coderId="22682913" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269244&rd=11125&pm=8620&cr=22682913">solution</a> for example.
</p>
<p>
Another method is more complex. Sort all reports by beginPoints increasingly, process them one by one and meanwhile record and update the last covered rightmost point. See <tc-webtag:handle coderId="22675206" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269242&rd=11125&pm=8620&cr=22675206">solution</a> for example.
</p>
 
 
<font size="+2">
 
<b><a href="/stat?c=problem_statement&amp;pm=8175&amp;rd=11125" name="8175">IsomorphicWords</a></b>
 
</font>
 
<A href="Javascript:openProblemRating(8175)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519980" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
 
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
 
      397 / 617 (64.34%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      334 / 397 (84.13%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Alex_KPR</b> for 486.63 points (4 mins 44 secs)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Average Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      346.27 (for 334 correct submissions)
 
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
 
      435 / 440 (98.86%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      428 / 435 (98.39%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>blueblimp</b> for 247.83 points (2 mins 39 secs)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Average Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      218.27 (for 428 correct submissions)
 
    </td>
 
  </tr>
 
</table></blockquote>
 
<p>
The key step is to check whether two words are isomorphic. Firstly two words of different lengths are definitely not isomorphic. Given two words of the same length, we can construct the required letter-to-letter mapping or report failure, which means the two words are not isomorphic, by scanning both words one by one letter from left to right. All we need are two arrays map[] and remap[] of size 26,  the former records which letter the corresponding letter of the first word has been mapped to or not assigned and the latter records which letter 
has been mapped to the corresponding letter of the second word or not assigned. While scanning two words, we check the inconsistency in map[] and remap[] and update them by adding new single letter-to-letter mapping. See <tc-webtag:handle coderId="272072" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269216&rd=11125&pm=8175&cr=272072">solution</a> for a neat implementation.
</p>
 
<font size="+2">
 
<b><a href="/stat?c=problem_statement&amp;pm=8488&amp;rd=11125" name="8488">MarbleCollectionGame</a></b>
 
</font>
 
<A href="Javascript:openProblemRating(8488)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519980" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Value</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      1050
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Submission Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      35 / 617 (5.67%) 
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      0 / 35 (0.00%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      No correct submissions
 
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
To solve this problem, graph theory knowledge about Strongly Connected Components is of great help, but lack in it will also be OK to understand the solution.
</p>
<p>
If there are no cells marked with 'L' and 'U', we can easily solve it by dynamic programming from left to right and from top to bottom. 
But life is not easy. The evil 'L's and 'U's destroy it at all. They make it possible that the robot reenters a cell, which make us headache. Let us see how we can crack the nut.
</p>
<p>
A key observation is that some cells are just like a friendly group, where the robot starts from any cell of it can successfully move by successive steps to any another cell of it. 
For example, in the board {"1234","U5L6","UL78"} cells in {"123","U5L","UL"} are just such a group. 
If such a group is maximal, namely  we can't add another cell to it to make a larger group, we call it maximal group. 
Once the robot enters one of the cells of a maximal group, it can freely move between cells of the group and surely collect all marbles in all the cells. 
So we can consider a maximal group as a super cell, whose marbles are the sum of all marbles in the original cells 
and the robot can enter or go out of the super cell from any original cell of the group.
</p>
<p>
According to the observation we can construct a new "board" made up of super cells. 
The robot can move in one step from one super cell to another if and only if it can move in one step from one of the original cells of the former group to one of the original cells of 
the latter group.  You can easily show that the robot can never reenter a super cell in the new "board", which is a good condition for dynamic programming. 
To construct the super cells and new "board", we firstly use BFS from every cell to find the connectivity between any pair of cells. Then, we pick one arbitrary unprocessed cell and 
find all cells such that there is bi-directional connectivity between the picked cell and them, they all as well as the picked cell consists of a super cell and we mark them all processed.
</p>  
<p>
After constructing the super cells, a simple recursive DP is enough for remaining work. Below is the pseudo code for DP part.
<pre>
    int DP(currentSuperCell)
    {
        if currentSuperCell has been calculated, return the value in the cache.
        mark currentSuperCell as calculated
        int res = the number of marbles in currentSuperCell
        for each super cell reachable from currentSuperCell
            res+=DP(another super cell)
        cache res
        return res.
    }
</pre>
See the writer's solution in the practice room for a complete implementation.
</p>

 
<font size="+2">
 
<b><a href="/stat?c=problem_statement&amp;pm=8202&amp;rd=11125" name="8202">KeysInBoxes</a></b>
 
</font>
 
<A href="Javascript:openProblemRating(8202)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519980" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
 
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
 
      259 / 440 (58.86%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      185 / 259 (71.43%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Petr</b> for 483.05 points (5 mins 21 secs)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Average Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      288.27 (for 185 correct submissions)
 
    </td>
 
  </tr>
 
</table></blockquote>
<p>
Let's see how much one bomb can help for opening boxes. You use a bomb to open a starting box, and then possibly use the key in it to open another box and so on. 
You will finally go back to the starting box. So one bomb can help you open a group of boxes. 
Moreover, starting from any one of the boxes in the group, you can always open them all. 
On the other hand, such a group always need one bomb to crack. Consequently, the number of such groups is just the number of bomb we need to open all the boxes.
</p>
<p>
A further observation indicates that a cycle in the permutation of the keys just corresponds to such a group of boxes. 
Now the problem is just to count how many permutations have not more than M cycles. 
It seems easier to count the number of permutations with exactly K cycles. 
In fact, it's just <a target="_blank" href="http://mathworld.wolfram.com/StirlingNumberoftheFirstKind.html">Stirling number of first kind</a>, which has a nice recurrence relation. 
Based on that, we can get a simple solution. See <tc-webtag:handle coderId="22629574" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269220&rd=11125&pm=8202&cr=22629574">solution</a> for a clear implementation.
</p>
 
<font size="+2">
 
<b><a href="/stat?c=problem_statement&amp;pm=8291&amp;rd=11125" name="8291">Transformation</a></b>
 
</font>
 
<A href="Javascript:openProblemRating(8291)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519980" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br />
 
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
 
      79 / 440 (17.95%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Success Rate</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      26 / 79 (32.91%)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>High Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Smylic</b> for 794.44 points (15 mins 18 secs)
 
    </td>
 
  </tr>
 
  <tr>
 
    <td class="bodyText" style="background: #eee;">
 
      <b>Average Score</b>
 
    </td>
 
    <td class="bodyText" style="background: #eee;">
 
      540.12 (for 26 correct submissions)
 
    </td>
 
  </tr>
 
</table></blockquote>


<p>
Here comes the toughest one! Surprisingly it has a short solution as below(Java code):
<pre>
    public String[] transform(String[] origin)
    {
        final int n=origin.length;
        long vector[]=new long[n];
        for(int i=0;i &lt; n;i++)
            vector[i]=Long.parseLong(origin[i]);
        for(int i=n-1;i&gt;=0;i--)
        {
            for(int j=0;j &lt; n;j++)
            {
                if(j==i)continue;
                long g=gcd(vector[i],vector[j]);
                long t=vector[j]/g;
                while((gcd(t,vector[i])) &gt; 1)
                    vector[i]/=gcd(t,vector[i]);
            }
            for(int j=i+1;j &lt; n;j++)
                vector[i]/=gcd(vector[i],vector[j]);
        }
        String[] re=new String[n];
        for(int i=0;i &lt; n;i++)re[i]=(new Long(vector[i])).toString();
        return re;
    }
</pre>
</p>
<p>
Let's see why it works step by step.
</p>
<p>
Firstly, assume we can express each number in A[] as a product of primes and get an integer matrix M[][] such that 
M[i][j] is the maximum of the set { x | P[j]<sup>x</sup> divides evenly A[i] }, where P[] is a group of prime numbers which contains all prime factors of numbers in A. 
Let PM[j]=Maximum{M[i][j] | for all i }. Then the LCM of As is just  the product of P[j]<sup>PM[j]</sup> for all j.
</p>
<p>
We can transform the matrix M[][] instead of A[] to finish the transformation, because we can reconstruct A[] from M[][]. 
If we only decrease the value of M[][], the condition 1 in the problem statement will be always satisfied. 
To keep the LCM invariant, each PM[j] must keep invariant after the transformation. 
So there must be a M[i][j](among all i) equal to the original PM[j] for all j after transformation.<br />
There are two parts we need do:<br />
    (1)We only need one such M[i][j]=original PM[j] for all j due to optimality, so we can safely set all other M[i][j]=0.<br />
    (2)If there are multiple M[i][j]=PM[j] for some specified j, we need only keep the one with maximum i due to optimality.<br />
</p>
<p>
After the transformation of M[][], we can reconstruct the optimal answer. The problem is solved perfectly. 
But life is not easy as I said before! The numbers in A[] can be as large as 10<sup>18</sup>, so it's hard to factor them into products of primes. 
How to crack the nut? A creative idea is to use gcd() procedure to generate the same effect as above. 
It's not hard to show that the Java code above just finishes the two parts work exactly.
</p>
<p>
It's interesting to note that <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269216&rd=11125&pm=8291&cr=10574855">solution</a> seems based on the 
prime factoring method. But I can't understand how exactly he do it.
</p>
<p>
By the way, this transformation does have a good application. It can be used to solve the generalized version of 
<a target="_blank" href="http://mathworld.wolfram.com/ChineseRemainderTheorem.html">Chinese Remainder Theorem</a>, 
where module numbers are not necessarily relatively prime. These ideas come from the writer's term paper for Concrete Math.
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15166995" context="algorithm"/><br />
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
