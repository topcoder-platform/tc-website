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

<title>TopCoder Adds Sweden To Its Developer Community</title>

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
                        <p><span class="bodyTitle">TopCoder Adds Sweden To Its Developer Community</span><br />
                        <span class="bodySubTitle"><em>Host of Computer Programming Contests Continues Global Expansion</em></span></p>
                        </div>

                        <p><strong>GLASTONBURY, Conn., June 17, 2003&#151;</strong>TopCoder, Inc., the leader in on-line programming 
                        competition and skills assessment, today announced it has expanded eligibility for cash prizes in its online and onsite 
                        computer programming contests to include citizens of Sweden.  The addition of Sweden to the TopCoder developer community 
                        demonstrates the company's continuing global expansion efforts.  Sweden is the eighth international territory to be added 
                        since the company launched its competitions in February 2001.  Citizens of Australia, Canada (excluding Quebec), China, 
                        India, Ireland, New Zealand, the United Kingdom and the United States are also eligible to receive cash prizes.  Citizens 
                        from all countries are allowed to compete, however those not listed above have their prize money donated to a charity of 
                        their choice.</p>

                        <p>"We are pleased to welcome the citizens of Sweden to TopCoder's developer community, and are excited about the 
                        continued international expansion of our competitions," said Jack Hughes, Chairman and founder of TopCoder.  "Our 
                        Swedish member base continues to grow and in fact, produced a finalist in our 2003 TopCoder Collegiate Challenge."</p>

                        <p><span class="bodySubTitle">International Demand for Competition Continues</span><br />
                        TopCoder has always seen positive results from expanding the eligibility criteria to include residents of new countries.  
                        The worldwide appeal of TopCoder has resulted in membership growth of more than 1,300 members per month.</p>

                        <p>"TopCoder is a venue for interaction, learning and competition amongst the worldwide developer community," said 
                        Tom Longo, Vice President of Membership for TopCoder.  "The continued growth in our membership clearly demonstrates 
                        the international draw of TopCoder."</p>

                        <p>TopCoder will continue to extend its programming competitions globally as international demand for competition 
                        continues, in effect, bringing the entire worldwide developer community together.  According to Hughes, the company's 
                        next expansion effort is Germany.</p>

                        <p><br /></p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
                        TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
                        rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
                        software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
                        Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

                        <p># # #</p>

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
