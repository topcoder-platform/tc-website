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

<title>Single Round Match 159 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 159</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, August 12, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 
<p> 
In Division I <b>antimatter</b> and <b>bladerunner</b> were on fire, as they both finished all 3 problems in under 30 minutes. However, as it is often the case, fast code is not always good code and both had to resubmit their Easy problems. After the coding phase, <b>CristopherH</b> looked certain to win his first SRM with an impressive score of 1500.67, but that was about to change...</p>

<p>The challenge phase was fast and furious with many Easy problems challenged by one simple case. A number of coders gained over 100 points in those frenetic 15 minutes. It was 5 successful challenges by <b>Yarin</b> and <b>WishingBone</b> which propelled them into first and second, respectively. System tests brought even more destruction, failing nearly half of Medium problems. At the end of the day, it was <b>Yarin</b> on top with 1562.66, closely followed by <b>WishingBone</b> and <b>CristopherH</b>.</p>

<p>Division II coders had a more relaxing SRM with few difficulties on the first two problems. Once again, it was the Hard problem which separated the best from the rest, as there were only 8 coders who passed it. The division was won by <b>dilap</b> who scored 1513.41 and gained the highest rating change doing so. He was followed by first-timer <b>roma</b> and <b>DimaGer</b>, who has gained an amazing 468 rating points from last two SRMs!
</p>
 
 <p> 
<H1> 
The Problems 
</H1> 
</p> 
<font size="+2"> 
<b>StreetParking</b> 
</font><A href="Javascript:openProblemRating(1753)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      158 / 183 (86.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      121 / 158 (76.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Uranium-235</b> for 244.15 points (4 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.73 (for 121 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p> 
This problem was relatively easy if you simply followed instructions from the problem statement and did not try to take any risky shortcuts. The most difficult part of the problem was avoiding index out of bounds errors, especially when dealing with bus stops and side streets. An easy way to handle such errors was to "pad" the <b>street</b> like so in Java:</p>

<pre>street = "*" + street + "**";</pre>

<p>All we have to do now is loop through all the characters in street (without the first and last two) and count all valid '-' positions:</p>

