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

<title>Yahoo! Signs On as Premier Sponsor of 2004 TCO</title>

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
                        <p><span class="bodyTitle">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>Leading Global Internet Company Added to Distinguished Sponsorship Group for World's Most Challenging Programming Tournament</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., September 2, 2004&#151;</strong>
						TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as a premier sponsor for the 2004 TopCoder Open. The 2004 TopCoder Open will award $150,000 in total cash prizes for Algorithm, Component Design and Component Development categories, and programmers from more than 50 countries will compete.  Yahoo's sponsorship of the 2004 TopCoder Open marks the company's second successive involvement with TopCoder events. 
						<br/><br/>
						"As a sponsor of the TopCoder Collegiate Challenge, Yahoo! had the opportunity to recruit several truly talented individuals.  We are excited to continue our relationship with TopCoder and are looking forward to meeting with the top talent competing in the TopCoder Open," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  
						<br/><br/>
						The 2004 TopCoder Open will feature some of the IT industry's top professionals and international collegiate coders. Software will be designed and developed and seemingly unsolvable algorithmic problems will be solved over the course of 14 weeks, culminating in the exciting Onsite Finals at the Santa Clara Marriott in Santa Clara, CA, on November 11th &amp; 12th. 
						<br/><br/>
						TopCoder events provide the perfect setting for reaching and interacting with some of the most   accomplished software developers in the world.  By providing access to thousands of competitors as they compete, employers can get a unique evaluation of how good a developer really is. 
						<br/><br/>
						Registration for the 2004 TopCoder Open Algorithm Competition is open until 9:00 am EDT on Tuesday, September 7, 2004. Full registration details and rules are available at:  http://www.topcoder.com/tco04
						<br/><br/>
						"Our family of sponsors has seen significant growth in the last year and we are committed to continuing our success in delivering a quality program and experience for both competitors and sponsors as they build valuable and enduring relationships," said Rob Hughes, President and COO of TopCoder.  "We are always pleased when we find a shared passion for supporting the most driven and exciting group of programmers in the world - the TopCoder developer community."
						<br/><br/>
						<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
						TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
						<br/><br/>
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
