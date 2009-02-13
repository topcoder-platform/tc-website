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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;eBay Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=ebay_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=ebay" class="bodyText"><img src="/i/es/ebay/eBay_logo.gif" width="121" height="56" alt="eBay" border="0" /></A></p>

                        <h3>Staff Software Engineer, Selling - 0300136</h3>
                        
                        
                        <p><strong>Job Description</strong><br />
                        We are seeking a highly motivated individual for a Staff Software Engineer position in the Selling Development team to deliver high quality selling features to our 
                        eBay sellers. As part of a fast pace organization, the candidate will be responsible for defining, designing, coding, testing and debugging complex, multi-tier 
                        distributed software applications; helping estimate engineering effort, planning implementation and rollout of system changes. Work with Product Marketing, 
                        other engineers, QA, DBA, and Operations team. Must be able to independently design, code, and coordinate complex projects. Should be able to multi-task 
                        implementation, design and project discussions with Product Marketing. Be able to lead other developers to deliver quality projects on a timely basis. The 
                        candidate is expected to be a self-starter, collaboration, a strong drive for results and continuous improvement.
                        </p>
                                                
                        <p><strong>Required Skills</strong></p>
                        <ul>
                        <li>BS/BA in CS or related field</li>
                        <li>7+ years experience in object-oriented analysis, design, development, and unit testing of scalable, distributed multi-tier applications</li>
                        <li>3+ years experience in J2EE, including servlets, JSP, Java Beans, EJB, JMS, RMI, JDBC</li>
                        <li>5 yrs experience in C++ development.</li>
                        <li>3 years experience in web-based application development, including L18N and L10N best practices.</li>
                        <li>2 years development experience using relational databases.</li>
                        <li>Working knowledge of ISAPI, XML, XSL, JavaScript and user interface design.</li>
                        <li>Excellent verbal and written communication skills and detail oriented</li>
                        <li>Familiarity with eBay application a plus.</li>
                        </ul>


                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=ebay_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

