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

<title>Single Round Match 257 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 257</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Monday, August 8, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
With solid times on all three problems, Petr took first by over 100 points.
tmyklebu had the best time one the hard problem by far, and despite a failed
medium submission, he took second.  kalinov took third thanks to a challenge.
In division 2, sfcommand took first, followed by Minny and newcomer WSX.
</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4713&amp;rd=8005" name="4713">SubstitutionCode</a></b>
</font>
<A href="Javascript:openProblemRating(4713)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      315 / 340 (92.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      291 / 315 (92.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>kissaki</b> for 249.31 points (1 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      212.81 (for 291 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The simplest way to solve this problem was to look at each character in the code, starting from the first character, in order. As you go along, you keep an integer representing the value so far. If the character in the code is not in the key, you simply ignore it. Otherwise, you multiply the integer by 10, and add the number represented by the character. This is the standard way to parse numbers in any base: look at each character one at a time, multiplying by the base (10 in this case) and then adding each time.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3494&amp;rd=8005" name="3494">BridgePts</a></b>
</font>
<A href="Javascript:openProblemRating(3494)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      301 / 340 (88.53%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      240 / 301 (79.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agent_smith</b> for 499.83 points (0 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      377.21 (for 240 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was pretty straightforward.  It's easy to add up the points for the
jacks, queens, kings and aces.  To add up the points for short suits, just count
how many cards of each suit you have.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4520&amp;rd=8005" name="4520">TimeCard</a></b>
</font>

<A href="Javascript:openProblemRating(4520)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      139 / 340 (40.88%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 139 (23.74%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Minny</b> for 738.74 points (18 mins 18 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      507.17 (for 33 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Working in 12 hour format is cumbersome.  In these sorts of problems, it's
typically best to convert the input format to a single integer, representing the
number of minutes past midnight.  The easiest way to do this is:

<pre>
    int time = hour%12*60+minute;
    if(pm)time += 12*60;
</pre>
Once you have everything as an integer, it's easy to compute the duration between
two time stamps: 
<pre>
    duration = (time2 - time1 + 24*60)%(24*60);
</pre>
Adding up all the durations, you can figure out how many more minutes you need
to reach 40 hours (or that this is impossible, in which case you return one of the two
special cases).  If you need <tt>minutes</tt> more minutes to reach 40 hours, and the
last time is in <tt>last_time</tt>, then you can get off work at <tt>ret = (minutes +
    last_time) % (24*60)</tt> minutes past midnight.  Finally, you need to
convert this to the appropriate return format.  You can compute the appropriate
parts as follows:

<pre>
    int hours = ret/60%12;
    if(hours == 0)hours = 12;
    int minutes = ret%60;
    boolean pm = ret &gt;= 12*60;
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3496&amp;rd=8005" name="3496">Predicting</a></b>
</font>
<A href="Javascript:openProblemRating(3496)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      240 / 319 (75.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      171 / 240 (71.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>antimatter</b> for 290.16 points (5 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      209.65 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Many coders missed the part of the problem that said that the weights must add
up to exactly 1.  Assuming you saw that, the problem wasn't too bad.  Since
you always predict from exactly 5 previous values, you can easily solve this
with 4 nested loops, each going from -1 to +1 in increments of 0.1.  You can
calculate the 5<sup>th</sup> weight as <tt>d5 = 1-d1-d2-d3-d4</tt>.  Assuming that
this fifth weight is between -1 and +1, inclusive, you can compute the weighted
average for each of the values beyond the fifth, and find the average error as
described.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4706&amp;rd=8005" name="4706">StockQuotes</a></b>

</font>
<A href="Javascript:openProblemRating(4706)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      185 / 319 (57.99%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      61 / 185 (32.97%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 381.52 points (12 mins 30 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      265.44 (for 61 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The parts of the return corresponding to the exchanges are relatively simple to
calculate.  Each new quote corresponds to a change in the quote, so the COUNT
part of the return is just the number of times that the exchange appeared in the
input.  The average spread for an exchange is also pretty easy to calculate,
since it's just a simple average over the spread from the input for that exchange.<br/><br/>

