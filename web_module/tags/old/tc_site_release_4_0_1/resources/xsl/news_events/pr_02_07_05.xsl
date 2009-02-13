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

<title>TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</title>

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
                        <p><span class="bodyTitle">TopCoder Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</span><br />
                        <span class="bodySubTitle"><em>Global Leader in Programming Competitions and Competitive Software Development Celebrates Rapid Growth</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, CT, February 7, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it was celebrating a major milestone as the TopCoder global community of registered members officially surpassed the 50,000 mark. At the same time, the number of rated TopCoder developers has approached 10,000. In less than four years since the organization's inception, TopCoder programming tournaments have awarded more than $2 million in prize money to some of the best collegiate and professional programmers from 187 countries around the globe. TopCoder membership is free and brings with it eligibility to compete in high profile tournaments, access to round tables and educational forums as well as access to some of the world's leading employers of software developers. For full membership benefit details and registration please visit http://www.topcoder.com.
<br /><br />
Through its schedule of high profile tournaments and unique competition arena, TopCoder recognizes and promotes the abilities of the best programmers around the world and with TopCoder Software harnesses the talent of these developers to design, develop and deploy software using its revolutionary competitive development methodology.
<br /><br />
Along with reaching the 50,000 registered and 10,000 rated member milestones, other TopCoder statistical notes include:
<ul>
<li>3,211 individual participants have competed in the 8 major tournaments since May 2001;</li>
<li>$2,060,000 in prize money has been awarded to TopCoder members, $1.29million in major tournament prize money and $785,000 over the course of 229 weekly single round matches (SRMs);</li>
<li>Major TopCoder sponsors and clients include Yahoo!, Google, NVIDIA, Microsoft Corporation, Praxair, Inc., Sun Microsystems, Inc., ING, Intel Corporation, and ABB Ltd;</li>
<li>Total of 187 countries represented by TopCoder members;</li>
<li>TopCoder membership is 52% collegiate and 48% professional;</li>
<li>Over 37,500 challenges have been submitted in SRMs;</li>
<li>149,774 code submissions have been made in all rated events;</li>
<li>4,926,915 individual system tests have been run in all rated events.</li>
</ul>

 "We are celebrating the continued growth of TopCoder as we reach this significant milestone of 50,000 with 10,000 of those members fully ranked and rated," said Rob Hughes, President of TopCoder. "We've experienced dynamic growth this year - almost 12,000 new members in the last six months alone - so we are at a very exciting stage of our community's life and are committed to continuing to provide the world's number one developer forum for the world's top developers."
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
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
