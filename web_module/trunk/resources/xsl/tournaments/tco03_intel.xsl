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

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<xsl:call-template name="Preload"/>      

<title>Intel&#174; is the title sponsor of the 2003 TopCoder Open</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body onLoad="timer(1);">

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
        <td class="bodyText" align="center">
            <table border="0" cellspacing="15" cellpadding="0" width="540">
                <tr valign="top">
                    <td colspan="2" class="bodyText">
                        <p><img src="/i/sponsor/intel_ids/IDS_Novbr2TC-header.gif" width="510" height="115" alt="Intel Developer Services" /></p>
                    </td>
                </tr> 
                
                <tr align="left">
                    <td class="bodyText"> 
                    
                        <p><strong>Intel&#174; Developer Services</strong> offers the technical content, resources and opportunities you need to keep pace with 
                        industry innovations, take advantage of emerging technologies, and accelerate the successful development and deployment of your software 
                        solutions, applications and tools. </p>
                                             
                        <p>Membership gives you <strong>FREE</strong> access to code samples, demos, software documentation, online training, developer 
                        forums, technical content and more.  Check out what Intel Developer Services offers you.  Then join today. </p>
                        
                        <p align="center"><strong>Compete in TopCoder Single-Round Matches = Be Eligible to Win Intel Prizes.</strong></p>
                        
                        <p>Now through March 2004, if you're a member of Intel Developer Services AND take part in any of the five (5) Intel-sponsored 
                        TopCoder Single-Round Matches, you'll be eligible for a chance to win one the following (each SRM will have a unique drawing):</p>
                        
                        <table> 
                            <tr>
                             <td><img src="/i/sponsor/intel_ids/Centrino_Image_embossed.jpg" width="120" height="117" /></td>
                             <td><p>Intel&#174; Centrino&#153; mobile technology-based notebook!  View Specs.  </p>
                                    <p>Register Now!  Use  promottiion  code  TCO2003.</p></td>
                             <td><img src="/i/sponsor/intel_ids/IDL-Logo-Square.gif" width="216" height="144" /></td>
                             <td><p>One-year subscription to the Intel&#174; Developer Library.  A year's worth of  free access to the most relevant technical books available. Read More.</p>
                             <p>Register Now! Use promotion code TCO2003.</p></td>
                         </tr>
                     </table>
                             

       
                        <p><strong>Check the TopCoder site for SRM dates and times. Remember to use promotion code <font color="#CC0000"><strong>TCO2003</strong></font> and 
                        compete in any Intel-sponsored Single-Round Match for a chance to win!</strong></p>
                    
                    
                        <p class="smallText">*Intel, the Intel Inside logo, Intel Centrino and the Intel Centrino logo are trademarks or registered trademarks of Intel Corporation or its 
                        subsidiaries in the United States and other countries.</p>
                    
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
                <xsl:with-param name="sectionSubname">intel</xsl:with-param>
            </xsl:call-template>
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
