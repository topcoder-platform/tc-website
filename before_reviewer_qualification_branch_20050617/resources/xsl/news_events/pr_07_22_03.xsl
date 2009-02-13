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

<title>TopCoder Adds VB.NET Competitions</title>

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
                        <p><span class="bodyTitle">TopCoder Adds VB.NET Competitions</span><br />
                        <span class="bodySubTitle"><em>Competition Platform Also Enhanced to Support Web Services</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., July 21, 2003&#151;</strong>TopCoder, Inc., the leader in online programming competition and skills assessment, today announced that it now 
                        offers the ability to compete using Microsoft&#174; Visual Basic&#174;.NET (VB.NET) in its programming tournaments.  In 
                        addition to VB.NET, competitors can use the Java, C++ and C# programming languages. 
                        </p>
                        <p>Since March 2001, TopCoder has  conducted over 150 programming competitions at its web site, <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a>.  
                        These competitions have attracted more than 28,000 members from more than 150 countries.  TopCoder members 
                        compete online throughout the year.  Twice per year, members are invited to compete in TopCoder's major tournaments 
                        with substantial cash prizes.  With the addition of VB.NET, TopCoder competitions are now available to a greater number 
                        of professional and student programmers worldwide.
                        </p>
                        <p>"TopCoder is a company created by programmers for programmers, and the addition of VB.NET is yet another 
                        validation," said Jack Hughes, founder and chairman of TopCoder. "Our members have assisted in the design and 
                        development of this addition to the competition engine."
                        </p>
                        <p>In a continuing effort to support the needs of its clients, TopCoder has recently incorporated another major feature into 
                        its competition engine.  Clients may now utilize TopCoder to conduct customized, private label competitions on a Web 
                        Services platform.  This enhancement was recently featured during the JavaOneSM Coding Challenge conducted at the 
                        2003 JavaOneSM Conference in San Francisco, CA held June 10-13th.
                        </p>
                        <p><span class="bodySubTitle">$100,000 prize purse for next tournament</span><br />
                        TopCoder leverages online and onsite programming competitions to create an international database of objectively 
                        rated professional and student programmers.  This database provides prospecting companies with a means to efficiently 
                        and cost-effectively target and communicate with top technologists.  Members are rated weekly in TopCoder's Single Round 
                        Matches.  In addition, these matches serve to prepare programmers for the major tournaments.  TopCoder's next major 
                        tournament will be the 2003 TopCoder Open, which begins online on October 7th.  The total purse for the tournament will 
                        be $100,000, with the winner receiving $50,000.
                        </p>
                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
                        TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
                        rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
                        software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
                        Employment Services or sponsorship of TopCoder Events, please visit www.topcoder.com.
                        </p>
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
