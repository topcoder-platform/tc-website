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
        <td width="170" bgcolor="#CCCCCC">
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

                        <h3>Software Engineer, Algorithms Team, #03-007827</h3>
                        
                        <p><strong>Job Description</strong><br />
                        We are looking for experienced, accomplished computer scientists to serve as engineers reporting to the Chief 
                        Algorithms Officer. Amazon.com is solving incredibly interesting algorithmic challenges, ranging from 
                        personalization and data mining to pricing and inventory control problems&#151;even to traveling salesmen 
                        problems. The Web, with its scale and the availability of instant data and feedback, has taken these old 
                        problems&#151;and many new ones&#151;to new dimensions. We are looking for people who are comfortable 
                        with abstract thinking as well as with detailed solutions; people with experience in applying new algorithms 
                        to real-world problems; people who care about users and their experience; people who are independent 
                        thinkers and builders who enjoy seeing their creations impact millions of people.</p>
                        
                        <p><strong>Required Skills</strong><br />
                        The ideal candidate will be a computer scientist with a proven track record of building innovative solutions. 
                        A Ph.D. in computer science is preferred, but not required (provided the candidate has equivalent research and 
                        innovation experience), with a minimum of 5 years of industry experience. This position, in which you will 
                        push for new ideas throughout the company, requires a unique blend of hands-on development and evangelism. 
                        You will work with many different groups and will have great visibility within the company.</p>

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

