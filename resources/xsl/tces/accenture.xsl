<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Accenture Jobs at Tallan Employment Services</title>

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
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Accenture Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=accenture_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><A href="/?&amp;t=tces&amp;c=accenture" class="bodyText"><img src="/i/es/accenture/accenture_logo.gif" width="134" height="71" alt="Accenture" border="0" /></A></p>

                        <p>Accenture Technology Solutions is a global company of technology specialists who do application development, 
                        systems admin work, and develop and maintain software.</p>

                        <p>For people with problem-solving minds and technical skills, Accenture Technology Solutions offers a 
                        collaborative and challenging work environment. One that recognizes diversity, respects individual differences, 
                        and encourages people to achieve. One that also encourages people to keep a healthy work-life balance.</p>

                        <p>Accenture Technology Solutions people tend to work in project or client teams, alongside Accenture consultants. 
                        Many are based in Accenture Delivery Centres around the world. Others might work on-site with Accenture clients 
                        and may travel from time to time. No matter the location, we strive to create a friendly, inviting, and diverse 
                        atmosphere.</p>

                        <p>We value professionalism, not uniformity. Different work styles, values, backgrounds, and ideas are part 
                        of our strength. </p>

                        <p>At Accenture Technology Solutions we have a learning culture, where everyone is encouraged to expand their 
                        technology skills everyday by working on challenging projects and applying Accenture's vast toolset technology 
                        assets. Our open atmosphere is designed to encourage the exchange of ideas. </p>

                        <p>As well, we offer a supportive environment where everyone has a team to go to with project-related issues 
                        or for general questions and support.</p>

                        <p>We have opportunities at a range of levels. So whether you are a recently qualified programmer or one with 
                        several years of experience looking for something new, you can apply your technology skills on the job, and 
                        expand and deepen them to become a true expert.</p>

                        <p>In short, we're seeking people who are enthusiastic and want to work hands-on with technology.</p>

                        <p>Check out our <A href="/?&amp;t=tces&amp;c=accenture_openings&amp;a=secure" class="bodyText">available positions</A></p>
<!-- Client Message Ends -->

                        <p><br /></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br />
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

