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
                <xsl:with-param name="title">Opening Ceremonies: Summary &amp; Photos</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Reception Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="left">
                            <tr valign="top"><td align="left"><img src="/i/tournament/invit02/tourney_photo_SFR1.jpg" alt="" width="200" height="435" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">SnapDragon takes Round One with ease.</td></tr>
                        </table>
                                
                        <h2> The Sweet 16 </h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Thursday, April 3, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets">View current bracket</a></p>

                       	<p>Competitors representing schools such as Duke, Michigan, Minnesota, Stanford, and UCLA 
                       	will face off this weekend in an effort to be crowned champion of a collegiate tournament.  
                       	Is it the culmination of the NCAA Men's Basketball tournament?  Nope, it's the Collegiate 
                       	Challenge Finals - TopCoder style.</p>

						<p>The field of over 500 college programmers has been narrowed to 16.  By Friday, it will be 
						reduced again to just 4.  Saturday afternoon will see one coder presented with a very big 
						check (in size and amount) and awarded the title of 2003 Sun Microsystems and TopCoder 
						Collegiate Challenge Champion.</p>

						<p>Tonight, however, we took the opportunity to relax and introduce ourselves to one 
						another.  15 of the 16 competitors were on location at the time of the reception, and 
						with 11 competitors new to the onsite finals, there were many introductions to be made. 
						Fashionable red and black competition gear was handed out to all the participants - 
						mandatory attire for the Final Four on Saturday.  The crowd broke up shortly after 
						the rules were laid out, and the competitors are hoping to get a good night's sleep 
						before a very big day of competition tomorrow.</p>  

						<p>Here's the lineup:<br />
						<br />
						Room 1, 10am:<br />
						evd<br />
						StefanPochmann<br />
						Yarin<br />
						yike<br />
						<br />
						Room 2, 1pm:<br />
						axch<br />
						dmwright<br />
						mathewsb<br />
						niteneb<br />
						<br />
						Room 3, 4pm:<br />
						ante<br />
						bstanescu<br />
						sjelkjd<br />
						WhiteShadow<br />
						<br />
						Room 4, 7pm:<br />
						dgarthur<br />
						DjinnKahn<br />
						jburnim<br />
						O_O<br />
						</p>

                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Reception Photos</strong></td></tr>

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


