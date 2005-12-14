<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505758" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 261</span><br>Tuesday, August 30, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
Division 1 was faced with a pretty standard problemset, with the medium problem
slightly harder than average. <b>JongMan</b> was between the first coders to 
submit all three problems. Sadly, later he found a bug in his 250 and the 
resubmit costed him the SRM win and moved him to the fifth place. 
</p>
<p>
After the coding phase the field was lead by <b>kalinov</b> and <b>Toivoa</b>.
But the match was far from being over. We saw quite a lot of challenges for
all three problems, especially for the easy one. After the dust settled,
<b>Toivoa</b> was left fourth, <b>Zuza</b> claimed the third place with 
the help of 5 successful challenges, <b>kalinov</b> finished second...

</p>
<p>
...and the SRM win goes to <b>marek.cygan</b>. Congratulations!
</p>
<p>
In division 2 the hard problem was pretty tricky, thus only two solutions made
it through the system test phase. The only coder to have all three problems
passed was <b>zmast3r</b> &ndash; and he won division 2 by a fair margin.
<b>phoenixinter</b> and a newcomer <b>endrjo</b> finished second and third.
Another newcomer <b>LemonTree</b> had the other successful solution for
the hard problem, but his failed medium placed him only in the fifth place.

</p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4651&amp;rd=7995" name="4651">SpreadsheetColumn</a></b>
</font>
<A href="Javascript:openProblemRating(4651)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      324 / 366 (88.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      199 / 324 (61.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LemonTree</b> for 247.37 points (2 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      192.82 (for 199 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was pretty simple. To avoid any confusion, probably the best way is to handle the two
cases separately. As long as you tested your solution on all examples, you should've been on
the safe side.
</p>
<pre>
string result;
if (column &lt;= 26)
  result += char('A'+column-1);
