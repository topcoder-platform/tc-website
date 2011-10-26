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
    <A href="/stat?c=round_overview&er=5&rd=10674">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506240" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 350</span><br>Wednesday, May 23, 2007
<br><br>



<h2>Match summary</h2> 

<p>
Division 2 was marked with a tricky medium and quite a straight-forward
hard. This led to many coders solving the hard one but failing the medium. Thus
a plan of skipping the 500-pointer and moving straight to the 1000-pointer really
paid off. However, all three correct submissions were crucial in order to
guarantee oneself a comfortable place at the very top. Division 2 was won by
<tc-webtag:handle coderId="10393569"
context="algorithm"/>, who achieved an impressive score of 1706.50
with the help of 6 successful challenges, while <tc-webtag:handle
coderId="22661509" context="algorithm"/> and
<tc-webtag:handle coderId="21595683"
context="algorithm"/> took second<sup></sup> and third<sup></sup>
place respectively.

<br />
<br />
Division 1 was another story, though the medium was again trickier than the
hard. The challenge bait was the 250-pointer and the 500-pointer as all the
corner cases of the 1000-pointer were covered in the examples.
<tc-webtag:handle coderId="19849563"
context="algorithm"/> submited the hard problem for an amazing
amount of 952.28 points early in the Coding Phase. Alas, he had to resubmit but
despite this managed to finish third <sup></sup>. With the fastest
submission of the hard, <tc-webtag:handle coderId="10574855"
context="algorithm"/> won the match with a comfortable lead on
<tc-webtag:handle coderId="7390224"
context="algorithm"/>, who took the second prize. This SRM brought
<tc-webtag:handle coderId="10574855"
context="algorithm"/> really close to the all-time rating record,
which also belongs to him.

