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

<title>2003 TopCoder Open sponsored by Intel&#174; - Online Round 3 Summary</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%" nowrap="nowrap"><font size="3">TCO - Online Round 3 Summary</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, October 29, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
The best-of-the-best battled for the 50 round 4 slots.  Unlike previous rounds, slow-yet-cautious coding 
practices prevailed, with many submissions falling to challenges and systests.  Most quickly submitted the 
easy problem, but had troubles with the medium.  Valiant coders who submitted the medium had even greater 
woes ahead.  The hard was a devilish problem, whose solution requires a deep understanding of permutations.  
When the dust cleared, quick coding Yarin came out on top, with Tomek just behind.  snewman, the `newbie' 
whose submissions are always colored in `C# blue', extended his perfect submission streak to 6.  There is 
clearly a permanent top 10 spot with his name on it.  Problem descriptions follow, including a detailed 
explanation of the solution to the hard.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>QuadraticRoots</b> 
</font> 
<A href="Javascript:openProblemRating(893)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      99 / 100 (99.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 99 (83.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tjq</b> for 244.76 points (4 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      224.00 (for 83 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, brute force all possible combinations of the 3 parameters:
<pre>
   for (int aIndex = 0;  aIndex &lt; a.length; aIndex++) {
      for (int bIndex = 0;  bIndex &lt; b.length; bIndex++) {
         for (int cIndex = 0;  cIndex &lt; c.length; cIndex++) {
            //code here
         }
      }
   }
</pre>
When evaluating the quadratic formula, be careful that you aren't taking the square root of a negative number, 
and that the value b^2-4ac is a perfect square.  Once that is checked, it still must be verified that the numerator 
is divisble by 2a.  The following code checks whether a value x is a perfect square using java:
<pre>
   int rtx = (int)Math.sqrt(x);
   if (rtx*rtx == x) { \\proceed 
   }
</pre>
</p> 

<font size="+2"> 
<b>WaterPressure</b> 
</font> 
<A href="Javascript:openProblemRating(1907)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      71 / 100 (71.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      51 / 71 (71.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NGBronson</b> for 411.98 points (13 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      287.61 (for 51 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The solution described here is something of an optimized breadth first search.  Maintain a list of all `digit squares' adjacent to water.  This can be thought of as the frontier of the water.  Check each element of the frontier, to see if the square can be flooded, and if so, remove it from the frontier, and add its relevant adjacent neighbors.  If no frontier element can be flooded, store the minimum water total that will be required to resume flooding.  Using this min, we can quickly advance the seconds and water total to a point where flooding can begin again.  This process is repeated till the frontier is empty.  At that point, if any digits squares remain unflooded return -1.  Otherwise, return the time when the last digit was flooded.
</p> 

