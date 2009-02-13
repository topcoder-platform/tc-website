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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10971">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516070" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 373</span><br />Tuesday, October 23, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
The problem set in division 1 was well balanced. The easy problem was really 
easy and had a high success rate. The medium turned out to be more tricky than
many expected, and system tests took their toll. In my opinion the hard problem
from this set was pretty easy both to solve and to implement. Still, geometry
problems are always tricky, and the fact that there were only 13 successful
solutions proves this.
</p>

<p>
Victory went to 
<tc-webtag:handle coderId="144400" context="algorithm"/>
by a comfortable margin, with 
<tc-webtag:handle coderId="22221928" context="algorithm"/>
second (someone to watch out for, this is only his 7th match!) and 
<tc-webtag:handle coderId="7462740" context="algorithm"/>
third.
</p>

<p>
In the easier division the hard problem was geometrical as well, and it
proved to be tough. Only seven coders managed to get it right in time,
and three of them claimed the top spots: 
<tc-webtag:handle coderId="22679947" context="algorithm"/>
won,
<tc-webtag:handle coderId="22675210" context="algorithm"/>
was second and 
<tc-webtag:handle coderId="22359756" context="algorithm"/>
third.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6587&amp;rd=10791" name="6587">TheEquation</a></b> </font> <A href="Javascript:openProblemRating(6587)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516070" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      437 / 499 (87.58%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      360 / 437 (82.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NB-zhanglehua</b> for 249.95 points (0 mins 23 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211.62 (for 360 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Already in the problem statement it is explained why the answer is never
greater than <b>2P</b>. 
</p>

<p>
From this, we can make a simple observation: in the optimal solution
we have <b>a&le;2P</b> and <b>b&le;2P</b>.
</p>

<p>
As <b>P</b> can be at most 1000, this leaves us with at most 4 000 000 pairs
<b>(a,b)</b> to try out. We can simply examine all of them, and for each of them
compute <b>(aX+bY) mod P</b>.
</p>

<pre style="color: #9c0000;">

<font color="navy">class</font> TheEquation {
<font color="navy">public</font>:
  <font color="navy">int</font> leastSum(<font color="navy">int</font> X, <font color="navy">int</font> Y, <font color="navy">int</font> P) {
    <font color="navy">int</font> res=<font color="red">2</font>*P;
    <font color="navy">for</font> (<font color="navy">int</font> a=<font color="red">1</font>; a&lt;=<font color="red">2</font>*P; a++) 
      <font color="navy">for</font> (<font color="navy">int</font> b=<font color="red">1</font>; b&lt;=<font color="red">2</font>*P; b++)
        <font color="navy">if</font> ((a*X+b*Y)%P == <font color="red">0</font>) 
          res=min(res,a+b);
    <font color="navy">return</font> res;
  }
};
</pre>


