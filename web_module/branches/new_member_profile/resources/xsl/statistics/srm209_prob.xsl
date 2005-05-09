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

<title>Single Round Match 209 Statistics at TopCoder</title>

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
							 <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 209</font></td>
							 <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
						 </tr>

						 <tr valign="middle">
							 <td class="bodyText">Saturday, August 28, 2004</td>
							 <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
						 </tr>
					 </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
In division 1, many coders were quick to submit the first two problems,
but took their time on the hard problem.
System tests then saw 13 coders solve all three problems correctly, one of them being
Vigothebest, who gains 275 rating points and no longer feels blue.
Eryx won the division by a comfortable margin of over
140 points, having the fastest submission time on both the medium
and the hard problem.
Division 2 was a close race, with algorithmus_ua winning with only
2.54 points ahead of chaochao.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2924&amp;rd=5855" name="2924">MovingAverages</a></b>
</font>
<A href="Javascript:openProblemRating(2924)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      168 / 185 (90.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      161 / 168 (95.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>35C4P3</b> for 243.51 points (4 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186.55 (for 161 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Calculating the n-moving averages for the times given proved to be
no problem for the vast majority of coders.
For each average to be calculated, loop through and add up the times that need
to be considered for that average and do not forget to divide at the end.
<pre>
<b>C++</b>

