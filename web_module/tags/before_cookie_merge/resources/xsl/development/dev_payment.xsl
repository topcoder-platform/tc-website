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

 <title>How to Get Paid for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">dev_payment</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="1"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;How to Get Paid</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="20" border="0" />
            
            <h2>TopCoder Development Project Payment Requirements</h2>
                                    
            <p>You must meet the following requirements in order for TopCoder to pay you:</p>
                                          
            <ul>
                <li><strong>Valid member profile information.</strong><br/>
                We will mail checks to the address in your TopCoder profile, so please make sure that this information is current.<br/><br/></li>
                
                <li><strong>One completed tax form on file with TopCoder.</strong><br/>
                <a href="/?t=support&amp;c=form_faq">TopCoder FAQ regarding these forms >></a><br/><br/>
                The <strong>W-9 form</strong> should be filled out by all U.S. Citizens, including U.S resident aliens.<br/>
                <a href="/contest/iw9.pdf">Click here for W-9 form instructions >></a><br/>
                <a href="/contest/fw9.pdf">Click here for the W-9 form >></a><br/><br/>
                The <strong>W-8BEN form</strong> should be filled out by all non-U.S. Citizens.<br/>
                <a href="/contest/iw8ben.pdf">Click here for W-8BEN form instructions >></a><br/>
                <a href="/contest/fw8ben.pdf">Click here for the W-8BEN form >></a></li>
            </ul>
                        
            <p>Mailing address for forms and affidavits:&#160;&#160;TopCoder, 703 Hebron Avenue, Glastonbury, CT 06033</p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

