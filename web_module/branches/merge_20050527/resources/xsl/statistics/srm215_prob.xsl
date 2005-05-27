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

<title>Single Round Match 215 Statistics at TopCoder</title>

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
							 <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 215</font></td>
							 <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
						 </tr>

						 <tr valign="middle">
							 <td class="bodyText">Saturday, October 16, 2004</td>
							 <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
						 </tr>
					 </table>
<!--end contextual links-->


<h2>Match summary</h2>
<p>
In division 1, coders had a pretty easy time with the easy and medium problems,
but no one was able to get a tricky hard problem.  As a result, the top scores
were quite close going into the challenge phase.  Not surprisingly, the results
ended up being determined by challenges, and wleite was able to get 4 of them,
to take first.  kirkifer took second with 5 challenges, and AdrianKeugel was a
distant third, with only one challenge.  In division 2, coders had an easier
time, as 40 coders solved the hard problem.  35C4P3 took first by a respectable
margin, followed by first timer Rud0lf and Artist_ in second and third,
respectively.
</p>
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1741&amp;rd=5861" name="1741">DivisorDigits</a></b>
</font>
<A href="Javascript:openProblemRating(1741)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      216 / 226 (95.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      194 / 216 (89.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Sleeve</b> for 249.19 points (1 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      224.89 (for 194 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The key to this problem is to first represent the input integer as a string.
Once that is complete, loop through each character and test for divisibility.
Just be sure not to try 0, since your divisibility check may throw an exception.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2884&amp;rd=5861" name="2884">Mailbox</a></b>
</font>
<A href="Javascript:openProblemRating(2884)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      196 / 226 (86.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      175 / 196 (89.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Sleeve</b> for 486.96 points (4 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      378.67 (for 175 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
For each address, we need to check and see if that address can be formed from
the letters in the collection.  There are a number of ways to do this.  Perhaps
the simplest is to write two nested loops, keeping track of which letters have
been used from the collection:
<pre>
    bool[] used = new bool[collection.size()];
    for(int i = 0; i&lt;address.size(); i++){
        bool found = false;
        for(int j = 0; j&lt;collection.size(); j++){
            if(!used[j] &amp;&amp; collection[j] == address[i]){
                used[j] = true;
                found = true;
                break;
            }
        }
        if(!found){
            ret++;
            break;
        }
    }
</pre>
Another way to solve this, which has a faster runtime (unnecessary in this
case), is to sort both the characters in collection and the characters in
address:

