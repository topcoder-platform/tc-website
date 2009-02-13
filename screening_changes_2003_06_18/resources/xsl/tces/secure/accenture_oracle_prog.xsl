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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Accenture Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=accenture_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=accenture" class="bodyText"><img src="/i/es/accenture/accenture_logo.gif" width="134" height="71" alt="Accenture" border="0" /></A></p>

                        <h3>Oracle Configurators and Developers</h3>
                        
                        <p>Accenture Technology Solutions, a wholly owned subsidiary of Accenture, is a global company of 
                        technology specialists who build, deploy and maintain technology solutions for Accenture clients. As 
                        part of our global team, you'll be working with the latest software and leading-edge development 
                        tools&#151;giving you the opportunity to build specialist skills and expertise on the job. We need 
                        people who thrive on technology challenges. People who can help turn innovative ideas into effective 
                        results.</p>

                        <p>Be part of Accenture Technology Solutions, where we have expertise in start-to-finish delivery 
                        of technology-based solutions. Work alongside talented colleagues who share a passion for developing 
                        original technology solutions for top companies around the world. At the same time build expertise 
                        with new technologies, software, methods and tools.</p>

                        <p>We currently have openings at all levels for individuals skilled in the coding, testing and 
                        implementation of configuration changes to software applications to meet both functional and 
                        technical requirements. Analyst and Programmers will contribute to any or all areas of application 
                        programming and development, testing, and maintenance and support.</p>

                        <p><strong>Job Description</strong><br />
                        This position is responsible for supporting functional configuration, implementation and production 
                        activities for the enterprise Oracle applications environment. Ideal candidates will possess relevant 
                        work experience in one or more of the other skill areas listed below.</p>
                                                
                        <p><strong>Required Skills</strong></p>
                        
                        <ul>
                            <li>Experience in Oracle 11i is strongly desired </li>
                            <li>2 &#43; years programming experience with a minimum of twelve (12) months experience 
                            directly related to Oracle applications development and implementation including experience with 
                            Oracle's development toolset, Designer 2000 and Developer 2000. This should also include a solid 
                            background in PL/SQL. </li>
                            <li>Programming experience with any of the following: Oracle 8i, Oracle Reports 6i, Oracle 
                            Forms 6i, Oracle Workflow 2.5/2.6, SQL, SQL Loader, Oracle Discoverer, Sun Solaris. </li>
                            <li>Twelve (12) months directly related work experience in business requirements analysis, 
                            systems analysis and design. Experience mapping business requirements to application 
                            functionality </li>
                            <li>Configuring Oracle application modules to meet required functionality </li>
                            <li>Work on client projects in the general metro area around your city. Out of town travel will 
                            be minimal.</li>
                        </ul>

                        <p><strong>Job Locations</strong><br />
                        Chicago, IL<br />
                        Florham Park, NJ <br />
                        New York, NY </p>
                        
                        <p>Applicants for employment in the U.S. must possess work authorization that does not require 
                        sponsorship by the employer for a visa.</p>
                        
                        <p>We are an Equal Opportunity Employer.</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=accenture_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

