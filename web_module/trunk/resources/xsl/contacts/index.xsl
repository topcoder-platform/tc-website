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
        <title>Contact information for TopCoder</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body>
        <xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="5"><img src="/i/clear.gif" width="5" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">contacts</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br />

                        <p>TopCoder is dedicated to servicing members, partnering companies, the media and anyone else interested in what 
                        TopCoder is about. Please contact the appropriate individuals below for more information or assistance.</p>
                        
                        <div align="center">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td width="50%" align="left" class="bodyText">
                                    <p><strong>Corporate Address</strong><br />
                                    TopCoder, Inc.<br/>
                                    703 Hebron Avenue<br/>
                                    Glastonbury, CT 06033 U.S.A.<br/>
                                    tel: 860.633.5540<br/>
                                    fax: 860.657.4276<br/>
                                    &#160;</p>
                                </td>
                                    
                                <td width="50%" align="left" class="bodyText">
                                    <p><strong>Contact us by email</strong><br />
                                    <A href="mailto:service@topcoder.com" class="bodyText">General Questions</A><br />
                                    <A href="mailto:service@topcoder.com" class="bodyText">Competition Tech Support</A><br />
                                    <A href="mailto:service@topcodersoftware.com" class="bodyText">Software Tech Support</A></p>
                                </td>
                            </tr>
                            
                            <tr valign="top">
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:sponsorship@topcoder.com" class="bodyText">Sponsorship and Private Label Events</a><br/>
                                    Robert Hughes, President and COO<br />
                                    tel: 860.633.5540<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                                    
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:jmorris@fitzgerald.com" class="bodyText">Public Relations</a><br />
                                    Jessica Morris<br />
                                    FitzGerald Communications<br />
                                    tel: 617.585.2227<br />
                                    &#160;</p>
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:service@topcoder.com" class="bodyText">TopCoder Arena / Web Site Technical Support </a><br />

                                    Mike Lydon, CTO<br />
                                    tel: 860.633.5540<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                                    
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:tces@topcoder.com" class="bodyText">Employment Services</a><br />
                                    Paul Moriarty, Director of Employment Services<br />
                                    tel: 860.633.5540<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:sales@topcodersoftware.com" class="bodyText">Software Sales</a><br />
                                    Dave Tanacea<br />
                                    tel: 866.TOP.CODE<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                                    
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:tlongo@topcoder.com" class="bodyText">Membership / College Relations</a><br />
                                    Tom Longo, VP of Membership<br />
                                    tel: 860.633.5540<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                            </tr>

                            <tr valign="top">
                                <td width="50%" align="left" class="bodyText">
                                    <p><a href="mailto:service@topcodersoftware.com" class="bodyText">Software Service</a><br />
                                    Mike Morris<br />
                                    tel: 866.TOP.CODE<br />
                                    fax: 860.657.4276<br />
                                    &#160;</p>
                                </td>
                                    
                                <td width="50%" align="left" class="bodyText">&#160;</td>
                            </tr>
                        </table>
                    </div>
                    </td>
                </tr>

            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="5"><img src="/i/clear.gif" width="5" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>
<!-- Body Ends -->

<xsl:call-template name="Foot"/>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
