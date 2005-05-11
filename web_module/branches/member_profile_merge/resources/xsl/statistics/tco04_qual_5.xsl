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

<title>TCO04 Qualification 5 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Qualification Problem Set 5</font></td>
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
Jongman was one of two yellow coders to win his problem set, and he did so by
over 70 points, beating second place ZorbaTHut, and third place kalinov, not to
mention every one's favorite problem writer, Yarin.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2969&amp;rd=5877" name="2969">TheThe</a></b> 
</font> 
<A href="Javascript:openProblemRating(2969)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      197 / 211 (93.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      168 / 197 (85.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gepa</b> for 248.02 points (2 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      218.90 (for 168 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
A good string tokenizer was all you needed in this problem.  Simply loop through
all of the lines, tokenizing each one into words.  Then, look at all pairs of
adjacent lines, and see if the first token of one line matches the last token of
the preceding line.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2979&amp;rd=5877" name="2979">FewestTurns</a></b> 
</font> 
<A href="Javascript:openProblemRating(2979)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      81 / 211 (38.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 81 (45.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 796.40 points (12 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      481.02 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This is a pretty standard search problem.  The most efficient way to do it is
with a breadth first search, but a simpler depth first search can be made to
work as long as you are careful about not blowing the stack.  Most coders went
for a breadth first approach, so I'll discuss that one.  The basic idea here is
like any other breadth first search problem, you have a first in, first out
queue.  Each element in the queue represents a location and direction in the
map.  You also have a table which tells how many turns it has taken to get to a
particular location in a particular direction.  After you take a location and
direction off the queue, you look at all the positions and directions that can
be reached from there.  For each one, you also look up how many turns it has
taken in the table.  If the value in the table doesn't exist, or is greater than
the number of turns required to get there from the location we took off the
queue, we insert the location and direction into the queue, and update the
table.  At the end, we return the minimum value in the table for the final
position and some direction.
</p>
<pre>
    queue q;
    table t;
    initialize t[a][b][c] = INF, for all a,b,c;
<font color="blue">//insert starting location and all four directions</font>
    q.insert(startx,starty,0);
    q.insert(startx,starty,1);
    q.insert(startx,starty,2);
    q.insert(startx,starty,3);
    t[startx][starty][0] = 0;
    t[startx][starty][1] = 0;
    t[startx][starty][2] = 0;
    t[startx][starty][3] = 0;
    while(!q.isEmpty()){
        x = q.first().x;
        y = q.first().y;
        dir = q.first().dir;
        q.removeFirst();
        turns = table[x][y][dir];
        if(roadFrom(x,y,x+dx[dir],y+dy[dir])){
            if(t[x+dx[dir]][y+dy[dir]][dir] &gt; turns){
                t[x+dx[dir]][y+dy[dir]][dir] = turns;
                q.insert(x+dx[dir],y+dy[dir],dir);
            }
        }
        if(t[x][y][(dir+1)%4] &gt; turns+1){
            t[x][y][(dir+1)%4] = turns+1;
            q.insert(x,y,(dir+1)%4);
        }
        if(t[x][y][(dir+3)%4] &gt; turns+1){
            t[x][y][(dir+3)%4] = turns+1;
            q.insert(x,y,(dir+3)%4);
        }
    }
    return min(t[finalx][finaly][0],t[finalx][finaly][1],
        t[finalx][finaly][2],t[finalx][finaly][3]);
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
