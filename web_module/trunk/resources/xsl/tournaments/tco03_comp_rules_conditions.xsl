<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_suplinks.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 TopCoder Open - Computer Programming Tournament - Rules - Conditions</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1"></xsl:with-param>
                <xsl:with-param name="image">tournaments_white</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Open</xsl:with-param>
            </xsl:call-template>
        
<!-- TCO Header -->
            <div align="center"><img src="/i/tournament/tco03/tco_promo_big2.gif" alt="2003 TopCoder Open" width="550" height="160" border="0" vspace="15" /></div>

<!-- Tab bar suplinks
            <xsl:call-template name="tco03_suplinks">
                <xsl:with-param name="selectedTab">component</xsl:with-param>
            </xsl:call-template>-->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedTab">component_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">component_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">conditions</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Conditions of Participation</h2>
            
            <p>By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which 
            are final, binding and conclusive in all matters.</p>

            <h3><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be 
            the contestant's alone.</font></h3>

<p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the 
tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

<p>As a condition of participation in the tournament, all information provided by you in your TopCoder member profile 
must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form 
to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and 
all registration forms required by TopCoder.</p>

<p>As a condition of winning and redeeming a cash prize, winners will be required to return by Tuesday, October 28th a 
completed (i) notarized Affidavit of Eligibility and Liability and Publicity Release, (ii) competitor questionnaire, (iii) 
travel form, and (iv) IRS Form W-9 or W-8BEN, as appropriate, if one is not already on file with TopCoder. In completing 
the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms his/her eligibility, (ii) represents 
and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies 
the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (iv) authorizes 
TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) assigns 
to TopCoder all rights to all information submitted during the tournament (including rights to source code and other executables), 
and (vii) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form 
W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the winner fails to return 
the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified 
winner will be forfeited. Providing false information in the registration process or in the required forms described in this 
paragraph will disqualify a winner.</p>

<p>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its 
affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective 
directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property 
damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, 
from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, 
use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, 
any prize given.</p>

<p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes 
the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or 
similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and 
all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a 
third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's 
participation in the tournament.</p>

<p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, 
and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors 
of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation 
of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned 
for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

