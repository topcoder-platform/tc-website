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
                            <tr><td valign="middle" height="18" bgcolor="#43515E" class="statText"><strong>Great Jobs at Vertex</strong></td></tr>
                            <tr><td valign="middle" height="18" class="bodyText">Jobs</td></tr>
                        </table>
                        
<!-- Client Job List begins -->
                        <p><img src="/i/es/vertex/vertex_logo.gif" width="76" height="52" border="0"/></p> 

                        <h3>Contract Position</h3>
                        
                        <p><strong>Job Description</strong><br />
                        Vertex Pharmaceuticals has an open contract position.  The contract term is through the end of the year.</p>
                        
                        <p>The position responsibilities include:</p>

                        <ol>
                            <li>Creating a modular infrastructure for the display and analysis of biological and chemical information</li>
                            <li>Being a system administrator/developer for corporate chemical databases</li>
                            <li>Responding quickly to high-priority prototyping efforts</li>
                            <li>Working closely with scientists to define practical solutions to research data problems</li>
                        </ol>

                        <p>The position requires that the person must keep up with research software trends as well as appropriate 
                        computing skills to support these software packages.  Support may require installation, configuration, 
                        maintenance, troubleshooting &amp; upgrading of concomitant computer systems.</p>

                        <p>Finally, this person will be required to communicate effectively with scientists to understand their 
                        software needs and relay this information to vendors, scientists, IS, and management as appropriate.</p>
                        
                        <p><strong>Desired Skills</strong></p>

                        <ul>
                            <li>Experience designing and implementing multi-tiered systems</li>
                            <li>Science background</li>
                            <li>Java Swing</li>
                            <li>Python</li>
                            <li>SOAP</li>
                            <li>System Administrator skills</li>
                            <li>RAD (Rapid Application Development)</li>
                            <li>Ability to work independently</li>
                            <li>Strong communication skills</li>
                        </ul>
                        
                        <p align="center"><A HREF="/jobposting?&amp;t=JobHitTask&amp;jid=118&amp;jt=2" class="bodyText">Apply now!</A></p>

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

