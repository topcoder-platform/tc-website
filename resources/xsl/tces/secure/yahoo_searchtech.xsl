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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Yahoo! Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=yahoo_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=yahoo" class="bodyText"><img src="/i/es/yahoo/yahoo_logo.gif" width="137" height="35" alt="Yahoo!" border="0" /></A></p>

                        <h3>Technical Yahoo! Software Engineer (Search Technologies)</h3>
                        
                       <p>Yahoo! HotJobs is currently looking for a Software Engineer to design and develop HotJobs' current and future products in 
                       the Sunnyvale or NYC office. A successful candidate for this position will set the technology direction for projects and 
                       directly impact the delivery of products that drive HotJobs' business success! </p>
                       
                       						
						<p>Specific requirements include:</p>
						
						<ul>
						<li>M.S. in Computer Science or equivalent</li>
						<li>5+ years developing high-quality high-performance Internet-based services including extensive track record of launching industry-leading applications</li>
						<li>Ability to be hands-on in all phases of software development including design, implementation, testing, and deployment</li>
						<li>Outstanding implementation skills in C/C++ or Java on Unix platforms</li>
						<li>Ability to influence strategic technical decisions, including 3rd party vendor selection, and ensure that technical decisions are made according to HotJobs business needs</li>
						<li>Ability to effectively communicate with all participants in the development lifecycle including Marketing, Product Management, and Operations teams</li>
						<li>Ability to mentor junior engineers and define best practices within the development team</li>
						</ul>

                        <p>Preferred Skills:</p>
                        
                        <p>Experience with database schema design and query tuning is a plus and familiarity with search engine technologies is a strong plus!</p>
                       
                        <p><strong>Job Location</strong><br/>
                        Sunnyvale, CA or New York, NY</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=yahoo_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

