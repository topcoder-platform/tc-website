<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Jobs available working for TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

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
        <td width="15"><img src="/i/clear.gif" alt="" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">about_tc</xsl:with-param>
                <xsl:with-param name="title">Working at TopCoder</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br />
                       
                        <h3>Project Manager</h3>
                        
                        <p><strong>Job Description</strong></p>
                        
                        <ul>
                            <li>Work closely with TopCoder Software customers to identify business needs and translate them into technical specifications</li>
                            <li>Work with Sales and Application Managers to create work proposals</li>
                            <li>Work with customer, Application Manager and Creative resources to complete the Specification phase of the Application Development Methodology.  This entails creating:</li>
                            
                            <ul>
                                <li>Requirement Specifications</li>
                                <li>Activity Diagrams</li>
                                <li>Use Cases</li>
                                <li>Working Prototype</li>
                                <li>Deployment Diagram</li>
                                <li>Project Plan</li>
                            </ul>
                            
                            <li>Work with implementation team to deploy the application for the customer</li>
                        </ul>

                        <p>Additional Responsibilities:</p>
                        
                        <ul>
                            <li>May work with multiple customers simultaneously</li>
                            <li>Must be willing to travel up to 100%</li>
                        </ul>

                        <p>Technical Skills:</p>
                        
                        <ul>
                            <li>Strong grasp of Object Oriented design principles with a focus on component based software development</li>
                            <li>Demonstrated experience in software application design</li>
                            <li>Technical experience in relevant project technologies.  For example, a given project may require familiarity 
                            with the following technologies:</li>
                            
                            <ul>
                                <li>Java 1.3 (JSP, Servlets, JDBC)</li>
                                <li>Relational database design (Microsoft SQL Server or Oracle)</li>
                            </ul>
                            
                            <li>Experience managing software development projects</li>
                        </ul>

                        <p>Professional Skills:</p>
                     
                        <ul>
                            <li>Excellent communication skills</li>
                            <li>Proven leadership and management experience</li>
                            <li>Team player</li>
                        </ul>

                        <p>Applicant should be located near one of these metropolitan areas (no exceptions):</p>
                        
                        <ul>
                            <li>Hartford</li>
                            <li>Boston</li>
                            <li>New York</li>
                            <li>Richmond</li>
                            <li>Detroit</li>
                        </ul>
                        
                        <p align="center" class="bodyText"><a href="mailto:service@topcodersoftware.com?subject=TopCoder Project Manager Position">Apply for this job</a> by email. </p>
                        <p><br/></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
