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
<tc-webtag:forumLink forumID="505994" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 319</span><br>Monday, September 18, 2006
<br><br>

<h2>Match summary</h2>
<p>SRM 319 was the first SRM hosted by TopCoder in nearly three weeks - and it was a money SRM to boot! As
if coders needed more incentive, this was the last SRM before TCCC round 1 and GCJ round 2 to practice 
those skills. These reasons were enough to attract the second largest crowd ever for a TopCoder SRM, 
with 1001 coders taking part in the match. This was only the second SRM in TC history with more 
than 1000 participants, behind SRM 294.</p>

<p>In division 1, coders were faced with a relatively easy set overall, with many contestants solving
all three problems. Although <tc-webtag:handle coderId="260835" context="algorithm"/>
was in the lead after the coding phase, <tc-webtag:handle coderId="310333" context="algorithm"/> took top spot in Division 1 thanks to two successful challenges. Rounding out the top five were
<tc-webtag:handle coderId="7459080" context="algorithm"/>, <tc-webtag:handle coderId="7462740" context="algorithm"/> and <tc-webtag:handle coderId="15982182" context="algorithm"/>.</p>
<p>In division 2, the hard problem seemed to trip up several coders. Nonetheless, the top five of <tc-webtag:handle coderId="20018722" context="algorithm"/>, <tc-webtag:handle coderId="21659869" context="algorithm"/>, <tc-webtag:handle coderId="22645698" context="algorithm"/>, <tc-webtag:handle coderId="22639623" context="algorithm"/> and <tc-webtag:handle coderId="21034193" context="algorithm"/> each had scores of over 1200 points, with positions 2, 3 and 5 being occupied by newcomers to TC.</p>

<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6151&amp;rd=9999" name="6151">SkewSymmetric</a></b>
</font>
<A href="Javascript:openProblemRating(6151)"><img src="http://www.topcoder.com/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505994" CLASS="statText"><img src="http://www.topcoder.com/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      386 / 492 (78.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      340 / 386 (88.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cluster2006</b> for 247.67 points (2 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183.56 (for 340 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>In this problem, coders were asked to determine the minimum number of alterations required
to transform a given matrix into a skew-symmetric matrix.</p>
<p>The easiest way to solve this problem is to note that values in the original matrix at position row <i>i</i>,
column <i>j</i> map to position row <i>j</i>, column <i>i</i> under the transposition operation. In this way, 
we form pairs of values - denoted by <i>x</i> and <i>y</i> - that will map to each other under transposition. 
Now, for every pair where <i>x</i> does not equal <i>-y</i>, we can simply choose to alter either one of <i>x</i>
or <i>y</i>. Note that values on the diagonal of the matrix map to themselves under transposition. Thus, we are
looking for values of <i>x</i> such that <i>x</i> = <i>-x</i>. Only the value 0 satisfies this constraint, so
we arrive at the condition that the diagonal values must be 0 in a skew-symmetric matrix. Pseudocode to solve
the entire problem follows:</p>
<pre>

    // Given M, an N by N matrix

    numAlterations = 0

    // Diagonal must be all 0
    for i:0 to N-1
        if M[i][i] != 0 numAlterations++

    // Check only one half of matrix
    for i:0 to N-1
        for j:i+1 to N-1
            if M[i][j] != -M[j][i] numAlterations++

    return numAlterations
