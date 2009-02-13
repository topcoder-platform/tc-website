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
  <xsl:import href="../nvidia_links.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>Job Listings for Nividia at TopCoder</title>

<xsl:call-template name="CSS"/>      

<!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
</head>

<body>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>

<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15" valign="top"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%" valign="top">

            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" colspan="2" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/><br/>

<!-- Nvidia Links Begins -->
                        <xsl:call-template name="nvidia_links"/>
<!-- Nvidia Ends -->

                        <div align="center"><a href="/?&amp;t=tces&amp;c=nvidia"><img src="/i/es/nvidia/intern_banner.gif" width="510" height="100" alt="" border="0" vspace="10" /></a></div>       

                        <p>We are reinventing the visual experience beyond the bleeding-edge with the best hardware and software innovation.  The culture promotes 
                        and inspires our driven team of world-class engineers and developers to be at the top of their game...and to have fun along the way!  We are shaping 
                        the world of tomorrow...today.  Are you ready?</p>
            
                        <p>At NVIDIA, we thrive on innovation, we're passionate about developing revolutionary technology, and we have the most brilliant minds in graphics, 
                        hardware, and software.  If this sounds like the place you want to be, see what opportunities are waiting for you! </p>
            
                        <p>Positions are available in our Santa Clara, CA headquarters in the following areas:</p>
                        <ul>
                            <li>Architecture</li>
                            <li>Marketing - Demo &#38; Performance Teams</li>
                            <li>Software Engineering</li>
                            <li>IT Business Development &#40;Engineering&#41;</li>
                        </ul>
            
                        <p><a href="/?&amp;t=tces&amp;c=nvidia_openings_intern_soft&amp;a=secure" class="bodyText">SOFTWARE &#38; GRAPHICS</a><br/>
                        <a href="/?&amp;t=tces&amp;c=nvidia_openings_intern_hard&amp;a=secure" class="bodyText">HARDWARE &#38; SYSTEMS ENGINEERING</a><br/></p>
            
                        <p>As an New College Grad at NVIDIA, your career starts faster than the speed of light!  You will be working side by side with some of the world's best engineers, 
                        and you will have an opportunity of a lifetime to make your mark in history.  Where your career will go...only you can tell!</p>
            
                        <p>As an intern&#47; co-op at NVIDIA, you will be empowered to show what you can do.  You are a valuable member of our team and play a critical role in the development 
                        of our latest products.  Your success will be determined by your technical strength and undisputed proactive attitude.</p>
            
                        <p>If you are highly motivated and passionate about winning, check out the possibilities waiting for you.</p>
            
                        <p>At NVIDIA, the sky's the limit! Visualize your future...We do.</p>

                        <p><strong>YOUR FUTURE BEGINS HERE...</strong></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot"/>
<!-- Footer Ends -->

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
