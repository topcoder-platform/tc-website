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

<title>Intel Developer Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body onLoad="timer(1);">

<table border="0" cellspacing="10" cellpadding="0" width="100%">
    <tr valign="top">
        <td align="center"><img src="/i/sponsor/intel_ids/sample_header.gif" width="510" height="64"/></td>
    </tr>
    
    <tr>
        <td align="left" width="100%" class="bodyText">
            <table border="0" cellpadding="4" cellspacing="0">
                <tr valign="top">
                    <td valign="top" width="13"><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                    <td valign="top" width="99%" class="bodyText"><strong>Technical Training.</strong> 
                        Offered in classrooms as well as via online tutorials and webcasts, our training can help you get up to speed on the latest information to develop and enhance your solutions.<br />
                                    <ul>
                                    <li>"Building Mobile Apps for Intermittent Connections"</li>
                                    <li>"Thread Programming and Hyper-Threading Technology"</li>
                                    <li>"3D Animation for Engineers"</li>
                                    <li>"Steal Our Secrets&#151;Make Your .NET* App Run Faster"</li>
                                    </ul>
                                </td>
                            </tr>

                            <tr valign="top">
                                <td valign="top" width="13"><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Focused Content.</strong> 
                                Keep informed with articles and conversation on today's hottest software technologies and topics.<br />
                                <ul>
                                    <li>Code Central&#151;offering free samples and downloads</li>
                                    <li>Columns and Case Studies</li>
                                      <li>Developer Community Forums</li>
                                    <li>Developer Solutions Catalog&#151;a dynamic resources in which you can showcase your software products</li></ul>
                                </td>
                            </tr>

                            <tr valign="top">
                                <td valign="top" width="13"><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Developer Centers.</strong> 
                                These topic-specific pages provide technical, e-Business and strategic content and developer discussions tailored to your software needs and interests. Some examples: <br />
                                    <ul>
                                    <li>Software Technologies&#151;Mobile Technology, Peer-to-Peer, Java*, .NET*, Handheld and Wireless App Development  </li>
                                    <li>Intel Processors&#151;Itanium&#174; Processor Family, Pentium&#174; 4 Processor, Xeon&#174; Processor  </li>
                                    <li>Industry Segments&#151;Digital Media, Games </li>
                                    <li>Operating Systems&#151;Windows*, Linux* </li></ul>
                                </td>
                            </tr>
                            
                            <tr valign="top">
                                <td valign="top" width="13"><img src="/i/sponsor/intel_ids/bttn.gif" height="13" width="13" alt="*" border="0" /></td>
                                <td valign="top" width="99%" class="bodyText"><strong>Early Access Program.</strong> 
                                Part of a software development company? If yes, membership to the Early Access Program gives your company early access to the following: <br />
                                <ul>
                                    <li>Intel's next-generation platforms&#151;directly or through Protected Remote Access</li>
                                    <li>Comprehensive technical support  </li>
                                    <li>Industry Segments&#151;Digital Media, Games </li>
                                    <li>Extensive marketing and promotional opportunities</li></ul>
                        </td>
                    </tr>
                            
            </table>
        </td>
    </tr>
</table>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
