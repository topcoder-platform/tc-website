<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="feature_home">
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Feature</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/?t=features&amp;c=index" class="bodyText"><strong>View All</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="3" cellpadding="0" width="100%">
                <tr>
                    <td width="85" class="bodyText"  valign="top">
                        <!--<a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" vspace="5" /></a>-->
                        <img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" vspace="5" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=271917"><strong>slowjoe</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br/>
                        <img src="/i/clear.gif" alt="" width="85" height="1" border="0" />
                    </td>

                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

                    <td  width="99%" class="bodyText"  valign="top">
                        <p><a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_062603</xsl:attribute><font size="4"><strong>Simple Performance Improvement</strong></font></a><br />
                        Thursday, June 26, 2003</p>

                        <p>At the Collegiate Challenge finals, there was a discussion about improving performance levels, and it made me think.  
                        Someone asked two questions: when should he expect his performance to peak, and how high should he expect to go.  No 
                        answer was given, not surprisingly. I'd like to share a few of my thoughts on improving performance in areas other 
                        than pure programming ability.
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_062603</xsl:attribute><strong>full&#160;story</strong></a></p>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
            