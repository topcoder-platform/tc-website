<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 176 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 176</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Monday, December 22, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2>

<p>
SRM 176 Division 1 had a total point value of 2000 for all three problems, probably the highest
ever.  The presence of a 600 as well as an 1150 may have daunted some coders, but certainly
not <b>bladerunner</b>, who finished with a score of 1650, almost making it into the top ten 
highest totals ever.  <b>Tomek</b>, finishing in second, continues 
to increase his rating, now to 3506. <b>Eryx</b>, a fairly new coder, extends his flawless record
to three SRMs.  Nothing too unusual in Divison 2, <b>acki2003</b> took first, not far behind were
<b>tp1</b> and <b>slanc</b>, two first time coders whose performance earned them yellow ratings.
</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>RGBColor</b>
</font>
<A href="Javascript:openProblemRating(2251)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      169 / 183 (92.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      112 / 169 (66.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Tak-kun</b> for 242.77 points (4 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      182.41 (for 112 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>If you've ever messed around with any cool graphics programs (like Photoshop) you may be
familiar with the inverse of colors.  You may also be aware that when you try to take the
inverse of grey, you get grey, which isn't so hot when you're trying to make the grey stand out.
This problem attempts to fix that with a simple check for shades of grey.  All that was required
for this problem was to create the color's complement in the standard way, check to see if all
components were too close to their corresponding components in the original color, 
and if so, return an alternate complement.</p>
<pre>
vector&lt;int&gt; getComplement(vector&lt;int&gt; v) {
    vector&lt;int&gt; ret(3);
    bool grey=true;
    for (int i=0;i&lt;3;i++) {
        ret[i]=255-v[i];
        if (ret[i]-v[i]&gt;32 || ret[i]-v[i]&lt;-32)
            grey=false;
    }
    if (grey)
        for (int i=0;i&lt;3;i++)
            ret[i]=(v[i]+128)%256;
    return ret;
};
</pre>
</p>

