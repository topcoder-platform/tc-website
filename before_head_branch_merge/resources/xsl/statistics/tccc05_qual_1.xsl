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

<title>TCCC05 Qualification 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Qualification Problem Set 1</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 11-12, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
Rooms 1 and 6 probably had the easiest hard problem, as 99 people got it right.
As a result, it had the highest cutoff of any room, and only a few people made
it in with only the easy problem.  Topping off the list of advancers was tomek,
with a comfortable lead over second place Wernie.  Andrew_Lazarev rounded out
the top 3 and denpoz ended up doing best amongst the newcomers, taking a
respectable 26<sup>th</sup> place.
</p> 
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3477&amp;rd=6523" name="3477">Fairness</a></b> 
</font> 
<A href="Javascript:openProblemRating(3477)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      146 / 175 (83.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 146 (72.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>weimashizhu</b> for 245.86 points (2 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.76 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
Most of the time, the easiest why to solve any sorting problem is to write a
comparator method and then use the built in sort function that your language of
choice provides.  In this case, we want to break ties in the sort by putting the
word that appears earlier in the input first.  This is known as a stable sort,
and you need to be sure that you use it, or else you could end up with tied
elements in the wrong order.  In Java, the default sort methods are all stable,
while in C++, you have to use stable_sort.  Writing the comparator is fairly
simple.  You just calculate the averages for each word with a couple of loops,
and then return -1, 0 or 1, depending on which of the averages is greater (or 0
if they are equal).
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3473&amp;rd=6523" name="3473">LandMines</a></b> 
</font> 
<A href="Javascript:openProblemRating(3473)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      116 / 175 (66.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      95 / 116 (81.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 913.62 points (7 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      631.54 (for 95 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
This problem can be solved using either a depth or breadth first search.  Depth
first search (DFS) is usually easier to code, so we'll go with that one.  The
basic idea of any DFS algorithm is to branch out from some start state, and keep
visiting new states until you can't find any unvisited states to visit, and then
backtrack.  In this case, the state is simply a location on the board.  From a
particular state, you can visit any of the 4 adjacent spaces, so long as the
metal detector doesn't beep in that direction.  It should be noted that you are
allowed to go to a previously visited location even if the metal detector beeps
in that direction.  However, this doesn't really matter because there is no
reason to ever visit a spot more than once as knowing where some of the mines
are doesn't help you deduce anything about other potential mines.  <br/><br/>

Also, you really don't have to worry very much about efficiency in this problem,
so its ok if your code to check for beeping is rather inefficient.  The code
below is very inefficient, as it does a lot of work over and over again to check
for beeps.  An improved version could precalculate whether the metal detector
beeps from each location, in each direction in O(N^2).  Then, the DFS would also
be O(N^2).  Yet, the version below is O(N^3), which is still plenty fast when N
is only 50.

<pre class="code">
boolean[][] visited;
String[] layout;
int ret = 0;
public int numClear(String[] layout){
    this.layout = layout;
    visited = new boolean[layout.length][layout[0].length()];
    dfs(0,0);
    return ret;
}
void dfs(int x, int y){
    if(x&lt;0||x&gt;=layout.length)return;
    if(y&lt;0||y&gt;=layout[0].length())return;
    if(visited[x][y])return;
    <font color="blue">//If we get here, x,y is an unvisited, valid state</font>
    ret++;
    visited[x][y] = true;
    boolean r1 = false, r2 = false;
    boolean c1 = false, c2 = false;
    <font color="blue">//r1, r2, c1, and c2 each represent a beep in a certain direction</font>
    for(int i = 0; i&lt;layout.length; i++){
        if(layout[i].charAt(y) == 'M' &amp;&amp; i &lt; x)r1 = true;
        if(layout[i].charAt(y) == 'M' &amp;&amp; i &gt; x)r2 = true;
    }
    for(int i = 0; i&lt;layout[0].length(); i++){
        if(layout[x].charAt(i) == 'M' &amp;&amp; i &lt; y)c1 = true;
        if(layout[x].charAt(i) == 'M' &amp;&amp; i &gt; y)c2 = true;
    }
    <font color="blue">//now recurse in each of the valid directions</font>
    if(!r1)dfs(x-1,y);
    if(!r2)dfs(x+1,y);
    if(!c1)dfs(x,y-1);
    if(!c2)dfs(x,y+1);
}
</pre>
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
