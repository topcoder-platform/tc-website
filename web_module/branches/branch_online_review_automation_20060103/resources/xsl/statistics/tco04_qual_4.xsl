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

<title>TCO04 Qualification 4 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Qualification Problem Set 4</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">September 7-8, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
The Easy problem was really easy, but the Hard problem made this set brutal.
Only 7 coders passed system tests on the Hard, led by <b>Eryx</b> and 
<b>tomek</b>.  Congratulations to <b>jasonw</b>, who made red for the first 
time by solving both problems.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2973&amp;rd=5876" name="2973">Genetics</a></b> 
</font> 
<A href="Javascript:openProblemRating(2973)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      206 / 215 (95.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 206 (97.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 197.93 points (2 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      173.19 (for 200 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Once you know how to handle a single pair of genes,
it is simply a matter of looping through all the pairs.
<pre>
    String answer = "";
    for (int i = 0; i &lt; dom.length(); i++)
      answer += qualityOf(g1.charAt(i), g2.charAt(i), dom.charAt(i));
    return answer;
</pre>
Now, what does the <tt>qualityOf</tt> function do?  Basically, you want
the following logic:
<pre>
    char qualityOf(char x, char y, char dom) {
      if (<i>both uppercase</i>) return <i>uppercase</i>
      if (<i>both lowercase</i>) return <i>lowercase</i>
      // one uppercase and one lowercase
      if (dom == 'D') return <i>uppercase</i>
      if (dom == 'R') return <i>lowercase</i>
    }    
</pre>
Noting that uppercase letters have smaller ASCII codes than lowercase
letters, you could write
<pre>
      if (x == y) return x;
      if (dom == 'D') return min(x,y);
      if (dom == 'R') return max(x,y);
</pre>
or even just
<pre>
      return (dom == 'D') ? min(x,y) : max(x,y);
</pre>
because <tt>min</tt> and <tt>max</tt> will give you the right answer
when <tt>x</tt> and <tt>y</tt> are equal.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2994&amp;rd=5876" name="2994">PhoneSearch</a></b> 
</font> 
<A href="Javascript:openProblemRating(2994)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      29 / 215 (13.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 29 (24.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 661.61 points (21 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      502.68 (for 7 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This was by far the hardest problem in the qualification round.
The first step was to convert the single-letter frequencies
into relative frequencies for each of the 26*26*26 three-letter 
prefixes.  Suppose the phone book has some arbitrarily large number
of names in it, and consider some prefix <tt><i>XYZ</i></tt>.  
Let <tt>N</tt> be
the sum of the single-letter frequencies.
The fraction of names that start with <tt><i>X</i></tt> is
<tt>freq[<i>X</i>]/N</tt>, the
fraction of names starting with <tt><i>X</i></tt> that have <tt><i>Y</i></tt> 
in the second position is 
<tt>freq[<i>Y</i>]/N</tt>, and the fraction of names starting with <tt><i>XY</i></tt>
that have <tt><i>Z</i></tt> in the third position is
<tt>freq[<i>Z</i>]/N</tt>.  Altogether, the fraction of names that start with
<tt><i>XYZ</i></tt> is 
<tt>(freq[<i>X</i>]*freq[<i>Y</i>]*freq[<i>Z</i>])/(N*N*N)</tt>.  Multiply
all such fractions by <tt>N*N*N</tt> to get the relative frequencies of
all prefixes as integers.
</p>

<p>
Next, we need some way to sum the relative frequencies of all prefixes
between two prefixes <tt>lo</tt> and <tt>hi</tt>.  
(I'll assume the range from 
<tt>lo</tt> to <tt>hi</tt> is inclusive, but you could also make it 
exclusive, or&#8212;my favorite&#8212;inclusive of <tt>lo</tt> but 
exclusive of <tt>hi</tt>.)
Pretend we have a function 
<tt>sum(lo,hi)</tt> that computes this sum.  
  A very efficient way to calculate the 
sum is to precalculate a table of cumulative sums, and simply return 
<tt>cumulative[hi+1]-cumulative[lo]</tt>.  But the problem sizes were small
enough that you could probably get away with a simple loop.
</p>

<p>
Now, suppose <tt>lopage</tt> is the lowest page the desired prefix
might occur on, and <tt>lopre</tt> is the lowest prefix that might occur
on that page.  Similarly, suppose <tt>hipage</tt> is the highest page
the desired prefix might occur on, and <tt>hipre</tt> is the highest
prefix that might occur on that page.  There are <tt>P=hipage-lopage+1</tt>
pages under consideration.
</p>

<p>
The first page on which we expect the desired prefix, <tt>pre</tt>, to
appear depends on the weighted fraction of prefixes that precede 
<tt>pre</tt> within the range from <tt>lopre</tt> to <tt>hipre</tt>. 
This fraction is 
<tt>sum(lopre,pre-1)/sum(lopre,hipre)</tt>, where
<tt>pre-1</tt> is the prefix just before <tt>pre</tt> alphabetically.
To turn this fraction into a page number, we adjust it as 
<tt>lopage + P*sum(lopre,pre-1)/sum(lopre,hipre)</tt>, rounded
down.
Similarly, we expect the first page of the next higher prefix to be
<tt>lopage + P*sum(lopre,pre)/sum(lopre,hipre)</tt>, also rounded
down.  We expect the desired prefix to extend onto the same page
as the next prefix, <i>except</i> when the page break falls exactly between
the two prefixes, which occurs when <tt>P*sum(lopre,pre)/sum(lopre,hipre)</tt>
is exactly an integer.  In that case, the desired prefix will extend only
to the previous page.  The last page on which we expect <tt>pre</tt>
to appear can thus be calculated as 
<tt>lopage + (P*sum(lopre,pre) - 1)/sum(lopre,hipre)</tt>,
where the minus one protects us from the page break.
</p>

<p>
The main search loop then looks something like
<pre>
  flips = 0;
  lopage = 0;
  hipage = <i>total number of pages</i> - 1;
  lopre = <i>AAA</i>;
  hipre = <i>ZZZ</i>;
  while (lopage &lt;= hipage) {
    P = hipage - lopage + 1;
    firstpage = lopage + P*sum(lopre,pre-1)/sum(lopre,hipre);
    lastpage = lopage + (P*sum(lopre,pre) - 1)/sum(lopre,hipre);
    midpage = (firstpage+lastpage)/2;
    flips++;

    if (prefix &lt; <i>first prefix on midpage</i>) {
      hipage = midpage - 1;
      hipre = <i>first prefix on midpage</i> - 1;
    }
    else if (prefix &gt; <i>last prefix on midpage</i>) {
      lopage = midpage + 1;
      lopre = <i>last prefix on midpage</i> + 1;
    } 
    else // found right page!
      return flips;
  }
  // no more pages to search!
  return -flips;
</pre>
Notice that this code is nearly identical to a binary search, except for
the calculation of <tt>midpage</tt>.
</p>

                        <p>
                        <img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=299177"><strong>vorthys</strong></a><br />
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
