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
                    <td align="left" width="100%" class="bodyText">

                        
                        <table border="0" cellpadding="4" cellspacing="0">
                            <tr valign="top">
                                <td valign="top" width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Technical Training.</strong> 
                                Offered in classrooms as well as via online tutorials and webcasts, our training can help you get up to speed on the latest information to develop and enhance your solutions.<br />
                                    <li>"Building Mobile Apps for Intermittant Connections"</li>
                                    <li>"Thread Programming and Hyper-Threading Technology"</li>
                                    <li>"3D Animation for Engineers"</li>
                                    <li>"Steal Our Secrets &#151; Make Your .NET* App Run Faster"</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td valign="top" width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Focused Content.</strong> 
                                Keep informed with articles and conversation on today's hottest software technologies and topics<br />
                                    <li>Code Central &#151; offering free samples and downloads</li>
                                    <li>Columns and Case Studies</li>
                                      <li>Developer Community Forums</li>
                                    <li>Developer Solutions Catalog &#151; a dynamic resources in which you can showcase your software products</li><br />
                                </td>
                            </tr>

                            <tr valign="top">
                                <td valign="top" width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Developer Centers.</strong> 
                                These topic-specific community forums provide technical, e-Business and strategic content and developer discussions tailored to your software needs and interests. Some examples: <br />
                                    <li>Software Technologies &#151; Mobile Technology, Peer-to-Peer, Java, .NET, Handheld and Wireless App Development  </li>
                                    <li>Intel Processors &#151; Itanium Processor Family, Pentium 4 Processor, Xeon Processor  </li>
                                    <li>Industry Segments &#151; Digital Media, Games </li>
                                    <li>Operating Systems &#151; Windows*, Linux* </li><br />
                                </td>
                            </tr>
                            
                            <tr valign="top">
                                <td valign="top" width="20"><img src="/i/clear.gif" width="13" height="4" border="0" /><br /><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Early Access Program.</strong> 
                                Part of a company? If yes, membership to the Early Access Program gives your company early access to the following: <br />
                                    <li>Intel's next-generation platforms &#151; directly or through Protected Remote Access</li>
                                    <li>Comprehensive technical support  </li>
                                    <li>Industry Segments &#151; Digital Media, Games </li>
                                    <li>Extensive marketing and promotional opportunities</li><br />
                                </td>
                            </tr>
                            
                        </table>
                            
                

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
