<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10764&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514497" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Championship Round</span><br>Saturday, May 19, 2007
<br><br>

<h2>Match summary</h2> 

  
The problem set for the Championship Round consisted of one easy "implement the algorithm" problem,
one not very tricky greedy problem and one quite hard problem, which was too hard for most
of the competitors. Only three people got it right:
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/> (first), 
<tc-webtag:handle coderId="21111148" context="hs_algorithm"/> (second)
and <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> (fourth).
Due to an amazing challenge phase,
<tc-webtag:handle coderId="15604398" context="hs_algorithm"/> came third despite
a failing hard problem.
<br /><br />

As the result, <tc-webtag:handle coderId="21111148" context="hs_algorithm"/>
took home the individual title, while V. Gimnazija became the top team of the contest.
Unfortunately for the best performer in the Championship Round, <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>,
he returned home with no hardware. Since he is the only coder who qualified onsite for both TCHS and TopCoder Open tournaments, 
hopefully he'll be able to step up big in Vegas!
<br /><br />

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7805&amp;rd=10764" name="7805">SimpleTextProcessor</a></b> 

</font> 

<A href="Javascript:openProblemRating(7805)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      31 / 31 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      30 / 31 (96.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Zuza</b> for 248.00 points (2 mins 33 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      228.52 (for 30 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The only thing you need to do in this problem is to correctly perform the actions described in the statement.
First split the words from the input into two halfs and determine the lengths of the longest words in each of the halfs (A and B).
Then put the first half into an array of Strings, padding each of the words with spaces until its length is less than A.
After that, add a '*' to each of the elements and perform similar actions in the reverse order - add the necessary number of spaces
and append the correspondent element of words.
<br /><br />

Java implementation of this algorithm follows:
<pre>
        String[] ans = new String[words.length];
        System.arraycopy(words, 0, ans, 0, N);
	int A = 0;
        for (int i = 0; i < words.length / 2; i++)
		A = Math.max(words[i].length(), A);
	int B = 0;
        for (int i = words.length / 2; i < words.length(); i++)
		B = Math.max(words[i].length(), B);
        for (int i = 0; i < words.length; i++) {
            for (int j = 0; j < A - words[i].length(); j++)
                ans[i] += " ";
            ans[i] += '*';
            for (int j = 0; j < B - words[N + i].length(); j++)
                ans[i] += ' ';
            ans[i] += words[N + i];
        }
        return ans;
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7806&amp;rd=10764" name="7806">ZeroesAndOnesGrid</a></b> 

</font> 

<A href="Javascript:openProblemRating(7806)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      30 / 31 (96.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      28 / 30 (93.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk3</b> for 497.64 points (1 mins 57 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      452.33 (for 28 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


The key observations for this problem were the following:
<ul>
<li>
The order of the moves is irrelevant, because the final value of the each cell depends only on the number of times it was inverted.
</li>
<li>
You never need to choose the same cell more than once. 
If some solution contains the same cell chosen twice, change the order of moves such that the selections of this cell go one after another.
Since selecting the same cell twice in a row doesn't change the grid at all, you can safely eliminate the duplicated moves from the solution.
</li>
<li>
The resulting value of the bottom right cell (row = R - 1, column = C - 1) can be changed only by choosing cell (R - 1, C - 1).
</li>
</ul>

Let's look closer at the last observation. Since we want all cells to contain 0 after all moves, and there is no
benefit to choosing the same cell more than once, we can easily determine whether we ever need to choose the bottom right cell or not:
we play it if and only if its value was 1 at the beginning of the game.
If we must play it, let's make this move first, inverting the values of all cells in the grid and not playing this cell anymore.
<br />
<br />

Now, when the value of the bottom right cell is set to 0, let's look at the cell with address (R - 1, C - 2).
As you can see, this cell can be inverted by only two possible moves - by choosing either (R - 1, C - 2) or (R - 1, C - 1).
Since we can not touch the (R - 1, C - 1) cell anymore, the decision whether to play (R - 1, C - 2) cell depends only 
on the value of this cell (again, we play it only if the value is equal to 1).
<br />
<br />

Hope you already see the solution, which is all about the following idea. Iterate through the cells row by row, column by column, starting from the last cell and going to the 
cells with smaller indices. At each step, check the value of the cell and play the cell only if its value is equal to 1.
The number of moves during these iterations will be the answer for the problem.
<br /><br />

The Java solution, written by marian during the testing process, follows:
<pre>

public class ZeroesAndOnesGrid {
  public int[][] values;

  public void Invert(int si, int sj) {
    for (int i = 0; i <= si; ++i) 
      for (int j = 0; j <= sj; ++j)
        values[i][j] = 1 - values[i][j];
  }

  public int minMovesCount(String[] table) {
    values = new int[table.length][table[0].length()];
    for (int i = 0; i < values.length; ++i)
      for (int j = 0; j < values[0].length; ++j)
        values[i][j] = (int)(table[i].charAt(j) - '0');
    
    int res = 0;
    for (int i = values.length - 1; i >= 0; --i)
      for (int j = values[0].length - 1; j >= 0; --j) 
        if (values[i][j] == 1) {
          Invert(i,j);
          res++;
        }
    return res;
  }
}
</pre>
</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7808&amp;rd=10764" name="7808">RoadsReorganization</a></b> 

</font> 

<A href="Javascript:openProblemRating(7808)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      23 / 31 (74.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      3 / 23 (13.04%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk2</b> for 565.81 points (22 mins 40 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      455.57 (for 3 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Imagine we've built a loop which satisfies all conditions from the statement.
If you look closer at the intersection of this loop with the initial tree, you see the intersection is a set of disjoint paths 
(here, the intersection is the set of all roads such that they are present both in the tree and the loop).
Let the intersection contain X roads and the kingdom contain N cities.
Then, the initial tree contains N - 1 roads, out of which ((N - 1) - X) must be destroyed, 
and the final loop contains N roads, out of which (N - X) roads must be built.
Therefore, the answer is ((N - X) + ((N - 1) - X)) = 2 * (N - X) - 1, and the only task left is to find the maximal 
number X such that the final loop will contain X roads from the initial tree.
<br />
<br />

To find this number X we will iterate over the initial tree.
Let us be at vertex k and let the previous visited vertex be m. 
We need to find the maximal number of edges we can select in the subtree that is reachable from vertex k without visiting vertex m.
To find this number we do the following things:

<ul>
<li>
If vertex k is a leaf (so only vertex m is adjacent to it), return 0 - we can not select any more edges here.
</li>
<li>
If vertex k is connected to 2 vertices (vertex m and some other vertex p), select the edge from k to p, recursively find the 
value for p and return this value incremented by 1.
</li>
<li>
Now the answer depends on whether we selected the edge from m to k on the previous step or not.
If we did select it, then you can select only one more edge from vertex k. If we did not, you can select two more edges.
In either case, iterate through all possible selections and return the maximal possible answer you can achieve.
</li>
</ul>

See <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>'s 
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=11972352&rd=10764&pm=7808">solution</a>
for a nice implementation of a very similar approach.
<br />
<br />

<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
