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

<title>Intel&#174; Developer Library</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>
<table border="0" cellspacing="10" cellpadding="0" width="100%">
    <tr valign="top">
        <td align="left"><img src="/i/sponsor/intel_ids/IDL-logo-square.gif" width="120" height="80" />
        </td>
    </tr>
    <tr>
        <td align="left" width="100%" class="bodyText">
            <p><strong>Search Online. <br/>
            Every page of every book.</strong></p>
            
            <p>The Intel&#174; Developer Library is an essential source of relevant information that is not 
                available anywhere else. </p>
                  
                <p>Enjoy routine access to thousands of dollars of books, combined with key technical 
                documents all selected by industry experts and organized for easy online searching to 
                SAVE YOU VALUABLE TIME. </p>
                <p>Get the best technical information and get it NOW.  Some examples: 
                <ul>    
                <li><font color="#0033CC">Intel Itanium&#174; Processor Reference Manual: For Software Development and 
                Optimization</font> -publisher: Intel Corporation, 2003 </li>
                
                <li><font color="#0033CC">Wi-Fi Handbook: Building 802.11b Wireless Networks</font> - publisher: McGraw-Hill, 2003</li>
                
                <li><font color="#0033CC">IA-32 Intel&#174; Architecture Software Developer's Manual, Volume 3: System 
                Programming Guide</font> - publisher: Intel Corporation, 2003</li>
                
                <li><font color="#0033CC">The Get-Started Guide to M-Commerce and Mobile Technology</font> - publisher: 
                AMACOM, 2002</li>
                
                <li><font color="#0033CC">Designing Embedded Communications Software</font> - publisher: CMP Books, 2003</li>
                
                <li><font color="#0033CC">Intel&#174; Pentium&#174; 4 Processor in the 478-pin Package/Intel&#174; 850 Chipset Family 
                Platform: Design Guide</font> -publisher: Intel Corporation, 2003</li>
                
                <li><font color="#0033CC">Intel Desktop Board D875PBZ: Technical Product Specification</font> - publisher: Intel 
                Corporation, 2003 </li>
                
                <li><font color="#0033CC">Introduction to PCI Express: A Hardware and Software Developer's Guide</font> - publisher: Intel Press, 2003</li>
                </ul>
                </p>
                
        </td>
    </tr>
</table>
</body>

</html>

  </xsl:template>
</xsl:stylesheet>
