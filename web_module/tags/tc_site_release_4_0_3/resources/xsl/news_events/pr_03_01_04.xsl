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

<title>TopCoder Announces Yahoo! as Title Sponsor for TCCC04</title>

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
                        <p><span class="bodyTitle">Columbia University Student Wins DoubleClick's 2004 TopCoder Programming Challenge</span><br />
                        <span class="bodySubTitle"><em>Jason Winokur Named Champion in $10,000 Coding Contest Eliot Horowitz Wins DoubleClick Employee Challenge </em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., March 1, 2004&#151;</strong>

TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Jason Winokur of Columbia University has won the DoubleClick 2004 Coding Challenge.  In the DoubleClick employee competition, first place finisher was Eliot Horowitz of the New York City office.  The competition was open to all eligible students at Columbia University and New York University as well as DoubleClick employees. The tournament was designed to highlight the competitors' relative skills in the analysis of complex algorithmic problems and the ability to write software to solve those problems.</p>
	
<p>Winokur overcame nine other students representing Columbia and NYU in the final round at DoubleClick's Headquarters in New York City on Friday to claim the top honors and take home the first place purse of $5,000. The remainder of the student finalists shared an additional $5,000 in prize money.  In the parallel competition for employees, DoubleClick's own software engineers battled in the TopCoder arena applet to evaluate their professional skill sets. DoubleClick Software Engineer Horowitz earned a 32 inch Sony Plasma TV for his victorious effort.  Of the remaining finalists, the top three received Garmin iQue 3600 Palm devices with integrated GPS, and the rest were awarded their choice of a Canon PowerShot S400 digital camera or an Apple iPod.</p>

<p>"TopCoder's competition model provides us with a powerful tool for recruitment and assessment as we look to identify the next generation of DoubleClick's programming talent," said Mok Choe, Chief Information Officer, DoubleClick.  "We've also generated a lot of excitement within our internal development group and given our own talent a chance to shine."</p>

<p>DoubleClick used the TopCoder contest to cultivate the competitive spirit and the technical strength of the contestants who solved the same set of complex problems during two rounds of competitions using Java, C++, C# or Visual Basic as their language of choice.</p>

<p>"Many of the world's top technology companies use TopCoder to reach both professional and collegiate developers," said Rob Hughes, President of TopCoder.  "Nothing attracts an audience like competition, and TopCoder sets the pace."</p>

<p><span class="bodySubTitle">About DoubleClick</span><br />
DoubleClick is the leading provider of tools for advertisers, direct marketers and web publishers to plan, execute and analyze their marketing programs. DoubleClick's online advertising, email marketing and database marketing solutions help clients yield the highest return on their marketing dollar. In addition, the company's marketing analytics tools help clients measure performance within and across channels. DoubleClick Inc. has global headquarters in New York City and maintains 22 offices around the world.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>          

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