<pre>	for (int i=1; i&lt;street.length()-2; i++) 
	{
		char current = street.charAt(i);
		char previous = street.charAt(i-1);
		char next = street.charAt(i+1);
		char next2 = street.charAt(i+2);

		if (current=='-' &#38;&#38;
		   next!='B' &#38;&#38; next2!='B' &#38;&#38;
		   previous!='S' &#38;&#38; next!='S')
			count++;
	}
</pre>



<font size="+2"> 
<b>Sets</b> 
</font><A href="Javascript:openProblemRating(1685)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      137 / 183 (74.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      107 / 137 (78.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>eldering</b> for 468.08 points (7 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      349.98 (for 107 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p> 
This problem dealt with sets and three of their most common operations: union, intersection and symmetric difference. Many coders may want to keep their code for future reference, because set operations tend to crop up in many applications. For example, Kruskal's algorithm for finding the minimum spanning tree uses union of sets when adding new edges to the final solution.</p>

<p>C++ coders had a slight advantage in this problem, because set operations are part of the standard package (see <b>Karshikinpa</b>'s solution in the practice rooms). Then again, I don't think many used it during the contest. In Java it is easiest to use one of the built in classes like TreeSet, HashSet, ArrayList or Vector. Although I will demonstrate the solution with a Vector class, any of the above would do the job.</p>

<p>To implement the union operation we add all the elements from set A to our result, then loop through set B and add all of its elements which are not already in result:</p>

<pre>	for (int i=0; i&lt;A.length; i++)
		result.add(""+A[i]);
	for (int i=0; i&lt;B.length; i++)
		if (!result.contains(""+B[i])) result.add(""+B[i]);</pre>

<p>To implement the intersection operation we loop through set A and add all of its elements, which can be found in set B:</p>

<pre>	for (int i=0; i&lt;A.length; i++)
		for (int k=0; k&lt;B.length; k++)
			if (A[i]==B[k]) result.add(""+A[i]);</pre>

<p>Symmetric difference can be found by taking the union of A and B and then removing all the elements that belong to the intersection of A and B. I leave this as an exercise to the reader. In general, coders did well on this problem. However, some failed because they did not properly handle the case with empty sets.</p>
 

<font size="+2"> 
<b>ThePriceIsRight</b> 
</font><A href="Javascript:openProblemRating(1784)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      42 / 183 (22.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 42 (19.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dilap</b> for 758.50 points (17 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      593.04 (for 8 correct submissions) 
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
      96 / 118 (81.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      48 / 96 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 476.07 points (6 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369.51 (for 48 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p> 
It should not take long to realize that this is the longest increasing subsequence problem. Intuitively, we could produce all possible sequences, find all increasing sequences, and then find the longest of those sequences. However, this is not a very good idea, because the number of sequences we need to consider for input of size n is 2^n - 1. Since n can be as high as 50, such a solution would definitely time-out. Recursion is another way to solve this problem, but as many coders found - it also timed-out.</p>

<p>So how do we solve this problem? Well, we use the power of dynamic programming of course. We begin by creating two auxiliary arrays S and L. S[i] will store the longest increasing subsequence that ends with prices[i], while L[i] will store the total number of ways of achieving S[i].</p>

<p>We can notice a recurrence relationship:</p>

<p>       <i>The longest increasing subsequence ending at prices[i] can be formed by appending it to the longest increasing subsequence to the left of i that ends on a number smaller than prices[i].</i></p>

<p>We also notice the following:</p>

<p>       <i>The total number of ways of achieving the longest increasing subsequence
ending at prices[i] is equal to the sum of the total number of ways of
achieving the longest increasing subsequence ending at prices[j], where
j&lt;i and prices[j] &lt; prices[i].</i></p>

<p>Based on the above relationships we can derive the following pseudo-code:</p>

<pre>
	initialize int[] out to {0,0}

	for all i&lt;prices.length
		initialize temp to 0
		for all k&lt;i
			if prices[k]&lt;prices[i] then temp = Max{temp, S[k]}
		for all k&lt;i
			if S[k] == temp and prices[k]&lt;prices[i] then increment L[i] by L[k]
		if L[i] is still 0 then L[i] = 1
		S[i] = 1 + temp
		out[0] = Max{out[0], S[i]}

	for all i&lt;prices.length
		if S[i] == out[0] then increment out[1] by L[i]

	return out
</pre>

<p>To compute each S[i] value we must make (i-1) comparisons. Thus, the time complexity of this algorithm is O(n^2). By using advanced data structures we can improve the complexity to O(n*log(n)). Surprisingly, this problem has parallels with real-world applications. The same algorithm is used for finding common subsequences in DNA strands, and is closely related to spelling correction algorithms.
</p> 
<font size="+2"> 
<b>FryingHamburgers</b> 
</font><A href="Javascript:openProblemRating(1517)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      117 / 118 (99.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      50 / 117 (42.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tjq</b> for 248.12 points (2 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.51 (for 50 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p> 
Many coders submitted this problem, but surprisingly not many of those solutions stood the rigorous test of challenges and system tests. In fact, this problem had the lowest success rate for any non-level 3 problem over the past 10 competitions! The case which was most often overlooked occurred when 2*<b>hamburgers</b>&lt;=<b>panSize</b>. For this case, solutions returned 5, while 10 was the expected answer.</p>

<p>Some coders like <b>ZorbaTHut</b> and <b>sjelkjd</b> simulated the problem, but there is a much shorter solution. Nevertheless, it will probably require some convincing before you can see that it works. We notice that there are five distinct cases:</p>
<ol>
<li>If <b>hamburgers</b> == 0 then we do not need to fry anything and we should return 0.
</li><li>If <b>hamburgers</b>&lt;=<b>panSize</b> then all the hamburgers can be fried in one go and we should return 10.
</li><li>If <b>panSize</b> divides evenly into <b>hamburgers</b> (i.e. <b>hamburgers</b>%<b>panSize</b> == 0) then we have no tricks up our sleeves and must fry
all hamburgers consecutively in batches of <b>panSize</b>. In this case we should return (<b>hamburgers</b>/<b>panSize</b>)*10.
</li><li>If the last batch of hamburgers is not more than half of <b>panSize</b> (i.e. <b>hamburgers</b>%<b>panSize</b>&lt;=<b>panSize</b>/2) then we can save some
time by using the trick described in examples. This involves frying hamburgers from the last batch on their first side together with
half of hamburgers from the previous batch on their second side. After that, the remaining hamburgers from the previous batch are
fried together with the hamburgers from the last batch on their second sides. This trick saves us 5 minutes, so we could
return (<b>hamburgers</b>/<b>panSize</b>+1)*10-5.
</li><li>For all remaining situations, we have too many hamburgers in the last batch to do anything with. In this case we return
(<b>hamburgers</b>/<b>panSize</b>+1)*10.
</li></ol>
<p>It turns out that cases 1, 3, 4 and 5 can be all simplified to one single statement:</p>

<pre>5*(int)Math.ceil(2.0*hamburgers/panSize);</pre>

<p>For a short solution see <b>writer</b>'s solution in the practice rooms.</p>
 
<font size="+2"> 
<b>PointsOnAxis</b> 
</font><A href="Javascript:openProblemRating(1670)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      32 / 118 (27.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 32 (40.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ChristopherH</b> for 792.27 points (15 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560.00 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p> 
Given a set of points we can easily construct the set containing distances between each pair of points. However, it is a much more difficult task going backwards - i.e. constructing the set of points from a given set of distances. This problem is called the Turnpike Reconstruction problem.</p>

<p>As far as I know there is no solution to this problem that is guaranteed to run in polynomial time. Since a general algorithm is unavailable, we are forced to use a more "guess-and-check" method, such as backtracking. Like many other backtracking algorithms, this solution involves having a driver function and a recursive function.</p>

<p>In the driver function we sort distances into ascending order and initialize the points array to the correct number of points. This can be done using a simple while loop or the quadratic formula: N = (int)(1+Math.sqrt(1+8*distances.length))/2. Because this is a backtracking algorithm it is important to keep track
of distances already used so that we don't try to use the same distance more times than it occurs in the input. The easiest way to implement this is to create an int[] tally of size 1000001, where tally[i] represents the number of distances of length i. If the distances array has only one element then we can simply return {0,distances[0]}.
Otherwise we set the first point to 0, the last point to the largest distance and the second point to the difference between largest and second largest distances. If the second point exists in distances then we run the recursive function, otherwise the set of points cannot be constructed and we return an empty int[].</p>

<p>The function prototype for the recursive call can look like this in Java:</p>

<pre>void place(int[] points, int[] tally, int left, int right);</pre>

<p>Each call, the function assumes that points have not yet been placed between <b>left</b> and <b>right</b> inclusive. We begin by attempting to set points[left] to points[N-1] - largest unused distance. We make sure that all the distances between this new point and the points already placed have not been used yet. If this is the case, then all those distances are removed (by decrementing values in <b>tally</b>) and we recurse with the call place(points, tally, left+1, right).
Otherwise, we attempt to set points[right] to the largest unused distance. Once again we make sure that all the distances between this new point and the points already placed have not been used yet. If this is the case, then all those distances are removed and we recurse with the call place(points, tally, left, right-1).
If we reach the situation where setting points[left] or points[right] are both impossible then we must backtrack. This is achieved by incrementing elements in <b>tally</b> back to their original values.
We continue recursion until all distances have been considered. If all distances have been placed successfully then we have a working solution that we return, otherwise the set of points cannot be constructed and we return an empty int[].</p>

<p>It is important to note that the problem specifically asks us to find the lexicographically earliest set of points. We can be sure that our solution achieves that, because the recursive function always places the smallest possible point, and only if that doesn't work does it go on to place a larger point.</p>

<p>Now to the analysis. First, we must show that the above algorithm is correct. The step which may seem questionable is to always choose the largest unassigned distance at each step of the recurrence, and use only that distance to find the next point. However, we can see that this is correct by induction. Clearly, the first point has to be 0, and the last point has to be the largest distance in the input. Now, the inductive step is to show that, after some subset of points has been placed, if that subset is part of a correct solution, the next point must be either at the largest unused distance, or the maximum distance minus the largest unused distance. If there were not a point at either of those locations, then the largest unused distance must be a distance from some other point. However, since this point isn't the smallest or the largest, there would have to be a largest unused distance for this to work. Perhaps a diagram will make this clearer. Assume we have an input whose largest distance is 8, and in our recursion, we have placed a point at 4. Now, at the current step of our recursion, the largest unused distance is 3:</p>
<pre>
0---1---2---3---4---5---6---7---8
x---------------x---------------x
</pre>
<p>If the distance of 3 is a distance from the point at 5, then there would have to also be a distance of 4+3=7 (from the point at 0), or of 8-4+3=7 (from the point at 8). So, from this, it should be clear that we need only try to place a point at one of two locations in each step of our recurrence. Thus, the running time of our algorithm has a worst case which is O(2^n), which is plenty fast for n&lt;=10. It turns out that the runtime is usually much better than this. In fact, the following website claims that the runtime seems to be O(n^2 log n): 
<a href="http://www.cs.fiu.edu/~weiss/cop3337_f99/assignments/turnpike.pdf">http://www.cs.fiu.edu/~weiss/cop3337_f99/assignments/turnpike.pdf</a></p>

<p>However, proving this seems to be pretty hard, though my experiments seem to support the claim that the algorithm is much better than exponential. For a reference implementation see <b>writer</b>'s solution in the practice rooms.</p> 


                        <p>
                        <img src="/i/m/dimkadimon_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=276230"><strong>dimkadimon</strong></a><br />
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

