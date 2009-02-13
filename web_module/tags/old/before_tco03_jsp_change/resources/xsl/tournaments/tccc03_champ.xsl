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
                <xsl:with-param name="title">Championship: Summary &amp; Photos</xsl:with-param>
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
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/champ_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dgarthur contemplates a question during the Semi-final Round.</td></tr>
                        </table>
                                
                        <h2>dgarthur takes home the crown</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Saturday, April 5, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets" class="bodyText">View current bracket</a></p>

                        <p>In a final round that saw 11 out of a possible 12 submissions, it was <strong>dgarthur</strong> who posted the highest 
                        score and walked away $50,000 richer as the Champion.</p>

                        <p>The contest started off with <strong>Yarin, </strong><strong>dgarthur</strong> and <strong>sjelkjd</strong> all opening the 250-point problem and 
                        <strong>dmwright</strong> opting to go with the 450.  <strong>Yarin</strong> took the early lead with a quick submission of the 250-pointer 
                        for 237.49 points.  He then moved on to the 450.  <strong>sjelkjd</strong> was in next with his submission to the 250, 
                        getting 213.97 points.  <strong>dgarthur</strong> brought in the lowest score on the 250 with his submission for 
                        202.96 points.  He and <strong>sjelkjd</strong> both moved on to the 450.  Even before <strong>dmwright</strong> could log his first 
                        submission, <strong>Yarin</strong> sent in his second, adding 385.26 points from his 450.  <strong>dmwright</strong> finally sent in 
                        his first submission for 303.43 points on the 450.  He moved on to the 950, leaving the 250 for last.  
                        <strong>dgarthur</strong> made up some ground by receiving 381.34 points for his 450-point submission, and moved 
                        to the 950.</p>

                        <p><strong>Yarin</strong> sent in the 7th submission of the round and added 760.04 points to his total.  In an impressive 
                        move, <strong>dgarthur</strong> submitted his 950-point solution for 863.41 points and pulled ahead of <strong>Yarin</strong> by 65 
                        points.  <strong>dmwright</strong> logged his 2nd submission for 709.86 points on the 950, then went to work on the 
                        250.  <strong>sjelkjd</strong> sent in his only other submission, getting 232.11 points on the 450.  <strong>dmwright</strong> sent in 
                        the 2nd highest 250-point submission for 231.85 points.  At the end of the Coding Phase, the point 
                        totals stood as follows:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1447.71</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Yarin</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1382.79</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1245.14</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">446.08</td>
                             </tr>
                        </table>		

                        <p><strong>sjelkjd</strong> offered the only action of the Challenge Phase by unsuccessfully challenging all 3 950-point 
                        submissions and <strong>Yarin's</strong> 450-point submission.  System tests proved that challenging any of the other 
                        competitor's submissions was in vain, as all submissions passed.  The final scores looked quite similar 
                        to those at the end of the Coding Phase:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1447.71</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Yarin</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1382.79</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1245.14</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">246.08</td>
                             </tr>
                        </table>		

                        <p><strong>dgarthur</strong> was all smiles during the media hour, and rightfully so.  He performed perfectly through 
                        two onsite rounds and beat six very worthy competitors in two days.  Congratulations to dgarthur and 
                        the 15 other semi-finalists for a great weekend of coding!</p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Championship Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_01.jpg');"><img src="/i/tournament/tccc03/champ_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_02.jpg');"><img src="/i/tournament/tccc03/champ_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_03.jpg');"><img src="/i/tournament/tccc03/champ_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_04.jpg');"><img src="/i/tournament/tccc03/champ_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_05.jpg');"><img src="/i/tournament/tccc03/champ_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_06.jpg');"><img src="/i/tournament/tccc03/champ_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_07.jpg');"><img src="/i/tournament/tccc03/champ_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_08.jpg');"><img src="/i/tournament/tccc03/champ_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_09.jpg');"><img src="/i/tournament/tccc03/champ_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_10.jpg');"><img src="/i/tournament/tccc03/champ_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/champ_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_11.jpg');"><img src="/i/tournament/tccc03/champ_11_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_12.jpg');"><img src="/i/tournament/tccc03/champ_12_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_13.jpg');"><img src="/i/tournament/tccc03/champ_13_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_14.jpg');"><img src="/i/tournament/tccc03/champ_14_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_15.jpg');"><img src="/i/tournament/tccc03/champ_15_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>            

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_16.jpg');"><img src="/i/tournament/tccc03/champ_16_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_17.jpg');"><img src="/i/tournament/tccc03/champ_17_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_18.jpg');"><img src="/i/tournament/tccc03/champ_18_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_19.jpg');"><img src="/i/tournament/tccc03/champ_19_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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


