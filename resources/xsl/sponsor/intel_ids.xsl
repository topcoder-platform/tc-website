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

<title>Intel is a proud sponsor of TopCoder Coding Competitions</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="99%">
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td align="left" width="100%">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td><embed src="/i/sponsor/intel_ids/ids_movie.swf" quality="high" wmode="opaque" bgcolor="#8D9AC1" width="289" height="130" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></td>
                                <td valign="top" rowspan="2"><img src="/i/sponsor/intel_ids/intel_dev_services.gif" alt="Intel Developer Services--Software and Solutions" width="275" height="55" /></td>
                            </tr>
                            <tr>
                                <td valign="bottom"><img src="/i/sponsor/intel_ids/yellow.gif" width="289" height="12" /></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                            
                <tr valign="top">
                    <td align="left" width="100%" class="bodyText">

                        <p class="promoText">In a complicated world, questions abound. Where are the tools you need to make your software sing? What standards are being 
                        adopted in the industry? How can you take advantage of new technologies?  Intel&#174; Developer Services can help with answers. 
                        Make sure you're taking advantage of the content, tools and training to help maximize your code's performance while minimizing 
                        time and effort.</p>
                        
                        <p class="promoCallout">Go to <A href="http://www.intel.com/ids/index.htm?iid=ids_topcoder+home&amp;" target="_blank">www.intel.com/IDS</A> for 
                        FREE technical resources designed to help you capitalize on today's technology trends:</p>
                        
                        <table border="0" cellpadding="4" cellspacing="0">
                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><A href="http://www.intel.com/ids/training/index.htm?iid=ids_topcoder+training&amp;" target="_blank"><strong>Technical Training:</strong></A> 
                                Get up to speed with courses from Hyper-Threading Technology to Migration to Occasionally Connected Computing<br />
                                    <li>Webcasts</li>
                                    <li>Software College</li>
                                    <li>Online Tutorials</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><A href="http://www.intel.com/ids/index.htm?iid=ids_topcoder+home&amp;" target="_blank"><strong>Focused Content:</strong></A> 
                                Keep informed with articles and conversation on today's hottest software technologies and topics<br />
                                    <li>Code Central</li>
                                    <li>Columns and Case Studies</li>
                                    <li>Online Community Forums</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><A href="http://www.intel.com/software/products/index.htm?iid=ids_topcoder+spd" target="_blank"><strong>Software Developer Tools:</strong></A> 
                                Download free trial versions and discover just how much performance matters<br />
                                    <li>Compilers</li>
                                    <li>Performance Analyzers</li>
                                    <li>Performance Libraries</li><br />
                                </td>
                            </tr>
                        </table>
                            
                        <p class="promoText"><A href="http://www.intel.com/ids/register/index.htm?iid=ids_topcoder+register&amp;" target="_blank">Register now</A> 
                        and make sure you're taking advantage of all your resources! As a member of Intel Developer Services, you'll be among the first to learn about 
                        the latest Intel technologies, helping you create faster, more responsive applications in less time.</p>
                        
                        <p class="promoCallout">Find out more at <A href="http://www.intel.com/ids/index.htm?iid=ids_topcoder+home&amp;" target="_blank">www.intel.com/IDS</A></p>
                        
                        <p><br /></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

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

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
