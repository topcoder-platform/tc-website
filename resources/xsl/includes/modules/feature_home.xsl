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
                        <!-- <img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" vspace="5" /><br />-->
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br/>
                        <img src="/i/clear.gif" alt="" width="85" height="1" border="0" />
                    </td>

                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

                    <td  width="99%" class="bodyText"  valign="top">
                        <p><a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_072903</xsl:attribute><font size="4"><strong>The TopCoder Design Contest #2</strong></font></a><br />
                        Tuesday, July 29, 2003</p>

                        <p>The TopCoder Design Contest #2 was a very different contest than  the 
previous one due to changes in the contest rules, design requirements, and judging. 
The top 3 designers were awarded payments of $3000, $2000 and $1000, based 
on the average of the top 5 submission scores from each designer. Design requirements
changed by removing the need for functional tests.  The scorecard added new categories,
relaxed the wording on others and a much needed appeals process was put into place.  Altogether,
the contest provided a wonderful experience to all and definitely improved the resulting
submissions.
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_072903</xsl:attribute><strong>full&#160;story</strong></a></p>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
            