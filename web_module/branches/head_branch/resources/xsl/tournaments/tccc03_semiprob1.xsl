<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03summary_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

<!-- Include external CSS files -->
<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
</head>

<body>

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<a name="top_page"></a>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">Room 1: Problems</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 1 Problem Analysis &amp; Opinion</strong></td></tr>
                <tr valign="top">
                    <td width="10%" class="bodyText">
                        <p>Friday, April 4, 2003</p>
                        
                        <P><B>Problem Set Analysis &amp; Opinion</B></P>
                        <p>
						Semifinal Round 1 proved to be one of the most exciting in recent history. Yarin and Evd raced to see who 
						would complete the easy first, while StefanPochmann worked diligently on the hard problem.  
						Yarin was the first to finish the easy, and immediately started the medium, with Evd close behind.  
						Yike submitted the easy soon after.  StefanPochmann began testing his hard early shocking onlookers, 
						but wasn't ready to submit till much later.  After Yarin submitted the medium, StefanPochmann 
						submitted his hard.  Things were beginning to get crazy, when onlookers saw Stefan wasn't opening 
						any of the other problems.  Then, Stefan recompiled the hard alerting spectators to the situation at 
						hand.  Stefan later resubmitted the hard, and soon after, submitted the easy.  Yarin raced to try 
						and complete the hard, but couldn't finish on time.  Only one challenge was issued during the 
						challenge phase, an unsuccessful attempt by StefanPochmann.  Once systests were done, Yarin clearly won, 
						with Stefan failing on both of his submissions.  In the end, nobody correctly submitted the hard.  
						Once the round was over everyone was in agreement, the set was "evil", particularly under tournament 
						conditions.  SnapDragon said afterward, "If I'd competed in it, I'd have gotten 1 question!"  
						Good luck to Yarin in the next round.</p>
						
						<font size="+2"><b>TCU</b></font><BR />
						Used as: Division 1 - Level 1:
						<blockquote>
						<table cellspacing="2" cellpadding="2">
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Value</b></td>
						<td style="background: #eee;" class="bodyText">200</td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
						<td style="background: #eee;" class="bodyText">4 / 4  (100.00%) </td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
						<td style="background: #eee;" class="bodyText">3 / 4  (75.00%)</td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
						<td style="background: #eee;" class="bodyText"><b>Yarin</b> for 170.84 points</td>
						</tr>
						</table></blockquote>
						<p>
						In this problem, coders are given the initial number of students in each college major, as well as, 
						the tendency for students to switch majors each year.  To find the final number of students in 
						each major, you can iteratively apply the yearly major switches for the required number of years.  
						The trick here is to carefully round all results, so there are no fractional transfers.  That way, 
						the number of students at TCU isn't changed as a result of imprecise arithmetic.</p>

						<font size="+2"><b>FaceFinder</b></font><BR />
						Used as: Division 1 - Level 2:
						<blockquote>
						<table cellspacing="2" cellpadding="2">
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Value</b></td>
						<td style="background: #eee;" class="bodyText">550</td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
						<td style="background: #eee;" class="bodyText"> 1 / 4  (25.00%) </td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
						<td style="background: #eee;" class="bodyText"> 1 / 1  (100.00%)</td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
						<td style="background: #eee;" class="bodyText"><b>Yarin</b> for 337.35 points</td>
						</tr>
						</table>
						</blockquote>
						<p>
						An easy way to solve this problem, given the restrictive input constraints, is to create a large two 
						dimensional array.  By using a fill algorithm, all of the regions of the plane can be labeled thus 
						giving the total number of regions.  A more inspired solution, that would work on much larger inputs, 
						would make use of Euler's formula:
						<pre>
n - m + f = 1 + k
where n represents the total number of line endpoints or distinct intersection points
	m represents the total number of line segments
	f represents the total number of regions
	k represents the total number of components
						</pre>
						To clarify, a component is a connected region of the plane.  2 line segments belong to the same component 
						if you could travel from one to the other using only line segments and intersection points (no jumping).  
						Since Euler was such a prolific mathematician, he has numerous theorems and formulas named after him.  
						This particular formula usually goes by the name Euler's Polyhedral Formula.  By determining all of 
						the intersections of the given line segments, n, m, and k can be easily calculated thus producing f.
						</p>

						<font size="+2"><b>HardwareOptimize</b></font><BR />
						Used as: Division 1 - Level 3:
						<blockquote>
						<table cellspacing="2" cellpadding="2">
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Value</b></td>
						<td style="background: #eee;" class="bodyText">1000</td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
						<td style="background: #eee;" class="bodyText">1 / 4  (25.00%) </td>
						</tr>
						<tr>
						<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
						<td style="background: #eee;" class="bodyText">0 / 1 (0.00%)</td>
						</tr>
						<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td>
						<td style="background: #eee;" class="bodyText"><b></b></td>
						</tr>
						</table>
						</blockquote>
						<p>
						This problem is all about building parse trees.  The first is built while trying to validate the 
						correctness of the expression given.  A simple recursive descent parser can quickly check whether 
						the input adheres to the required grammar.  If the grammar is valid, the parser can be coded 
						to produce a tree representing the input.  The interior nodes of the tree will be operators while 
						the leaves will be numbers.  Once the main tree is built, the minimum implementation cost must be 
						determined.  This can be calculated by traversing the tree in a bottom up fashion.  At each node, 
						you can determine which subtrees rooted at that node exist in the available instructions.  
						This requires that the instructions be parsed as well, and built into parse trees.  
						The subtree producing the minimum cost becomes the value for that node.  The cost of a subtree 
						is the cost of its leaves, plus the cost of the instruction required to process the subtree.  
						Once this process is complete, the root of the whole tree has the best possible cost.
						</p>
						
                        <IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
						By&#160;brett1479<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=251317" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
                        
                        <p><br/></p>
          
                    </td>
                </tr>                  

                    
            </table>

            <p><br/></p>
        
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>
<!-- Body Ends -->

<!-- Foot begins -->
<xsl:call-template name="Foot"/>
<!-- Foot ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>


