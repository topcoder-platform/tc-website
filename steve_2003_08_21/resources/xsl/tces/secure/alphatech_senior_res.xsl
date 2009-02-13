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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;ALPHATECH Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=alphatech_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=alphatech" class="bodyText"><img src="/i/es/alphatech/alphatech_logo.gif" width="141" height="64" alt="ALPHATECH" border="0" /></A></p>

                        <h3>Senior Software Research Engineer (Req 02-63)</h3>
                        
                        <p><strong>Job Description</strong><br />
                        ALPHATECH is the prime contractor on an exciting new project to develop the next generation of database technology 
                        needed to support ultra-large scale data mining.  The resulting technology will be capable of efficiently storing 
                        and rapidly accessing vast quantities of heterogeneous data, will provide mechanisms for handling information 
                        uncertainty, and will incorporate novel query management techniques to efficiently access a wide variety of data 
                        sources for new, relevant data.  ALPHATECH is currently seeking a number of qualified candidates to support this 
                        exciting new program. </p>

                        <p>The successful candidate will be involved in the application of an advanced distributed application framework 
                        and other relevant technologies to build an active, distributed database system.  The candidate will be part of a team, 
                        and will assist in all phases of program execution, from theory and research to software implementation.  Activities 
                        will include developing and evaluating alternative algorithms and architectures, interfacing with other ALPHATECH 
                        team members and subcontractors, and interfacing with various co-contractors and end users of the research systems.</p>

                        <p><strong>Required Skills</strong><br />
                        Ph.D. in Computer Science or related field with proven skills in large-scale software development using 
                        object-oriented approaches in the C&#43;&#43; and Java languages.  Ability to do research and generate new ideas as 
                        well as practical experience in building distributed applications and database systems.  Exposure to agent 
                        technologies, and intelligent systems is desirable.  The candidate must have good communications skills and 
                        must be willing to work as part of a team.</p>

                        <p>US Citizenship is required.</p>
                        
                        <p><strong>Job Location</strong><br />
                        Burlington, MA</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=alphatech_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

