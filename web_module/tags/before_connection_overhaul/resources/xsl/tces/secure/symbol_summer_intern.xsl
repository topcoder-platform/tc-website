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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Symbol Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><a href="/?&amp;t=tces&amp;c=symbol_openings&amp;a=secure" class="bodyText">Jobs</a> | <a href="http://www.symbol.com/about/careers/career_culture.html" target="_blank" class="bodyText">Culture</a> | <a href="http://www.symbol.com/about/careers/career_profgrowth.html" target="_blank" class="bodyText">Professional Growth</a> | <a href="http://www.symbol.com/about/careers/career_benefits.html" target="_blank" class="bodyText">Benefits</a></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><a href="/?&amp;t=tces&amp;c=symbol" class="bodyText"><img src="/i/es/symbol/symbol_logo.gif" width="135" height="49" alt="" border="0" /></a></p>

                        <h3>Summer Intern (Dist &amp; Whse Systems)</h3>
                        
                        <p><strong>Tracking Code</strong><br />
                        40659</p>
                        
                        <p><strong>Job Description</strong><br />
                        This position would work as part of the Distribution &amp; Whse Systems team in McAllen, Texas. They will be 
                        asked to assist with: </p>
                        <ul>
                            <li>Documentation and testing activities related to the 4.7 upgrade project</li>
                            <li>Logging and queuing application support issues</li>
                            <li>Data analysis and report writing</li>
                            <li>Logistics process analysis and documenting opportunities for improvement Responsibilities</li>
                            <li>Update and maintain the Ascendant toolset for SAP upgrade activities</li>
                            <li>Assist in training activities at the MLC</li>
                            <li>Enhance and maintain the Dist &amp; Whse Systems intranet website (Catalog existing Logistics reports)</li>
                            <li>Publish a list of work instructions and catalog menus on the department website</li>
                        </ul>

                        <p><strong>Required Skills</strong><br />
                        This would be an ideal position for an intern who is majoring in Computer Science with a minor in Business 
                        or Industrial Engineering. The candidate would work side by side with Systems Analysts. Examples of 
                        appropriate majors would be:</p>
                        <ul>
                            <li>Computer Science Major with a minor in Business Management</li>
                            <li>Operations Analysis/Industrial Engineering with a minor in Computer Science</li>
                            <li>Business Management Major with a minor in Computer Science</li>
                            <li>M.S. Information Technology candidate</li>
                        </ul>
                        
                        <p><strong>Job Location</strong><br />
                        McAllen, TX, US</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=symbol_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

