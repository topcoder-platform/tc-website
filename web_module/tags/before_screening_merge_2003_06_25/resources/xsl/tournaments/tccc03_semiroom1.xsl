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
                <xsl:with-param name="title">Room 1: Summary &amp; Photos</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 1 Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/room1_main.jpg" alt="" width="200" height="433" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">What is Yarin thinking about?</td></tr>
                        </table>
                                
                        <h2>Yarin moves on</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Friday, April 4, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets" class="bodyText">View current bracket</a></p>

                        <p>Maybe it was the later-than-normal start, or the fact that there are so many onsite tournament newbies, 
                        but the tournament room was bustling with traffic for the Round 1 competition.  More in line with past 
                        tournaments, however, the problem set seemed to be the big winner of the morning.</p>

                        <p><strong>Yarin, </strong><strong>evd</strong> and <strong>yike</strong> started out the round by opening the 200 point problem first.  In what may have been 
                        a strategic error, <strong>StefanPochmann</strong> took the opposite route by opening the 1000 pointer first.  <strong>Yarin</strong> submitted 
                        first, gaining 170.84 on his 200 point solution.  <strong>evd</strong> sent his solution in second for 155.93 points on the 
                        200-pointer.  <strong>yike</strong> was in third, getting 129.35 on his 200-point problem.  Even before <strong>StefanPochmann</strong> 
                        could submit his 1000-pointer, <strong>Yarin</strong> sent in his solution for the 550 point problem for 337.35 points.  
                        The 5th submission of the morning came from <strong>StefanPochmann,</strong> giving him 424.74 points for the 
                        1000-pointer.  Further testing prompted <strong>StefanPochmann</strong> to resubmit his 1000-point solution, which 
                        cost him an additional 124.74 points, leaving him with exactly 300 points on the problem.  In the 
                        meantime, <strong>evd</strong> and <strong>yike</strong> attempted to solve the 550 point problem, while <strong>Yarin</strong> worked away on the 1000 
                        pointer.  <strong>StefanPochmann</strong> surprised the crowd with a last second submission of his 200 point problem for 
                        163.65 points.</p>

                        <p><strong>StefanPochmann</strong> waited until there were 10 seconds left in the Challenge Phase to provide the only action 
                        by unsuccessfully challenging <strong>yike's</strong> 200-pointer.  At the end of the challenge phase, the scores were <strong>Yarin</strong> 
                        with 508.19, <strong>StefanPochmann</strong> with 413.65, <strong>evd</strong> with 159.53 and <strong>yike</strong> with 129.35.</p>

                        <p>System tests were kind to everyone except <strong>StefanPochmann,</strong> who lost all his points due to a time-out on the 
                        200 pointer and a small bug on the 1000.  The results for Round 1 of the 2003 Sun Microsystems and 
                        TopCoder Collegiate Challenge are a follows:</p>
                         
                        <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Yarin</td>
                                 <td width="50" class="bodyText" align="right" nowrap="nowrap">508.19</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Evd</td>
                                 <td width="50" class="bodyText" align="right" nowrap="nowrap">159.53</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap"> Yike</td>
                                 <td width="50" class="bodyText" align="right" nowrap="nowrap">129.35</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">StefanPochmann</td>
                                 <td width="50" class="bodyText" align="right" nowrap="nowrap">-&#160;50.00</td>
                             </tr>
                        </table>		

                        <p>Congratulations to <strong>Yarin</strong> on a solid victory this morning!  Good luck to the Round 2 competitors - <strong>axch, </strong>
                        <strong>dmwright, </strong><strong>mathewsb </strong>and<strong> niteneb.</strong></p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Semifinal Room 1 Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_01.jpg');"><img src="/i/tournament/tccc03/room1_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_02.jpg');"><img src="/i/tournament/tccc03/room1_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_03.jpg');"><img src="/i/tournament/tccc03/room1_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_04.jpg');"><img src="/i/tournament/tccc03/room1_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_05.jpg');"><img src="/i/tournament/tccc03/room1_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/room1_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_06.jpg');"><img src="/i/tournament/tccc03/room1_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_07.jpg');"><img src="/i/tournament/tccc03/room1_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_08.jpg');"><img src="/i/tournament/tccc03/room1_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_09.jpg');"><img src="/i/tournament/tccc03/room1_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room1_10.jpg');"><img src="/i/tournament/tccc03/room1_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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


