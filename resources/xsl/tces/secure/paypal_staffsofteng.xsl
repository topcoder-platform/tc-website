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
                <xsl:with-param name="title">TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr>
                <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;PayPal Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=paypal" class="bodyText"><img src="/i/es/paypal/paypal_logo.gif" width="150" height="50" alt="PayPal" border="0" /></A></p>

                        <p><h3>Staff Software Engineer</h3></p>
                        
                        <p><strong>Primary Job Responsibilities</strong><br> 
                        Auctions payments make up a large portion of PayPal's transaction volume. As a software engineer in the auction tools team, 
                        you will create new and exciting auction features that will have a visible and immediate impact to our site. This team works to 
                        enhance the auction user's experience from a PayPal point of view. Responsibilities include but are not limited to: reviewing specs 
                        with Product Managers, giving estimates on spec execution, designing and coding features, debugging features in support of QA and 
                        Live Ops. Primary technologies used are C++ and Oracle SQL.
                        </br>
                        </p>
                        
                        <p><strong>Job Requirements</strong></p>
                        <p>We are looking for exceptional software engineers that have a strong command of C++ in a UNIX/Linux environment. The ideal 
                        candidate has 5+ years of programming experience and a strong understanding of relevant web protocols. This candidate will be experienced 
                        with designing and implementing large scale systems and be well versed in application level, database and network programming. The ideal 
                        candidate will be able to assess current processes to determine scalability and reliability and make recommendations for improvement. 
                        Individuals from a software, Internet, or networking environment are highly desirable. Working knowledge of auction sites, particularly 
                        eBay, is a strong plus; knowledge of XML and experience with SQL also desirable. CS or related degree is helpful.</p>               
                        
                        <p><A href="/jobposting?&amp;t=JobHitTask&amp;jid=172&amp;jt=2" class="bodyText">Apply now!</A></p>
                        <p><A href="/?&amp;t=tces&amp;c=paypal_openings&amp;a=secure" class="bodyText">Back To Jobs</A></p>

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

