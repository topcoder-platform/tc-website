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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Amazon.com Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=amazon_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=amazon" class="bodyText"><img src="/i/es/amazon/amazon_logo.gif" width="139" height="34" alt="Amazon.com" border="0" /></A></p>

                        <h3>Software Development Engineer, Item Management, #03-008293 </h3>
                        
                        <p><strong>Job Description</strong><br />
                        Amazon.com's Item Management team is looking for an exceptional software engineer to create and enhance 
                        enterprise quality data management systems. The team works with internal clients of a new item catalog 
                        service to create optimal access to needed data around the company. We are looking for a person who has a 
                        true understanding of the software development process and knows how to develop scalable, high-availability 
                        systems.</p>
                        
                        <p><strong>Required Skills</strong><br />
                        Successful candidates will have three or more years of industry software engineering and product delivery 
                        experience. Candidates must have experience building high-performance, reliable systems in a multitiered, 
                        distributed environment. Documented experience delivering mission-critical projects in C/C&#43;&#43; is required, 
                        as is expertise with high-end transactional systems and relational databases. Experience with Berkley DBs, 
                        XML/XSDs, Perl, CORBA, Publish-Subscribe, SQL and database expertise, including data normalization also 
                        desired. Java expertise is also a plus. Candidates must have a firm understanding of the UNIX environment 
                        and application programming. Candidates must be innovative, flexible, and self-directed; they must also 
                        have solid written and verbal communication skills. Candidates should also show a willingness to share, 
                        discuss, and brainstorm in an impromptu as well as more formal setting. An undergraduate degree in 
                        computer science or other engineering fields is required. Amazon.com offers competitive compensation 
                        packages, including 401(k), comprehensive health care, and stock options, as well as the opportunity 
                        to significantly impact the quality and functionality of Amazon.com's stores.</p>

                        <p><strong>Job Location</strong><br />
                        Seattle, WA</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=amazon_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

