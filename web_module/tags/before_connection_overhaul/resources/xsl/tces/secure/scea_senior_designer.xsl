<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Employment Services</title>

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
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr>
                <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Sony Computer Entertainment Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=scea_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=scea" class="bodyText"><img src="/i/es/scea/scea_logo.gif" width="90" height="119" alt="Sony Computer Entertainment Computer Entertainment" border="0" /></A></p>

                        <h3>Senior Designer</h3>
                        
                        <p><strong>Job Description</strong><br />
                        Sony Computer Entertainment Computer Entertainment America's (SCEA) Santa Monica Product Development Studio is currently looking 
                        for a Sr. Designer to join its team. The Level Designer is a specialist in the creation of game levels and 
                        gameplay scenarios. Level designers are responsible for contributing to level concept, layout, prototype 
                        modeling, scenario creation, event scripting, game balance, pacing, and gameplay tuning. As part of the 
                        design team, level designers are also expected to contribute to general game design. </p>

                        <p><strong>Required Skills</strong><br />
                        Experience is necessary</p>
                        
                        <ul>
                            <li>Having shipped at least two console games in a designer/senior designer role</li>
                            <li>Will possess strong hands-on experience with level design utilizing a 3D software package&#151;preferably Maya</li>
                            <li>Demonstrate solid writing skills&#151;possess the ability to clearly and concisely define game areas and feature sets</li>
                            <li>Is able to consider game-wide mechanics including interface, pacing and story, game balance, and difficulty curve</li>
                            <li>Possesses the ability and desire to contribute to a highly creative environment, provide unique concepts and solutions</li>
                            <li>Have a good understanding of the game market, can analyze competitive products to identify key strengths and weaknesses</li>
                            <li>Be able to quickly adapt to changes, finding creative solutions and maintaining positive momentum in the face of adversity</li>
                            <li>Be able to communicate, evolve, and proactively push the game design</li>
                            <li>Have a passion for playing / creating quality video games.</li>
                        </ul>
                        
                        <p><strong>Job Location</strong><br />
                        Santa Monica, CA, US</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=scea_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

<!-- Client Job List ends -->

                        <p><br/></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

