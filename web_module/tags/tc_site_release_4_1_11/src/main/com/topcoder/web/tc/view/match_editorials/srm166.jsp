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
<tc-webtag:forumLink forumID="505602" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 166</span><br>Wednesday, October 1, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
This problem set consisted of some nice quality problems.  There was a definite triangle theme
going on in Division Two, with one problem asking whether three lines could make a triangle and
another problem asking for the area of a convex polygon (which is composed of simple triangles).
There were no subtle tricks in any of the problems, as evidenced by the relatively high success
rates all around.
</p>

<p>
The leading scorers in Division One, <b>SnapDragon</b>, <b>ZorbaTHut</b>, and <b>venco</b>,
obtained their scores solely through solving problems far faster than anyone else.
Only a couple of contenders, such as <b>NGBronson</b> and <b>haha</b>, were knocked out of the running
during the Challenge Phase.  <b>NGBronson</b> didn't handle carrying overflow from additions
to the right in <a href="#LongNumber">LongNumber</a> properly, which <b>O_O</b> picked up on
for 50 points.
</p>

<p>
Divison Two was won by <b>snewman</b>, a newcomer.  <b>snewman</b> squeaked ahead of two close runners up,
<b>Dumitru</b> and <b>andreicsibi</b>, by successfully challenging someone else's solution.
</p>
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b>Workshop</b> 
</font> 
<A href="Javascript:openProblemRating(1880)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505602" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      269 / 332 (81.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227 / 269 (84.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Jwalk</b> for 297.05 points (2 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      226.01 (for 227 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There are two parts to solving this problem.  The first is generating triples of values from the list of numbers given.
The second is determining whether a given triple can form a triangle.
</p>
<p>
As the problem states, a triangle can be formed from three line segments if and only if the sum of the lengths of any pair is
greater than the length of the third segment.  That implies three comparisons, but we really only need to make one to determine
if any three segment lengths can form a triangle.
If we sort the lengths in ascending order, then we only really have to compare the sum of the first two to the third.  The third
value is larger than the other two, so it plus any value will always be greater than each of the first two.
</p>
<p>
If we sort the list of numbers we are given, we can easily generate triples that are already sorted.  Thus this problem can be reduced
to the following bit of code (in C++):
</p>
<pre>
int Workshop::pictureFrames(vector&lt;int&gt; pieces)
{
    int result = 0;

    sort(pieces.begin(), pieces.end());
    for(vector&lt;int&gt;::const_iterator i = pieces.begin(); i != pieces.end(); i++) {
        for(vector&lt;int&gt;::const_iterator j = i + 1; j != pieces.end(); j++) {
            for(vector&lt;int&gt;::const_iterator k = j + 1; k != pieces.end(); k++) {
                if(*i + *j &gt; *k) {
                    result++;
                }
            }
        }
    }
    return result;
}
</pre>

<font size="+2"> 
<b>BinaryCardinality</b> 
</font> 
<A href="Javascript:openProblemRating(1519)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505602" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      217 / 332 (65.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      181 / 217 (83.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>snewman</b> for 489.05 points (4 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      354.94 (for 181 correct submissions) 
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
      198 / 201 (98.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192 / 198 (96.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sjelkjd</b> for 249.18 points (1 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      225.89 (for 192 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There are many ways to solve this problem.  First, we need a way of computing the cardinality of a number.
There are more ways of doing this than can be discussed (some good, some bad, some downright crazy), but here are a few ideas.
First, we can use bitwise operators to determine whether or not any particular bit is set.  So we could simply do:
</p>

<pre>
    for(int i = 0; i &lt; 20; i++) {
        if(value &amp; (1 &lt;&lt; i)) {
            cardinality++;
        }
    }
</pre>

<p>
Or, we could use some mechanism in our language to convert the value to a string representation in base 2, and then count how
many characters in the string are <code>'1'</code>.  Another method is to repeatedly check if the value is odd and divide by 2,
until it is 0.  Each time the value is odd indicates a 1 bit.  That is:
</p>

<pre>
    while(value) {
        if(value &amp; 1) {
            cardinality++;
        }
        value &gt;&gt;= 1;
    }
</pre>

<p>
Next is the problem of sorting, which has probably as many methods.  However, the best method is <i>always</i> to use
the libraries available with your language of choice.  Use an existing sort implementation that allows you to override
the comparison function.  Then just implement the comparison function so that it compares cardinality first and then
value next if cardinality is equal.  For example, in C++:
</p>

<pre>
bool cmp(int x, int y)
{
    if(cardinality(x) == cardinality(y)) {
        return x &lt; y;
    }
    return cardinality(x) &lt; cardinality(y);
}

vector&lt;int&gt; BinaryCardinality::arrange(vector&lt;int&gt; numbers)
{
    sort(numbers.begin(), numbers.end(), cmp);
    return numbers;
}
</pre>

<font size="+2"> 
<b>ConvexPolygon</b> 
</font> 
<A href="Javascript:openProblemRating(1660)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505602" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 332 (38.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      102 / 128 (79.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>snewman</b> for 890.53 points (2 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      651.01 (for 102 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The trick to computing the area of a convex polygon is to note that it is easy to subdivide a convex polygon into non-overlapping
triangles.  There are a number of ways to do this, but the most common and simplest to implement involves the cross product.
<a href="http://mathworld.com">MathWorld</a> gives a general formula for calculating the area of a convex polygon in two dimensions
in <a href="http://mathworld.wolfram.com/PolygonArea.html">this article</a>.
</p>

<p>
The method consists of iterating over all adjacent pairs of vertices.  For each pair 
<i>(x<sub>i</sub>, y<sub>i</sub>), (x<sub>j</sub>, y<sub>j</sub>)</i> we compute
<i>x<sub>i</sub>y<sub>j</sub> - x<sub>j</sub>y<sub>i</sub></i>.
One half the absolute value of the sum of these values over all pairs gives the area of the polygon.
</p>

<font size="+2"> 
<b>CircleBugs</b> 
</font> 
<A href="Javascript:openProblemRating(1555)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505602" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 201 (63.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 128 (67.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 622.79 points (5 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      414.42 (for 87 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The primary obstacle in this problem is making it efficient enough.  It is easy to generate each formation in the series.
However, without some cleverness, it is too costly to determine whether a particular formation is the same as any of the formations
in a large set of previous formations.
</p>

<p>
The problem is that there are multiple ways to represent what is really the same formation.  A formation can be rotated or reversed.
What we need is some way to transform any representation into a particular, canonical form.  One method is to generate all the equivalent
representations to a particular representation, and choose the one that is lexicographically minimal.  Then we only need to store one
string in our history for each formation generated, and thus only have to compare the <i>n</i><sup>th</sup> formation to <i>n - 1</i>
strings to see if it is a repeat.
</p>

<a name="LongNumber">
<font size="+2"> 
<b>LongNumber</b> 
</font> </a>
<A href="Javascript:openProblemRating(1863)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505602" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      34 / 201 (16.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 34 (55.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 629.17 points (20 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      428.62 (for 19 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Problems of this type appear every now and then in Division One.
The problem consists of determining the <i>k</i><sup>th</sup> value in a simple, generated sequence, where
<i>k</i> may be so large as to make linear search infeasible.
</p>

<p>
In this case, we have two sequences to search in.  Fortunately, the sequences can be approached in more or less the same way.
We can easily figure out the location of certain values.  Let us examine the first sequence, consisting of consecutive integers
concatenated together.
</p>

<p>
In this first sequence, we need a way of counting how many digits are taken up by the concatenation of a range of consecutive
integers.  We can do this by grouping integers by length.  There are 9 single-digit integers, so they take up the first
<tt>10 * 1</tt> positions.  Then there are 90 two-digit integers, so they take up the next <tt>90 * 2</tt> positions.
Then there are 900 three-digit integers, and so on.  Given an arbitrary position <i>k</i>, we can determine the length of the
integer that contains the digit referenced by <i>k</i> by successively subtracting 9, 90, 900, etc. from <i>k</i> until doing
so would make <i>k</i> negative.
</p>

<p>
At this point we know the length <i>x</i> of the integer that contains the digit referenced by <i>k</i>, as it is the number of subtractions
we were able to make (plus 1).  We also know which position <i>m</i> refers to where the value <i>10^x</i> begins.
If we divide <i>k - m</i> by <i>x</i>, we get the integer that contains the digit referenced by <i>k</i>.  If we take the remainder of
<i>k - m</i> divided by <i>x</i>, we get the digit (counting from the left).
</p>

<p>
This seems easy enough for the sequence of consecutive integers.  But how do we do the squares?
We do it by generalizing the first case a bit.
The first method works because we know how many consecutive numbers there are of any given length.
The same can be done with squares.  Values from <tt>1</tt> to the floor of the square root of <tt>10</tt> (which is <tt>3</tt>) have
single-digit squares.  Values above that that are less than the square root of <tt>100</tt> have two-digit squares.  Values above that
that are less than the square root of <tt>1000</tt> have three-digit squares.  And so on.  The same method as above can be applied to
find the square root (from which the value we want obviously follows) of the value that <i>k</i> points to.
</p>

<p>
Once we have a method for finding the <i>k<sup>th</sup></i> digit of each sequence, we can find the <i>k<sup>th</sup></i> digit of
the sum.  This will obviously be either the sum of the corresponding digits of the two sequences, or that sum plus one (due to
overflow from the right).  We are not finished until we have a method of determining whether or not there is overflow from the right.
</p>

<p>
To check for overflow from the right, we find the sum for the digits corresponding to <i>k + 1</i>.  If this sum is less than 9, there
cannot be overflow.  If this sum is greater than 9, there must be overflow.  If the sum is 9, then we must repeat the process to see if
there is overflow to the right of <i>k + 1</i> to cause overflow in <i>k</i>.  This is a simple enough function to implement once
we have the ability of choosing arbitrary digits from the two sequences we are adding.
</p>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
