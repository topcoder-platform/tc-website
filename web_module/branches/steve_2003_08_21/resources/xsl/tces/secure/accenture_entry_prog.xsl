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

                        <h3>Entry-Level Programmers</h3>
                        
                        <p>Accenture Technology Solutions, a wholly owned subsidiary of Accenture, is a global company of 
                        technology specialists who build, deploy and maintain technology solutions for Accenture clients. As 
                        part of our global team, you'll be working with the latest software and leading-edge development 
                        tools&#151;giving you the opportunity to build specialist skills and expertise on the job. We need 
                        people who thrive on technology challenges. People who can help turn innovative ideas into effective 
                        results.</p>

                        <p>At Accenture Technology Solutions we offer an 8-week training program targeted towards 
                        individuals starting their career in IT. This program covers the latest, in-demand technologies, 
                        including C, Java and/or ERP. Demand for certain skills in a location will determine whether the 
                        training includes Java or ERP but all people in the training program will receive the C training.</p>

                        <p>This program gives people the opportunity to deepen their skills and learn how, at Accenture 
                        Technology Solutions, they can use them to help deliver innovative solutions to Accenture clients. 
                        During the training program, participants will gain exposure to new technologies and receive the 
                        latest training along with other IT specialists. It's a great opportunity to learn and network. The 
                        training is made up of two intense four-week courses starting with C programming followed by 
                        4 weeks of a location-specific training, covering either Java or ERP. The training uses the latest 
                        technology in training and stimulates group interaction.</p>

                        <p>You could get a job at the end of the training program!</p>

                        <p>The Entry-Level Training Program is our primary vehicle for selecting people for Programmer 
                        roles at Accenture Technology Solutions. People who successfully complete this program may be 
                        offered a position as a Programmer with Accenture Technology Solutions. So not only will you have 
                        the opportunity to strengthen IT skills and learn to apply them in a business environment, you 
                        could potentially gain a job at the end of it.</p>

                        <p><strong>Job Description</strong><br />
                        To be eligible for the Entry-Level Training Program, you need to have significant training in 
                        programming and software development including training in at least one of the following: C, C&#43;&#43;, 
                        Java or Visual Basic. If you are interested in joining a training program in a location that is not 
                        currently listed, make sure to check our website often. We regularly update our location listings.</p>
                                                
                        <p><strong>Required Skills</strong><br />
                        Significant training in programming and software development including training in at least 
                        one of the following: C, C&#43;&#43;, Java or Visual Basic. </p>

                        <p><strong>Job Locations</strong><br />
                        Detroit, MI <br />
                        Florham Park, NJ <br />
                        San Francisco, CA <br />
                        Kansas City, MO</p>
                        
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

