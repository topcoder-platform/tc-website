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
    <A href="/tc?module=HSRoundOverview&rd=10763&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514496" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Semifinal Round</span><br>Saturday, May 19, 2007
<br><br>

<h2>Match summary</h2>

The match started with a very easy 250 problem that almost everyone was able to solve. 
The medium had a coder-friendly statement and was not very difficult as well. 
The hard problem could be solved using a well-known algorithm but it included several tricks, which brought a 
lot of excitement into the challenge phase (and lots of points to some coders).
Many of the hard solutions failed during either the challenge or the system test, so only 7 coders got it right.
<br/><br/>
The leading position on the scoreboard was occupied by <tc-webtag:handle coderId="21111148" context="hs_algorithm"/> from Russia. He was followed by <tc-webtag:handle coderId="10399429" context="hs_algorithm"/> and <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>, from Canada and Croatia, respectively.
<br/><br/>
</p>



<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7803&amp;rd=10763" name="7803">SortInsideNumber</a></b>

</font>

<A href="Javascript:openProblemRating(7803)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514497" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      47 / 47 (100.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      45 / 47 (95.74%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>rlp</b> for 249.21 points (1 mins 36 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      241.50 (for 45 correct submissions)

    </td>

  </tr>

</table></blockquote>


This problem was pretty straightforward and many coders solved it quickly.
<br/><br/>
The problem had two very simple parts. The first consists of converting the given integer number into the array of digits, then sorting it in ascending order. 
Next, add each element to the beginning of the resulting string by iterating over the sorted array.
<br/>
<br/>
This is <tc-webtag:handle coderId="21868978" context="hs_algorithm"/>'s Java solution for the implementation details:

<pre>
 public int sort(int x) {
   String s = String.valueOf(x);
   char[] arr = new char[s.length()];
   for (int i = 0; i < s.length(); i++) {
     arr[i] = s.charAt(i);
   }
   Arrays.sort(arr);
   String res = "";
   for (int i = 0; i < s.length(); i++) {
     res = arr[i] + res;
   }
   return Integer.parseInt(res);
 }
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7770&amp;rd=10763" name="7770">SoccerCommentator</a></b>

</font>

<A href="Javascript:openProblemRating(7770)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514497" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      47 / 47 (100.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      33 / 47 (70.21%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Burunduk3</b> for 487.32 points (4 mins 36 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      431.01 (for 33 correct submissions)

    </td>

  </tr>

</table></blockquote>


This problem was not very difficult and the only thing to worry about was following the statement rules carefully.
<br/>
<br/>
The first step was to calculate how many goals both teams have already scored. 
Let's compute X - the number of goals scored by the second team minus the number of goals scored by the first team.
Obviously, if X < 0 the first team does not need any more goals to win (return 0 in this case).
<br/>
<br/>
Second, the first team needs at least X more goals to score. 
When it will score X goals, the number of away goals becomes significant.
Now, the answer depends on the host team of the first game:
<ul><li>
If the first game was hosted by the first team, compare the number of first team away goals 
(goals already scored by the first team in the second game plus X) and the number of second team away goals 
(scored by the second team in the first game).
If the second number is greater or equal than the first number, the first team needs to score one more goal, 
increasing the answer to (X + 1). Otherwise, X goals is enough for the first team to advance.
</li>
<li>
We act similarly if the first game was hosted by the second team.
Compare A = the number of away goals scored by the first team (the number of goals it scored in the first game) and
B = the number of away goals scored by the second team (the number of goals it scored in the second game).
The answer is X or (X + 1) depending on whether A is greater than B or not.
</li></ul>

For the details of the implementation please check <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>'s C++ fastest <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=21468741&rd=10763&pm=7770">solution</a>.
<br /><br />

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6742&amp;rd=10763" name="6742">KnapsackProblem</a></b>

</font>

<A href="Javascript:openProblemRating(6742)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514497" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      37 / 47 (78.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      7 / 37 (18.92%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Burunduk2</b> for 916.94 points (8 mins 42 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      583.22 (for 7 correct submissions)

    </td>

  </tr>

</table></blockquote>


You were given an array A={a<sub>1</sub>,...,a<sub>x</sub>} of x integers (the weights of the items you have) and
 another integer C (the maximum weight of your bag). 
You were asked to find the number of different sets of items you can carry in the bag.
<br/><br/>
Clearly you have 2<sup>x</sup> subsets of A, and you can not naively solve this problem by exhaustively 
comparing the sum of the elements of each subset of A to C. 
Such a procedure would work slightly long and could exceed the time-limit.
<br/>
<br/>
The problem can be solved more quickly with an algorithm discovered by Horowitz and Sahni in 1974, which 
is called the <i>Meet-in-the-Middle algorithm</i>. It takes on the order of 2<sup>x/2</sup> steps instead of the 
2<sup>x</sup> steps of the naive exhaustive comparison algorithm.
<br/>
<br/>
The idea of the <i>Meet-in-the-Middle algorithm</i> is the following. 
First, partition the array A into two arrays A<sub>1</sub>={a<sub>1</sub>,...,a<sub>x/2</sub>}
 and A<sub>2</sub> ={a<sub>x/2 + 1</sub>,...,a<sub>x</sub>}.
<br/><br/>
Now iterate through all subsets of A<sub>1</sub>, calculating the sum of the elements for each subset and adding this sum to array s1.
When you are done with all subsets, sort s1 in ascending order. Perform the same operation for A<sub>2</sub>, getting sorted array s2.
<br/><br/>
Now for each i-th element of the s1 you have to find the biggest s2 element such that the sum of these two elements is less than or equal to C. Since the array s2 is sorted in the ascending order, all the elements on the left of the just found "biggest value" are also matched (sum of the i-th element of s1 and each of them is less or equal to C). Thus you have found the number of sets which can be carried in the bag and contain the i-th element of s1.
<br/>
<br/>
To find the total number of sets you need to sum such numbers on each step of iterating for s1.
<br/><br/>
Each time the search of the biggest s2 element can be done using the binary search algorithm. This helps to speed up the solution.
<br/><br/>
The problem had one interesting trick inside - sometimes the subset-sum can be greater than the maximum value of 
32-bit integer. During the round, several coders stumbled over this hidden trap.
<br/><br/>
<tc-webtag:handle coderId="21111148" context="hs_algorithm"/>'s C++ code follows:


<pre>
int numberOfWays( vector <int> x, int C )
  {
    vector <llong> a, b;
    int n1 = x.size() / 2, n2 = x.size() - x.size() / 2;
    for (int i = 0; i < (1 << n1); i++)
    {
      a.push_back(0);
      for (int j = 0; j < n1; j++)
        if ((i >> j) & 1)
          a[a.size() - 1] += x[j];
    }
    for (int i = 0; i < (1 << n2); i++)
    {
      b.push_back(0);
      for (int j = 0; j < n2; j++)
        if ((i >> j) & 1)
          b[b.size() - 1] += x[n1 + j];
    }
    sort(a.begin(), a.end());
    sort(b.begin(), b.end());
    fprintf(stderr, "a.size()=%d b.size()=%d", a.size(), b.size());
    int ans = 0;
    for (int i = 0; i < a.size(); i++)
    {
      int mi = 0, ma = b.size() - 1, av;
      while (mi < ma)
      {
        av = (mi + ma + 1) / 2;
        if (b[av] + a[i] <= C)
          mi = av;
        else
          ma = av - 1;
      }
      if (a[i] <= C)
        ans += mi + 1;
    }
    return ans;
  }
</pre>




<div class="authorPhoto">
    <img src="/i/m/Katya_Lazareva_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8436401" context="algorithm"/><br />    <em>TopCoder Member</em>
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