<font size="+2"> 
<b>ShuffleMethod</b> 
</font> 
<A href="Javascript:openProblemRating(1871)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      33 / 100 (33.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 33 (36.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 714.07 points (19 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      535.72 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
It is always interesting when an easy concept like shuffling cards, can lead to a very difficult problem.  A complete description of the solution follows.<br/>
<br/>
<b>Introducing the cycle notation</b><br/>
<br/>
To explain the method I used to solve this, I will first introduce some important concepts about permutations.  Let's say you were looking at the shuffling procedure 3,1,2,5,6,4.  This takes the deck 
<pre>   1,2,3,4,5,6 to 3,1,2,5,6,4.</pre>
For the purpose of this discussion, we will say card 1 is transformed into card 3, card 2 is transformed into card 1, and so forth.  Explicitly written out: (a->b meaning a transformed into b)
<pre>   1->3,  2->1,  3->2,  4->5,  5->6,  6->4</pre>
Given any shuffling procedure, hereafter called a permutation, we can look at its cycles.  To find a cycle, mark a card, and follow its transformations as we shuffle over and over, noting when a repeat occurs.  For example,
<pre>   1->3 then 3->2 then 2->1  so we have the cycle 1->3->2->1.</pre>
We use the notation (1 3 2) to write such a cycle.  Verify that the other cycle is (4 5 6).  Notice that there are many ways to write a cycle.  For example, 
<pre>   (1 3 2) = (2 1 3) = (3 2 1).</pre>  
It all depends on which card you follow.  From this point on, we will always use the version where the minimum number occurs first in the cycle.  Using cycles, we have a useful way to describe permutations.  The permutation above would be written as (1 3 2)(4 5 6).  Basically, just take each cycle and write them next to each other.  This can always be done, such that none of the cycles share any elements.  Such a description is called `a product of disjoint cycles', since the cycles have no elements in common (also called a disjoint cycle decomposition).  What about 1-element cycles?  If you have a permutation like 2,1,3, you can write it as (1 2)(3) or (1 2).  In other words, it's customary to leave out 1-element cycles.<br/>
<br/>
<b>Squaring cycles, and seeing what happens</b><br/>
<br/>
Let's say you had the permutation 2,4,5,3,1.  Verify that this can be written as (1 2 4 3 5).  This permutation is just a single cycle.  What happens if we apply this permutation twice (analogous to shuffling twice)? Observe:
<pre>   1,2,3,4,5 -> Shuffle 1 -> 2,4,5,3,1 -> Shuffle 2 -> 4,3,1,5,2</pre>
The permutation 4,3,1,5,2 is called the square of 2,4,5,3,1, since it is formed by performing it twice.  Verify that the permutation 4,3,1,5,2 can be written as (1 4 5 2 3).  What we have just seen, is that a cycle of length 5, when squared, becomes a cycle of length 5.  Let's look at an arbitrary odd length cycle:
<pre>   (a1 a2 a3 a4 ... ak) where k is odd.</pre>
Verify that the square will be a cycle of length k.  (Hint: start with a1, skip 2 steps to a3, ...)  What about an even length cycle?  For example, what is the square of 
<pre>   2,3,5,6,4,1 = (1 2 3 5 4 6).</pre>
Verify that the square is 
<pre>   3,5,4,1,6,2 = (1 3 4)(2 5 6).</pre>
Furthmore notice for any even length cycle
<pre>   (a1 a2 ... an) where n is odd</pre>
will have square
<pre>   (a1 a3 a5 ... a[n-1])(a2 a4 ... an). </pre>
The last key thing to realize, is that squaring doesn't mix cycles.  Let's say you had our first example, 
<pre>   3,1,2,5,6,4 = (1 3 2)(4 5 6).</pre>
Squaring we get
<pre>   2,3,1,6,4,5 = (1 2 3)(4 6 5).</pre>
Numbers from the first cycle didn't get jumbled with numbers from the second cycle.  It is not hard to prove, that disjoint cycles will remain disjoint when you square the permutation.  Furthermore, each cycle can be squared individually.  (Notice that (1 3 2) squared is (1 2 3) and (4 5 6) squared is (4 6 5).  Algebra enthusiasts will realize that this occurs since disjoint cycles commute.)<br/>
<br/>
<b>Finding oneShuffle</b><br/>
<br/>
Let's say twoShuffle is 
<pre>   2,3,1,5,6,4 = (1 2 3)(4 5 6).</pre>
We want to figure out what oneShuffle could be.  We ask where (1 2 3) could have came from.  In other words, what cycle could have been squared to produce the 3-element cycle (1 2 3).  From the previous section, we know the only possibilities are: a) a cycle of length 3, or b) a cycle of length 6.  Verify that the only cycle of length 3 it could have came from is (1 3 2).  (Hint: if 1 -> 2 in twoShuffle then 1 must go to 2 in two steps in oneShuffle)  Furthermore, verify that the possible 6-element cycles are 
<pre>   (1 4 2 5 3 6) and (4 1 5 2 6 3) = (1 5 2 6 3 4) (same hint).</pre>
One major concept at play here, is that the square of a 6-cycle (6-element cycle) is two 3-cycles, and the square of a 3-cycle is a 3-cycle.  In this problem, we will have to choose the lexicographically earliest permutation, so here oneShuffle would be 
<pre>   (1 3 2)(4 6 5) = 3,1,2,6,4,5.</pre>
When dealing with even cycles in twoShuffle, there are fewer options.  For example, if twoShuffle is 2,1,4,3 = (1 2)(3 4), there are no single cycles whose square is a 2-cycle.  The only option is a squared 4-cycle that becomes two 2-cycles.  So the only options for oneShuffle are 
<pre>   (1 3 2 4) and (3 1 4 2) = (1 4 2 3),</pre>
 from which we would choose the lexicographically earlier (1 3 2 4).  What if twoShuffle is 
<pre>   2,3,4,1,6,5 = (1 2 3 4)(5 6).</pre>
The 2-cycle (5 6) could only have came from a squared 4-cycle in oneShuffle.  The problem is, when you square a 4-cycle in oneShuffle, it will produce two 2-cycles, and we only have 1.  This is an example where you would return an empty int[], since there is no permutation whose square is twoShuffle.  We now have enough information to form our algorithm.<br/>
<br/>
<b>Algorithm</b><br/>
<br/>
Decompose twoShuffle into disjoint cycles, and place them in a list called cycleList ordered by minimum element.  In other words, (1 3 7) would come before (2 4 5) since 1 is less than 2.  Starting with the cycle containing 1, figure out which cycle it could have came from (which cycle squared will produce it).  When many choices are available, always take the one that produces the lexicographically earliest permutation.  Two examples of choices are shown below:
<ul>
<li>cycleList = (1 7),(2 6),(3 4),(5 8).  When processing (1 7) pair it with cycle (2 6) so it came from the 4-cycle 
(1 2 7 6) in oneShuffle.  All other pairings produce lexicographically later permutations.</li>
<li>cycleList = (1 4 5),(2 3 6).  When processing (1 4 5) you can either choose to have it come from the 3-cycle (1 5 4), or the 6-cycles (1 2 4 3 5 6), (2 1 3 4 6 5) = (1 3 4 6 5 2) by pairing with (2 3 6).  Choose the first 6-cycle, since it is lexicographically earliest.</li>
</ul>
If you pair cycles together, remove them both from cycleList.  If you have an even cycle, and there is no pair in cycleList, return an empty int[].  Since we are processing in order of minimum elements, 1-cycles are never paired with other 1-cycles. Proceed till all elements of cycleList are exhausted.  The formed permutation is the answer.
</p> 



                        <p>
                        <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
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