vector&lt;int&gt; calculate(vector&lt;string&gt; times, int n)
{
    vector&lt;int&gt; result;
    for (int i=0; i&lt;(int)times.size()-n+1; i++)
    {
        int seconds = 0, h, m, s;
        for (int j=i; j&lt;i+n; j++)
        {
            sscanf(times[j].c_str(), "%d:%d:%d", &amp;h, &amp;m, &amp;s);
            seconds += 3600*h + 60*m + s;
        }
        result.push_back(seconds/n);
    }
    return result;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2922&amp;rd=5855" name="2922">MedalTable</a></b>
</font>
<A href="Javascript:openProblemRating(2922)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      107 / 185 (57.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      87 / 107 (81.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>wlott</b> for 418.58 points (13 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      292.86 (for 87 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      170 / 175 (97.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      157 / 170 (92.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>marian</b> for 288.63 points (5 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      231.45 (for 157 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
In this problem an Olympic medals table has to be created from the results
given.
While this was not difficult to understand, this problem required quite
some work.
There were basically three steps to do: Accumulate the medals for each
country, sort them by the criteria given and finally assemble the strings
that are to be returned.
Some coders were able to show off their language proficiency.
Snapdragon for example makes nice use of
<tt>vector&lt;pair&lt;vector&lt;int&gt;,string&gt; &gt;</tt> in his short
 C++ solution that can be found in the practice room.
<pre>
<b>Java</b>

class SortEntry implements Comparable
{
    int[] medal = new int[]{0, 0, 0};
    String country;
    SortEntry(String c)
    {
        country = c;
    }
    public int compareTo(Object o)
    {
        SortEntry e = (SortEntry)o;
        for (int i=0; i&lt;3; i++)
            if (medal[i] != e.medal[i])
                return e.medal[i] - medal[i];
        return country.compareTo(e.country);
    }
}
public String[] generate(String[] results)
{
    Map m = new TreeMap();
    for (int i=0; i&lt;results.length; i++)
    {
        String[] s = results[i].split(" ");
        for (int j=0; j&lt;3; j++)
        {
            SortEntry entry;
            if (m.containsKey(s[j]))
                entry = (SortEntry)m.get(s[j]);
            else
                entry = new SortEntry(s[j]);
            entry.medal[j]++;
            m.put(s[j], entry);
        }
    }
    SortEntry[] se = (SortEntry[]) m.values().toArray(new SortEntry[0]);
    Arrays.sort(se);
    String[] res = new String[se.length];
    for (int i=0; i&lt;se.length; i++)
        res[i] = se[i].country + " " + se[i].medal[0] + " "
                 + se[i].medal[1] + " " + se[i].medal[2];
    return res;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2947&amp;rd=5855" name="2947">LoadBalancing</a></b>
</font>
<A href="Javascript:openProblemRating(2947)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      59 / 185 (31.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 59 (25.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Crystal</b> for 741.23 points (13 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      624.06 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To achieve the fastest running time, the input chunks have to be
distributed between the two CPUs as evenly as possible. The first
thing to be noticed is that the input sizes may be divided
by 1024 to be able to work with smaller numbers. Then it is just a
standard problem (knapsack) of dynamic programming, where you loop through the
chunks and keep track of the sizes that can be achieved with the
chunks used so far. You may want to take a look at vorthys' feature 
on dynamic programming for an in-depth explanation.<br/>
A lot of coders failed because they tried a greedy algorithm that
looped through the chunks (perhaps sorted) and assigned
the current one to CPU that currently has fewer work to do.
You can convince yourself with the example {3, 3, 7, 3, 1} that
this approach is doomed to fail.
<pre>
<b>C++</b>

int minTime(vector&lt;int&gt; chunkSizes)
{
    vector&lt;int&gt; dp(204801, 0);
    dp[0] = 1;
    int total = 0;
    for (int i=0; i&lt;(int)chunkSizes.size(); i++)
    {
        total += chunkSizes[i]/1024;
        for (int j=204800; j&gt;=0; j--)
            if (dp[j] == 1)
                dp[j+chunkSizes[i]/1024] = 1;
    }
    for (int i=(total+1)/2; true; i++)
        if (dp[i] == 1)
            return 1024 * i;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1729&amp;rd=5855" name="1729">TopCan</a></b>
</font>
<A href="Javascript:openProblemRating(1729)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      160 / 175 (91.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      146 / 160 (91.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 496.66 points (2 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      397.36 (for 146 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This is an optimization problem that can be solved by differential calculus.
Apparently TopCoders know their math better than the problem writer expected
since most of them were able to solve this problem rather quickly.<br/>
<br/>
These are the formulas given. V is the volume, S the surface area, h the height
and r the radius.
<pre>
(I)        V = h * PI * r^2
(II)       S = 2 * PI * r * (r + h)
</pre>
Solve (I) for h and substitute h in (II).
<pre>
(III)      h = V / (PI * r^2)
(IV)    S(r) = 2 * PI * r^2 + 2 * V / r
</pre>
Take the derivative of S(r) with respect to r.
<pre>
(V)    S'(r) = 4 * PI * r - 2 * V / r^2
(VI)  S''(r) = 4 * PI + 4 * V / r^3
</pre>
Set S'(r) = 0 to find the extremal value and assure yourself that this
is indeed a minimum by stating that S''(r) &gt; 0 for all r &gt; 0.
<pre>
(VII)                  0 = 4 * PI * r - 2 * V / r^2
       &lt;=&gt;    4 * PI * r = 2 * V / r^2
       &lt;=&gt;  4 * PI * r^3 = 2 * V
       &lt;=&gt;           r^3 = V / (2 * PI)
(VIII) &lt;=&gt;             r = cuberoot(V / (2 * PI))
</pre>
So we can calculate r with the help of (VIII), then h with (III) and finally the minimal surface area with (II).
That is the solution most coders developed. Others like snewman performed a search to find the minimum surface area.
<pre>
<b>Java</b>

public double minSurface(int volume)
{
    double r = Math.pow(volume / (2 * Math.PI), 1.0/3.0);
    double h = volume / (Math.PI * r * r);
    return = 2 * Math.PI * r * (r + h);
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1706&amp;rd=5855" name="1706">CaseysArt</a></b>
</font>
<A href="Javascript:openProblemRating(1706)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      30 / 175 (17.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 30 (46.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 752.03 points (17 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      520.93 (for 14 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem asked for the number of tilings of a rectangle by
the right tromino. It can be solved using dynamic programming
in <tt>O(length * width * 2^width)</tt>.<br/><br/>

A possible solution works as follows.



Let <tt>dp[length][width+1][2^(width+1)]</tt> be a array  which holds
the number of tilings for a certain state. 
Start with every element of <tt>dp</tt> set to <tt>0.0</tt>, except
<tt>dp[0][0][0] = 1</tt>.
Loop through the rows from
<tt>0</tt> to <tt>length-1</tt> and in each row through the columns from
<tt>0</tt> to <tt>width-1</tt>.<br/>
When a certain state <tt>(i,j,bitmask)</tt> is considered, a right tromino
is placed in all possible ways while occupying field <tt>(i,j)</tt>
and the number of ways to achieve the new state is updated.<br/>
A state <tt>(i,j,bitmask)</tt> whose number of tilings is stored in
<tt>dp[i][j][bitmask]</tt>
refers to a position at row <tt>i</tt> and column <tt>j</tt> in the rectangle.
Rows <tt>0</tt> to <tt>i-1</tt> are completely filled and row <tt>i</tt> is
filled up to column <tt>j-1</tt>.
Bits <tt>0</tt> to <tt>width</tt> of <tt>bitmask</tt> are used.
Bits <tt>0</tt> to <tt>j</tt> of <tt>bitmask</tt> indicate
if the fields from <tt>(i+1,0)</tt> to <tt>(i+1,j)</tt> are
filled (that is in the next row) and bits <tt>j+1</tt> to <tt>width</tt>
indicate if the fields from <tt>(i,j)</tt> to <tt>(i,width-1)</tt> are
filled (that is in the current row).<br/>
<img src="/i/srm/srm209.gif" border="0"/><br/>
<i>Image showing state <tt>(i,j,1101000101)</tt>.
The red and blue fields are the ones whose information is stored in the bitmask.
The trominos that can be placed in this state have to cover <tt>(i,j)</tt>
and two free fields. The free fields are the ones that are light red,
light blue or white.
</i>
<br/>
<br/>
In order to stay within the memory limit, the array
<tt>dp[width+1][2^(width+1)]</tt> is reused for every row in the following
implementation.
<pre>
<b>C++</b>

double howMany(int length, int width)
{
    vector&lt;vector&lt;double&gt; &gt; dp(width+1, vector&lt;double&gt;(1&lt;&lt;(width+1), 0));
    dp[0][0] = 1;
    for (int row=0; row&lt;length; row++)
    {
        for (int col=0; col&lt;width; col++)
        {
            for (int mask=0; mask&lt;(int)dp[col].size(); mask++)
            {
                int j0 = 1 &lt;&lt; (col-1); // previous position in current row
                int j1 = 1 &lt;&lt; col; // position in current row
                int j2 = 1 &lt;&lt; (col+1); // next position in current row
                int nxt = mask &amp; (j2-1); // only bits set in next row
                int cur = (mask ^ nxt) &gt;&gt; 1; // only bits set in current row
                // bits 0 to i of mask hold bits 0 to i of next row
                // bits i+1 to width of mask hold bits i to width-1 of current row

                if (cur &amp; j1) // (row,col) already filled?
                {
                    // move value one column forward
                    dp[col+1][nxt | (cur^j1)&lt;&lt;1] += dp[col][mask];
                }
                else // place trominos
                {
                    int newcur = cur &lt;&lt; 1;
                    if (col+1 &lt; width &amp;&amp; (cur &amp; j2) == 0) // (row,col+1) free?
                    {
                        if ((j1 &amp; nxt) == 0) // (row+1,col) free?
                        {
                            // Xx
                            // x
                            int newnxt = nxt | j1;
                            dp[col+2][newnxt|newcur] += dp[col][mask];
                        }
                        // (row+1,col+1) is free
                        // Xx
                        //  x
                        int newnxt = nxt | j2;
                        dp[col+2][newnxt|newcur] += dp[col][mask];
                    }
                    if ((j1 &amp; nxt) == 0)
                    {
                        if (col &gt; 0 &amp;&amp; !(j0 &amp; nxt)) // (row+1,col-1) free?
                        {
                            //  X
                            // xx
                            int newnxt = nxt | j1 | j0;
                            dp[col+1][newnxt|newcur] += dp[col][mask];
                        }
                        if (col+1 &lt; width)
                        {
                            // (row+1,col+1) is free
                            // X
                            // xx
                            int newnxt = nxt | j1 | j2;
                            dp[col+1][newnxt|newcur] += dp[col][mask];
                        }
                    }
                }
            }
        }
        // values of completed row are the values at the
        // start of the next row
        for (int i=0; i&lt;((int)dp[0].size()&gt;&gt;1); i++)
            dp[0][i&lt;&lt;1] = dp[width][i];
        for (int i=1; i&lt;=width; i++)
            for (int j=0; j&lt;(int)dp[i].size(); j++)
                dp[i][j] = 0; // empty the rest
    }
    return dp[0][0];
}
</pre>
See Yarin's SRM solution for an implementation of a similar approach
while using memoization.
</p>
 

					 <p>
					 <img src="/i/m/Wernie_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
					 By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=307638"><strong>Wernie</strong></a><br />
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
