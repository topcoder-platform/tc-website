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

                        <h3>Software Engineer III / IV</h3>
                        
                        <p><strong>Tracking Code</strong><br />
                        40165</p>
                        
                        <p><strong>Job Description</strong></p>
                        <ul>
                            <li>Develop system software and SDK's for Symbol hand-held computers running the Windows CE Operating System</li>
                            <li>Involves integration of the operating system and extending it to support unique hardware devices and software features</li>
                            <li>Ideal candidates will have strong embedded microprocessor design experience with x86 and RISC architectures and Windows NT/2000/XP development environments</li>
                            <li>Serve as lead engineer on projects, directing the work of other engineers and providing innovative product solutions. A limited amount of travel to the Far East is required</li>
                            <li>Work on projects from concept phase to release, ensuring that all software components are developed according to Symbol's Product Realization Process (PRP).</li>
                        </ul>

                        <p><strong>Required Skills</strong></p>
                        <ul>
                            <li>Bachelor of Science in Computer Science, Computer Engineering or Electrical Engineering. Master of Science preferred</li>
                            <li>Minimum of 7 years experience in software design and analysis as applied to Embedded Software Development</li>
                            <li>Mastery of the C/C++/C# programming language, X86 and RISC assembly language, microprocessor development environments and debugging techniques</li>
                            <li>Demonstrable success in embedded computer platform design experience preferred</li>
                            <li>Experience with Windows NT/2000/XP/CE, WIN32 API, Visual Studio 6.0 and Visual Studio.NET development</li>
                            <li>Experience with VOIP (Voice Over IP) and RFID (Radio Frequency Identification) a plus</li>
                            <li>Experience with networking protocols such as TCP/IP a plus</li>
                            <li>Experience with device interconnectivity using serial or IrDA a plus.</li>
                        </ul>
                        
                        <p><strong>Job Location</strong><br />
                        Holtsville, NY, US</p>
                        
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