<p>
The running time of this solution is quadratic in <b>P</b>. 
There are more effective solutions. Try to find one that is linear in <b>P</b>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8087&amp;rd=10791" name="8087">StringFragmentation</a></b>
</font>
<A href="Javascript:openProblemRating(8087)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516070" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      241 / 499 (48.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      134 / 241 (55.60%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>RAD.</b> for 432.10 points (11 mins 38 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.60 (for 134 correct submissions) 
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
      365 / 378 (96.56%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      306 / 365 (83.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 243.40 points (4 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178.94 (for 306 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First of all, let's start by preprocessing the input: split the input 
string into words. Clearly, the exact words are not important,
the only thing that matters are their lengths. (We could precompute
these, but the constraints were so small that this was not necessary.)
</p>

<p>
With <b>height</b> limited to 10 000, and with letter height equal
to twice the font size, the maximum font size is never greater than 5 000.
This means that the number of possible font sizes is small. 
All we need is an efficient way how to find out whether our text fits
the panel when using a given font size.
</p>

<p>
To check whether a given font size is good, we can use a simple greedy
approach: Each line of text should contain as many words as possible.
We will process the given words in order, and for each word we either
place it on the current line (if it fits), start a new line (if it doesn't,
but fits on a line by itself), or give up (if the word does not even fit on
a single line).
</p>

<p>
The following function checks whether <b>text</b> fits on a panel with
<b>width</b> times <b>height</b> pixels when using font size <b>fontSize</b>.
Note that thanks to our implementation we don't have to handle the third
case (a word that's too long) separately.
</p>

<pre style="color: #9c0000;">
<font color="navy">bool</font> fits(<font color="navy">const</font> vector&lt;string&gt; &amp;text, <font color="navy">int</font> width, <font color="navy">int</font> height, <font color="navy">int</font> fontSize) {
  <font color="navy">int</font> charWidth = fontSize + <font color="red">2</font>,   charHeight = <font color="red">2</font>*fontSize;
  <font color="navy">int</font> cols = width / charWidth,   rows = height / charHeight;

  <font color="navy">if</font> (cols==<font color="red">0</font> || rows==<font color="red">0</font>) <font color="navy">return</font> <font color="red">false</font>;
  <font color="navy">int</font> currentWord = <font color="red">0</font>, words = text.size();

  <font color="navy">for</font> (<font color="navy">int</font> r=<font color="red">0</font>; r&lt;rows; r++) {
    <font color="navy">int</font> c=<font color="red">0</font>;
    <font color="navy">while</font> (currentWord &lt; words) {
      <font color="navy">int</font> currentLength = text[currentWord].size();
      <font color="navy">if</font> (c &gt; <font color="red">0</font>) currentLength++;
      <font color="navy">if</font> (c + currentLength &gt; cols) <font color="navy">break</font>;
      c += currentLength;
      currentWord++;
    }
  }
  <font color="navy">return</font> currentWord == words;
}
</pre>

<p>
Now all we have to do is a linear search for the largest good font size.
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> largestFontSize(string text, <font color="navy">int</font> width, <font color="navy">int</font> height) {
  vector&lt;string&gt; T;
  stringstream SS(text);
  string S;
  <font color="navy">while</font> (SS &gt;&gt; S) T.push_back(S);
  <font color="navy">if</font> (!fits(T,width,height,<font color="red">8</font>)) <font color="navy">return</font> -<font color="red">1</font>;
  <font color="navy">int</font> res = <font color="red">8</font>;
  <font color="navy">while</font> (fits(T,width,height,res)) res++;
  <font color="navy">return</font> res-<font color="red">1</font>;
}
</pre>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8051&amp;rd=10791" name="8051">RectangleCrossings</a></b>
</font>
<A href="Javascript:openProblemRating(8051)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516070" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      35 / 499 (7.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 35 (20.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zyx3d</b> for 706.01 points (20 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      530.09 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Finding the intersection of a axes-parallel rectangle and a line segment is one of the most
important geometry algorithms. Without actually realizing it, you encounter it often -- whenever
a line or a surface is clipped to fit a window.
</p>

<p>
In this task we had to implement a significant part of the line clipping algorithm.
(Still, our task was much easier, for example we didn't have to find the actual intersections.
We will use this observation later.)
</p>

<p>
Geometry algorithms tend to be nasty and involve special cases. When encountering
tasks like this one, it is best to slow down and double check that you thought of 
each and every case that might occur.
</p>

<p>
This solution will be much more verbose than what I would actually write in the contest.
However, only the presentation would change (e.g., I would use static arrays of integers instead of classes),
the idea would remain the same.
</p>

<p>
We will start by making classes for points, segments and rectangles:
</p>

<pre style="color: #9c0000;">
<font color="navy">class</font> Point {
  <font color="navy">public</font>:
  <font color="navy">int</font> x,y;
  Point(<font color="navy">int</font> xx=<font color="red">0</font>, <font color="navy">int</font> yy=<font color="red">0</font>) { x=xx; y=yy; }
};

<font color="navy">class</font> Segment {
  <font color="navy">public</font>:
  Point P,Q;
  Segment(Point PP, Point QQ) { P=PP; Q=QQ; }
  <font color="navy">bool</font> isHorizontal() <font color="navy">const</font> { <font color="navy">return</font> P.y == Q.y; }
  <font color="navy">bool</font> isVertical() <font color="navy">const</font> { <font color="navy">return</font> P.x == Q.x; }
  <font color="navy">bool</font> intersectsSegment (<font color="navy">const</font> Segment &amp;S) <font color="navy">const</font>;
};

<font color="navy">class</font> Rectangle {
  <font color="navy">public</font>:
  Point P,Q;
  Rectangle(<font color="navy">const</font> Point &amp;PP, <font color="navy">const</font> Point &amp;QQ) { P=PP; Q=QQ; }
  <font color="navy">bool</font> containsPoint(<font color="navy">const</font> Point &amp;Z);
  <font color="navy">bool</font> intersectsSegment(<font color="navy">const</font> Segment &amp;S);
  <font color="navy">int</font> area() { <font color="navy">return</font> (Q.x-P.x)*(Q.y-P.y); }
};
</pre>

<p>
Note that our objects will contain methods for some operations we will use later. 
We already implemented the area of a rectangle, and checks whether a segment is horizontal or vertical.
</p>

<p>
Now we need to take the input data, and convert it from its initial representation into our
points, segments and rectangles. We will write a function that will convert the input data into
points. Note that we can use this function twice -- once for rectangles, once for segments.
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// merge a vector&lt;string&gt; into a string</font>
string merge(<font color="navy">const</font> vector&lt;string&gt; &amp;input) {
  string result;
  <font color="navy">for</font> (<font color="navy">unsigned</font> i=<font color="red">0</font>; i&lt;input.size(); i++) result += <font color="red">&quot; &quot;</font> + input[i];
  <font color="navy">return</font> result;
}

<font color="darkgreen">// parse a vector&lt;string&gt; into a vector of points</font>
vector&lt;Point&gt; parse(<font color="navy">const</font> vector&lt;string&gt; &amp;input) {
  vector&lt;Point&gt; result;
  stringstream SS( merge(input) );
  <font color="navy">int</font> x,y;
  <font color="navy">while</font> (SS &gt;&gt; x &gt;&gt; y) resultpush_back( Point(x,y) );
  <font color="navy">return</font> result;
}
</pre>

<p>
For the first subproblem, we may forget about line segments. We are simply given a set of points,
and for each rectangle we have to check whether the rectangle contains some of the points.
This check is really simple:
</p>

<pre style="color: #9c0000;">
<font color="navy">bool</font> Rectangle::containsPoint(<font color="navy">const</font> Point &amp;Z) {
  <font color="navy">if</font> (Z.x &lt;= P.x || Z.x &gt;= Q.x) <font color="navy">return</font> <font color="red">false</font>;
  <font color="navy">if</font> (Z.y &lt;= P.y || Z.y &gt;= Q.y) <font color="navy">return</font> <font color="red">false</font>;
  <font color="navy">return</font> <font color="red">true</font>;
}
</pre>

<p>
For the second subproblem, we can already assume that no endpoint of the segment lies inside the rectangle.
This leaves us with two possible cases. The first case are horizontal and vertical line segments. These are
nasty, as they can have a common part with the boundary of the rectangle in several different ways. 
The second case are line segments that are neither horizontal nor vertical. We will handle these two
cases separately.
</p>

<p>
To make the code simpler, we will define two helper functions:
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// check whether x lies in [start,end]</font>
<font color="navy">bool</font> contains(<font color="navy">int</font> start, <font color="navy">int</font> end, <font color="navy">int</font> x) { <font color="navy">return</font> start&lt;=x &amp;&amp; x&lt;=end; }

<font color="darkgreen">// is the intersection of [start1,end1] and [start2,end2] non-empty?</font>
<font color="navy">bool</font> intersect(<font color="navy">int</font> start1, <font color="navy">int</font> end1, <font color="navy">int</font> start2, <font color="navy">int</font> end2) {
  <font color="navy">if</font> (contains(start1,end1,start2)) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (contains(start1,end1,end2)) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (contains(start2,end2,start1)) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (contains(start2,end2,end1)) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">return</font> <font color="red">false</font>;
}
</pre>

<p>
When does a horizontal line segment intersect a rectangle? First, the segment's y coordinate has to be between
the rectangle's minimum and maximum y coordinate, inclusive. If it is smaller or larger, the segment is below or
above the rectangle and can not intersect it.
</p>

<p>
Once we checked that the segment is in the correct horizontal strip, we need to check whether it really
intersects the rectangle. This happens if and only if the intervals of their x coordinates intersect -- and
this is exactly what our helper functions are for.
</p>

<p>
Vertical segments are handled in the same way, only with x and y coordinates swapped.
</p>

<p>
Now all that's left is to handle line segments that are neither horizontal nor vertical. These are the nice
friendly ones with no special cases. There is always at most one intersection point. We don't even need to
compute it, we just need to check whether there is one or not. To do this, we can check a simple condition:
</p>

<p>
Two line segments AB and CD intersect if and only if: A, B lie on different sides of the line CD and C, D lie on different
sides of the line AB.
</p>

<p>
In our case we allow intersections at an endpoint of a line, therefore we will allow that the points A, B
may also lie on the line CD, and points C, D may lie on AB. Vector (cross) product is a simple way how to check
this condition:
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// cross product of the vectors AB and AC</font>
<font color="navy">int</font> crossProduct(<font color="navy">const</font> Point &amp;A, <font color="navy">const</font> Point &amp;B, <font color="navy">const</font> Point &amp;C) {
  <font color="navy">int</font> ux = B.x-Ax, uy = B.y-A.y;
  <font color="navy">int</font> vx = C.x-A.x, vy = C.y-A.y;
  <font color="navy">return</font> ux*vy - vx*uy;
}

<font color="darkgreen">// do points P2 and Q2 lie on different sides of the line P1Q1 or on the line?</font>
<font color="navy">bool</font> differentSides(<font color="navy">const</font> Point &amp;P1, <font color="navy">const</font> Point &amp;Q1,
                    <font color="navy">const</font> Point &amp;P2, <font color="navy">const</font> Point &amp;Q2) {
  <font color="navy">long</font> <font color="navy">long</font> cross1 = crossProduct( P1, Q1, P2 );
  <font color="navy">long</font> <font color="navy">long</font> cross2 = crossProduct( P1, Q1, Q2 );
  <font color="navy">return</font> (cross1*cross2 &lt;= <font color="red">0</font>);
}

<font color="darkgreen">// does our segment intersect segment S?</font>
<font color="darkgreen">// CAUTION!!! assumes that S is not parallel to our segment</font>
<font color="navy">bool</font> Segment::intersectsSegment(<font color="navy">const</font> Segment &amp;S) <font color="navy">const</font> {
  <font color="navy">return</font> differentSides(P,Q,S.P,S.Q) &amp;&amp; differentSides(S.P,S.Q,P,Q);
}
</pre>

<p>
Now we have all we need to write a function that checks whether a rectangle and a segment intersect:
</p>

<pre style="color: #9c0000;">
<font color="navy">bool</font> Rectangle::intersectsSegment(<font color="navy">const</font> Segment &amp;S) {
  <font color="darkgreen">// handle horizontal and vertical segments separately</font>
  <font color="navy">if</font> (S.isHorizontal()) {
    <font color="navy">if</font> (!contains(P.y,Q.y,S.P.y)) <font color="navy">return</font> <font color="red">false</font>;
    <font color="navy">return</font> intersect(P.x,Q.x,S.P.x,S.Q.x);
  }
  <font color="navy">if</font> (S.isVertical()) {
    <font color="navy">if</font> (!contains(P.x,Q.x,S.P.x)) <font color="navy">return</font> <font color="red">false</font>;
    <font color="navy">return</font> intersect(P.y,Q.y,S.P.y,S.Q.y);
  }
  <font color="darkgreen">// now we know that S is neither horizontal nor vertical</font>
  <font color="darkgreen">// check whether it intersects a side</font>
  Point A(P.x,Q.y), B(Q.x,P.y);
  <font color="navy">if</font> (S.intersectsSegment( Segment(P,A) )) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (S.intersectsSegment( Segment(P,B) )) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (S.intersectsSegment( Segment(A,Q) )) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">if</font> (S.intersectsSegment( Segment(B,Q) )) <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">return</font> <font color="red">false</font>;
}
</pre>

<p>
And finally, the main function. For each rectangle check whether it contains some
endpoint. If not, check whether it intersects a segment.
</p>

<pre style="color: #9c0000;">
vector &lt;<font color="navy">int</font>&gt; countAreas(vector &lt;string&gt; rectangles, vector &lt;string&gt; segments) {

  <font color="darkgreen">// parse the rectangles</font>
  vector&lt;Point&gt; corners = parse(rectangles);
  vector&lt;Rectangle&gt; R;
  <font color="navy">for</font> (<font color="navy">unsigned</font> i=<font color="red">0</font>; i&lt;corners.size(); i+=<font color="red">2</font>)
    R.push_back( Rectangle( corners[i], corners[i+<font color="red">1</font>] ));

  <font color="darkgreen">// parse the segment endpoints</font>
  vector&lt;Point&gt; endpoints = parse(segments);

  <font color="navy">int</font> area1 = <font color="red">0</font>, area2 = <font color="red">0</font>;

  <font color="navy">for</font> (<font color="navy">unsigned</font> i=<font color="red">0</font>; i&lt;R.size(); i++) {
    <font color="darkgreen">// check whether this rectangle contains an endpoint</font>
    <font color="navy">bool</font> firstType = <font color="red">false</font>;
    <font color="navy">for</font> (<font color="navy">unsigned</font> j=<font color="red">0</font>; j&lt;endpoints.size(); j++)
      <font color="navy">if</font> (R[i].containsPoint( endpoints[j] ))
        firstType = <font color="red">true</font>;

    <font color="navy">if</font> (firstType) {
      area1 += R[i].area();
      <font color="navy">continue</font>;
    }

    <font color="darkgreen">// check whether this rectangle is intersected by a segment</font>
    <font color="navy">bool</font> secondType = <font color="red">false</font>;
    <font color="navy">for</font> (<font color="navy">unsigned</font> j=<font color="red">0</font>; j&lt;endpoints.size(); j+=<font color="red">2</font>)
      <font color="navy">if</font> (R[i].intersectsSegment( Segment(endpoints[j],endpoints[j+<font color="red">1</font>]) ))
        secondType = <font color="red">true</font>;

    <font color="navy">if</font> (secondType) area2 += R[i].area();
  }

  <font color="darkgreen">// report the result</font>
  vector &lt;<font color="navy">int</font>&gt; result;
  result.push_back(area1);
  result.push_back(area2);
  <font color="navy">return</font> result;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7521&amp;rd=10791" name="7521">RoadCrossing</a></b> </font> <A href="Javascript:openProblemRating(7521)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516070" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      161 / 378 (42.59%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      61 / 161 (37.89%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>msg555</b> for 387.13 points (16 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      275.13 (for 61 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<h4>Observation 1: Gap length</h4>

<p>
The movement of all pedestrians that cross the street is continuous.
Observe a gap between two pedestrians. If their speeds are not
equal, its length might be increasing or decreasing, but all 
the time the change is continuous. Even if two pedestrians
meet (and the slower one is overtaken by a faster one), the gaps
around them still change continuosly.
</p>

<p>
We are looking for the firs moment when the width of one of the gaps becomes
equal to or larger than <b>carWidth</b>.
Well, but we just noticed that the lengths of gaps change continuously. 
A large gap can not appear by miracle, it has to grow from a smaller gap.
If there is a gap <b>carWidth+47</b> wide, there had to be a gap
<b>carWidth+46</b> wide earlier. 
</p>

<p>
And thus at the <em>very first</em> good moment the length of the good gap will
surely be exactly equal to <b>carWidth</b>.
</p>

<p>
(Another way of looking at this: 
Imagine that you are the driver. You sit in the car and watch the sizes of all the
gaps change and change -- until one of them grows exactly to 
<b>carWidth</b>. At that moment you start the car and away you go.)
</p>

<p>
The only exception to this rule is the situation when there is a large 
enough gap right at the moment when the car arrives.
</p>

<h4>Observation 2: A pair of pedestrians</h4>

<p>
Observation 2: If there is a gap <b>carWidth</b> long, it has to be 
a gap between two of the pedestrians. (Or between a pedestrian and the side 
of the road where they enter. To handle this, we will add a new pedestrian
that always stands there.)
</p>

<h4>Transforming the input</h4>

<p>
We will now convert the pedestrians into a more suitable format. 
First, suppose that the car arrives at time 0. (Subtract <b>carArrival</b> from
the given delays.)
</p>

<p>
Now, we will imagine that the pedestrians move all the time. Not only when they
cross the street, but also before and after that. The position of any pedestrian
at any moment can be given as one real number: The start of the road is zero,
the end is <b>roadWidth</b>. A negative position corresponds to a pedestrian
that did not enter the street yet.
</p>

<p>
The position of pedestrian X at time 0 can be easily computed as -delay[X]*speed[X]
</p>

<p>
The advantage of this representation (position+speed instead of delay+speed)
is that we can also use it to represent a pedestrian that stands at any place.
Also, it will be more clear when we'll compute the pedestrians' positions
at other times than 0. 
</p>

<h4>Observation 3: A set of candidates</h4>

<p>
For two pedestrians with different speeds, there are exactly two moments when
they are exactly <b>carWidth</b> apart.
</p>

<p>
Pedestrians with equal speeds are not interesting. The gap between them does
not change, and thus it can not cause the event we are looking for.
</p>

<p>
Of course, at some of these moments the car will not be able to cross:
Some of the events occur when the two pedestrians are not on the road,
and in some cases there may be other pedestrians that block the gap.
</p>

<p>
What is important is to realize that this doesn't cause any problems.
We don't care that some of these moments are bad -- all we need to know
is that one of them has to be the moment we are looking for.
</p>

<p>
For N pedestrians we get at most N(N-1) moments that we need to check.
(And also the moment time=0.)
As there are at most 50 pedestrians, we can check all these moments, and 
pick the first one when the car actually can drive across.
</p>

<h4>Checking a given moment</h4>

<p>
Suppose that we picked a time T. Now, for each pedestrial compute 
his position at time T. Throw away those that are not on the road.
Sort them, and check the gaps between them. If one of them is large
enough, the car can pass, otherwise it can't.
</p>

<h4>Implementation</h4>

<p>
To avoid problems with floating point numbers, we will use fractions to
represent the times and positions.
</p>

<pre style="color: #9c0000;">
<font color="navy">typedef</font> pair&lt;<font color="navy">long</font> <font color="navy">long</font>, <font color="navy">long</font> <font color="navy">long</font>&gt; fraction;

<font color="navy">bool</font> isLess(<font color="navy">const</font> fraction &amp;A, <font color="navy">const</font> fraction &amp;B) { <font color="navy">return</font> A.first*B.second &lt; A.second*B.first; }
<font color="navy">bool</font> isLessEqual(<font color="navy">const</font> fraction &amp;A, <font color="navy">const</font> fraction &amp;B) { <font color="navy">return</font> A.first*B.second &lt;= A.second*B.first; }
</pre>

<p>
For two pedestrians P1, P2 compute the moment when P1 will be exactly <b>carWidth</b> to the left of P2:
</p>

<pre style="color: #9c0000;">
fraction process(<font color="navy">int</font> p1, <font color="navy">int</font> s1, <font color="navy">int</font> p2, <font color="navy">int</font> s2, <font color="navy">int</font> carWidth) {
  <font color="navy">int</font> d = p2-p1;
  <font color="navy">if</font> (d == cw) <font color="navy">return</font> fraction(<font color="red">0</font>,<font color="red">1</font>); <font color="darkgreen">// now</font>
  <font color="navy">if</font> (s1 == s2) <font color="navy">return</font> fraction(-<font color="red">1</font>,<font color="red">1</font>); <font color="darkgreen">// never</font>
  <font color="navy">int</font> missing = carWidth - d;
  <font color="navy">int</font> step = s2 - s1;
  <font color="navy">if</font> (step &gt; <font color="red">0</font>) <font color="navy">return</font> fraction(missing,step);
  <font color="navy">return</font> fraction(-missing,-step); <font color="darkgreen">// we want a positive denumerator</font>
}
</pre>

<p>
For a pedestrian and a time, compute his position at that time:
</p>

<pre style="color: #9c0000;">
fraction getPosition(<font color="navy">int</font> p, <font color="navy">int</font> s, fraction time) {
  <font color="navy">long</font> <font color="navy">long</font> num = p*time.second + s*time.first;
  <font color="navy">long</font> <font color="navy">long</font> denum = time.second;
  <font color="navy">long</font> <font color="navy">long</font> d = __gcd(num,denum);
  <font color="navy">return</font> fraction (num/d,denum/d);
}
</pre>

<p>
For two positions, check whether the gap between them is large enough for the car:
</p>

<pre style="color: #9c0000;">
<font color="navy">bool</font> goodGap(fraction A, fraction B, <font color="navy">int</font> gap) {
  fraction C(A.first + gap*A.second, A.second);
  <font color="navy">return</font> isLessEqual(C,B);
}
</pre>

<p>
For a given moment, compute all positions and check whether the car can pass at that moment:
</p>

<pre style="color: #9c0000;">
<font color="navy">bool</font> check(fraction time, vector&lt;<font color="navy">int</font>&gt; &amp;pos, vector&lt;<font color="navy">int</font>&gt; &amp;speed, <font color="navy">int</font> roadWidth, <font color="navy">int</font> carWidth) {
  vector&lt;fraction&gt; pedestrians;

  fraction LEFT(<font color="red">0</font>,<font color="red">1</font>), RIGHT(roadWidth,<font color="red">1</font>);
  pedestrians.push_back(LEFT); pedestrians.push_back(RIGHT);

  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;<font color="navy">int</font>(pos.size()); i++) {
    fraction now = getPosition(pos[i],speed[i],time);
    <font color="navy">if</font> (isLessEqual(LEFT,now) &amp;&amp; isLessEqual(now,RIGHT))
      pedestrians.push_back(now);
  }
  sort( pedestrians.begin(), pedestrians.end(), isLess );

  <font color="navy">int</font> K = pedestrians.size();
  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">1</font>; i&lt;K; i++)
    <font color="navy">if</font> (goodGap(pedestrians[i-<font color="red">1</font>],pedestrians[i],carWidth))
      <font color="navy">return</font> <font color="red">true</font>;
  <font color="navy">return</font> <font color="red">false</font>;
}
</pre>

<p>
And finally the main function: generate all the candidate moments, and find the first one that actually works.
</p>

<pre style="color: #9c0000;">
<font color="#9c0000">#define FOREACH(it,c) </font><font color="navy">for</font><font color="#9c0000">(__typeof((c).begin()) it=(c).begin();it!=(c).end();++it)</font>

<font color="navy">double</font> passTime(vector &lt;string&gt; pedestrians, <font color="navy">int</font> roadWidth, <font color="navy">int</font> carWidth, <font color="navy">int</font> carArrival) {
  <font color="navy">int</font> N = pedestrians.size();
  vector&lt;<font color="navy">int</font>&gt; delay(N);
  vector&lt;<font color="navy">int</font>&gt; speed(N);
  vector&lt;<font color="navy">int</font>&gt; position(N);
  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) {
    stringstream SS(pedestrians[i]);
    SS &gt;&gt; delay[i] &gt;&gt; speed[i];
    delay[i] -= carArrival;
    position[i] = - delay[i] * speed[i];
  }

  vector&lt;fraction&gt; candidates;
  candidates.push_back( fraction(<font color="red">0</font>,<font color="red">1</font>) );
  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) {
    fraction F;
    <font color="navy">for</font> (<font color="navy">int</font> j=<font color="red">0</font>; j&lt;i; j++) {
      F = process(position[i],speed[i],position[j],speed[j],carWidth);
      <font color="navy">if</font> (F.first &gt;= <font color="red">0</font>) candidates.push_back(F);
      F = process(position[j],speed[j],position[i],speed[i],carWidth);
      <font color="navy">if</font> (F.first &gt;= <font color="red">0</font>) candidates.push_back(F);
    }
    F = process(<font color="red">0</font>,<font color="red">0</font>,position[i],speed[i],carWidth);
    <font color="navy">if</font> (F.first &gt;= <font color="red">0</font>) candidates.push_back(F);
  }
  sort( candidates.begin(), candidates.end(), isLess );

  FOREACH(it,candidates)
    <font color="navy">if</font> (check(*it,position,speed,roadWidth,carWidth))
      <font color="navy">return</font> carArrival + (<font color="red">1.0</font> * it-&gt;first / it-&gt;second);
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6649&amp;rd=10791" name="6649">SpiralConstruction</a></b>
</font>
<A href="Javascript:openProblemRating(6649)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516070" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      28 / 378 (7.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 28 (46.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SkidanovAlex</b> for 706.02 points (20 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      523.45 (for 13 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was actually simpler than it looks at the first sight.
</p>

<p>
Imagine that we are drawing a spiral according to the given rules.
We already have several segments and want to add another one.
</p>

<p>
The key thing to note is that we don't need to know the actual 
order in which we connected the points that are already on the spiral.
All information we actually need:
</p>

<ul>
<li>The set of points we already used.
<li>The last two points used, in order.
</ul>

<p>
Clearly this is enough to check that we don't use the same point twice.
Condition 4 implies condition 1 -- if the halfline doesn't intersect or touch anything,
then the segment can't intersect anything as well. Thus we can ignore condition 1.
To check condition 3 the last two points are enough.
And finally, condition 4 can be rephrased as follows:
</p>

<p>
Condition 4 rephrased: The line segment between the last point used and the new
point must lie on the boundary of the convex hull of the spiral.
</p>

<p>
Or equivalently:
</p>

<p>
Condition 4 rephrased again: All the points we already used must lie to the left
of the line given by the last point used and the point we want to add
(or on the line, but the new point and the old point must be on opposite
sides of the last point used).
</p>

<p>
Now it should be clear that to check whether this condition holds it is
enough to have the information described above.
</p>

<h4>Algorithm</h4>

<p>
We will write a recursive function that tries to extend the spiral, while 
keeping the information we need: the set of points used, and the indices
of the last two points.
The function will be memoized to avoid computing the same thing twice.
We will use a bitset to represent the set of used points.
</p>

<p>
There are at most 2^15 * 16^2 = roughly 8 million possible states, thus
this approach should run in time. (In reality, most of the states won't
even be reachable, the spiral-building rules are pretty restrictive.)
</p>

<h4>Implementation</h4>

<p>
We will write a helper function:
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// c must be on the left side of ab, OR on the half-line reverse to ba</font>
<font color="navy">bool</font> correctTurn(<font color="navy">int</font> a, <font color="navy">int</font> b, <font color="navy">int</font> c) {
  <font color="navy">int</font> ux = X[b]-X[a], uy=Y[b]-Y[a];
  <font color="navy">int</font> vx = X[c]-X[b], vy=Y[c]-Y[b];
  <font color="navy">int</font> crossProduct = ux*vy - vx*uy;
  <font color="navy">int</font> dotProduct = ux*vx + uy*vy;
  <font color="navy">if</font> (crossProduct != <font color="red">0</font>) <font color="navy">return</font> (crossProduct &gt; <font color="red">0</font>);
  <font color="navy">return</font> dotProduct &gt;= <font color="red">0</font>;
}
</pre>

<p>
Now, the funny thing is that this function does all we need. We can use it to check whether the 
new point turns the spiral in the required direction, and also to check whether all other points
lie on the left side of the new edge.
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> N;
<font color="navy">int</font> X[<font color="red">52</font>], Y[<font color="red">52</font>];

<font color="navy">int</font> memo[<font color="red">33000</font>][<font color="red">16</font>][<font color="red">16</font>];

<font color="navy">int</font> solve(<font color="navy">int</font> used, <font color="navy">int</font> last, <font color="navy">int</font> prev) {
  <font color="navy">int</font> &amp;res = memo[used][last][prev];
  <font color="navy">if</font> (res &gt;= <font color="red">0</font>) <font color="navy">return</font> res;
  res = <font color="red">0</font>;
  <font color="navy">for</font> (<font color="navy">int</font> next=<font color="red">0</font>; next&lt;N; next++) {
    <font color="navy">if</font> (used &amp; (<font color="red">1</font>&lt;&lt;next)) <font color="navy">continue</font>;
    <font color="navy">bool</font> good = <font color="red">true</font>;
    <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N+<font color="red">1</font>; i++)
      <font color="navy">if</font> ( (i==N) || (used &amp; (<font color="red">1</font>&lt;&lt;i)) )
        <font color="navy">if</font> (!correctTurn(i,last,next)) good=<font color="red">false</font>;
    <font color="navy">if</font> (good) res = max(res, <font color="red">1</font>+solve(used | (<font color="red">1</font>&lt;&lt;next), next, last));
  }
  <font color="navy">return</font> res;
}

<font color="navy">class</font> SpiralConstruction {
<font color="navy">public</font>:
  <font color="navy">int</font> longestSpiral(vector &lt;string&gt; points) {
    N = points.size();
    <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) { stringstream SS(points[i]); SS &gt;&gt; X[i] &gt;&gt; Y[i]; }
    X[N]=Y[N]=<font color="red">0</font>;
    memset(memo,-<font color="red">1</font>,<font color="navy">sizeof</font>(memo));

    <font color="navy">int</font> res=<font color="red">0</font>;
    <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) res = max(res, <font color="red">1</font>+solve(<font color="red">1</font>&lt;&lt;i, i, N) );
    <font color="navy">return</font> res;
  }
};
</pre>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
