<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
    <xsl:import href="../includes/dev/public_dev_right.xsl" />     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Payment Requirements</xsl:with-param>
            </xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr valign="top">
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="10" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
                <tr valign="top">
                    <td width="100%" background="/i/steel_darkblue_bg.gif">
                        <table border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
                            <tr valign="top">
                                <td class="statText">
                                    <p><strong>TopCoder Development Project Payment Requirements</strong></p>
                                    
                                    <p>You must meet the following requirements in order for TopCoder to pay you:
                                          
                                          <ul>
                                              <li><strong>Valid member profile information.</strong><br/>
                                            We will mail checks to the address in your TopCoder profile, so please make sure that this information is current.<br/><br/></li>
                                        <li><strong>One completed tax form on file with TopCoder.</strong><br/>
                                            <a class="statText" href="/?t=support&amp;c=form_faq">TopCoder FAQ regarding these forms >></a><br/><br/>
                                            The <strong>W-9 form</strong> should be filled out by all U.S. Citizens, including U.S resident aliens.<br/>
                                            <a class="statText" href="/contest/iw9.pdf">Click here for W-9 form instructions >></a><br/>
                                            <a class="statText" href="/contest/fw9.pdf">Click here for the W-9 form >></a><br/><br/>
                                            The <strong>W-8BEN form</strong> should be filled out by all non-U.S. Citizens.<br/>
                                            <a class="statText" href="/contest/iw8ben.pdf">Click here for W-8BEN form instructions >></a><br/>
                                            <a class="statText" href="/contest/fw8ben.pdf">Click here for the W-8BEN form >></a></li>
                                    </ul>
                        
                                    Mailing address for forms and affidavits:&#160;&#160;TopCoder, 703 Hebron Avenue, Glastonbury, CT 06033</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>    
    
                <tr valign="top">
                    <td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" bgcolor="#001B35">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>

