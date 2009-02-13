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

<title>Single Round Match 238 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 238</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Thursday, April 14, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
This SRM's early time slot seemed to enhance coder performance.  In Division 2, the medium was
submitted by more than 80% of the coders, and most were correct.  The Div 1 Hard was correctly
solved by 18 competitors.  <b>Kalmakka</b>, with an amazingly fast submission on the hard problem, lead
the pack going into the challenge round.  The system tests claimed numerous solutions, and left
<b>misof</b> on top by nearly 200 points.  <b>petr</b>, competing for the second time, finished in
second.  <b>Bhageera</b> and <b>pradhan_ptr</b> took first and second place in Division 2.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4503&amp;rd=6537" name="4503">ArrayHash</a></b>
</font>
<A href="Javascript:openProblemRating(4503)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      291 / 307 (94.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      285 / 291 (97.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cypressx</b> for 249.28 points (1 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      228.79 (for 285 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, we iterate over the entire input and apply the given formula to each entry.  An interesting feature of the formula, is that the position of each letter has no effect on the final return value.  The important factors are the number of times each letter occurs, the number of elements in the input, and the number of characters in each element of the input.  Java code follows :<pre>
public int getHash(String[] input) {
	int ret = 0;
	for (int i = 0; i &lt; input.length; i++) 
		for (int j = 0; j &lt; input[i].length(); j++)
			ret += input[i].charAt(j) - 'A' + i + j;
	return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4504&amp;rd=6537" name="4504">PrintScheduler</a></b>
</font>
<A href="Javascript:openProblemRating(4504)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      252 / 307 (82.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      224 / 252 (88.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Voldemort</b> for 487.32 points (4 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      379.96 (for 224 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201 / 201 (100.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      198 / 201 (98.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 198.94 points (2 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183.46 (for 198 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
In this problem we must write code that simulates a multithreaded system.  Since we are explicitly given the time slices alocated to each thread, the solution amounts to simple iteration code.  In a separate array, we maintain the position of each thread, so that subsequent executions begin properly.  Java code follows: <pre>
public String getOutput(String[] threads, String[] slices) {
	StringBuffer ret = new StringBuffer();
	int[] pc = new int[threads.length];
	for (int i = 0; i &lt; slices.length; i++) {
		String[] toks = slices[i].split(" ");
		int threadNum = Integer.parseInt(toks[0]), time = Integer.parseInt(toks[1]);
		for (int j = 0; j &lt; time; j++) {
			ret.append(threads[threadNum].charAt(pc[threadNum]));
			pc[threadNum] = (pc[threadNum] + 1) % threads[threadNum].length();
		}
	}
	return ret+"";
}
</pre> 
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4505&amp;rd=6537" name="4505">RedundantStrings</a></b>
</font>
<A href="Javascript:openProblemRating(4505)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      67 / 307 (21.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      53 / 67 (79.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>DineshLayek</b> for 995.69 points (1 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      582.30 (for 53 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The key to this problem is given in the statement.  Every redundant string has a unique non-redundant
root.  To count the number of redundant strings of a given length, we only need to consider the
possible roots.  Based on a divisibility argument, the length of a root must divide the length
of the string.  Thus, to find all non-redundant roots, we iterate over all possible divisors.  Java code
follows:<pre>
public int howMany(int length) {
	if (length == 1) return 0;
	int ret = 0;
	for (int sub = 1; sub &lt; length; sub++) 
		if (length % sub == 0)
		//# of Non-Redundant = Total - Redundant
			ret += (1 &lt;&lt; sub) - howMany(sub);
	return ret;
}</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4506&amp;rd=6537" name="4506">SequenceSync</a></b>
</font>
<A href="Javascript:openProblemRating(4506)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      113 / 201 (56.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      58 / 113 (51.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 481.52 points (5 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      342.11 (for 58 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, we perform a breadth first search over all possible machine configurations.
Each configuration is a set containing the states that the machine could be in.  Initially, 
the machine could be in any state, so the set of all states is given a cost of 0.  Considering all
possible input symbols, we can compute which sets are within 1 step of the initial set.  This
process is continued until we find a set containing a single element.  If no such singleton set is
reachable, our method returns -1.<br/>
<br/>
A similar way of looking at this problem involves non-determinism.  Assume the given machine is an
NFA.  Perform the full subset construction to get a DFA.  Make the set of all states the start
state, and all singleton states final.  The problem asks for the length of the shortest accepted string.  Although
this method gives a loose exponential upper bound, a tighter cubic bound is not hard to prove.  It
has been conjectured, that the maximum possible answer for an n state input is (n-1)<sup>2</sup>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3050&amp;rd=6537" name="3050">SquareLanguage</a></b>
</font>
<A href="Javascript:openProblemRating(3050)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      32 / 201 (15.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 32 (56.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalmakka</b> for 885.33 points (10 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      579.81 (for 18 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This is one of those problems that becomes extremely easy to code once you have the right idea.
Each string in S<sup>2</sup> will look as follows: <pre>
       #   #   #   #   #   #   #   #
      --- --- --- --- --- --- --- ---
       a   b   c   d   a   b   c   d
</pre>  Each of the #s correspond to some quantity of the letter below it.  If all of the lower bounds are
positive, we can easily compute the solution by multiplying the number of possible values
for each #.  In fact, this condition can be weakened: if at least 2 of the
lower bounds are positive, the solution can be computed via simple multiplication (why?).  
When this condition is not satisfied, the simple method may overcount certain strings.  The case
where fewer than 2 lower bounds are positive will be handled separately.<br/>
<br/>
Suppose, without loss of generality, the b's have a positive lower bound, 
but all other letters have 0 as a lower bound.  The simple multiplication
method will overcount the case where the c's, d's, and a's between the two groups of b's are all
missing.  For example, the case where the first group has 5 b's and the second group has 7 will be
considered different from the case where the first group has 10 b's and the second group has 2. The
following formula describes how far the simple method overcounts: <pre>
      (B - 1)<sup>2</sup>*A*C*D
</pre> Here A, B, C, and D denote the number of possible values for a's, b's, c's and d's.  For example,
C = uc - lc + 1.  Note that <pre>
   (B - 1)<sup>2</sup> = B<sup>2</sup> - (2B - 1)
</pre> When the letters between the b's are missing, the simple method counts B*B*A*C*D
strings, but in reality there are only (2B-1)*A*C*D strings.  When all 4 letters have lower bounds
at 0, this formula must be subtracted 4 times, for each potential case of overcounting.  Java code
follows: <pre>
public long howMany(int[] abounds, int[] bbounds, int[] cbounds, int[] dbounds) {
	int[][] arrs = {abounds,bbounds,cbounds,dbounds};
	int cnts[] = new int[4], lowSum = 0;
	long ret = 1, simp = 0;
	for (int i = 0; i &lt; cnts.length; i++) {
		simp = ret *= cnts[i] = arrs[i][1] - arrs[i][0] + 1;
		lowSum += arrs[i][0];
	}
	ret *= ret;
	for (int i = 0; i &lt; 4; i++) 
		if (arrs[i][0] == lowSum) 
		        ret -= simp*(cnts[i] - 1)*(cnts[i] - 1)/cnts[i];
	return ret;
}
</pre>
</p>

                <p>
                <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
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