<font size="+2">
<b>Matching</b>
</font>
<A href="Javascript:openProblemRating(2249)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      142 / 183 (77.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      130 / 142 (91.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>thegreensniper</b> for 479.66 points (5 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      345.80 (for 130 correct submissions)
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
      152 / 152 (100.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      146 / 152 (96.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ZorbaTHut</b> for 246.94 points (3 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      219.25 (for 146 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>Based on a particularly fun card game, the task here was to determine the characteristics of
the third card in a set based on the characteristics of the first two.  At first glance it
appears that this problem should be solved with a series of if-else clauses, but there is a more
elegant solution.  Each characteristic on each card is one of three different values.  Each of 
these values can be numbered 0, 1, or 2, so the shape characteristic of a card, for example, would
be 0, 1, or 2, instead of "SQUIGGLE", "DIAMOND", or "CIRCLE".
Since a set requires all three cards to match or for none of the cards to match for a given
characteristic, the only 
combinations of states for a set are {0,0,0}, {1,1,1}, {2,2,2}, or {0,1,2}.  All three values of
each of these
combinations add to a multiple of three, so given the first two states we can find the third
by determining which state will make the sum of all three a multiple of three.  This makes for 
much cleaner code:</p>
<pre>
vector&lt;string&gt; findMatch(vector&lt;string&gt; a,vector&lt;string&gt; b) {
    string state[4][3]={{"CIRCLE","SQUIGGLE","DIAMOND"},
                        {"RED","GREEN","BLUE"},
                        {"SOLID","STRIPED","EMPTY"},
                        {"ONE","TWO","THREE"}         };
    vector&lt;string&gt; ret(4);
    for (int i=0;i&lt;4;i++) {
        int val=0;
        for (int j=0;j&lt;3;j++) {
            if (a[i]==state[i][j]) val+=j;
            if (b[i]==state[i][j]) val+=j;
        }
        ret[i]=state[i][(9-val)%3];
    }
    return ret;
};
</pre>
<p>For each characteristic, add together the values (0,1, or 2) of the states of the two cards,
then find out what state will add to that to get a multiple of three.  (-n)%3 will give a value
that adds to n to make a multiple of three, but when using the % (modulus) operator on a 
negative number, you get a negative number back.  This is the purpose of (9-val)%3, since 9 is
a multiple of 3 already it will ensure that (9-val)%3 is a positive value that, when added to
val, is a multiple of three.</p>
</p>

<font size="+2">
<b>Harmony</b>
</font>
<A href="Javascript:openProblemRating(2015)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      35 / 183 (19.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      13 / 35 (37.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>robert1900</b> for 700.79 points (16 mins 8 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      488.19 (for 13 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>This problem offered two obstacles, reducing fractions and tiebreaking.  Given two frequencies,
determining how harmonic they are when played together is done by determining the lowest possible
integer that can be used in the denominator when the ratio is expressed as a fraction.  This means
the fraction must be reduced, and once it is reduced we choose the smaller of the two numbers 
(since it doesn't matter if the ratio is a:b or b:a).  Reducing a fraction is a simple matter of
dividing both numbers by the greatest common denominator of the two numbers.  The GCD is found
easily by using Euclid's GCD algorithm, which can be implemented as follows:</p>
<pre>
int gcd(int a,int b) {
    if (b==0) return a;
    return gcd(b,a%b);
};
</pre>
<p>Once we have the GCD of two numbers, we divide the smaller of the two numbers by it and we
have the lowest number that can be used in the denominator of the fraction representing the 
ratio of those two numbers.  All that was required of this problem was to loop through all
combinations of three frequencies (this is O(n<sup>3</sup>), which isn't bad for an input size
of 50), and keep track of the best chord.  The following C++ code does this and figures all
tiebreakers by exploiting the STL comparators for vectors as much as possible.</p>
<pre>
vector&lt;int&gt; mostHarmonious(vector&lt;int&gt; v) {
    sort(v.begin(),v.end());
    vector&lt;int&gt;bestFreq(3);
    vector&lt;int&gt;bestDen(3,1000000);
    for (int i=0  ;i&lt;v.size();i++)
    for (int j=i+1;j&lt;v.size();j++)
    for (int k=j+1;k&lt;v.size();k++) {
        vector&lt;int&gt;curFreq(3);
        vector&lt;int&gt;curDen(3);
        curFreq[0]=v[i];
        curFreq[1]=v[j];
        curFreq[2]=v[k];
        curDen[0]=v[i]/gcd(v[i],v[j]);
        curDen[1]=v[i]/gcd(v[i],v[k]);
        curDen[2]=v[j]/gcd(v[j],v[k]);
        sort(curDen.begin(),curDen.end());
        reverse(curDen.begin(),curDen.end());
        if (curDen&lt;bestDen || (curDen==bestDen &amp;&amp; curFreq&lt;bestFreq)) {
            bestFreq=curFreq;
            bestDen=curDen;
        }
    }
    return bestFreq;
};
</pre>
<p>To compare two chords, first the denominators of each chord are compared, greatest to 
smallest, and the first chord to have a smaller denominator is considered more harmonic.  This is why
the <i>curDen</i> and <i>bestDen</i> are reversed, the &lt; operator for vectors will now do
all the comparing we need.  Similarly, the frequencies are sorted in increasing order and the
&lt; operator again does all of the work for us.</p>
</p>

<font size="+2">
<b>Deranged</b>
</font>
<A href="Javascript:openProblemRating(2013)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      38 / 152 (25.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      37 / 38 (97.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 571.27 points (6 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      397.16 (for 37 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>This problem asked for the number of permutations of a set of numbers in which none of the 
elements remained in their original position.  This problem is solvable in more than one way.  
One way is memoized recursion, which is the approach that most coders took.  The solution I 
give here, however, uses the principle of inculsion-exclusion.</p>
<img src="/i/srm/srm176_1.gif" width="150" height="150" align="right"/>
<p>The principle of inclusion-exclusion gives a way of counting the number of unique items
in a set of sets of items.  I will give a general idea of how it works, for a more rigorous
explanation, click <a href="http://mathworld.wolfram.com/Inclusion-ExclusionPrinciple.html">
here</a>.  Consider the Venn diagram to the right that shows three circles representing the
primary colors of light and how they add together.  The principle of inclusion-exclusion says
that the total area covered by the three circles will be equal to the sum of the areas of each
circle, minus the area of each intersection of two circles, plus the area of the intersection
of all three circles.  The general idea is to add the intersection of each group of an odd
number of sets, and subtract the intersection of each group of an even number of sets.</p>
<p>Now to apply this to deranged permutations.  First we need to be able to calculate the number
of uniqe permutations of a set S.  If S contains <i>n</i> elements, all of which are unique, then
there exist <i>n</i>! permutations of S.  If S contains <i>n</i> elements and the value <i>v</i>
<sub><i>i</i></sub> occurs <i>k</i><sub><i>i</i></sub> times in S, for <i>i</i>=1 through <i>m</i>,
then the number of distinct permutations of S is given by n!/(<i>k</i><sub>1</sub>!*<i>k</i>
<sub>2</sub>!*...*<i>k</i><sub><i>m</i>-1</sub>!*<i>k</i><sub><i>m</i></sub>!).  If we want to 
calculate the number of permutations of S when a subset of the elements in S are held in their
original positions we can just remove those elements from S and then calculate the 
number of permutations of S with those elements removed.  To calculate the number of permutations 
for which no element remains in its original position, we calculate the number
of permutations of S in which at least one element remains in its original position, and subtract
that number from the total number of permutations of S.  To calculate the number of permutations 
for which at least one element remains in its original position we use the principle of 
inclusion-exclusion.  The following pseudo-code demostrates how to do this, see <b>writer</b>'s 
solution in the practice room for an implementation of this in C++. 
</p>
<pre>
long long numDerangements(S)
	long long ret=numPermutations(S);
	for i from 1 to the number of elements in S
		for each combination, C, of i elements in S
			if (i is odd) ret=ret-numPermutations(S-C);
			if (i is even) ret=ret+numPermutations(S-C);
		end
	end
	return ret;
end
</pre>
</p>

<font size="+2">
<b>Watchtower</b>
</font>
<A href="Javascript:openProblemRating(2014)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1150
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      32 / 152 (21.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      8 / 32 (25.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>WishingBone</b> for 1045.00 points (9 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      740.45 (for 8 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>An 1150 point problem can be quite intimidating, and I was pleased to see several coders solve
this problem, and was even more pleased to see that several solved it without the use of a prewritten
geometry library.  Many coders tried Monte Carlo solutions, and <b>John Dethridge</b> even attempted to
solve the problem using quad trees,
though these approximations were not able to get the accuracy of 1e-5 that the problem
required.  The solution that I outline here involves finding Voronoi polygons, which happen to
be exactly what the problem is asking for.  Given a set
P of <i>n</i> points in a plane, a Voronoi diagram partitions the plane into <i>n</i> regions
(called Voronoi polygons)
such that each region contains one point from P and contains all points in the plane that are
closer to that one point than to any other point in P.</p>
<p>One way to construct the Voronoi diagram is to first create the Delaunay triangulation.  This
method, however, would require significantly more explanation than anyone would like to hear.  If
you want to read about and fool around with a cool applet demonstrating the relationship between
Delaunay triangulations and Voronoi diagrams, click 
<a href="http://www.cs.cornell.edu/Info/People/chew/Delaunay.html">here</a>.</p>
<p>If we restrict the Voronoi diagram such that no region extends outside the square region with
corners at (0,0) and (100,100), then we will have a diagram that will solve our problem.
In this case, each Voronoi edge is either the perpendicular bisector of the line segment between 
some pair of watchtowers, or it is one of the sides of the square region. If you don't realize
that each edge of the Voronoi diagram of a set of points P is the 
perpendicular bisector of the line segment between some pair of points in P, take a moment to
convince yourself of this.</p>
<p>What we need to find the area of each region, however, are the intersection points of the
appropriate lines.  For a watchtower <i>w</i>, find the perpendicular bisectors of the line 
segments between <i>w</i> and every other watchtower.  Call the set of these lines along with the
four lines defining the square region L.  Now find the intersection point
of every pair of lines in L and call this set of points T.  Clearly T contains the set of points
that define the Voronoi polygon around <i>w</i>, which I will now refer to as V.  How do we find
which points in T are also in V? Since each Voronoi
region is convex (if you didn't know this already, take a moment to prove it) no line in L will come
between <i>w</i> and a point in V.  Also, every
point in T that is not in V  will be separated from <i>w</i>
by some line in L.  Knowing this, we can determine if a point in T is also in V by determining 
whether or not there is a line in L that separates it from <i>w</i>.</p>
<p>Determining if two points lie on the same side of a line is easy given the correct representation
of a line.  If we represent lines in the form Ax+By+C=0, then when we plug a point into that 
equation, it will be zero if it lies on the line, positive if it lies on one side, and negative if
it lies on the other side.  If for all equations for lines in L  we plug in <i>w</i> and a point
from T and both results have the same sign then that point in T is also in V.  There are special
cases for this, however.  Since <i>w</i> can lie on certain lines (if it is located on border
of the square region), we need to move <i>w</i> inside the square region slightly for the purposes
of finding the points in V.  Also, since points in V can lie on certain lines in L, we have to 
accept a point as being in V if it yields 0 when plugged into an equation for a line in L.  Since
we are using floating point numbers here, however, we have to actually make sure it is close to 0,
a value of 1e-3 works fine for this.</p>
<p>Now that we have all of the points that make up the Voronoi polygon, we need to arrange them
in either clockwise or counter-clockwise order.  This can be done a number of ways.  I prefer to
sort them
by the slope of the line that passes through them and  an arbitrary point on the interior of the 
polygon.  Once the points are sorted, the area of the polygon they form is given by the
absolute value of
(1/2)(x<sub>1</sub>y<sub>2</sub>-x<sub>2</sub>y<sub>1</sub>+
x<sub>2</sub>y<sub>3</sub>-x<sub>3</sub>y<sub>2</sub>+...+
x<sub>n-1</sub>y<sub>n</sub>-x<sub>n</sub>y<sub>n-1</sub>+
x<sub>n</sub>y<sub>0</sub>-x<sub>0</sub>y<sub>n</sub>).</p>
<img src="/i/srm/srm176_2.gif" width="250" height="250" align="left"/>
<p>The image here should give a general idea of everything I have said.  The red dot is <i>w</i>, 
the three black dots are the other watchtowers.  The black dashed lines are the line segments 
between <i>w</i> and the other towers, the blue lines are the corresponding perpendicular bisectors,
the green points are intersection points in T, and the yellow points are intersections points that
are in T and also in V.  The highlighted region around the red dot is the Voronoi polygon around
<i>w</i>.</p>
<p>Now that we can compute the area of the Voronoi polygon around a given watchtower, just do it
for each watchtower, and sort them by area.  The bulk of the time this algorithm spends is when
it is determining which points are part of the Voronoi polygon.  If there are W watchtowers, then
there are O(W) lines in L and O(W<sup>2</sup>) points in T.  Determining which points are part
of the Voronoi polygons takes O(W<sup>3</sup>) comparisons, and this has to be done for each
watchtower.  So the algorithm i've outlined here is O(W<sup>4</sup>).  Not great, but with an
input size of 20 it runs plenty fast.</p>
</p> 


                        <p>
                        <img src="/i/m/Running_Wild_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=274760"><strong>Running Wild</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>

