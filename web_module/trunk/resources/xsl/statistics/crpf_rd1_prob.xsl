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

<title>CRPF Charity Challenge Round 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">CRPF Charity Challenge Round 1</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, November 11, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
I always love watching, and writing about tournaments, but tonight's competition was better than usual.  
The first round of the TopCoder Charity Challenge united coders to help a great cause.  Everyone was in 
high spirits, and it seemed to affect their performance.  Coders were in top form, with 23 people scoring 
over 1000.  In an unusual twist of events, yellow rated competitors dominated the score board, with only 
2 reds winning their rooms.  indigo9, a blue rated coder, surpassed 5 higher ranked coders, including 2 
reds, to win room 5.  It is clear that Monday's final competition for the 4 winning spots will be exciting.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>AustrianLotto</b> 
</font> 
<A href="Javascript:openProblemRating(1934)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      75 / 75 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 75 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gladius</b> for 248.13 points (2 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      232.03 (for 75 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This is a classic tallying problem:  "Given a set of events, count how many of each variety there are."  We first allocate an array, which will hold the counts of each type.  Then we process each event, and increment the correct counter.  Once done, our array is the solution.  Java code follows:<pre>
public int[] evaluate(String drawing, String[] picks) {
   int[] ret = new int[7];
      String[] dtoks = drawing.split(" "); //Split by spaces
      for (int i = 0; i &lt; picks.length; i++) {
         String[] currToks = picks[i].split(" "); //Split by spaces
            int cnt = 0;
            for (int x = 0; x &lt; currToks.length; x++) {
               for (int y = 0; y &lt; dtoks.length; y++) {
                  if (Integer.parseInt(dtoks[y])==Integer.parseInt(currToks[x])) cnt++;
               }
            }
      ret[cnt]++; //Increment counter
   }
   return ret;
}
</pre>
</p> 

<font size="+2"> 
<b>RoomSummary</b> 
</font> 
<A href="Javascript:openProblemRating(1935)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      65 / 75 (86.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 65 (47.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Maris</b> for 404.29 points (14 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      307.75 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, coders were required to simulate a competition round and return the scores of each player.  Since the constraints verified the round would proceed normally, no input error checking was required.  First build a 2-dimensional array whose rows represent coders, and columns represent each problem.  Next loop through each submission, and record the scores in the array.  Similarly loop through each challenge, and then each systest, recording score changes in the array.  When all is done, final scores can be extracted from the table.  Using a hand coded sort or comparator, the coders can be arranged into proper order.  The final step is to output in the correct format.  To convert from doubles, simply multiply by 100, cast to an int, and then extract the required digits.
</p> 

<font size="+2"> 
<b>CongruenceLock</b> 
</font> 
<A href="Javascript:openProblemRating(1936)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      44 / 75 (58.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 44 (56.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abiczo</b> for 953.74 points (6 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      839.90 (for 25 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Two different solutions to this problem come to mind, both of which use an array to cache results in a dynamic programming fashion.  The first method loops over the different kinds of buttons.  Once the ith iteration is complete, the array will store the least possible number of presses required to produce any target, using the first i buttons.   Code for this method follows:<pre>
public int minPushes(int current, int target, int[] buttons) {
   int[] dp = new int[100000];
   Arrays.fill(dp,-1);
   dp[current] = 0;
   for (int i = 0; i &lt; buttons.length; i++) {
      for (int xx = 0; xx &lt; dp.length; xx++) {
         int x = xx;
         if (dp[x]==-1) continue;
         int next = (x+buttons[i])%100000;
         while (dp[next] ==-1 || dp[next] &gt; dp[x]+1) { //HERE
            dp[next] = dp[x]+1;
            x = next;
            next = (next+buttons[i])%100000;
         }
      }
   }
   return dp[target];   
}
</pre>
For a given button, to efficiently account for all reachable targets, we loop over each value.  Then, in the loop marked HERE, we continually push the button, as long as it continues to improve the scores for the targets we reach.  Another method used by many coders, was to implement a table-aided breadth-first-search.  Instead of looping over buttons, we loop over the number of button presses, stopping when we reach the target.  Since the table stores the targets already produced earlier in the search, we can avoid reexamining those values.
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

