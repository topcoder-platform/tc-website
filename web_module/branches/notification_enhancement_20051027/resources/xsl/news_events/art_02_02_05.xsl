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

<title>Press Room</title>

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
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder's Jack Hughes Appears on CNN's "Lou Dobbs Tonight"</span><br/>
                        <span class="bodySubTitle"><em>Founder Featured in Discussion on Global Programming Talent: Who are the TopCoders?</em></span></p>
                        </div>

<p>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that TopCoder Founder and Chairman, Jack Hughes, was interviewed this week on CNN's <A href="http://www.cnn.com/CNN/Programs/lou.dobbs.tonight/">Lou Dobbs Tonight</A>. In the segment titled "Champion Coders", Hughes explained how proficiency with mathematical algorithms, as the underlying piece of logic in a computer program, is an extremely important skill for programmers. TopCoder competitions have created a global ranking of programmers in algorithmic competitions as well as components and application design and development. The segment focused on our measurement of the skills of developers in different countries and at various universities, in particular, in the U.S. and India. 
<br /><br />
<strong>WHO:</strong> CNN Lou Dobbs Tonight - Jack Hughes, Founder and Chairman, TopCoder, Inc.<br />
<strong>WHAT:</strong> Who are the champion coders? Comparison between U.S. and Indian tournament data.<br />
<strong>WHEN:</strong> Monday, January 31, 2005 6:00 p.m. Eastern <br />
<strong>VISUALS:</strong> Interview with Jack Hughes, On-Air B-Roll of TopCoder events. Data points from TopCoder research.
<br /><br />
A rush transcript of the interview is available online at <A href="http://www.cnn.com/TRANSCRIPTS/0408/10/ldt.00.html">CNN's transcript website</A>. [See under "Exporting America: India Too Costly?" aired Monday, January 31, 2005 at 6:00 p.m. (ET).] 
<br /><br />
TopCoder, Inc. was established with the purpose of identifying top computer software engineers world-wide. Since 2001, the company's worldwide membership has grown to over 50,000 developers many of whom who compete regularly in weekly programming matches and high stakes international tournaments. 
<br /><br />
"We're pleased to have been asked to share our industry expertise with Lou Dobbs Tonight and the CNN audience," said Rob Hughes, President and COO TopCoder, Inc.
<br /><br />
"Results from our global programming tournaments show an undeniable correlation between quality math and science education infrastructures and the ability to produce <br /><br />world class software programming talent.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">http://www.topcoder.com.</A> 
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
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
