<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="left.xsl"/>
<xsl:import href="form.xsl"/>
<xsl:import href="right.xsl"/>
<xsl:import href="activate_form.xsl"/>
<xsl:import href="../includes/body_top.xsl"/>

<xsl:template name="Body">

  <xsl:param name="activate"></xsl:param>
  <xsl:param name="valid"></xsl:param>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="BodyLeft" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
      <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="statText" width="99%">
            <IMG src="/i/clear.gif" width="400" height="5" alt="" border="0" /><br />
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelblue</xsl:with-param>
                <xsl:with-param name="image">login</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
        
            <xsl:if test="not(/TC/ErrorMsg='')">
                <tr valign="top">
                    <td width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br />
                        
                        <xsl:choose>
                            <xsl:when test="$activate='true'">
                                <xsl:call-template name="ActivateForm"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <p class="registerNav"><strong><xsl:value-of select="/TC/ErrorMsg"/></strong></p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
                
                <tr valign="top">
                    <td class="statText" width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br/>
                        <p><span class="statTextBig">Forgot your password?</span><br/>
                        If you cannot remember your password <A href="index?t=authentication&amp;c=recover_password" class="statText">click here</A> 
                        and we can send it to you via email.</p>
                        
                        <p><span class="statTextBig">New to TopCoder?</span><br/>
                        <A class="statText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register now.</A>
                        After you complete the registration process, we will send your account activation code via email.</p>
                        
                        <xsl:choose>
                            <xsl:when test="$valid='false'">
                                <div class="statTextBig"><center><span class="statTextBig">* Invalid Login *</span></center></div>
                            </xsl:when>
                            <xsl:otherwise>
                                <br/><br/>
                            </xsl:otherwise>
                        </xsl:choose>
              
                        <div align="center">
                        <xsl:call-template name="Form"/>
                        </div>
                        
                        <p><br/></p>
              
                    </td>
                </tr>
	
	        <tr><td width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>   	
            </table>
                        
            <img src="/i/clear.gif" alt="" width="1" height="150" border="0"/><br />

            <p><br/></p>
              
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><IMG src="/i/clear.gif" width="170" height="1" alt="" border="0"/><br />
            <xsl:call-template name="BodyRight"/>
        </td>

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"/></td>
<!-- Gutter Ends -->

    </tr>
  </table>
  <!-- Body Ends -->

</xsl:template>

</xsl:stylesheet>

