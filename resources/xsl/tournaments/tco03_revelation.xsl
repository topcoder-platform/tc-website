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

<title>Revelation Software is corporate sponsor of the 2003 TopCoder Open coding tournament</title>

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
        <td width="170" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="15">

<!-- 2003 JavaOne Conference -->
                <tr><td align="center"><A href="http://www.revelation.com/tcohome/tcoevent03" target="_blank"><img src="/i/tournament/tco03/sponsors/revelation_header.jpg" alt="Revelation Software is a corporate sponsor of the 2003 TopCoder Open" width="565" height="91" border="0" /></A></td></tr>
                            
                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><font face="times"><strong>With more than 1.5 million users, at over 60,000 sites, on all seven continents, 
                        <A href="http://www.revelation.com" target="_blank">Revelation Software</A> can be found in nearly 
                        every industry imaginable. Revelation's flagship product, OpenInsight, is currently being taught at various colleges throughout 
                        the world including the University of D.C.</strong></font></p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><img src="/i/tournament/tco03/sponsors/revelation_pullquote.gif" alt="" width="194" height="138" border="0" align="right" />
                        <img src="/i/tournament/tco03/sponsors/revelation_subhead1.gif" alt="Multi-Value Database" width="245" height="22" border="0" /><br />
                        <font face="times">Our database technology is a PC-based implementation of the MultiValue Database, or MVDB. The 
                        MultiValue (MV) architecture is a mature, powerful technology whose roots go back to the Apollo space program era 
                        (various NASA sites use OpenInsight today). The technology is also sometimes called Post-Relational, 
                        Multi-Dimensional, object-relational, or 4NF (fourth normal form). <A href="http://www.revelation.com/WEBSITE/vipweb.nsf/e4a32622500660198525631900091149/178609577b262b2a852563f500770fc5?OpenDocument#RBE" target="_blank">Learn more</A> 
                        about Revelation's use of MVDB.</font></p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><A href="http://www.revelation.com/website/vipweb.nsf/e4a32622500660198525631900091149/5c1fc5847f2a73eb852563f500761db4?OpenDocument" target="_blank"><img src="/i/tournament/tco03/sponsors/revelation_openinsight_logo.gif" alt="OpenInsight" width="194" height="155" border="0" align="right" /></A>
                        <img src="/i/tournament/tco03/sponsors/revelation_subhead2.gif" alt="OpenInsight for Workgroups" width="315" height="22" /><br />
                        <font face="times"><A href="http://www.revelation.com/website/vipweb.nsf/e4a32622500660198525631900091149/5c1fc5847f2a73eb852563f500761db4?OpenDocument" target="_blank">OpenInsight for Workgroups</A> 
                        is a repository-based applications development environment that 
                        enables development teams to work collaboratively to design, develop, deploy and scale high-performance  business 
                        solutions. OpenInsight's complete  tool set (including a Form Designer, Editor/Debugger, UI WOrkspace, XML 
                        Workspace and more), advanced BASIC&#43;  scripting  language and powerful client/server development combine to 
                        deliver a complete  environment for deploying and evolving network applications. OpenInsight is delivered with a 
                        flexible Multi-Valued, variable length,  filing system, or has the ability OpenInsight for Workgroups is a 
                        repository-based applications development environment that enables development teams to work collaboratively 
                        to design, develop, deploy and scale high-performance  business solutions. OpenInsight's complete  tool set 
                        (including a Form Designer, Editor/Debugger, UI WOrkspace, XML Workspace and more), advanced BASIC&#43; 
                        scripting  language and powerful client/server development combine to deliver a complete  environment for 
                        deploying and evolving network applications. OpenInsight is delivered with a flexible Multi-Valued, variable 
                        length,  filing system, or has the ability</font></p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><img src="/i/tournament/tco03/sponsors/revelation_subhead3.gif" alt="Developer Network" width="245" height="22" border="0" /><br />
                        <font face="times">The Revelation Software Developers Network is provided to foster and support the Revelation 
                        community by offering a resource for networking and solutions. If you need help with your Advanced Revelation or 
                        OpenInsight applications, there are Revelation <A href="http://www.revelation.com/DEVNET.NSF/74f7ca4127a6aae485256682006be8d3?OpenView" target="_blank">consultants</A> 
                        who can help you. Would you like to use a Revelation-based <A href="http://www.revelation.com/DEVNET.NSF/6df062a21244594c852566860073dfe1?OpenView" target="_blank">application?</A> 
                        There are many packaged Revelation-based applications available for a wide variety of vertical and functional 
                        markets. The Revelation Developer <A href="http://www.revelation.com/DEVNET.NSF/5f515126aca03901852566200054b9a3?OpenView" target="_blank">Classifieds</A> 
                        is a forum to bring together companies seeking Revelation developers with developers available for project and/or permanent work.</font></p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><font face="times" size="3"><strong>For more information go to <A href="http://www.revelation.com/tcohome/tcoevent03" target="_blank">www.revelation.com/tcohome/tcoevent03.</A></strong></font></p>
                    </td>
                </tr>
            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
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