The information corresponding to the inside quote is a bit more difficult to
calculate.  To calculate the inside quote, you need to keep track of the most
recent quote from each of the exchanges that have issued at least one quote.
The inside quote can be calculated from this information as described in the
problem, by finding the highest bid and the lowest ask.  After each new quote,
you should recalculate the inside quote and see if it changed.  If it changes,
include that spread as part of the average spread, and increment the
count.<br/><br/>
Finally, you need to be particularly careful about the rounding mode you use for
rounding your return to 2 digits.  The default rounding mode in many methods is
to round 0.005 towards the even number, not just up.  Many solutions failed
because they rounded 0.625 to 0.62 instead of 0.63.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2006&amp;rd=8005" name="2006">Computers</a></b>
</font>
<A href="Javascript:openProblemRating(2006)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      32 / 319 (10.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      19 / 32 (59.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tmyklebu</b> for 941.65 points (7 mins 9 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      585.31 (for 19 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p> 
There are a few different ways you can do the dynamic programming for this
problem.  Since tmyklebu had the highest score, I'll describe a solution similar
to his.  First, observe that each computer must have at least <b>minInComp</b>
processors.  So, we can immediately remove <b>minInComp</b>*<b>amount</b>
processors, and reduce <b>minInComp</b> to 0, to get an equivalent problem.
Now, there are two basic cases that we need to handle.  We can have some positive
number of computers with 0 processors (<b>minInComp</b> processors in the
original problem).  Alternatively, we can have 0 computers with 0
processors, in which case the <b>minDif</b> doesn't come into play, as we could
have computers with just 1 processor.  In the first case, we will account for
some of the computers and assign a number of processors to them.  In this case,
the remaining computers must have at least <b>minDif</b> processors (the ones we
just assigned had 0 processors), so we
subtract that many processors and recurse.  In the
second case, where we have 0 computers with 0 processors, all of the computers
must have at least 1 processor.  In this case, we can subtract 1 processor for
each computer that we must make, and we still need to make the same number of
computers.  In both cases, the key realization is that the answer to
choices(n,minDif,minInComp,amount) is the same as the answer to
choices(n-minInComp*amount,minDif,0,amount), assuming that 0 is an acceptable
value for minInComp.<br/><br/>

So, our basic recurrence goes as follows:
<pre>
    <font color="blue">//go() returns the number of ways to make amount 
    //computers with n processors, assuming that the
    //minimum number of processors per computer is 0</font>
    long go(int n, int amount){
        <font color="blue">//too few processors, return 0</font>
        if(n&lt;0)return 0;
        <font color="blue">//1 way to assign 0 processors to the computers -- 
        //0 processors to each one</font>
        if(n==0)return 1;
        <font color="blue">//all computers assigned, but extra processors</font>

        if(amount == 0)return 0;
        long ret = 0;
        <font color="blue">//assign 0 computers with 0 processors.  Each 
        //computer must have at least one processor.  
        //Same as n-amount processors for amount computers</font>
        ret += go(n-amount,amount);
        for(int i = 1 ;i&lt;=amount;i++){
            <font color="blue">//assign i computers to have 0 processors.  The
            //other amount-i computers must have at least minDif 
            //processors, so subtract (amount-i)*minDif from n, 
            //and i from amount and recurse.</font>
            ret += go(n-(amount-i)*minDif,amount-i);
        }
        return ret;
    }
    long choices(int n, int minDif, int minInComp, int amount) {
        return go(n-minInComp*amount,amount);
    }
</pre>
As you'd expect, you need to memoize your recursive function to make it run
within the time limit.  This is just standard dynamic programming though, and you can just use a 2D array.
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
