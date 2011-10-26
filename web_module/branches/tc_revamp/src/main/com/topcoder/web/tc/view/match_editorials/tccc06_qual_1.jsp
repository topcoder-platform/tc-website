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
<tc-webtag:forumLink forumID="506103" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Qualification Round 1 </span><br>September 7, 2006
<br><br>

<h2>Match summary</h2> 

 

<p> 
Thanks to the new qualification system, a lot of non-red coders got a perfect opportunity to win a TopCoder round.
Newcomer <tc-webtag:handle coderId="22629359" context="algorithm"/> used this opportunity,
 getting 5 successful challenges on the way to the round win.
<tc-webtag:handle coderId="20280511" context="algorithm"/> was less than 3 points behind, and 
and <tc-webtag:handle coderId="11904660" context="algorithm"/> rounded the top 3.
Unfortunately, nobody was able to correctly solve the hard problem.
Due to low participation level, the round cut-off was lower than 180 points, allowing a lot of lower-rated coders to qualify.
</p> 

 

<H1> 

The Problems 

</H1>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6698&amp;rd=10093" name="6698">MedianProcess</a></b> 

</font> 

<A href="Javascript:openProblemRating(6698)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      576 / 629 (91.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      537 / 576 (93.23%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Triple_M</b> for 248.36 points (2 mins 18 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      207.55 (for 537 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In this problem you need only to carefully implement 
the algorithm described in the statement. 
The easiest way to compute the median is described in notes - 
sort the numbers and take the element with the proper index.
C++ code follows:
<pre>
        int getScore(vector <int> values) 
            { 
            int n = values.size();
            if (n == 0) return 0;
            sort(values.begin(), values.end());
            int index = (n % 2) ? (n / 2) : (n - 1);
            int v = values[index];
            values.erase(values.begin() + index);
            return (n % 2) ? getScore(values) + v : getScore(values) - v;
        }
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6505&amp;rd=10093" name="6505">StudentsOrdering</a></b> 

</font> 

<A href="Javascript:openProblemRating(6505)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      384 / 629 (61.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      184 / 384 (47.92%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>{dano}</b> for 429.28 points (11 mins 56 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      278.97 (for 184 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

To solve this problem we need to make a couple of observations.
First, if in the final arrangement we separate boys and girls, 
both boys' (and girls') heights will go in the non-descending order.
Second, if several boys (or gilrs) are of the same height, their names will go in the alphabetical order.
</p>
<p>
These two observations are the key to the algorithm. 
Order boys and girls independently by height (splitting ties by names).
Let the sorted arrays look like B1, B2, ..., BN and G1, G2, ..., GM respectively. Then the optimal ordering can be either
B1, G1, B2, G2,... or G1, B1, G2, B2, ... 
Of course, each of these orders must satisfy several requirements. Heights in the order must go in the non-descending order. 
Also, if, for example, the line starts from a boy, the total number of boys cannot be smaller than the total number of girls  
and cannot exceed the number of girls by more than 1.
</p>
<p>
To find the answer, we build both ordering described earlier and compare their results.
C++ implementation of this algorithm follows:
<pre>
string findOrder(vector <string> students) 
   {
   vector<pair<int, string> > boys, girls;
   for (int i = 0; i < students.size(); i++) 
       if (students[i][students[i].length() - 1] == 'y')
           boys.push_back(read(students[i]));
       else
           girls.push_back(read(students[i]));
   sort(boys.begin(), boys.end());
   sort(girls.begin(), girls.end());
   string s1 = order(boys, girls);
   string s2 = order(girls, boys); 
   if (s1 == "") 
       return s2;
   return (s2 == "" || s1.compare(s2) < 0) ? s1 : s2;
} 
pair<int, string> read(string s) {
   int n1 = s.find(' ');
   return make_pair(atoi(s.substr(n1 + 1, n1 + 4).c_str()), s.substr(0, n1));
}
string order(vector<pair<int, string> > a, vector<pair<int, string> > b) {
   string ans = "";
   if (a.size() < b.size() || a.size() > b.size() + 1) return "";
   for (int i = 0; i < b.size(); i++) {
       ans += "-" + a[i].second;
       ans += "-" + b[i].second;
       if (b[i].first < a[i].first) return "";
       if (i > 0 && a[i].first < b[i - 1].first) return "";
   }
   if (a.size() > b.size()) {
        if (b[b.size() - 1].first > a[a.size() - 1].first) return "";
        ans += "-" + a[a.size() - 1].second;
   }
   return ans.substr(1);
} 
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6667&amp;rd=10093" name="6667">PenPuzzle</a></b> 

</font> 

<A href="Javascript:openProblemRating(6667)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      10 / 629 (1.59%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 10 (0.00%) 

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

<p>
This problem, as many other puzzle problems, is a modified shortest path problem. 
To build the graph, we represent each state of the puzzle 
(i.e. - colors of plates on all sides) as a node, and each valid modification as an edge between two nodes.
Removing any of the plates from the initial puzzle gives us several starting points, and all solved puzzles are our destinations.
To find the shortest path we use the BFS algorithm with a queue 
(see <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">this tutorial</a>
to read more about shortest paths). 
To avoid visiting the same state more than once, we save all visited states in a map.
</p>
<p>
The hard part of the problem is to make this solution run in time. 
Here I describe several tricks, which may be useful to you in the future.
The first (and wide-used) trick is to create a hash value for each state, to make comparing two states faster. 
Since the puzzle can not contain more than 12 plates of 5 different colors (4 colors + 1 extra "color" to mark an empty slot), 
the state of the puzzle can be represented as a 64-bit number (6 ^ 12 is ~ 2.2 * 10<sup>9</sup>).
Since this optimization is not enough, we will to reduce the search space to avoid checking the same state twice. 
Reducing the space includes introducing the <i>normal form</i> for each state, so different states will be represented by the same node.
</p>
<p>
First, the puzzle is symmetrical to rotations. That is, if we rotate each level of the puzzle, the resulting puzzle will have the same solution as the initial one. 
Since each side of the puzzle can be taken as "the first" side, each unique state of the puzzle may be represented as 
several nodes in our graph (for example, nodes {"ABC", "AC_"}, {"BCA", "C_A"} and {"CAB", "_AC"} represent the same unique state of the puzzle).
To avoid this, we need to select the first side unambiguously. 
The most natural way of doing this (at least for me) was selecting the side with the empty slot as the first side. 
In this case, the normal state of the puzzle is {"DABA", "CB_C"} will be {"BADA", "_CCB"}.
</p>
<p>
Another optimization uses the fact that the puzzle is symmetrical in respect to colors - 
so, if we'll make all green plates blue, and all blue plates green, the solution to the puzzle will remain the same 
(for example, solutions to puzzles {"ABC", "AC_"} and {"BAC", "BC_"} are equal).
Representing these as one node can be made in the following way. Iterate through all plates of the puzzle in some fixed order,
indexing all colors in the order you meet them. 
Then, change the color of each plate to the index of its color. 
For example, if the puzzle is {"DABA", "_CBC"} (or {"DBAB", "_CAC"}),  and we iterate from the top level to the bottom, from the first side to the last,
the normal state of the puzzle will be {"1232", "_434"}, or, using letters, {"ABCB", "_DCD"}.
</p>
<p>
To see the complete solution of this problem, check <tc-webtag:handle coderId="19849563" context="algorithm"/>'s solution in practice room.
</p>
<div class="authorPhoto">
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