else {
  column -= 27;
  result += char('A' + (column/26));
  result += char('A' + (column%26));
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4661&amp;rd=7995" name="4661">PrimeStatistics</a></b>
</font>
<A href="Javascript:openProblemRating(4661)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      270 / 366 (73.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      70 / 270 (25.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>airtifa</b> for 486.70 points (4 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      372.13 (for 70 correct submissions)
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
      304 / 308 (98.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      176 / 304 (57.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>wanglei</b> for 249.99 points (0 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      220.17 (for 176 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The first step to solve this problem is (of course) being able to say whether a given number
is prime. Either you could precompute this using the sieve of Erathostenes, or you could write a simple function that checks whether a number is prime.
</p>
<p>
How to do this? If a number N is not prime, it has a non-trivial divisor. Let D be the smallest of them.
Clearly D&ge;2. The number N/D is also a non-trivial divisor of N. But D is the smallest one,
therefore D&le;N/D. In other words, D*D&le;N. A simple way of primality testing follows:
</p>
<pre>
boolean isPrime(int N){
  if (N&lt;2) return false;
  for(int i = 2; i*i &lt;= N; i++){
    if(N%i == 0) return false;
  }
  return true;
}
</pre>
<p>
The time complexity of this function is clearly O(sqrt(N)). Note that the upper bound for the
cycle is often written as "i &le; sqrt(N)", but our way is a bit faster and we avoid using
real numbers.

</p>
<p>
Now all you had to do was to loop through the given interval, for each number check whether
it is prime and for each prime compute its remainder.
</p>
<p>
There were lots of successful challenges for this problem. The problem with most of the 
flawed solutions is that they considered 1 to be prime. Note that 1 is never considered 
to be a prime number. This was also clearly stated in the problem statement... but avoided
in the examples. Many coders spotted this and were awarded in the challenge phase.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4652&amp;rd=7995" name="4652">GomokuBoardChecker</a></b>
</font>
<A href="Javascript:openProblemRating(4652)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      63 / 366 (17.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 63 (3.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zmast3r</b> for 509.79 points (36 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      504.06 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Algorithmically there's nothing that difficult in this problem. But there were many cases to
consider... and not all of them were covered by the examples. This made the problem pretty tricky,
with only two solutions handling all the cases correctly.
</p>
<p>
Clearly, we need a systematic way of approaching the problem. First of all, let's count the number of 'O's and the number of 'X's on the board. If these counts differ by more than 1, the position is illegal. If they differ by 1, we know, who made the last move. If they are equal, either player could make the last move.
</p>
<p>
Now we check whether each player has got a 5-in-a-row. The easiest way: Loop through all squares,
loop through all 8 directions and check, whether there's a 5-in-a-row starting on the chosen square and going in the chosen direction.
</p>
<pre>
<font color="blue">// constants for the 8 directions</font>

int dr[] = { -1, -1, -1, 0, 0, 1, 1, 1 };
int dc[] = { -1, 0, 1, -1, 1, -1, 0, 1 };
<font color="blue">// the number of rows and columns</font>
int R, C;

boolean inside(int x, int y) { return (x&gt;=0 &amp;&amp; x&lt;R &amp;&amp; y&gt;=0 &amp;&amp; y&lt;C); }

boolean hasFive (char who, vector&lt;string&gt; board) {
  for (int r=0; r&lt;R; r++)
    for (int c=0; c&lt;C; c++)
      for (int d=0; d&lt;8; d++)
        if (inside( r+4*dr[d] , c+4*dc[d] )) {
          boolean ok=true;
          for (int k=0; k&lt;5; k++)
            if (board [ r+k*dr[d] ][ c+k*dc[d] ] != who) { ok=false; break; }
          if (ok) return true;
        }
  return false;
}

</pre>
<p>
If both players have got a 5-in-a-row, the position is invalid. If nobody has 5-in-a-row, the
position is either a game in progress, or a draw. To distinguish between these two cases, we simply check whether the board is full.
</p>
<p>
We are left with the case that exactly one player has got some 5-in-a-rows. If she couldn't make
the last move, the position is invalid. If she could, she had to make all of them in her last
move. (The game has to end immediately after one of the players won.) 
The easiest way to check whether this is possible is brute force: For each square with
her symbol try whether this could be the last move (i.e., check whether the board with
this symbol removed contains any 5-in-a-rows). If no possible last move is found, the position
is invalid, otherwise the player won.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4700&amp;rd=7995" name="4700">EncodingTrees</a></b>
</font>
<A href="Javascript:openProblemRating(4700)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      550
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      137 / 308 (44.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      115 / 137 (83.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 517.65 points (7 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      316.43 (for 115 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In the whole text, the abbreviation BST means "a binary search tree with N nodes labeled from 0 to (N-1)".
(In the problem statement the nodes were labeled by lowercase letters, but dealing with numbers
will simplify this text a little bit. Converting numbers to letters is trivial.)
Also, we will assume that the trees are indexed from 0. 
</p>
<p>
Counting all BSTs with N nodes is a pretty standard combinatorial tasks. Let C(N) be the count of
BSTs with N nodes, let C(N,K) be the count of BSTs with N nodes with the label K in the root node.
How to compute C(N,K)? The left subtree contains K nodes (labeled from 0 to K-1) and the
right one contains N-1-K nodes (labeled from K+1 to N-1). The left subtree is again a BST,
thus there are C(K) possible left subtrees. If we subtract (K+1) from each label in the right
subtree, we get another BST -- and vice versa, from each BST on N-1-K nodes we can create
a possible right subtree by adding (K+1) to each label. Thus there are C(N-1-K) possible
right subtrees.
</p>
<p>
Clearly, each pair (left subtree, right subtree) corresponds to one BST. We get the equation:
</p>
<pre>
C(N,K) = C(K) * C(N-1-K)

</pre>
<p>
and we may compute the total count of BSTs with N nodes by summing through all possible
labels of the root node: 
</p>
<pre>
C(N) = sum(K=0; K&lt;N; K++) C(K) * C(N-1-K)
</pre>
<p>
(As a side note, the numbers C(N) are known under the name Catalan numbers and they can be
found in many different places of combinatorics.)
</p>
<p>
After computing all the numbers C(N,K) the reconstruction of a tree from its index is
straightforward. In fact, the approach we use is the most common way of solving such combinatorial
tasks.
</p>
<p>
First, we need to determine the label of the root node (which is also the first label in 
the preorder code of the tree). This can be done by counting the trees
with the root node having the label 0, 1, etc.: The trees with indices from 0 to C(N,0)-1
have the label 0, trees from C(N,0) to C(N,0)+C(N,1)-1 have the label 1, etc.
</p>

<p>
Now we have the label K of the root node. Moreover, we can easily determine a new index I of our
tree between these C(N,K) trees.
</p>
<p>
Now all we have to realize is that these trees are ordered by the preorder codes of their left
subtrees and only in case of equality by the preorder codes of the right subtrees. In other words:
We know that there are
C(K) possible left subtrees and C(N-1-K) possible right subtrees. Given our index I, the left
subtree we seek has the index I / C(N-1-K) and the right subtree has the index I % C(N-1-K).
Thus we can compute their codes recursively using the same approach.
Note that the right subtree doesn't use label 0..N-K-2, thus we need to shift the
computed preorder code by K+1.
</p>
<p>
The value we return is: (label in the root node) + (preorder code of the left subtree) +
(appropriately shifted preorder code of the right subtree).
</p>
<pre>
String getCode(int N, int index) {
  if (index &gt;= C[N]) return "";

  int seen = 0;
  for (int rootLabel=0; rootLabel&lt;N; rootLabel++) {
    seen += C[rootLabel] * C[N-1-rootLabel];
    if (seen &gt; index) {
      <font color="blue">// enough trees found, rootLabel is correct</font>

      seen -= C[rootLabel] * C[N-1-rootLabel];
      int newIndex = index - seen;
      
      int leftIndex = newIndex / C[N-1-rootLabel];
      int rightIndex = newIndex % C[N-1-rootLabel];
      
      String result1 = getCode(rootLabel, leftIndex);
      String almostResult2 = getCode(N-1-rootLabel, rightIndex);
      String result2 = "";
      for (int i=0; i&lt;almostResult2.length(); i++) 
        result2 = result2 + ( (char)(rootLabel+1+(int)res2.charAt(i)) );
      
      return (char)(rootLabel + 97) + result1 + result2;
    }
  }
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4660&amp;rd=7995" name="4660">StackingBoxes</a></b>
</font>
<A href="Javascript:openProblemRating(4660)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      40 / 308 (12.99%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      13 / 40 (32.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Toivoa</b> for 857.15 points (12 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      640.09 (for 13 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
When trying to solve this problem greedily, there are many simple and wrong approaches. Putting the box with the largest carrying capacity on the bottom doesn't work. And neither does putting the heaviest box on the bottom. Many of the coders went for a greedy solution... and failed.
</p>
<p>
But still, the intuition behind these approaches is not that faulty. Suppose that we finished
building a valid stack of boxes. Let B be any box in the stack and let A be the box immediately above B.
From now on, consider only the stack formed by the box B and all boxes above it. The total weight of this
stack is at most w_B + c_B. Now suppose that w_A + c_A &gt; w_B + c_B. This means that c_A &gt; (w_B +
c_B) - w_A &ge; (weight of all the boxes) - w_A. In other words, the box A is able to carry all the
other boxes in our stack. Thus by swapping A and B we obtain a new valid stack with the same number
of boxes. (We should note that B is carrying less than before and nothing has changed for the
other boxes, thus the stack is valid indeed.)
</p>
<p>
As a consequence, we may rearrange each valid stack of boxes in such a way that the boxes are
ordered according to the sum of their weight and carrying capacity. Thus we only have to search for
an optimal stack, where the boxes appear in this order.
</p>
<p>

This can be done using a simple dynamic programming approach: Process the boxes in increasing order
of their sum. For each stack size, keep the smallest weight of a valid sorted stack created from the
currently processed boxes.
</p>
<pre>
<font color="blue">// assumptions:</font>
<font color="blue">// W[i] is the weight of the i-th box</font>
<font color="blue">// C[i] is its carrying capacity</font>
<font color="blue">// for all i, W[i] + C[i] &lt;= W[i+1] + C[i+1]</font>

<font color="blue">// in the beginning, the only valid stack is the empty one</font>
for (int i=0; i&lt;=N; i++) best[i]=1000000047;
best[0]=0;


<font color="blue">// the largest stack size so far is zero</font>
int maxCount=0;

for (int i=0; i&lt;N; i++) {
  <font color="blue">// we now process the i-th box</font>
  for (int j=maxCount+1; j&gt;0; j--) {
    <font color="blue">// let's try to make a stack with j boxes</font>
    <font color="blue">// with the current one on the bottom</font>
    <font color="blue">// for this to work, the currently smallest stack</font>

    <font color="blue">// of j-1 boxes mustn't be too heavy</font>
    if (C[i] &gt;= best[j-1]  &amp;&amp;  best[j-1]+W[i] &lt; best[j]) {
        best[j]=best[j-1]+W[i];
        if (j&gt;maxCount) maxCount=j;
    }
  }
}
</pre>

<p>
<img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
