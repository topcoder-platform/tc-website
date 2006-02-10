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

<title>TopCoder Announces DoubleClick 2004 Coding Challenge&#174;</title>

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
                        <p><span class="bodyTitle">TopCoder Announces DoubleClick 2004 Coding Challenge</span><br />
                        <span class="bodySubTitle"><em>Marketing tools leader to host TopCoder-powered programming competition for employees and NYC students</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., February 2, 2004&#151;</strong>
								TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, announced DoubleClick Inc. has engaged the company to conduct a programming competition beginning today, February 2. DoubleClick, the leading provider of marketing tools for advertisers, direct marketers and web publishers, is using the contest to cultivate the competitive spirit and the technical strength of their software engineers and of the students at Columbia University and New York University.  The results will show the relative skills of participants in the analysis of complex algorithmic problems and their ability to write software to solve those problems.</p>

								<p>Having self-administered coding competitions for its employees for the last two years, DoubleClick is now turning to TopCoder to expand this year's competition to include external applicants.  The DoubleClick 2004 Coding Challenge is open to all DoubleClick employees worldwide.  As an added dimension this year, DoubleClick is also opening the contest to students at two local universities - Columbia and NYU.  While they won't be competing for the same prizes, the employees and students will be asked to solve the same sets of complex algorithmic problems during two rounds of competitions.  Participants will have the choice of using Java, C++, C# or VB.Net to compete.  For more information and registration, go to <a href="http://www.topcoder.com/doubleclick">www.topcoder.com/doubleclick</a>.</p>

								<p>"TopCoder's contest platform is a perfect vehicle for DoubleClick to showcase the technical strength of our development staff, as well as promote the technology leadership of the company throughout college campuses," said Mok Choe, Chief Information Officer, DoubleClick.  "We look forward to being a part of this dual effort."</p>

								<p>DoubleClick will entice competitors from both groups by giving away impressive prizes to the finalists.  The student champion will take home $5,000 in cash, while the employee champion will win a Sony 32" Plasma TV.  Additional cash prizes of $5,000, Garmin iQue 3600 Palm devices, Canon PowerShot S400 digital cameras and Apple iPods will be awarded to the remaining finalists.  The combination of top-notch prizes and the excitement of competition provides incentive for a diverse, skilled group of programmers to participate.</p>

								<p>"TopCoder's private label events are an innovative idea - the platform provides companies with a way to engage targeted audiences, in this case employees and local students, in a stimulating competition," said Rob Hughes, President of TopCoder.  "We are excited to bring this pioneering program to another leading technology company who understands the importance of showcasing solid programming talent."</p>

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
