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
                            <tr> <td valign="top"><img src="/i/sponsor/artifact/artifact_banner.gif" width="510" height="66" /></td>
                            </tr>
                            <tr> <td valign="top"><img src="/i/sponsor/artifact/artifact_headline.gif" width="510" height="66" /></td>
                            </tr>
                        </table>
                        
                        
                  <table>
             <tr valign="top">
                    <td align="left" width="100%" class="bodyText">

                        <p class="promoText">Need quick answers to your Programming Questions? </p>
                        
                        <p class="promoText">Tired of wasting time looking for code? </p>
                        
                        <p class="promoText">At Artifact, we've created software products and an on-line developer network to help developers better manage their resources. </p>
                        
                        <p class="promoText">The Artifact Network&trade; is an on-line developer network that provides developers with an open forum to exchange code and development expertise. </p>
                        
                        <p class="promoText">The Artifact Desktop&trade; is a free .Net application that helps the individual developer to easily find, manage and share code, and collaborate with other 
                         developers in real-time. </p>
                         
                         <p class="promoText">The Artifact Server&trade; enables a development team to quickly establish their own private code-sharing network behind the corporate firewall. If so, the Artifact 
                           Desktop can help. It's a free application that provides access to the global Artifact Developer Network. This network contains thousands of code snippets and thousands of experienced 
                           developers. The Artifact Desktop helps you to quickly locate code you need from our network's repository. You can search for code snippets by language, platform, category and more. </p>
                        
                        <p class="promoText">For immediate answers to your programming questions, use the Artifact Desktop's instant messaging and chat functionality to tap the expertise of other developers 
                        in the Artifact Network. </p>
                        
                        
           	<p class="promoText">Get the Artifact Desktop now, and build better software - faster </p>
           	
           	<p class="promoText">To visit Artifact's Netork click here. </p>
                        
                   </td>
                </tr>
            </table>
            
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
