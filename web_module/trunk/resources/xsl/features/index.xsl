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

<xsl:call-template name="Preload" />      

<title>TopCoder :: Features</title>

<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">

            <xsl:call-template name="global_left" />

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
            
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;Upcoming/Past Features</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="23" border="0"/></td></tr>
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr><td valign="middle" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="23" border="0"/></td></tr>
                            <tr><td valign="middle" class="statTextBig" background="/i/steel_gray_bg.gif" height="18">&#160;Upcoming Features</td></tr>
                            <tr><td valign="middle" class="bodyText" bgcolor="#CCCCCC">Database security</td></tr>
                            <tr><td valign="middle" class="bodyText">The ACE library - Adaptive Communication  Environment</td></tr>
                            <tr><td valign="middle" class="bodyText" bgcolor="#CCCCCC">Authoring for an advanced morphing software (C++)</td></tr>        
                            <tr><td valign="middle" class="bodyText">Massive-scale simulator to test an instant messaging server (C++)</td></tr>        
                            <tr><td valign="middle" class="bodyText" bgcolor="#CCCCCC">Tools for debugging memory leaks</td></tr>
                            <tr><td valign="middle" class="bodyText">Smart pointers in C++</td></tr>    
                            <tr><td valign="middle" class="bodyText" bgcolor="#CCCCCC">Explaining dynamic Programming</td></tr>
                            <tr><td valign="middle" class="bodyText">Genetic algorithms/programming</td></tr>            
                            <tr><td valign="middle" class="bodyText" bgcolor="#CCCCCC">Reverse engineering the MSN Messenger protocol</td></tr>    
                            <tr><td valign="middle" class="bodyText">XML-based UI description language that allows dynamic building and switching of UI screens at runtime</td></tr>
                            <tr><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_topics" class="bodyGeneric">Want to write?</a></td></tr>        
                            <tr><td valign="middle" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="23" border="0"/></td></tr>
                        </table>
        
                        <table width="100%" border="0" cellpadding="0" cellspacing="1">
                            <tr><td valign="middle" bgcolor="#666666" colspan="3" height="18" class="statText">&#160;&#160;<strong>2003 Features</strong></td></tr>        
                            <tr>
                                <td valign="middle" bgcolor="#CCCCCC" height="18" width="12%" class="bodyText">&#160;&#160;<strong>Date</strong></td>
                                <td width="25%" valign="middle" bgcolor="#CCCCCC" class="bodyText">&#160;&#160;<strong>Author</strong></td>
                                <td width="63%" valign="middle" bgcolor="#CCCCCC" class="bodyText">&#160;&#160;<strong>Feature</strong></td>
                            </tr>
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;January</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr>
                                <td valign="middle" class="bodyText" height="14">&#160;02.20.03</td><td valign="middle" class="bodyText">&#160;&#160;David Tanacea</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_022003" class="bodyGeneric">Component-Based Development: Why Hasn't the Vision Met Reality?</a></td>
                            </tr>
                            <tr>
                                <td valign="middle" class="bodyText" height="14">&#160;01.22.03</td><td valign="middle" class="bodyText">&#160;&#160;the_gigi</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_012203" class="bodyGeneric">Who needs another UI framework?</a></td>
                            </tr>
                            <tr>
                                <td valign="middle" class="bodyText" height="14">&#160;01.08.03</td><td valign="middle" class="bodyText">&#160;&#160;radeye</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_010803" class="bodyGeneric">Functional Programming</a></td>
                            </tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>
                        </table>
        
                        <table width="100%" border="0" cellpadding="0" cellspacing="1">
                            <tr><td valign="middle" bgcolor="#666666" colspan="3" height="18" class="statText">&#160;&#160;<strong>2002 Features</strong></td></tr>        
                            <tr><td valign="middle" bgcolor="#CCCCCC" height="18" width="12%" class="bodyText">&#160;&#160;<strong>Date</strong></td><td width="25%" valign="middle" bgcolor="#CCCCCC" class="bodyText">&#160;&#160;<strong>Author</strong></td><td width="63%" valign="middle" bgcolor="#CCCCCC" class="bodyText">&#160;&#160;<strong>Feature</strong></td></tr>
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;December</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;12.20.02</td><td valign="middle" class="bodyText">&#160;&#160;KaiEl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_122002" class="bodyGeneric">The Big Rerun</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;12.09.02</td><td valign="middle" class="bodyText">&#160;&#160;KaiEl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_120902" class="bodyGeneric">It's Sink or Swim During the Challenge Phase</a></td></tr>
                
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>        
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;November</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;11.20.02</td><td valign="middle" class="bodyText">&#160;&#160;leadhyena_inran</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_112002" class="bodyGeneric">The eight seconds of death: Tips on preventing timeout</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;11.13.02</td><td valign="middle" class="bodyText">&#160;&#160;RevenantChaos</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_111302" class="bodyGeneric">King of the Silicon Hill: Today's High-End Microprocessors</a></td></tr>
                
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>        
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;October</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;10.09.02</td><td valign="middle" class="bodyText">&#160;&#160;Penwiper</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100902" class="bodyGeneric">Graphics Programming for Motion Capture</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;10.02.02</td><td valign="middle" class="bodyText">&#160;&#160;pearl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100202" class="bodyGeneric">Finding a Job is a Job</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>        
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;September</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;09.11.02</td><td valign="middle" class="bodyText">&#160;&#160;KaiEl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_091102" class="bodyGeneric">...A Problem is Born</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>                
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;August</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;08.21.02</td><td valign="middle" class="bodyText">&#160;&#160;polgara</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_082102" class="bodyGeneric">Wireless Woes and Winners</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;08.07.02</td><td valign="middle" class="bodyText">&#160;&#160;KaiEl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_080702" class="bodyGeneric">Match Strategy</a></td></tr>
        
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>        
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;July</td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;07.24.02</td><td valign="middle" class="bodyText">&#160;&#160;polgara</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_072402" class="bodyGeneric">Attack of the Moans: Building Applications for Users</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;07.10.02</td><td valign="middle" class="bodyText">&#160;&#160;bitbucket43</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_071002" class="bodyGeneric">From the Field - Avoid Overloading!</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;June</td></tr> 
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;06.26.02</td><td valign="middle" class="bodyText">&#160;&#160;kpsmith</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_062602" class="bodyGeneric">From the Field</a></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;06.12.02</td><td valign="middle" class="bodyText">&#160;&#160;polgara</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_061202" class="bodyGeneric">To in-house or to out-source, that is the question</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;06.05.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_060502" class="bodyGeneric">Where Has The Time Gone?</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;May</td></tr> 
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;05.29.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_052902" class="bodyGeneric">The Outsiders</a></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;05.22.02</td><td valign="middle" class="bodyText">&#160;&#160;KaiEl</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_052202" class="bodyGeneric">Obfu-What?</a></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;05.15.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_051502" class="bodyGeneric">First Time Phenomenal</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;05.08.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_050802" class="bodyGeneric">Working Their Way Up</a></td></tr>
                            <tr><td valign="middle" class="bodyText" height="14">&#160;05.01.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_050102" class="bodyGeneric">The Women of TopCoder</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>
                            <tr><td valign="middle" class="statTextBig" colspan="3" background="/i/steel_gray_bg.gif" height="18">&#160;April</td></tr> 
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>        
                            <tr><td valign="middle" class="bodyText" height="14">&#160;04.24.02</td><td valign="middle" class="bodyText">&#160;&#160;TopCoder Staff</td><td valign="middle" class="bodyText"><a href="/index?t=statistics&amp;c=2002tccc_feature" class="bodyGeneric">A Matter of Time</a></td></tr>
                        </table>
                        
                        <p><a href="/index?t=features&amp;c=feat_topics" class="bodyGeneric">Want to write?</a></p>
                        
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr><td colspan="4" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>       
            </table>
        </td>
    <!-- Center Column Ends -->
<!-- Body Area Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

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
<!-- Footer ends -->

</body>
</html>

</xsl:template>
</xsl:stylesheet>