</pre>
</p>
<font size="+2">
<b><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6715&amp;rd=9999" name="6715">BusSeating</a></b>
</font>
<A href="Javascript:openProblemRating(6715)"><img src="http://www.topcoder.com/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505994" CLASS="statText"><img src="http://www.topcoder.com/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      276 / 492 (56.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      239 / 276 (86.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mythruby</b> for 473.86 points (6 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      335.29 (for 239 correct submissions)
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
      436 / 450 (96.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      417 / 436 (95.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ihi</b> for 246.35 points (3 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      211.16 (for 417 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>The situation presented in this problem comes up often in the real-world. Of course, in the real-world,
the group of friends is more likely to just stand on the bus to be closer together... Here, however, we were
asked to minimize the sum of distances between each pair of friends.</p>
<p>This problem was not very difficult, with the toughest task being to translate the words from the statement
into a working model. The most straightforward model for the seats on the bus is to represent them as points
in the Cartesian plane. In particular, we can model the left row of seats as lying along the positive y-axis, 
where the origin of the coordinate system represents the front of the bus. Then, the points <i>(0,0), (0,1), 
(0,2), ... , (0,9)</i> represent the seats in the left row. Next, the seats in the right row can be represented 
using the points <i>(2,0), (2,1), (2,2), ... , (2,9)</i>. Note that the positioning of these points takes into 
account the specified separation between seats given in the problem statement.</p>
<p>Once those preliminaries are out of the way, the problem reduces to simply finding 3 of those points - 
<i>p<sub>1</sub></i>, <i>p<sub>2</sub></i> and <i>p<sub>3</sub></i> - such that the sum 
<i>d(p<sub>1</sub>,p<sub>2</sub>) + d(p<sub>1</sub>,p<sub>3</sub>) + d(p<sub>2</sub>,p<sub>3</sub>)</i>, where
<i>d(x,y)</i> represents the Euclidean distance between the points <i>x</i> and <i>y</i>, is minimized. Note that
the distinction between left and right row is irrelevant once the coordinates have been setup as above. For 
this reason, the two input strings may be concatenated and treated as one long input string. Pseudocode to 
solve this problem follows:</p>
<pre>

    // px, py represent the x and y coordinates as described above
    function dist(a,b)
			
        return sqrt( (px[a]-px[b])*(px[a]-px[b]) + (py[a]-py[b])*(py[a]-py[b]) )


    function getArrangement(leftRow, rightRow)

    full = leftRow + rightRow

    minDist = INF

    for i:0 to 19
        for j:0 to 19
            for k:0 to 19
                if full[i] != 'X' and full[j] != 'X' and full[k] != 'X'
                    if dist(i,j) + dist(j,k) + dist(i,k) &lt; minDist
                        update minDist

    return minDist
</pre>
</p>
<font size="+2">
<b><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6713&amp;rd=9999" name="6713">IncompleteBST</a></b>
</font>
<A href="Javascript:openProblemRating(6713)"><img src="http://www.topcoder.com/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505994" CLASS="statText"><img src="http://www.topcoder.com/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      63 / 492 (12.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 63 (14.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Barty_</b> for 905.46 points (9 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      589.52 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>In this problem, coders had to work with a fairly common data structure in CS, a binary tree. To be more specific,
coders were given a binary search tree (BST) with one unknown node value, and were asked to determine the possible
values that the node may assume while still maintaining a valid BST. Although the solution to this problem isn't
overly complicated, division 2 coders rarely have to work with binary trees, and this may have presented some
challenges.</p>
<p>The first sub-challenge in this problem was to figure out the relationship between nodes under the given
numbering scheme. In fact, if a given node is numbered <i>x</i>, then the node's left-child will be numbered 2*<i>x</i>
and the right-child will be numbered 2*<i>x</i>+1. As for representing the tree itself, a simple hash map may be used, 
using the node identifiers as keys to map to the node values.</p>
Once we have the tree setup as above, and we have identified the index of the unknown value, the most obvious way to 
approach this problem is to try all possible values (in the range 'A'-'Z') as the unknown value and verify that the 
resulting tree is still a valid BST. The key function here is one which determines whether a given tree constitues a
valid BST. The pseudocode for this function is given below, followed by a brief explanation:</p>
<pre>

    // myTree is the map (node identifier maps to node value)
    function isValidBST(curNode, minChar, maxChar)

        // the value of the current node is not within allowed character range
        if myTree[curNode] &lt; minChar or myTree[curNode] &gt; maxChar
            return false

        return
            // recursively check that left subtree is valid
            isValidBST(2*curNode, minChar, myTree[curNode])
            and
            // recursively check that right subtree is valid
            isValidBST(2*curNode+1, nextCharacter(myTree[curNode]), maxChar)
</pre>
<p>The above function should be called initially as `isValidBST(1, 'A', 'Z')'. The function verifies that the value of 
<i>curNode</i> lies within the character range [<i>minChar</i> - <i>maxChar</i>] inclusive. Thus, a call of 
`isValidBST(1, 'A', 'Z')' indicates that the value of the root node of the BST can lie anywhere in the range ['A'-'Z'].
The function then recursively verifies the validity of the left and right subtrees. Note how the range within which
node values may lie is updated in the recursive call to the function. Since the left subtree must contain values that
are less than or equal to the value of a given node, the upper bound on the valid character range for the left subtree
is changed to be the value of the current node itself. Similar logic may be applied to get the appropriate arguments
for the right subtree.</p>
</p>
<font size="+2">
<b><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6714&amp;rd=9999" name="6714">ConstructBST</a></b>
</font>
<A href="Javascript:openProblemRating(6714)"><img src="http://www.topcoder.com/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505994" CLASS="statText"><img src="http://www.topcoder.com/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      251 / 450 (55.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      191 / 251 (76.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 470.22 points (7 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      299.13 (for 191 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This was clearly a combinatorics problem at heart. Here, the shape of a particular BST was described, and coders had
to determine the number of distinct input strings that would give rise to a BST of the given shape. One restriction that 
made the problem simpler, I believe, was the fact that we knew that the first <b>N</b> uppercase characters were used 
to construct a BST with <b>N</b> nodes.</p>
<p>As a first step toward solving this problem, let's solve the following simpler problem: Find the lexicographically 
first string that would create a BST with a given shape. (Think about how you would solve this before reading on...) 
Since duplicate values in the strings are not allowed, we can construct the lexicographically first string by simply 
counting the number of descendents in the left (or right) subtree of a given node. To better explain the solution, 
let's use the following example case from the problem: {1, 2, 3, 4, 5}. Recall that using the characters 
{'A','B','C','D','E'} the following 8 strings generate a tree of the shape shown below: &quot;DBACE&quot;, 
&quot;DBAEC&quot;, &quot;DBEAC&quot;, &quot;DEBAC&quot;, &quot;DBCAE&quot;, &quot;DBCEA&quot;, &quot;DBECA&quot;, 
&quot;DEBCA&quot;.</p>
<div align="center">
<img src="/i/srm/srm319.jpg" alt="srm319" border="0" />
</div>
<p>Since the root node has 3 left descendents, we know that the characters {'A', 'B', 'C'} must somehow form the left 
subtree. Thus, the value of the root node is 'D'. It is clear that the value of the right child of the root is 'E', 
since this is the only character that has a value greater than 'D'. So, we know that the lexicographically first 
string must be of the form: &quot;D[ABC]E&quot;, where the exact ordering of the characters {'A', 'B', 'C'} is 
undetermined. But now, we can recursively apply the same logic to the left subtree of the root node, i.e. the tree 
rooted at the node numbered 2. Thus, we find that the lexicographically first input string is &quot;DBACE&quot;.</p>
<p>Now that we have the lexicographically first string, observe that the actual position of the input character 'E' 
is not important! In fact, as long as 'E' appears after 'D', we can be sure that it will occupy the correct position 
in the final BST, that is, as the right child of D. In other words, of the 4 characters that appear after 'D', the 
character 'E' can appear in any position. More generally, the values that comprise the left and right subtrees may 
be interleaved in any manner, so long as they appear after the common root. The question then becomes, how do we count 
the number of such interleavings?</p>
<p>This idea of interleaving may be encoded through a binary string. Let 0 represent a value that's part of the 
left subtree, and let 1 represent a value that's part of the right subtree. Since the root node in our above example 
has 4 descendents, 1 of which forms the right subtree, the binary strings {'0001', '0010', '0100', '1000'} represent 
all the ways in which those 4 descendents may be interleaved, while assigning each descendent to a unique subtree 
(left or right). But note that the number of such binary strings is simply 4 choose 1! Thus, the number of 
interleavings is simply numTotalDescendents choose numLeftDescendents (or numRightDescendents).</p>
<p>Of course, to finish the solution, we note that this idea applies recursively to all subtrees. Then, for the 
subtree rooted at node 2, we have 2 total descendents and 1 left descendent, giving us an additional 2 choose 1 = 2 
interleavings. So, overall, we are left with 4*2 = 8 interleavings, which is exactly the answer required. The 
following pseudocode captures the gist of this solution:</p>
<pre>

    // assumes that binom[x][y] stores the binomial coefficient x choose y
    function countNumInputs(curNode)
       
        if curNode does not exist (or curNode == null, etc.)
            return 1

        return binom[curNode.numTotalDescendents][curNode.numLeftDescendents] *
            countNumInputs(curNode.leftChild) *
            countNumInputs(curNode.rightChild)
        
    function numInputs(tree)

        // assumes that the tree has already been annotated with the number
        // of left and right descendents for each node

        return countNumInputs(root)
        
</pre>
</p>
<font size="+2">
<b><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6149&amp;rd=9999" name="6149">Manhattan</a></b>
</font>
<A href="Javascript:openProblemRating(6149)"><img src="http://www.topcoder.com/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505994" CLASS="statText"><img src="http://www.topcoder.com/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      100 / 450 (22.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      43 / 100 (43.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>reid</b> for 866.17 points (11 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      607.40 (for 43 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem required rather more insight than just the ability to write a megabyte of code. Congratulations go to <tc-webtag:handle coderId="260835" context="algorithm"/>, who needed less than 12 minutes to solve it.
</p>
<p>
Let persons A(x<sub>A</sub>, y<sub>A</sub>) and B(x<sub>B</sub>, y<sub>B</sub>) form the furthest pair and let x<sub>A</sub> >= x<sub>B</sub>. 
The distance between these points is (x<sub>A</sub> - x<sub>B</sub>) + |y<sub>A</sub> - y<sub>B</sub>|, 
which can be equal to either 
<pre>
(x<sub>A</sub> - x<sub>B</sub>) + (y<sub>A</sub> - y<sub>B</sub>) = (x<sub>A</sub> + y<sub>A</sub>) - (x<sub>B</sub> + y<sub>B</sub>)
</pre>
or
<pre>
(x<sub>A</sub> - x<sub>B</sub>) + (y<sub>B</sub> - y<sub>A</sub>) = (x<sub>A</sub> - y<sub>A</sub>) - (x<sub>B</sub> - y<sub>B</sub>)
</pre>
depending on whether y<sub>B</sub> is greater than y<sub>A</sub> or not.
</p>
<p>
The second parts of these formulae gives us the clue to the solution. 
The distance between points in the furthest pair can be written in one of the forms, written above. 
If we will find a pair (A, B) with the maximal value of ((x<sub>A</sub> + y<sub>A</sub>) - (x<sub>B</sub> + y<sub>B</sub>)) and 
a pair (C, D) with the maximal value of (x<sub>C</sub> - y<sub>C</sub>) - (x<sub>D</sub> - y<sub>D</sub>), the furthest pair will be either (A, B) or (C, D) <sup>1</sup>.
</p>
<p>
Obviously, the maximal value of ((x<sub>A</sub> + y<sub>A</sub>) - (x<sub>B</sub> + y<sub>B</sub>)) is achieved for point A, which has the maximal sum of 
its coordinates among all input points, and point B, the sum of which is minimal. To find A and B, iterate through all input points, calculating the sum of the coordinates for 
each point and keeping the indices with maximal and minimal sums. A similar algorithm will find the pair (C, D) with the maximal value of (x<sub>C</sub> - y<sub>C</sub>) - (x<sub>D</sub> - y<sub>D</sub>), and a simple comparation of pairs (A, B) and (C, D) will give you the answer to the whole problem.
</p>
<p>
The last trick is to not return (0, 0) in cases when all people live at the same point ((0, 0) is the lexicographically first pair, but it does not represent two different persons).  To avoid this, you can add a simple check which will return (0, 1) in all cases when you are trying to return (0, 0).
</p>
<p>
*1. To prove this we use the following lemma. For any points A and B, the following holds:
<pre>
|x<sub>A</sub> - x<sub>B</sub>| + |y<sub>A</sub> - y<sub>B</sub>| >= (x<sub>A</sub> + y<sub>A</sub>) - (x<sub>B</sub> + y<sub>B</sub>)
|x<sub>A</sub> - x<sub>B</sub>| + |y<sub>A</sub> - y<sub>B</sub>| >= (x<sub>A</sub> - y<sub>A</sub>) - (x<sub>B</sub> - y<sub>B</sub>)
</pre>
</p><div class="authorPhoto">
    <img src="/i/m/NeverMore_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="287130" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
