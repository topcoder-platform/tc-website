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

<title>Solipsys jobs at TopCoder Employment Services</title>

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
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr><td valign="middle" height="18" bgcolor="#43515E" class="statText"><b>&#160;Solipsys Jobs</b></td></tr>
                            <tr><td valign="middle" height="18" class="bodyText"><a href="/?&amp;t=tces&amp;c=symbol_openings&amp;a=secure" class="bodyText">Jobs</a> | <a href="http://www.symbol.com/about/careers/career_culture.html" target="_blank" class="bodyText">Culture</a> | <a href="http://www.symbol.com/about/careers/career_profgrowth.html" target="_blank" class="bodyText">Professional Growth</a> | <a href="http://www.symbol.com/about/careers/career_benefits.html" target="_blank" class="bodyText">Benefits</a></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <img src="/i/es/solipsys/solipsys_logo.gif" width="135" height="60" alt="" border="0" vspace="10"/>

                        <p>Symbol Technologies, Inc. is a global leader in mobile data management systems and services with innovative 
                        customer solutions based on wireless local area networking for voice and data, application-specific mobile 
                        computing and bar code data capture. Symbol's wireless LAN solutions are installed at more than 45,000 
                        customer locations, and more than seven million Symbol scanners and application-specific scanner-integrated 
                        mobile computer systems are in use worldwide. Symbol and its global network of business partners provide 
                        solutions for retailing, transportation and distribution logistics, parcel and postal delivery, healthcare, 
                        education, manufacturing and other industries.</p>
                        
                        <p>Symbol puts a premium on creativity, innovation and continual learning and expects their associates to do 
                        the same.  They believe that satisfaction comes from achieving individual and team goals, working with 
                        innovative and emerging technologies, having the freedom and confidence to implement new designs and interacting 
                        in a successful, forward-thinking environment.</p>
                        
                        <p>At Symbol, their greatest assets are their people's ideas, innovation, energy and discoveries.  Symbol associates 
                        are the heart and soul of the company and the essence behind transforming abstract thoughts into concrete 
                        solutions.  To ensure Symbol's continuing leadership in the integrated data management industry, the company 
                        gives its associates the resources they need, the freedom they crave and the encouragement they deserve.</p>
                        
                       <p>Come on… <a href="/?&amp;t=tces&amp;c=solipsys_openings&amp;a=secure" class="bodyText">join our team.</a></p>
<!-- Client Message Ends -->

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

