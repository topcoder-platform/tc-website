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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Pandemic Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=pandemic_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=pandemic" class="bodyText"><img src="/i/es/pandemic/pandemic_logo.gif" width="60" height="90" alt="Pandemic Studios" border="0" /></A></p>

                        <h3>Programmers/Senior Programmers</h3>

                        <p><strong>Job Description</strong><br />
                        We have a number of exciting opportunities for experienced programmers. We're especially interested 
                        in people with complex/advanced animation experience (rendering/processing/sequencing).</p>

                        <p><strong>Required Skills</strong></p>

                        <p>The ideal candidate will have: </p>
                        
                        <ul>
                            <li>2+ years of game programming experience, or a distinguished college course list in relevant fields. </li>
                            <li>A minimum of 1 completed game (or graphical/interactive relatedproject). </li>
                            <li>Proficient in C/C++. </li>
                            <li>Good oral communication. </li>
                            <li>Able to work with a bare minimum of supervision or management. </li>
                            <li>Must be able to work in a team atmosphere with schedules and reliable milestone delivery. </li>
                            <li>Bachelor's or equivalent </li>
                        </ul>

                        <p>Bonus Skills: </p>
                        
                        <ul>
                            <li>Experience with cross-platform development. </li>
                            <li>Low level assembly experience, (80x86, MIPs or VU code). </li>
                            <li>DirectX 8.0 experience. </li>
                            <li>Advanced animation, processing, rendering or sequencing. </li>
                            <li>Proven technical expertise on either Xbox or PS2.</li>
                        </ul>

                        <p><strong>Job Locations</strong><br />
                        Santa Monica, California and Brisbane, Australia</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=pandemic_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

