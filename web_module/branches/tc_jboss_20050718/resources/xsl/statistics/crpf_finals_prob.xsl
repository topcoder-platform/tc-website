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

<title>CRPF Charity Challenge Finals Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">CRPF Charity Challenge Finals</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Monday, November 17, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
The final round of the TopCoder Charity Challenge saw a number of TopCoder's best vying for one of the 4 spots at the CRPF ball.  The 300 point problem proved to be little trouble for many members, with John Dethridge submitting first, after about 8 minutes.  But, his lead was short lived as po submitted the 575 pointer first.  Going down the stretch though, hamster was in the lead, submitting all 3 problems first.  However, a bug forced him to resubmit his 1000 pointer, and jms137, despite a slow start on the 300 and 575, came roaring back with a dominant 1000 score.  The challenge phase was pretty dull, as only one problem was successfully challenged.  However, that was not for lack of bugs, as the system tests wiped out many of the 575 and 1000 point submissions.  At the end of the match, it was jms137 who won by over 100 points, thanks to his impressive 1000 score.  Congratulations to jms137, John Dethridge, po and hamster.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>FullMonitor</b> 
</font> 
<A href="Javascript:openProblemRating(1929)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      37 / 42 (88.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 37 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>John Dethridge</b> for 279.87 points (7 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.33 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
TopCoder's always been on the cutting edge, and this week they unveiled their brand new, 3D monitors complete with 3,145,728 lasers.  Well, not quite, the 3D monitors are still in the simulation stage.  We are given a number of points in 3D space, and asked to determine first if it is possible to have only those points lit up, and if it is possible, how many lasers are required to be turned on.  The first step in this problem is to create 3 sets of lasers, one set for lasers orthogonal to the XY plane, another for the YZ plane, and a third for the XZ plane.  Then, for each point, we can add a laser to each of the 3 sets, one with the same X and Y coordinates, one with the same Y and Z coordinates and one with the same X and Z coordinates.  Then, we have to check and make sure all those lasers wouldn't light up any points not in the input.  To do this, we basically just check all triples of lasers, each of which is from a different plane:
<pre>
    foreach laser (X1,Y1) in XY
        foreach laser (Y2,Z1) in YZ
            foreach laser (X2,Z2) in XZ
                if(X1==X2 &amp;&amp; Y1==Y2 &amp;&amp; Z1==Z2 &amp;&amp; (X1,Y1,Z1 is not in the input)
                    return -1;
                end if
            end for
        end for
    end for
    return XY.size()+YZ.size()+XZ.size();
</pre>
Whenever we get this many nested loops, we should think a little about run time, but in this case there are at most 50 lasers per set, and 50^3 is relatively fast.
</p> 

<font size="+2"> 
<b>AlgoHill</b> 
</font> 
<A href="Javascript:openProblemRating(1946)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      575 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 42 (42.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 18 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>po</b> for 456.24 points (15 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      383.70 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
A* is a classic AI search method that uses a heuristic to improve upon the standard Djikstra's algorithm.  It turns out that as long as the heuristic is optimistic, meaning that its estimate is less than or equal to the actual distance to the goal, A* will find the optimal path.  The most standard way to implement A*, and other breadth first search methods, is to use a heap.  A heap allows you to insert, update and remove locations in O(lg n) time, which is usually pretty fast.  Each language has some class which will do most of the work for you, though you will probably have to at least write a comparator method.  In C++, you can use the priority queue template, and Java's TreeSet can be easily adapted.
<br/><br/>
However, in this problem, the input was small enough that you didn't really need to have fast operations.  In fact, you could probably search over each location to find the one with the lowest estimate, and then expand that one, and repeat.  Since there are at most 2500 locations, this means that you need to look at 2500 locations in the search, and you have to do this 2500 times.  2500^2 = 6,250,000, which is getting close to the 8 second time limit, but usually is small enough.  Another method that you could use, without a priority queue, and that would be pretty fast is to maintain a set of locations for each possible estimate (The worst case estimate is 7500).  So, in pseudocode, we'd do this as:
<pre>
    set s[7500];
    s[manhattan(goal,start)].add(start);
    int est[2500][2500]={0};
    int actual[2500][2500]={0};
    for(int i = 0; i&lt;=est[goal_x][goal_y]; i++){
        for each location loc in s[i]{
            for each location adj adjacent to loc{
                if(est[adj_x][adj_y] != 0){
                    s[est[adj_x][adj_y]].remove(adj);
                }else{
                    est[adj_x][adj_y] = INF;
                    actual[adj_x][adj_y] = INF;
                }
est[adj_x][adj_y] = min(est[adj_x][adj_y], est[loc_x][lox_y]+dist(loc,adj)+manhattan(adj,goal));
                actual[adj_x][adj_y] = min(est[adj_x][adj_y], est[loc_x][lox_y]+dist(loc,adj));
                s[est[adj_x][adj_y]].add(adj);
            }
        }
    }
</pre>
</p> 

<font size="+2"> 
<b>SetComparison</b> 
</font> 
<A href="Javascript:openProblemRating(1636)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      14 / 42 (33.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 14 (57.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jms137</b> for 800.95 points (14 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.62 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Most coders who solved this one did so by using some sort of object to represent their sets.  All of the languages have some sort of set utilities built in, and if you are familiar with these, they can make your life a lot easier in this problem.  The first task is to parse the input string, which can be done using a standard recursive decent parser.  Once you're done parsing, you really only need to be able to tell if something is an element of a set, and all of the other functions are pretty simple from there.  So, in the following code, we will assume that we have two sets, A and B, and that we have a contains function, a size function, and that we can retrieve all of the members of a set easily.
<pre>
    boolean isEquivalent(A,B){
        return isSubset(A,B) &amp;&amp; isSubset(B,A);
    }
    boolean isSubset(A,B){
        foreach element elem of A{
            if(!B.contains(elem))return false;
        }
        return true;
    }
    boolean isProperSubset(A,B){
        return isSubset(A,B) &amp;&amp; !isSubset(B,A);
    }
    boolean isPowerSet(A,B){
        if(A.size()==(1&lt;&lt;B.size())){
            foreach element elem of A{
                if(elem is atom || !subset(elem,B))return false;
            }
            return true;
        }
        return false;
    }
    boolean isEquipotent(A,B){
        return A.size()==B.size();
    }
</pre>
The one that most people struggled with was power set, but if you can determine membership of two sets, power set becomes almost trivial.  To see an excellent example of how the Java API helps with this problem, read up on how a HashSet work, or check out jms137's solution.
</p> 



                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
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

