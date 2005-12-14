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
<tc-webtag:forumLink forumID="505719" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 233</span><br>Wednesday, March 2, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The submissions came fast and furious in both divisions; more
than 85 submissions were recorded in the first five minutes of
the match.  The rest of the submissions followed quickly, with
a very large number of level three submissions in both
divisions.  The Division 1 leader at the end of coding phase,
<b>bmerry</b>, saw his medium go down on on a challenge; the
Division 2 leader, <b>hhen926</b>, lost his difficult to a
challenge.  Going into system tests, Division 1 was led by
<b>nicka81</b>, <b>haha</b>, and <b>John Dethridge</b>;
Division 2 was led by <b>supernova</b>, <b>rsasanka</b>,
and <b>sandeep</b>.  System tests left the top three in each
division unchanged.
</p>
<p>
At the end of the contest, it appeared this would be the
first contest since SRM 55 that every submission on the easy
problem in Divison 1 passed.  This was not to be, as <b>haha</b>,
in an admirable feat of honesty, turned himself in on a
violation of the unused code rule.  This gesture may have
cost him one hundred rating points, but this writer believes
he'll get them back quickly enough.
</p>
<p>
In his (or her) second match, <b>marijnk</b>, gained an astonishing
354 ratings points this match in Division 1.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4017&amp;rd=6532" name="4017">JustifyText</a></b>
</font>
<A href="Javascript:openProblemRating(4017)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505719" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      295 / 310 (95.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      278 / 295 (94.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pankajbhamoriya</b> for 249.85 points (0 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      217.11 (for 278 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A loop to find the longest string, followed by another that extended each
string to this length, sufficed.  Another approach lead to an elegantly
short, although somewhat slower, solution:
</p>
<pre>
for (int i=0; i&lt;text.length; i++)
   for (int j=0; j&lt;text.length; j++)
      while (text[i].length() &lt; text[j].length())
         text[i] = " " + text[i] ;
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3994&amp;rd=6532" name="3994">PipeCuts</a></b>
</font>
<A href="Javascript:openProblemRating(3994)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505719" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      238 / 310 (76.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      188 / 238 (78.99%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>supernova</b> for 491.16 points (3 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      352.12 (for 188 correct submissions)
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
      144 / 145 (99.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      143 / 144 (99.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>wleite</b> for 247.65 points (2 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      226.34 (for 143 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Since there were few combinations of cuts, a simple enumeration followed
by a test was sufficient.  Sorting the cut array first provided some
brevity:
</p>
<pre>
Arrays.sort(weldLocations) ;
double sum = 0, tests = 0 ;
for (int i=0; i&lt;weldLocations.length)
   for (int j=0; j&lt;weldLocations.length) {
      tests++ ;
      if (weldLocations[i] > L ||
          weldLocations[j] - weldLocations[i] > L ||
          100 - weldLocations[j] > L)
         sum++ ;
   }
return sum / tests ;
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3937&amp;rd=6532" name="3937">AutoMarket</a></b>
</font>
<A href="Javascript:openProblemRating(3937)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505719" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      101 / 310 (32.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      32 / 101 (31.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Crystal</b> for 868.57 points (11 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      686.24 (for 32 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is longest increasing subsequence on a partial ordering.
A first approach might be to use recursion:
</p>
<pre>
int lengthFromHere(int carIndex) {
   int result = 1 ;
   for (int i=0; i&lt;i++)
      if (ordered(i, carIndex))
         result = Math.max(result, 1 + lengthFromHere(i)) ;
   return result ;
}
</pre>
<p>
with a similar loop in the main program to find the best car for
the head of the list.
This doesn't run fast enough because of repeated computations,
but memoization saves the day.
</p>
<p>
Since the only argument to the recursive function is <tt>carIndex</tt>,
dynamic programming also works, but first we need to order the
cars in an appropriate way.  (This is one advantage of memoization
over dynamic programming; with memoization you don't need to consider
how to order the state space.)  Sorting by any
particular attribute was sufficient, because the end result
must be sorted by all attributes.  Since the input was
provided in arrays, we may want to sort it ourselves using bubblesort,
rather than building all sorts of data structures.
A dynamic programming iteration of the state space
completes the solution; we do not include the head
car in our result array just to save us the trouble of initializing
the array:
</p>
<pre>
... bubble sort arrays by cost attribute ...
int res[] = new int[n] ;
int returnValue = 0 ;
for (int i=0; i&lt;n; i++) for (int j=0; j&lt;i; j++)
   if (ordered(j, i))
      returnValue = Math.max(returnValue,
                        res[i] = Math.max(res[i], 1+res[j])) ;
return returnValue + 1 ;
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3935&amp;rd=6532" name="3935">SmartWordToy</a></b>
</font>
<A href="Javascript:openProblemRating(3935)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505719" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      83 / 145 (57.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 83 (75.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ploh</b> for 420.22 points (12 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      289.18 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
With 26^4 or less than half a million states, and only eight transitions
out of each state, a breadth-first search works just fine.  Each state
could be encoded with a base-26 integer, but using base 32 instead
allows us to use shifts rather than divisions for some speedup.
Encoding our state with an integer allows us to use a simple array
for our distance map, although a four-dimensional array works also:
</p>
<pre>
int dist[] = new int[1+encode('zzzz')] ;
int queue[] = new int[1+encode('zzzz')] ;
</pre>
<p>
We use two magic values in our distance array:  0 means we haven't
gotten here yet, and -10 means it's an illegal square.  Using 0
as the initial value means we don't have to initialize the array,
but it also means we store one more than the actual distance.
</p>
<p>
First we iterate through the <tt>forbid</tt> array, marking all the illegal
places.  Because of the 50 character limit for each element, this
should run in time, but it's something to watch out for.
Our breadth first-search then looks like:
</p>
<pre>
int queuePut = 0, queueGet = 0 ;
queue[queuePut++] = encode(from) ;
dist[encode(from)] = 1 ;
int target = encode(to) ;
while (queueGet &lt; queuePut) {
   int pos = queue[queueGet++] ;
   if (pos == to)
      return dist[pos] - 1 ;
   for (delta=-1; delta&lt;=1; delta += 2)
      for (i=0; i&lt;4; i++) {
         int npos = ...calc next position...
    if (dist[npos] == -1) {
       dist[npos] = dist[pos] + 1 ;
            queue[queuePut++] = npos ;
         }
      }
}
return -1 ;
</pre>
<p>
As an exercise for the reader, what is the greatest possible return
value of this function, over all legal inputs?
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3936&amp;rd=6532" name="3936">DiskCut</a></b>
</font>
<A href="Javascript:openProblemRating(3936)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505719" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      47 / 145 (32.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      27 / 47 (57.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Abednego</b> for 914.30 points (8 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      706.52 (for 27 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A surprisingly large number of coders recognized this problem as
classic Huffman coding.  To solve this, you reconstruct the cuts in
reverse order; the last cut for any given input set always involves
the smallest two pieces.  We can show this works by induction on a
tree of cuts.  An interior node represents a piece to be cut, and the
children are the result of the cut; the leaf nodes are the final pieces.
The total cost of any tree is the sum over all leaves of the area of the
leaf multiplied by the distance from that leaf to the root.  We prove,
by induction, that any cut tree with minimum cost has the two smallest
leaves adjacent and at maximum distance from the root.  The base case
is two pieces and a single cut for which only one tree is possible.
For the inductive case, if the smallest values are not located as a
pair of leaves at the maximum distance from the root, we can clearly
swap them with the ones that are in that location and reduce the
overall cost of the tree.
</p>
<p>
The shortest solution is probably something like:
</p>
<pre>
int siz = percent.length ;
int totalCost = 0 ;
while (siz &gt; 1) {
   Arrays.sort(percent, 0, siz) ;
   totalCost += (percent[0] += percent[1]) ;
   percent[1] = percent[siz-1] ;
}
return (totalCost + 100) * (double)area ;
</pre>
<p>
A heap could also be used, or even just a simple linear search for
the smallest values.  An exercise for the reader is to solve
this problem using a single simple array, in place, in linear time
after the sort.
</p>
<p>
A completely different approach was used by some coders, such as
<b>Andrew_Lazarev</b>, who used a memoized recursive algorithm
to build an optimal ordered binary search tree.  (Others used
dynamic programming; there is a strong relationship between
memoized recursive algorithms and dynamic programming solutions.)
If the leaves are ordered by frequency, any optimal ordered binary
search tree is also an optimal Huffman tree.
</p>
 
 
<p>
<img src="/i/m/radeye_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="277659" context="algorithm"/><br />
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
