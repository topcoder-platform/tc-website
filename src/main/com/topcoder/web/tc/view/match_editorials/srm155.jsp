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
<tc-webtag:forumLink forumID="505591" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 155</span><br>Thursday, July 17, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>
<i>Incan Investigators Find Fraud by Deadbeat Dads in Twisty Two-Toned Trees...<b>SnapDragon</b> Wins Again!</i>
</p>

<p>
<b>SnapDragon</b> continues his dominance, winning for the sixth
time out of the past eight contests. <b>Yarin</b> was hot on his heels
until a late resubmit to fix a typo.  <b>ZorbaTHut</b> used one of
only a handful of challenges in Division 1 to pull into second place.
In Division 2, <b>TheFaxman</b> finished all three problems in a
lightning quick 24 minutes, only to watch <b>ambclams</b> pull ahead
for the victory two minutes later.
</p>

<p>
SRM 155 marks the debut of VB as a TopCoder programming language.
A scoring bug briefly showed one VB.NET user's total score as a heart-stopping 
-8000, but otherwise, the debut went smoothly.  Welcome aboard VB coders!
</p>

<p>  
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>Quipu</b> 
</font>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505591" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
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
      197 / 227 (86.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      182 / 197 (92.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kats</b> for 248.05 points (2 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.82 (for 182 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, you had to determine the size of each cluster of knots by
counting consecutive '<tt>X</tt>'s, allowing for the possibility of empty clusters.
You could do this with two nested loops, with the inner loop
processing a single cluster and the outer loop walking from cluster
to cluster:
<pre>
  int number = 0;
  for (int i = 0; i &lt; knots.length(); i++) {
    int cluster = 0;
    while (knots.charAt(i) == 'X') {
      cluster++;
      i++;
    }
    number = number*10 + cluster;
  }
</pre>
Alternatively, you could collapse these two loops into a single loop by 
incrementing every time you see an '<tt>X</tt>' and multiplying by 10 
every time you see a '<tt>-</tt>' (except for the trailing 
'<tt>-</tt>'):
<pre>
  int number = 0;
  for (int i = 0; i &lt; knots.length()-1; i++) {
    if (knots.charAt(i) == 'X') number++;
    else number *= 10; // '-' case
  }
</pre>
In either version, you could also ignore the leading '<tt>-</tt>' since
multiplying 0 by 10 has no effect.
</p> 

<font size="+2"> 
<b>BenfordsLaw</b> 
</font>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505591" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      130 / 227 (57.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      105 / 130 (80.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>TheFaxman</b> for 446.93 points (10 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      277.27 (for 105 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
According to Benford's Law, the probability that a number starts with 
digit <i>D</i> is log<sub>10</sub>(1+1/<i>D</i>).  Therefore, given a 
sample of <i>N</i> numbers, you would expect <i>E</i> = 
<i>N</i>*log<sub>10</sub>(1+1/<i>D</i>) of them to start with <i>D</i>.
A digit is questionable if its actual frequency is less than 
<i>E</i>/<b>threshold</b> or greater than <i>E</i>*<b>threshold</b>.
You count how many times each leading digit actually occurs and compare
it to these border values.
</p>

<p>
Many people lost time by accidentally using natural logarithms 
(base <tt>e</tt>) rather than base-10 logarithms.  To convert from
one base to the other, you use the identity log<sub>10</sub>(<i>x</i>) =
ln(<i>x</i>) / ln(10).  Another easy mistake to make was to accidentally
use integer division in calculating 1+1/<i>D</i>, instead of converting
to doubles.
</p>

<font size="+2"> 
<b>PaternityTest</b> 
</font>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505591" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
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
      70 / 227 (30.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 70 (74.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ambclams</b> for 953.86 points (6 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      691.68 (for 52 correct submissions) 
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
      123 / 136 (90.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      117 / 123 (95.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>shadowless</b> for 295.24 points (3 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.52 (for 117 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There are two basic approaches to deciding whether a particular
man could be the father.  The brute force approach is to test every
possible partitioning of characters from the child's sample between
the mother and the potential father, and accept any partitioning where
half of the characters come from the mother and half from the father.
With up to 2<sup>20</sup> possible partitionings per potential father,
and up to 5 potential fathers, there could be up to 5 million
partitionings to test.  Timeout is certainly a concern in this range,
but with a modicum of care it should be possible to test all 5 million 
partitionings in a few seconds.
</p>

<p>
A more efficient approach is to count how many characters in the child's 
sample match the mother and how many match the potential father, allowing
for the fact that some characters could match both.  If any characters match 
neither the mother nor the potential father, then the man can immediately
be ruled out.
Otherwise, a valid partitioning is possible if and only if at least half the
characters match the mother and at least half match the potential father.
Why?  Well, consider an example.  Suppose the sample is 20 characters long,
with 12 characters matching the mother and 13 characters matching the
father.  Then, there are 7 characters that match only the mother, 8 characters
that match only the father, and 5 characters that match both.  To create
a valid partitioning, we only need to assign 3 of the overlapping characters
to the mother and 2 to the father, which is clearly possible.
</p>

<p>
But wait!  We are guaranteed by the constraints that at least half the
characters in the child's sample match the mother, so we don't even need
to check that.  We merely need to check that no characters match neither
the mother nor the potential father, and that at least half the characters
match the father, as in the following helper method:
<pre>
  boolean possibleFather(String child, String mother, String man) {
    int match = 0;
    for (int i = 0; i &lt; child.length(); i++) {
      if (child.charAt(i) == man.charAt(i)) match++;
      else if (child.charAt(i) != mother.charAt(i)) return false;
    }
    return match &gt;= child.length()/2;
  }
</pre>
</p>

<p>
The rest of the solution is simply to check each man, and keep the indices
of those who cannot be ruled out.
</p>

<font size="+2"> 
<b>QuipuReader</b> 
</font>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505591" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      98 / 136 (72.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 98 (68.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ChristopherH</b> for 395.86 points (10 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      271.22 (for 67 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem is similar to Quipu, the Division II Easy, but extends it
in two ways.  First, there are now several cords instead of just one.
Second, there can now be an arbitrary number of '<tt>-</tt>'s between
clusters of knots.  The tricky part of the problem is deciding where one digit
ends and the next digit begins.  This is easy enough in examples like
<pre>
  "-XXX--XX---XXXX-"
  "-XX--XXXX---XX--"
</pre>
where one or more columns of dashes separate adjacent digits, but much
harder in examples like
<pre>
  "XXX-XX-XXXX"
  "XX-XXXX-XX-"
  "X--XXX---X-"
</pre>
where adjacent digits are not separated by columns of dashes.  A column begins
a new digit if it satisfies two conditions.  First, it must contain at
least one '<tt>X</tt>' that falls to the immediate right of a '<tt>-</tt>'.
Second, it must not contain any '<tt>X</tt>'s that fall to the immediate right
of another '<tt>X</tt>'.  These conditions can be tested for column <tt>i</tt> &gt; 0 as follows:
<pre>
    boolean newDigit = false;
    for (int j = 0; j &lt; knots.length; j++) {
      if (knots[j].charAt(i) == 'X') {
        newDigit = (knots[j].charAt(i-1) == '-');
        if (!newDigit) break;
      }
    }
</pre>
The rest of the code walks over all the columns, multiplying the numbers
for all the cords by 10 when a new digit is begun, and incrementing the 
appropriate cord's number for each '<tt>X</tt>' that is found.
</p>

<font size="+2"> 
<b>RedBlack</b> 
</font>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505591" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      20 / 136 (14.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 20 (80.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 621.54 points (25 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      465.91 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Red-black trees are described in most textbooks on data structures, but
they can be quite tricky to implement, often taking well over a hundred lines
of code.  This problem concerns a variant
of red-black trees that is much simpler and shorter.  Instead of the four 
different kinds of rotations used by standard red-black trees, this variant 
uses a single rebalancing transformation
called a <i>twist</i>.  The problem is to simulate a sequence of inserts and
count how many twists occur.
</p>

<p>
There are four different configurations in which a twist can occur, but
all four are twisted into the same target shape.  By writing a method to 
produce this shape, we avoid replicating the rebalancing code in four different
places.  The desired shape is
<pre>
            (RED) y
                 / \
                /   \
         (BLK) x     z (BLK)
              / \   / \
             T1 T2 T3 T4  
</pre>
and the method that produces this shape is
<pre>
  Node twist(Node x,Node y,Node z,  Node T1,Node T2,Node T3,Node T4) {
    twistCount++;
    x.color = BLK;  x.L = T1;  x.R = T2;
    z.color = BLK;  z.L = T3;  z.R = T4;
    y.color = RED;  y.L = x;   y.R = z;
    return y;
  }
</pre>
where I have abbreviated left and right as <tt>L</tt> and <tt>R</tt>.
</p>

<p>
The insertion code can be written as a recursive method.  Except for
the rebalancing code, it looks just like any other insertion into
a binary search tree.
<pre>
  Node ins(int x,Node t) {
    if (t == EMPTY) return new Node(RED,x,EMPTY,EMPTY);
    if (x &lt; t.value) t.L = ins(x,t.L);
    else             t.R = ins(x,t.R);
  
    ...rebalance by calling twist if necessary...

    return t;
  }
</pre>
The tricky part, of course, is the rebalancing code.  We need to call 
<tt>twist</tt> whenever <tt>t</tt> has a red child that has a red child
(<tt>t</tt> itself will always be black in this case.)  The four configurations
of red child and red grandchild can be coded very compactly as
<pre>
    // check if child and grandchild are red
    if (t.L.color == RED &#38;&#38; t.L.L.color == RED)
      return twist(t.L.L,t.L,t,  t.L.L.L,t.L.L.R,t.L.R,t.R);
    if (t.L.color == RED &#38;&#38; t.L.R.color == RED)
      return twist(t.L,t.L.R,t,  t.L.L,t.L.R.L,t.L.R.R,t.R);
    if (t.R.color == RED &#38;&#38; t.R.L.color == RED)
      return twist(t,t.R.L,t.R,  t.L,t.R.L.L,t.R.L.R,t.R.R);
    if (t.R.color == RED &#38;&#38; t.R.R.color == RED)
      return twist(t,t.R,t.R.R,  t.L,t.R.L,t.R.R.L,t.R.R.R);
</pre>
Although these masses of <tt>.L</tt>'s and <tt>.R</tt>'s can
be hard to read, they correspond directly to the <tt>x,y,z</tt>
and <tt>T1,T2,T3,T4</tt> from the diagrams given in the problem:
<pre>
       (BLK) z         (BLK) z               x (BLK)         x (BLK)
            / \             / \             / \             / \
     (RED) y   T4    (RED) x   T4         T1   z (RED)    T1   y (RED)
          / \             / \                 / \             / \
   (RED) x   T3         T1   y (RED)   (RED) y   T4         T2   z (RED)
        / \                 / \             / \                 / \
      T1   T2             T2   T3         T2   T3             T3   T4
</pre>
</p>

<p>
Another trick that helps to make this code compact is to use a sentinel 
node to represent the bottom of the tree, instead of <tt>null</tt>.
The sentinel node, called <tt>EMPTY</tt>, is simply a black node with
arbitrary values in its other fields.  Notice how the <tt>ins</tt> method
checks for <tt>t == EMPTY</tt> instead of <tt>t == null</tt>.  Without the
sentinel node, tests like
<pre>
    if (t.L.color == RED &#38;&#38; t.L.L.color == RED)
      return ...;
</pre>
would have to be written as
<pre>
    if (t.L != null &#38;&#38; t.L.color == RED &#38;&#38;
        t.L.L != null &#38;&#38; t.L.L.color == RED)
      return ...;
</pre>
</p>

<p>
The last detail to remember about insertions is that the root is colored black
at the end of every insertion.  This can be accomplished by a wrapper method 
that merely calls the main insertion method (<tt>ins</tt>) and colors the
result black.
<pre>
  Node insert(int x,Node root) {
    root = ins(x,root);
    root.color = BLK;
    return root;
  }
</pre>
See my solution in the practice room for the complete code.
</p> 

<p>
Many people complicated their solutions by trying to maintain parent
pointers.  Parent pointers are necessary only if you try to code insertion
using loops instead of recursion, but such an approach tends to be messy.
</p>

<p>
This variant of red-black trees is a handy data structure to add to
your toolbox.  Although it may have seemed difficult in a timed
setting, it is one of the simplest forms of balanced binary search
trees you'll ever find.
</p>

<p>
<img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="299177" context="algorithm"/><br />
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
