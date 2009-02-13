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

<title>TopCoder Hosts Charity Tournament</title>

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
                        <p><span class="bodyTitle">TopCoder Hosts Charity Tournament for Christopher Reeve Paralysis Foundation 
</span><br />
                        <span class="bodySubTitle"><em>International Programming Competition Set to Raise Money for Research</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., August 13, 2003&#151;</strong>
                        TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced the TopCoder Charity Challenge, 
                        benefiting the Christopher Reeve Paralysis Foundation (CRPF).  The Charity Challenge represents an exciting fundraising endeavor 
                        designed to support CRPF's ongoing research to find a cure for, and improve the lives of people with, spinal cord injuries and other 
                        central nervous system disorders.  In addition, TopCoder will match, dollar for dollar, all funds that are raised by competitors in this 
                        tournament, up to $50,000.</p>
 
                        <p>Programmers worldwide who raise a minimum of $25 in donations will be eligible to compete in this tournament.  Funds can be 
                        donated to sponsor a competing TopCoder member at <a href ="http://www.christopherreeve.org/topcoder">www.christopherreeve.org/topcoder</a>.  
                        The TopCoder Charity Challenge will consist of three online rounds, held November 11, 13 and 17.  The first round will be open to all 
                        eligible competitors.  The top 100 programmers from the open round will advance to the second round.  The top 50 programmers in the 
                        second round will advance to the final round on November 17.</p>

                        <p>"This charity tournament represents a unique collaboration," explained Mitchell Stoller,  President and CEO of CRPF.  "By bringing 
                        together the world's top programmers to compete in an online tournament fundraiser, significant money will be raised so the world's top 
                        scientists can continue their research to find a cure for paralysis."</p>

                        <p>The TopCoder Charity Challenge will award a grand prize to ten competitors: a trip to A Magical Evening, the annual star-studded gala 
                        ball in New York City on November 24 to benefit CRPF.  The ten recipients will consist of the four top scorers in the final round of the 
                        programming tournament, the four top fundraisers and two "wildcards".  The wildcards will be chosen at random from all members who 
                        raise at least $100.  In addition, TopCoder will send commemorative t-shirts to all members who raise at least $50.</p>

                        <p>"TopCoder is excited to host the CRPF event," said Jack Hughes, TopCoder's Founder and Chairman.  "Paralysis is a devastating 
                        condition for patients and their families.  CRPF is an outstanding organization spearheading research as well as providing guidance 
                        to resources and direct quality of life grants to those living with paralysis.  TopCoder is proud to be associated with such a determined 
                        and hard working organization."  Mr. Hughes is a member of CRPF's Board of Directors.</p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members 
                        extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community 
                        of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration 
                        details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit 
                        <a href="/">www.topcoder.com</a>.</p>

                        <p><span class="bodySubTitle">About CRPF</span><br />
                        The Christopher Reeve Paralysis Foundation is committed to funding research that develops treatments and cures for paralysis caused 
                        by spinal cord injury and other central nervous system disorders. The Foundation also vigorously works to improve the quality of life for 
                        people living with disabilities through its grants program, paralysis resource center and advocacy efforts.  For more information, please 
                        call (800) 225-0292 or visit the CRPF website at <a href="http://www.christopherreeve.org">www.christopherreeve.org</a>.</p>

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
