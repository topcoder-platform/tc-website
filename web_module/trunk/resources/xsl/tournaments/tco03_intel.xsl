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
                                <td valign="top" rowspan="2"><img src="/i/sponsor/intel_ids/intel_dev_services_2.gif" alt="Intel Developer Services--Maximize You Code" width="275" height="55" /></td>
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

                        <p class="promoText"> Change     Technology complexity is increasing at a blistering pace. In both the business and consumer markets, products that were once considered nice-to-haves 
                        are rapidly becoming expectations, challenging software developers to create and optimize solutions that fulfill their customers' growing demands.</p>
                        
                        <p class="promoText"><A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup" target="_blank"><strong>Intel&#174; Developer Services </strong></A>offers the resources and 
                        opportunities you need to keep stride with industry innovations, take advantage of emerging technologies and accelerate the successful development and delivery of your solutions.</p>
                        
                        <p class="promoText">With offerings such as legacy and emerging code, demos, software documentation, online training, developer forums and technical white papers, membership with 
                        <A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup" target="_blank"><strong>Intel Developer Services</strong></A> gives you <strong>FREE</strong> access to tools and resources that can maximize your code's performance, give you time-to-market advantage and make your software sing. Fast.</p>
                        
                        
                        <p class="promoCallout">Register at <A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup" target="_blank">www.intel.com/IDS</A> today and get FREE 
                        technical resources designed to help you capitalize on today's technology trends&#58;</p>
                        
           
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                        <td valign="top" rowspan="2"><img src="/i/sponsor/intel_ids/intel_centrino.gif" alt="Intel Developer Services--Maximize You Code" width="493" height="174" /></td>
                        <td></td>
                            </tr>
                        </table>
                        
            
                       <table border="0" cellpadding="4" cellspacing="0">
                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Technical Training.</strong>
                                Offered in classrooms as well as via online tutorials and webcasts, our training can help you get up to speed on the latest information to develop and enhance your solutions.<br />
                                   <li>"Building Mobile Apps for Intermittant Connections"</li>
                                    <li>"Thread Programming and Hyper-Threading Technology"</li>
                                    <li>"3D Animation for Engineers"</li>
                                    <li>"Steal Our Secrets &#151; Make Your .NET* App Run Faster"</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Focused Content.</strong>
                                Keep informed with articles and conversation on today's hottest software technologies and topics<br />
                                    <li>Code Central &#151; offering free samples and downloads</li>
                                    <li>Columns and Case Studies</li>
                                    <li>Developer Community Forums</li>
                                    <li>Developer Solutions Catalog &#151; a dynamic resource in which you can showcase your software products</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Developer Centers.</strong>
                                These topic-specific community forums provide technical, e-Business and strategic content and developer discussions tailored to your software needs and interests. Some examples&#58;<br />
                                    <li>Software Technologies &#151; Mobile Technology, Peer-to-Peer, Java, .NET, Handheld and Wireless App Development</li>
                                    <li>Intel Processors &#151; Itanium Processor Family, Pentium 4 Processor, Xeon Processor</li>
                                     <li>Industry Segments &#151; Digital Media, Games</li>
                                    <li>Operating Systems &#151; Windows&#42;, Linux&#42;</li><br />
                                </td>
                            </tr>
                            
                            <tr valign="top">
                                <td width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Early Access Program.</strong>
                                Part of a company&#63; If yes, membership to the Early Access Program gives your company early access to the following&#58;<br />
                                    <li>Intel's next-generation platforms &#151; directly or through Protected Remote Access</li>
                                    <li>Comprehensive technical support</li>
                                    <li>Industry Segments &#151; Digital Media, Games</li>
                                    <li>Extensive marketing and promotional opportunities</li><br />
                                </td>
                            </tr>
                            
         
                            
                        </table>
                            
                        
                        <p class="promoCallout">Give your applications a technology edge. Join <A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup" target="_blank">Intel Developer Services</A> today.</p>
                        
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