<br />
<br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7606&amp;rd=10674" name="7606">DistanceBetweenStrings</a></b>
</font>
<A href="Javascript:openProblemRating(7606)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506240" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      500 / 521 (95.97%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301 / 500 (60.20%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>marutiborker</b> for 248.61 points (2 mins 8 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      206.12 (for 301 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was quite straight-forward; the major bugs were in
misunderstanding the definition of the distance between two strings and
handling the case-sensitiveness.
<br /><br />

As upper-case and lower-case letters were regarded the same, and <b>letterSet</b>
contained only lower-case letters, it was convenient to turn both given strings <b>a</b>
and <b>b</b> into lower-case at the very beginning. Next, as all
the letters in the <b>letterSet</b> were guaranteed to be distinct,
we just had to calculate the distance between <b>a</b> and <b>b</b>
with respect to each of them and sum the obtained distances to get the answer.
Java code implementing this approach follows.

<pre>
public int getDistance(String a, String b, String letterSet)
{
    a = a.toLowerCase();
    b = b.toLowerCase();
    int ans = 0;
    for(int i = 0; i < letterSet.length(); i++) {
        int occa = 0, occb = 0;
        char temp = letterSet.charAt(i);
        for(int j = 0; j < a.length(); j++) if(a.charAt(j) == temp) {
            occa++;
        }
        for(int j = 0; j < b.length(); j++) if(b.charAt(j) == temp) {
            occb++;
        }
        ans += (occa - occb) * (occa - occb);
    }
    return ans;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7613&amp;rd=10674" name="7613">SumsOfPerfectPowers</a></b>
</font>
<A href="Javascript:openProblemRating(7613)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506240" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      147 / 521 (28.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 147 (37.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>danielrocha</b> for 449.98 points (9 mins 41 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      268.01 (for 55 correct submissions) 
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
      380 / 465 (81.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      313 / 380 (82.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Triple_M</b> for 245.18 points (4 mins 0 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174.00 (for 313 correct submissions) 
    </td>
  </tr>
</table></blockquote>




<p>
With many coders in both divisions overlooking the possibility of
overflowing the 32-bit integer variables, or loathing to implement an array of
5000000 booleans, this problem turned out to be a tricky one.

To begin with, let us calculate all the perfect powers that do not exceed
5000000 and store them in an array <tt>s</tt>. 0 and 1 are
clearly perfect powers so put them in <tt>s</tt>. Determine
the remaining elements of <tt>s</tt> iterate through all the
integers greater than 1 and less than 2237 (2237<sup>2</sup> &gt; 5000000) and,
given such integer, put all its integer powers not exceeding 5000000 into
<tt>s</tt>. To avoid duplicate elements in
<tt>s</tt> use an array of 5000001 booleans to look up whether a
certain number is already in <tt>s</tt>:

<pre>
vector&lt;int&gt; s;
boolean lookup[5000001];
for(int i = 0; i &lt;= 5000000; i++) lookup[i] = false;
s.push_back(0);
s.push_back(1);
lookup[0] = true;
lookup[1] = true;
for(int i = 2; i &lt; 2237; i++) {
    long long a = i;
    while (a &lt;= 5000000) {
        a *= i;
        if (!lookup[a]) {
            s.push_back(a);
            lookup[a] = true;
        }
    }
}
</pre>

To this point many coders failed by declaring <tt>a</tt> in
the above code as an int. This would lead to an overflow when i = 2236 since 2236<sup>2</sup> &lt; 5000000 but 2236<sup>3</sup> is
too big for 32-bit integers.
<br /><br />

Secondly, iterate through all pairs of elements of <tt>s</tt>
and mark their sum in the <tt>lookup</tt> as
<tt>true</tt> if it does not exceed 5000000 (we can still use
<tt>lookup</tt> since every perfect power is clearly the sum of
two perfect powers &ndash; zero and itself):

<pre>
for(int i = 0; i &lt; s.size(); i++)
    for (int j = 0; j &lt;= i; j++)
        if (s[i] + s[j] &lt;= 5000000)
            lookup[s[i] + s[j]] = true;
</pre>

It is hard to determine the exact maximal size of <tt>s</tt>
from scratch but one may convince oneself in many ways that it does not exceed
3000 so the above code will not time out.
<br /><br />

At the current moment <tt>lookup</tt> is
<tt>true</tt> for exactly those i which are representable as the
sums of two perfect powers. All that remains is counting such i between
<b>lowerBound</b> and <b>upperBound</b>, inclusive:

<pre>
int ans = 0;
for(int i = lowerBound; i &lt;= upperBound; i++)
    if (lookup[i]) 
        ans++;
return ans;
</pre>

For the complete implementation of this approach consult <tc-webtag:handle
coderId="7462740" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=264826&rd=10674&pm=7613&cr=7462740">code</a>.
<br /><br />
</p>




<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7587&amp;rd=10674" name="7587">BagsQuiz</a></b> </font> <A href="Javascript:openProblemRating(7587)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506240" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      164 / 521 (31.48%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 164 (56.10%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>punzki</b> for 926.11 points (8 mins 9 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      604.68 (for 92 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The problem was quite easy for a Division 2 hard and hence the number of
coders solving it correctly was rather high.
<br /><br />

To solve it note that the <i>inside</i> relation suggests that
storing for every bag i the number of the bag j such that i is <i>inside</i>
j might be helpful. Indeed, let's denote <tt>inside[i]=j</tt>
in this case, where <tt>inside[i]=0</tt> if the bag i is
currently lying on the floor. Initially all the bags are on the floor so the
array <tt>inside</tt> is filled with zeroes. Analyzing the
elements of <b>actions</b> one by one and altering
<tt>inside</tt> accordingly is now the core of the solution. The
updating of <tt>inside</tt> depends on the action encountered:

<ul>
<li>If it is "PUT i INSIDE j" check if either
<tt>inside[i]</tt> or <tt>inside[j]</tt> is non-zero.
If so, return -1, else set <tt>inside[i]=j</tt>.
</li>
<li>
If it is "SWAP i WITH j" check if either
<tt>inside[i]</tt> or <tt>inside[j]</tt> is
non-zero. If so, return -1. Else iterate through all the bags and if you find a
bag k such that <tt>inside[k]=i</tt> then set
<tt>inside[k]=j</tt> and vice versa.
</li>
<li>
If it is "SET i LOOSE" then check if
<tt>inside[i]</tt> is non-zero. If so, return -1. Else iterate
through all the bags and if you find a bag k such that <tt>inside[k]=i</tt> set <tt>inside[k]=0</tt>.
</li>
</ul>

After the analysis of the contents of <b>actions</b> is complete
one must check if the obtained configuration is proper. To do this simply
iterate through all the bags and if you find any i such that
<tt>inside[i]</tt> is non-zero and <tt>inside[i]</tt>
return -1, since then bag i would lie <i>inside</i> a bag with a
smaller number. Else the obtained configuration is a proper one and to count
the number of bags lying on the floor iterate through all of them to find the
number of such i that <tt>inside[i]</tt> is zero. For the
implementation of this approach see 
<tc-webtag:handle coderId="21595683" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=264848&rd=10674&pm=7587&cr=21595683">solution</a>.
<br /><br />

Analyzing the elements of <b>actions</b> requires some
string parsing skills, which can be honed <a
href="/tc?module=Static&d1=features&d2=112106">here</a>.
<br />
<br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7593&amp;rd=10674" name="7593">StarsInGraphs</a></b> </font> <A href="Javascript:openProblemRating(7593)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506240" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      288 / 465 (61.94%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 288 (44.44%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 464.74 points (7 mins 56 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      307.53 (for 128 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First, note that the star number of a vertex is a monotonously increasing
function of its degree. This is clear – the more outgoing edges there are, the
more possibilities to combine a set of them into the rays of a star.
<br />
<br />

Second, let us determine the star number of a certain vertex of degree D.
To do so note that the star centered at this vertex is uniquely determined by
the set of its rays. Since the empty set and the sets having cardinalities 1 or
2 must be discarded, the star number of such vertex is 2<sup>D</sup> – D*(D –
1)/2 – D – 1. Knowing how to calculate the star number of a vertex given its
degree we may find the maximal degree <tt>maxDeg</tt> that gives
this number &lt;= <b>C</b>, i.e. the maximal degree of a vertex
that may appear on a starry path.
<br />
<br />

Knowing <tt>maxDeg</tt> we may forget about the star numbers –
the problem becomes finding the longest path in which the first vertex has a
degree not less than 3 and not more than <tt>maxDeg</tt> and
every subsequent vertex has a degree not less than its predecessor and not more
than <tt>maxDeg</tt>.
<br /><br />

From this point on a multitude of different approaches arise. Alas, as shown
by a great amount of failed submissions, some of them are quite bug-prone or
even incorrect. Though the plain vanilla version of Depth First Search (DFS) is
doomed to time out one may still insist on using DFS with memorization.
However, the most elegant, in my opinion, solution uses Bellman-Ford <a
href="http://en.wikipedia.org/wiki/Bellman-Ford_algorithm">algorithm</a> or its
variations.
<br /><br />

We use Bellman-Ford on each vertex satisfying the degree condition
simultaneously – initialy all the distances to vertices with a degree in the
range <tt>[3; maxDeg]</tt> are set to -1. The distances to other
vertices are equal to infinity.
<br /><br />

We treat every edge in our graph to be of weight -1. Thus after n (n is the
number of vertices in our graph) steps  2 described in the above <a
href="http://en.wikipedia.org/wiki/Bellman-Ford_algorithm">link</a> we must
perform step 3 to determine whether we have a negative cycle and, if this
is not the case, find the minimum distance to a single vertex and return minus
this quantity.
<br />
<br />

For a detailed version of this solution see <tc-webtag:handle
coderId="10574855" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rd=10674&rm=264843&cr=10574855&pm=7593">solution</a>.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7788&amp;rd=10674" name="7788">PlaneDivision</a></b> </font> <A href="Javascript:openProblemRating(7788)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506240" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      50 / 465 (10.75%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 50 (62.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 730.15 points (18 mins 47 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      593.55 (for 31 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
What we have  in this problem determined by the lines is a planar graph
and we have to determine the number of its finite faces. This suggests that
Euler's formula for planar graphs V + F – E = 2 may come in handy. Here V is
the number of vertices of the graph, F – the number of its faces (both finite
and infinite) and E – the number of its edges. If you are unfamiliar with
this formula and the concept of planar graphs cast a glance <a
href="http://en.wikipedia.org/wiki/Planar_graph">here</a>.
<br />
<br />

First, we would want to know the total number of vertices V in our planar
graph. To find it we will find all the intersection points of the given lines
(V will be equal to this number plus 1, which stands for the vertex 'at
infinity' through which all the lines pass). Intersection points can be stored
in many ways:

<ul>
<li>As a pair of indices (i, j) of lines that
intersect in that particular point.
</li>

<li>
As a 4-tuple of integers (a, b, c, d) where the
intersection point coordinates are a/b and c/d respectively. (It is easy to see
that the lines may only intersect at points with rational coordinates).
</li>

<li>
As a pair of doubles (x, y) where x and y are
the respective coordinates of the intersection point. For this to work one had
to note that the constraints were too low for two intersection points to get
really close, so choosing adequate precision for comparing whether two
intersection points are actualy the same was enough.
</li>
</ul>

Initially the set of intersection points is empty. For each intersection
point we store it (in either of the aforementioned ways) and the set of lines
that pass through it. We process each pair of two distinct given lines one by
one and determine whether their intersection point coincides with any of the
points that we already have. If so, we update the set of lines that pass
through this point, else we add a new intersection point and mark that these
two lines pass through it. To accomplish this we need to know how to determine
the coordinates of the intersection point of two lines and how to determine
whether the two given lines are parallel (in this case their intersection point
does not exist). This is a standard procedure and to inspect it in further
detail see the geometry tutorial <a
href="/tc?module=Static&d1=tutorials&d2=geometry2">here</a>.
<br />
<br />

Now that we have determined the intersection points we have to distinguish
between two cases. In the first one, the set of intersection points is empty,
i.e. we have a bunch of parallel lines. Clearly we have no finite regions then
and return 0. In the second one, this set is non-empty. To determine the total
number of edges it is convenient to examine the given lines one by one. Since
there exist two intersecting lines in this case we easily see that every line
must intersect at least one other line. If the number of intersection points
that the line pass through is <i>a</i>, then the number of edges
lying on this line is clearly <i>a + 1</i>. Hence the total number
of edges E will be the sum of such (<i>a + 1</i>)'s for all given
lines. To find <i>a</i> for a certain line iterate through all the
intersection points to see through how many of them the line passes.
<br /><br />

Now that we have V and E we may find F from the aformentioned Euler's
formula: F = 2 + E – V. All that is left is to determine the number of infinite
regions, which is 2n (n is the number of given lines) in this case. A rigorous
proof of this fact goes by induction and is left to reader. Hence the required
answer is F – 2n.
<br /><br />

For a clear implementation of this approach see <tc-webtag:handle
coderId="10574855" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=264843&rd=10674&pm=7788&cr=10574855">solution</a>.
<br /><br />
</p>




<div class="authorPhoto">
    <img src="/i/m/Xixas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22629218" context="algorithm"/><br />
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
