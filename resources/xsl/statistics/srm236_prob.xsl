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

<title>Single Round Match 236 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 236</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, April 2, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
In division 1, tomek squeaked out a win, despite starting 15 minutes
late, and hence regained the number 1 ranking.  liympanda took second
place with the help of 175 challenge points and in spite of a
resubmission.  snewman rounded out the top 3 almost 90 points behind
tomek.  In division 2, first timer Vintik took top honors, with more
than a 100 point lead on second place fredphil.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4448&amp;rd=6535" name="4448">MassiveNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(4448)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      256 / 286 (89.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      235 / 256 (91.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mhykol</b> for 247.80 points (2 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.27 (for 235 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
While this problem required a little bit of math, the formulas were
given to you, so it really became a parsing problem.  You need to
split the input string into the base and the exponent, then apply the
formula, and return the result.  It's worth noting that the trick
described for comparing very large numbers may also be used with very
small numbers, and is applicable in many situations.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1585&amp;rd=6535" name="1585">BusinessTasks</a></b>
</font>
<A href="Javascript:openProblemRating(1585)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      183 / 286 (63.99%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      146 / 183 (79.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Serpent</b> for 488.07 points (4 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      326.12 (for 146 correct submissions)
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
      194 / 207 (93.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      185 / 194 (95.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 248.45 points (2 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      203.01 (for 185 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
With <b>n</b> as large as ten million, you have to be a little careful
about timing out if you perform a naive simulation of the process.
However, you can use a bit of simple math to make it run
instantaneously.  If there are k things, and you want to count to n,
starting from j, you will simply end up at (j+n)%k.  Using this, its
just a matter of removing the elements as specified, and running the
simulation.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4460&amp;rd=6535" name="4460">ComputerExpert</a></b>
</font>
<A href="Javascript:openProblemRating(4460)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      43 / 286 (15.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      28 / 43 (65.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Vintik</b> for 710.62 points (19 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      533.93 (for 28 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This was a good problem to use your language's built-in set class or
template on.  You can represent the known facts as a set of strings,
and then you can do many of the operations as set operations.  For
example, to find out if one or more of a number of facts are true (the
OR operation), you can simply do set intersection.  For example, in
Java, you can make some clever use of the Collections API to write
quite short code.
<pre>
public String[] operate(String[] facts, String[] rules){
    Set r = new TreeSet();
    r.addAll(Arrays.asList(facts));
    boolean changed = true;
    while(changed){
        changed = false;
        for(int i = 0; i&lt;rules.length; i++){
            String[] sp = rules[i].split(" -&gt; ");
            if(tr(r,sp[0])){
                changed |= r.add(sp[1]);
            }
        }
    }
    r.removeAll(Arrays.asList(facts));
    ArrayList al = new ArrayList(r);
    return (String[])al.toArray(new String[0]);
}
boolean tr(Set s, String r){
    String[] sp = r.split(",");
    for(int i = 0; i&lt;sp.length; i++){
        String[] s2 = sp[i].split("/");
        Set t = new TreeSet(Arrays.asList(s2));
        t.retainAll(s);
        if(t.size()==0)return false;
    }
    return true;
}

</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4459&amp;rd=6535" name="4459">HammingNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(4459)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      97 / 207 (46.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      59 / 97 (60.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 472.49 points (6 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      323.23 (for 59 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The most obvious way to do this problem is with an algorithm similar
to Dijkstra's.  Start with the number 1, then multiply it by each of
the factors, and add those numbers to a set.  Then, take the smallest
number out of the set, multiply it by each factor, and put those
numbers into the set.  If you continue this way, you will eventually
remove n numbers.  The problem with this algorithm is that the set
operations are fairly expensive and although n is capped at 100,000,
you may end up adding many more numbers to your set than that.
However, there is a simple optimization that will make this algorithm
run in time.  Maintain a integer representing the largest number in
the set.  Once we have added a total of n numbers to the set (including
those that we have subsequently removed from the set), we shouldn't
add any more numbers that are larger than the largest current number.  While
there are a number of further optimization we could make, this one is
enough, and is probably simplest to implement.  
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3530&amp;rd=6535" name="3530">Parking</a></b>
</font>
<A href="Javascript:openProblemRating(3530)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      27 / 207 (13.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 27 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 632.89 points (24 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      522.37 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem required quite a combination of skills.  You have to do 
a breadth first search, a binary search, and bipartite matching.
First, you do a breadth first search to find the distance from each
car to each parking spot.  Next, you put all of those distances into a
single sorted array, and do a binary search over this array.  At each
step in the binary search, you want to find if the distance under
examination is large enough that all of the cars can reach parking
spots in that much time.  To figure this out, you need to do bipartite
matching where the cars represent one side of the graph, and the
parking locations represent the other.  When doing the matching, you
are only allowed to match a car to a parking space if the distance
from that car to the parking space is less than the distance under
consideration in the binary search part of the algorithm.<br/><br/>
If you were efficient when it came to writing your
matching algorithm, you could probably get away without using the
binary search, but it is safer to use it, since its probably the
fewest lines of the whole thing.
</p>

                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
