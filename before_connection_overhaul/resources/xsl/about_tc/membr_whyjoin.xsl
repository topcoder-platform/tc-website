<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder :: About TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

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
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">about_tc</xsl:with-param>
                <xsl:with-param name="title">Why join TopCoder?</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/><br />

                    <p><span class="bodySubtitle">Competition</span><br/>
                    TopCoder's competitions are designed for technologists and are unique in several ways. The key to TopCoder's competition process 
                    is the immediacy and objectivity of each and every Single Round Match. With TopCoder, competitors do not await results and the 
                    announcement of winners from a panel of judges that take days or even weeks to arrive at a decision.</p>
                    
                    <p>The process is simple. There are three problem statements (per match) with ascending point value. The coder to submit the 
                    most accurate solution in the shortest amount of time is awarded the most potential points. The key is that a coder's submission 
                    is challenged not only by the TopCoder system, but first by the other participating coders in the match. A coder's entire potential 
                    point base (and possible win) can be altered should another coder find a means of "breaking" the submission.</p>
                    
                    <p><span class="bodySubtitle">Learning</span><br/>
                    TopCoder attracts the best programmers in the US and soon, the world. While you may not be able to beat the best programmers 
                    (welcome to the club - neither can we!), many of our members learn a great deal from the top developers. There is nothing like 
                    honing one's skill in the heat of competition. Since TopCoder is split by division, you won't be in problems over your head. As 
                    you compete more and more, you will be able to draw from some of the best talent out there. Also, every problem we create goes 
                    into our practice rooms. Competitor solutions are available to every participating member. What better way to learn, than from 
                    the masters!</p>
                    
                    <p><span class="bodySubtitle">Points and Ratings</span><br/>
                    The more a coder competes, the better their rating can become. Ratings are the key determining factor for establishing the initial 
                    elimination field for either the Invitational Tournament or Collegiate Challenge. A coder's rating is based on several factors 
                    (detailed ratings overview), but the basic idea is that ratings are based upon the points gained in a given match, the number of 
                    matches competed in, and how that stacks up against other coders with similar points and matches.</p>
                    
                    <p>As you look through the site, you will see color coding with member's handles. These colors indicate the rating level of that 
                    member. Participating members (those who compete versus spectate) are able to view each other's profiles, past code 
                    submissions, stats and more.</p>
                    
                    <p><span class="bodySubtitle">Prizes</span><br/>
                    Although there are no prizes awarded for the Single Round Matches, major TopCoder tournaments offer a substantial total purse. 
                    The purse for these tournaments ranges anywhere from $100,000 to $250,000.  TopCoder holds two major tournaments per year: 
                    the Collegiate Challenge, open for full-time students, and the Invitational, open to all eligible members.</p>
                    
                    <div align="center"><strong>- There is no cost to <a class="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute><strong>register</strong></a> or participate in any match or tournament -</strong></div>
                    </td>
                </tr>
            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
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
