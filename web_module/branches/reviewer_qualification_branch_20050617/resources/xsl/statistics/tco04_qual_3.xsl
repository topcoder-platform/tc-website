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

<title>TCO04 Qualification 3 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Qualification Problem Set 3</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">September 7-8, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
This set probably had the easiest hard problem, but it also had the most
difficult easy problem to balance things out.  reid was the quickest to finish
them both, and ended up less than 50 points ahead of snewman - if only there was
a challenge phase.  qubits, a TopCoder from way back showed up and took third
place, only a hair behind snewman.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2990&amp;rd=5875" name="2990">Rank</a></b> 
</font> 
<A href="Javascript:openProblemRating(2990)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      175 / 200 (87.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      154 / 175 (88.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 295.59 points (2 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214.45 (for 154 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
If you did this problem the hard way, it was surely the hardest of the qual
easies.  The hard way is to sort the elements, and then go through and rank
them, and finally to put the ranks in the right places in the return.  Granted,
this isn't that hard, but its a lot more work than the easy way that gave reid
over 295/300.  <br/><br/>

First, lets say there are no ties: in this case your rank is equal to one plus
the number of people who beat you.  Now, lets say you tied with one person, so
the two of you get ranks n and n+1, and the average is hence n+0.5.  Next, if
you tied with 2 other people, the three of you would get ranks of n, n+1, and
n+2, for an average of n+1.  The pattern developing here is that every tie adds
0.5 to your rank.  Hence, your ranks is one plus the number of people who beat
you, plus 0.5 times the number of people who tied you.  Therefore, two simple
nested loops are sufficient to calculate the ranks of all the competitors.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2974&amp;rd=5875" name="2974">GeneticCrossover</a></b> 
</font> 
<A href="Javascript:openProblemRating(2974)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 200 (41.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      62 / 82 (75.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 741.70 points (12 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      525.11 (for 62 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Was it the lower score, or was this problem really easier?  We'll never really
know, but it did end up with more submissions than any other hard.  The basic
principle needed to solve it is known as <i>linearity of expectations</i>.  This
says that, if you know the expected values of a number of variables, then the
expected value of the sum of those variables is equal to the sum of the expected
values of the variables, regardless of the dependencies among those
variables.<br/><br/>

In this problem, the variables were the values contributed by each gene, elements
of <b>dom</b> or <b>rec</b>.  The expected value of each of these variables was
equal to the <tt>p*dom+(1-p)*r</tt>, where p is the probability that a gene will
be expressed dominantly.  Since the return is simply the sum of all these
expected values (by linearity of expectations), we only need to find p for each
gene.<br/><br/>

If a gene does not depend on another gene, then p is equal to the probability
that one or both of the genes from the parents are dominant.  There are only 4
cases to consider for each gene, and it isn't hard to just look at all four
pairings.  Alternatively, <tt>p = 1-(2-q<sub>1</sub>)*(2-q<sub>2</sub>)/4</tt>,
where q<sub>1</sub> and q<sub>2</sub> are the numbers of recessive genes from
each parent has.  If gene i depends on gene j, we still have to compute the
above probability for gene i. Since gene i may only be dominant if gene j is
also, the we multiply the above value by the probability that gene j is
dominant, which gives us the probability that both j and i are dominant.
</p>
<pre>
	double[] p;
	int[] dep;
	public double cross(String p1a, String p1b, String p2a, String p2b, int[] dom, int[] rec, int[] dep){
		this.dep = dep;
		char[][] ch = new char[4][];
		ch[0]=p1a.toCharArray();
		ch[1]=p1b.toCharArray();
		ch[2]=p2a.toCharArray();
		ch[3]=p2b.toCharArray();
		p = new double[p1a.length()];
		for(int i = 0; i&lt;p1a.length(); i++){
        for(int j = 0; j&lt;2; j++){
				for(int k = 0; k&lt;2; k++){
					char c1 = ch[j][i];
					char c2 = ch[k+2][i];
					if(c1&gt;='A'&amp;&amp;c1&lt;='Z')p[i] += .25;
					else if(c2&gt;='A'&amp;&amp;c2&lt;='Z')p[i] += .25;
				}
			}
		}
		double ret = 0;
		for(int i = 0; i&lt;r.length; i++){
            double r = rec(i);
            ret += r * dom[i] + (1-r)*rec[i];
		}
		return ret;
	}
	double rec(int idx){
		if(dep[idx] == -1)return p[idx];
		else return p[idx] * rec(dep[idx]);
	}
</pre>

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
