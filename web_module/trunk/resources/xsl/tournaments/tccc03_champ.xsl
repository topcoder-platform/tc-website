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
        <td width="170" bgcolor="#CCCCCC">
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
                <xsl:with-param name="title">Championship Summary &amp; Photos</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Championship Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="left">
                            <tr valign="top"><td align="left"><img src="/i/tournament/invit02/tourney_photo_SFR1.jpg" alt="" width="200" height="435" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">SnapDragon takes Round One with ease.</td></tr>
                        </table>
                                
                        <h2>As expected, SnapDragon struts his stuff</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Friday, April 4, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets">View current brackets</a></p>

                        <p>In front of a sparse crowd, the morning competitors dealt with some minor system issues and tough 
                        problem statements as the first round of competition started at 8:00am. </p>

                        <p>All four competitors started the round by opening the 300-point problem.  Ten minutes later, 
                        <b>SnapDragon</b> was the first to weigh in with a submission for 268.59 points.  Within the next 
                        minute, both <b>malpt</b> and <b>ambrose</b> submitted their solutions for 260.51 points and 257.85 points, 
                        respectively.  <b>kyky</b> worked on his solution for 7 more minutes before submitting for 219.80 points.</p>

                        <p>Surprisingly, <b>malpt</b> submitted his solution to the 500-point problem after only working on it 
                        for 7 minutes, receiving just over 370 points.  Upon further inspection of the problem statement, 
                        however, he quickly realized that he had misread it, and began working on his resubmission.  
                        <b>ambrose</b> was next to submit a solution 35 minutes into the contest, and received 326.37 points 
                        for the 500-point problem.  Two minutes later, <b>SnapDragon</b> submitted his 500-point solution for 
                        300.55 points.  <b>kyky</b>, after reading the 1050-point problem, decided to work on the 500 instead.  
                        Unfortunately, he would not submit a solution to either problem.</p>

                        <p>For the next 36 minutes, all was quiet on the submission front.  Then, with seven minutes left in 
                        the coding phase, <b>malpt</b> resubmitted his solution to the 500-point problem for 150.00 points, 
                        losing over half of his original points and decreasing his point total to 410.51.  <b>SnapDragon</b> 
                        had the last say, submitting his solution to the 1050-point problem with five minutes left in 
                        the round for 521.09 points.  At the end of the coding phase, the point totals stood at 
                        1090.23 (<b>SnapDragon</b>), 584.22 (<b>ambrose</b>), 410.51 (<b>malpt</b>), and 219.80 (<b>kyky</b>).</p>

                        <p>The challenge phase was quiet for nearly 14 minutes.  Then, after lots of thought, testing, 
                        and agonizing, <b>SnapDragon</b> successfully challenged <b>ambrose</b>'s 500-point solution, further 
                        increasing his lead by 50 points.  The system test phase was kind to everyone but <b>kyky</b>, 
                        who lost his 219.80 points, causing him to finish with 0 points.</p>

                        <p>In the end, <b>SnapDragon</b> showed why he is the current Top Coder, being the only competitor 
                        of the round to finish all three problems and submit a successful challenge.  Perhaps 
                        <b>malpt</b>'s simple statement summed it up best: "It's tough to beat <b>SnapDragon</b> when he 
                        correctly solves all three problems."  Luckily for <b>malpt</b>, the casino floor is just 
                        a short walk away _ he can always place his winnings on double zero, spin the roulette wheel, and hope for the best...</p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Championship Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR102.jpg');"><img src="/i/tournament/invit02//SFR102_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR102.jpg');"><img src="/i/tournament/invit02//SFR102_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR103.jpg');"><img src="/i/tournament/invit02//SFR103_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR104.jpg');"><img src="/i/tournament/invit02//SFR104_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR105.jpg');"><img src="/i/tournament/invit02//SFR105_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/invit02//SFR102.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig"/></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR106.jpg');"><img src="/i/tournament/invit02//SFR106_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR107.jpg');"><img src="/i/tournament/invit02//SFR107_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR108.jpg');"><img src="/i/tournament/invit02//SFR108_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR109.jpg');"><img src="/i/tournament/invit02//SFR109_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR1010.jpg');"><img src="/i/tournament/invit02//SFR1010_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>              
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