<pre>
    sort(collection);
    sort(address);
    int ptr = 0;
    for(int i = 0; i &lt; collection.size(); i++){
        if(ptr &lt; address.size() &amp;&amp; collection[i] == address[ptr]){
            ptr++;
        }
    }
    if(ptr!=address.size())ret++;
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3037&amp;rd=5861" name="3037">Thesaurus</a></b>
</font>
<A href="Javascript:openProblemRating(3037)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      65 / 226 (28.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 65 (61.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Javaholic</b> for 801.56 points (14 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      539.26 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>

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
      136 / 169 (80.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      110 / 136 (80.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Krzysan</b> for 463.44 points (8 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      332.10 (for 110 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The basic algorithm for this problem is relatively straightforward.  The basic
idea is to merge entries in the thesaurus until no more entries can be merged:
<pre>
    bool merged = true
    while(merged){
        merged = false
        for each pair of entries (i,j){
            if(entries i and j share 2 or more words){
                merge entries i and j
                merge = true
            }
        }
    }
</pre>
The details of the implementation, however, leave a lot of room for variation.
There are a number of different ways to represent the entries.  You can use
arrays of strings, or more complicated data structures.  If you use your
language's built in set data structure, you can use the intersection method and
the union method, which make it easy to determine if two entries share 2 or more
elements, and also easy to merge two entries.  Using arrays to represent the
entries is probably a bit more work, but its not too hard to code.<br/><br/>
In the end, you need to sort words in the entries, and then sort the entries,
but this is just standard sorting, with no bells or whistles.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2960&amp;rd=5861" name="2960">Diving</a></b>
</font>
<A href="Javascript:openProblemRating(2960)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      162 / 169 (95.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      118 / 162 (72.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gladius</b> for 233.67 points (7 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      175.96 (for 118 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
First, you should parse the input by finding the 4 ratings that are known.
While you can use floating point numbers, you have to be careful, and its safer
to just stick with integers so that you end up storing the 4 ratings as integral
numbers of 10<sup>th</sup>s.  For example, you parse 4.5 as 45 10<sup>th</sup>s.
Similarly, you store the degree of difficulty and the needed score as integral
values.  By storing the degree of difficulty and ratings in 10<sup>th</sup>s,
and needed in 100<sup>th</sup>s, the multiplication works out the same so that
multiplying the ratings by the degree of difficulty can be directly compared to
needed.<br/><br/>
Once you have the input parsed, you can either iterate through all possible
ratings for the "?.?", and find the smallest one that works, or you work out the
different cases.  Assuming you don't iterate, there are three different cases:
<ul>
    <li>?.? is the lowest rating</li>
    <li>?.? is a middle rating</li>
    <li>?.? is the highest rating</li>
</ul>
If ?.? is the lowest rating, then the final score is the sum of the 3 lowest
given ratings times the degree of difficulty.  If this score is high enough,
return "0.0".  <br/><br/>

If ?.? is a middle rating, then we discard the highest and lowest
given ratings and find the sum of the remaining two given ratings, sum.  So, the
final score is <tt>degree of difficulty * (sum + x)</tt> where x is the value of
the ?.?.  Since this has to be greater than or equal to need, we have:<br/>
<tt>degree of difficulty * (sum + x) &gt;= need</tt>
&#160;&#160;&#160;&#160;&#160;-&gt;<br/>
<tt>x &gt;= (need - degree of difficulty*sum)/(degree of difficulty)</tt><br/>
So, we pick the smallest valid x that satisfies this inequality, and make sure
that it is not greater than the largest given rating (which was
discarded).<br/><br/>

Finally, there is the case where the ?.? is the highest score.  In this case,
the final score is the sum of the 3 highest given ratings times the degree of
difficulty.  If this is high enough, then return the value of the highest given
rating.  <br/><br/>

If none of these three cases works, return "-1.0".

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2867&amp;rd=5861" name="2867">ShortCut</a></b>
</font>
<A href="Javascript:openProblemRating(2867)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 169 (3.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 6 (0.00%)
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

Clearly, there is no way to evaluate all possible offroad paths, so we need to
figure out what sort of cases warrant going offroad.  First off, let's look at
the general case where we start at some point on one road, and travel offroad to
some part of another road, and then travel to the endpoint of the destination
road.  Assume that our origin point is fixed, and we want to figure out the
optimal point to head for on the destination road.  Also, assume that the
optimal point is somewhere in the middle of the destination road, not one of its
endpoints.</p>
<center><img src="/i/srm/srm215_1.jpg" border="0" /></center>
<p>
In this case, the time required to travel from the start to finish is:<br/>
<tt>2*X + B - Y = 2*sqrt(A*A+Y*Y)+B-Y</tt><br/>
Since we want to minimize this value, we can take the derivative of this
formula with respect to Y, and want the derivative to be equal to 0 (to find the
min):<br/>
<tt>2*Y/sqrt(A*A+Y*Y)-1 = 0<br/>
    2*Y = sqrt(A*A+Y*Y)<br/>
    4*Y*Y = A*A + Y*Y<br/>
    3*Y*Y = A*A<br/>
    Y = A/sqrt(3)<br/>
</tt><br/>
Perhaps it intuitively obvious, but this confirms the value of B is insignificant, so long as it is large
enough.  Therefore, it doesn't matter whether we are going all the way to the
endpoint of the road or not, we should always head to the same place along the
road.  Now we know where to head to on a destination road, but we don't know
which starting points we have to consider.  It might seem like we must consider
cases where we start on the middle of one road, and go to the middle of another
road.  However, it turns out that this case will never be optimal.  Imagine that
we take the gray path in the figure.  This path has length <tt>A+2B+C</tt>.  
The blue path, on the other hand, has a length of <tt>2E+D+A</tt>.
Let's assume that the gray path is shorter than the blue path.
By similar triangles, we know that there is some fraction <tt>p &lt; 1</tt> such
that <tt>B*p = E</tt>, <tt>X*p = X-C</tt>, and <tt>Y*p = Y-D</tt>.
Assuming the grey path is shorter than the path
along D and E, we know that <tt>2*B+C &lt; 2*E+D</tt> and therefore, by
substitution:<br/>
<tt>2*B+X-X*p &lt; 2*B*p+Y-Y*p</tt>.  <br/>This implies that 
<tt>2*B+X-Y &lt; p*(2*B+X-Y)</tt>, and therefore, since <tt>2*B+X-Y &gt; 1</tt>,
we have <tt>1&gt;p</tt>, which is a contradiction.  By similar reasoning, we can
work out the case where the roads are heading away from each other (they are
heading towards each other in the figure), and find that we should never travel
from midpoint to midpoint in that case either.</p>
<center><img src="/i/srm/srm215_2.jpg" border="0" /></center>

<p>Therefore, we find that an optimal path need never travel from the midpoint of
one road to the midpoint of another road.  Each offroad leg of the trip will either
start or end at an endpoint of one of the roads.  Once you come to that
conclusion, there are a number of ways to proceed.  One way is to find all of
the important points along the roads.  A point is important if it is an
endpoint, of if it is a point in the middle of a road such as that in the first
figure (noting that start and finish can be swapped in the figure, and the case
is essentially the same).  Once you find all of the important points, you can run
any standard graph algorithm.  However, finding all of the important points is a
bit tricky with all the geometry, so I elected to take an approach that required
less geometry.<br/><br/>
For the case shown in the first figure, I ran a search along the horizontal road
segment to find the best point to visit.  This approach used a standard search
method to find a local minima and required no more geometry than finding the
distance between two points.  With this approach, I considered the following 4
different cases for non adjacent points (black lines are roads, blue lines are
paths) between each pair of points in the input, and then ran Floyd-Warshall's
algorithm to find the minimum length path.  You could also use the search
approach to find all of the important points as described previously, but there
could be a lot of important points, and you'd have to use a graph algorithm
other than Floyd's.<br/> <center><img src="/i/srm/srm215_3.jpg" border="0" /></center>
</p>


					 <p>
					 <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
					 By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
