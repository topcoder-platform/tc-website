<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder Announces 2003 TopCoder Open</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder Announces 2003 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>$100,000 Tournament Will Crown World Programming Champion</em></span></p>
                        </div>

                        <p><strong>GLASTONBURY, Conn., June 16, 2003&#151;</strong>TopCoder, Inc., the leader in on-line programming 
                        competition and skills assessment, today announced its next major tournament, the 2003 TopCoder Open.  This coding event 
                        will be open to programmers around the world and will award a total of $100,000 in cash prizes.  The tournament will begin 
                        with online elimination rounds in October, and culminate on December 5 with the final rounds taking place live at Mohegan 
                        Sun Casino in Uncasville, Connecticut, where the winner of the TopCoder Open will be awarded $50,000 and named the 2003 
                        World Champion.</p>

                        <p>In the two qualifying rounds held in October, eligible TopCoder members will compete for 500 coveted spots in the 
                        tournament.  These 500 will be narrowed to the final 16 through four successive online rounds.  The remaining 16 will 
                        travel to the Mohegan Sun Casino to compete live on December 4 and 5, in the semi-final and final rounds, for the grand 
                        prize and champion title.</p>

                        <p>"The skill level in the TopCoder tournaments increases dramatically each year and from the caliber of competition 
                        we've seen in recent weekly matches, the 2003 TopCoder Open will be no exception," said Jack Hughes, founder of 
                        TopCoder, Inc.  "Once again, we are thrilled to bring together the world's best and brightest programmers for a tournament 
                        that promises to deliver plenty of excitement and opportunity."</p>

                        <p>TopCoder's software developer member base exceeds 27,000 and encompasses more than 150 countries.  Membership 
                        grows steadily at an average of more than 1,300 new members per month.  Participation in TopCoder tournaments that 
                        includes both college and professional programmers has increased more than 300% between 2001 and 2002.  The 2003 
                        TopCoder Open is the sixth major tournament hosted by TopCoder since inception in 2001.</p>

                        <p><strong>Companies interested in sponsoring this worldwide event should contact Drew Vaughn at 866.867.2633, 
                        <A href="mailto:dvaughn@topcoder.com">dvaughn@topcoder.com</A> or visit www.topcoder.com.</strong></p>

                        <p><br /></p>

                        <p><strong>About TopCoder, Inc.</strong><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
                        TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
                        rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
                        software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
                        Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

                        <p>###</p>

                        <p><br /></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
