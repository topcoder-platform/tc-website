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

                        <h3>Software Engineer III</h3>
                        
                        <p><strong>Tracking Code</strong><br />
                        40615</p>
                        
                        <p><strong>Job Description</strong></p>
                        <ul>
                            <li>Design and/or analyze Microsoft Pocket PC and Embedded CE OS based products</li>
                            <li>Implement complex value engineering product improvements</li>
                            <li>Work with Microsoft and other partners to port OS specific software to Symbol products</li>
                            <li>Follow PRP process and software design guidelines</li>
                        </ul>

                        <p><strong>Required Skills</strong></p>
                        <ul>
                            <li>BS /MS in Computer Science or Electrical Engineering</li>
                            <li>8 - 10 years design experience</li>
                            <li>Mastery of the C, C++ programming language, microprocessor development environments and debugging techniques</li>
                            <li>Experience with Windows CE (embedded and Pocket PC) OAL and device driver development and WIN32 level programming</li>
                            <li>Good leadership qualities</li>
                            <li>Excellent verbal and written skills are required</li>
                            <li>Demonstrable success in embedded processor software design on ARM (Xscale, StrongArm, etc.) architectures, mobile embedded computer platform design experience preferred</li>
                            <li>Experience with Windows 95/NT/CE, WIN32 API, DLL's, MS Platform builder and Embedded Visual Studio</li>
                            <li>Wireless integration experience is a plus</li>
                            <li>Experience with networking protocols: TCP/IP, FTP, client/server is a plus</li>
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

