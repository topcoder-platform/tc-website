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

<title>2003 TopCoder Open sponsored by Intel&#174; sponsored by Intel&#174; - Qualification Round 2 Summary</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%" nowrap="nowrap"><font size="3">TCO - Qualification Round 2 Summary</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Thursday, October 9, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
With another day of fierce competition in the books, the 2003 TopCoder Open sponsored by Intel&#174; heads 
into its opening round.  600+ coders battled furiously for the 200 advancing 
spots.  Many competitors, who hadn't qualified on Tuesday, came back to try 
and change their fate.  The new unrated coders, covered in a veil of mystery, 
sparked much attention.  Each could potentially be the next SnapDragon or 
Tomek.  At 10:00 the round began, and submissions started flying in.  Minutes 
into the competition, many were already testing their medium problem.  Things 
changed once the hards were opened.  Average submission frequency remained 
low for a good 20-30 minutes.  It wasn't until the last 10 minutes, that most 
rooms had point totals in the thousands.  Unfortunately, many of these scores 
were inflated.  In a rush to claim a seat in the tournament, many coders hastily 
submitted incorrect solutions.  Only 13 level 3 submissions withstood systests.  
Once the dust had settled, coders who accurately completed the first two in an 
average amount of time would move on.  Others will compete vicariously through 
the victors.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b>LetterFreq</b> 
</font> 
<A href="Javascript:openProblemRating(1822)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      545 / 578 (94.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      516 / 545 (94.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>leadhyena_inran</b> for 249.42 points (1 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      222.39 (for 516 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This easy was a classic loop and process problem.  Here we are looking for letters, insensitive to case.  To solve it, we allocate an array of integers, which will keep track of the letters seen.  Java code follows:
<pre>
public int[] getFreqs(String[] doc) {
   int[] ret = new int[26]; //for tallying
      for (int i = 0; i &lt; doc.length; i++) {
         doc[i] = doc[i].toUpperCase(); //case-insensitive
      for (int j = 0; j &lt; doc[i].length(); j++) {
         if (Character.isLetter(doc[i].charAt(j) ) ) ret[doc[i].charAt(j)-'A']++;
      }
   } return ret;
}
</pre>
</p>

<font size="+2"> 
<b>Mandelbrot</b> 
</font> 
<A href="Javascript:openProblemRating(1172)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      457 / 578 (79.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      378 / 457 (82.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>frypan</b> for 437.66 points (4 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      331.28 (for 378 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As directed by the problem, we must check each integer x in [0,max] to determine whether the given complex value is in the Mandlebrot set.  The check consists of testing if the magnitude of z(x) is at most 2, for each x.  To aid in this matter, the problem has provided a recurrence defining the value of z(x) inductively:<pre>
           z(0)   = c
           z(x+1) = z(x)*z(x) + c
</pre>
Beginning with z(0)=c, we can iteratively compute the values of z(x) for all pertinent x, and test for magnitudes above 2.  Java code follows:
<pre>
public int iterations(int max, double origa, double origb) {
	double a = origa, b = origb;
	for (int i = 0; i &lt;= max; i++) {
		if (Math.sqrta*a+b*b)&gt;2) return i;
		double tempa = (a*a-b*b)+origa;
		b =  2*a*b+origb; 
		a = tempa;
	} return -1;
}
</pre>
Alternatively, we could have computed z(x) recursively, but this could take some extra doing, seeing as a complex value need be passed through the call chain.  Many coders accidently computed z(x+1)=z(x)*z(x)+z(x), generating multiple questions about incorrect test cases.
</p>

<font size="+2"> 
<b>BitmapToGraph</b> 
</font> 
<A href="Javascript:openProblemRating(1882)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1050 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 578 (10.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 63 (20.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Jan_Kuipers</b> for 586.28 points (31 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      464.74 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The hard clearly stood out from the rest, in terms of required code amount.  In this problem, we must turn character input into a graph, and return edge information.  The heart of the solution loops over each character of the input, and determines whether it is a node.  If so, check all neighboring squares for edges, and traverse all paths to their ends.  Traversals were done both recursively and iteratively by competitors, both with varied success.  The most significant issue was accounting for loops, so as to not count them twice at a node.  Simply removing all traversed edge characters will not work, since multiple edges may share edge characters.  To avoid such a problem, I marked all edge characters used while processing a single node.  Once done processing the node, I removed all markings.  This way, the edges would remain, if needed by another node.<br/>
<br/>
To handle the return value sorting, I used the built in String sorting features.  This required some doing, do to varying number lengths.  Lets say I was storing each piece of edge data as "dest:len".  Simply sorting the strings could produce incorrect results since a string like "10:4" would lexicographically occur before "2:4".  To alleviate this issue, I stored all the numbers using a DecimalFormat that forced them to be at least 10 characters in length.  This was done with code similar to the following:<pre>
	int dest = something, len = somethingelse;
	DecimalFormat df = new DecimalFormat("000000000");
	edgeStorage.add(df.format(dest)+":"+df.format(len));
	/*later*/
	Collections.sort(edgeStorage);
</pre>
Such a method will correctly format the strings, and produce the necessary sorting method using the native string comparator.
</p>


                        <p>
                        <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=251317"><strong>brett1479</strong></a><br />
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

