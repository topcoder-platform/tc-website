<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_suplinks">
  <xsl:param name="selectedTab"></xsl:param>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="28%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Coding tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='coding'">
                    <td class="statTextBig" width="128"><A href="/index?t=tournaments&amp;c=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_coding_on.gif" alt="Coding" width="128" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="128"><A href="/index?t=tournaments&amp;c=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_coding_off.gif" alt="Coding" width="128" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>
            
            <td width="44%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>


<!-- Component tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='component'">
                    <td class="statTextBig" width="128"><A href="/index?t=tournaments&amp;c=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_component_on.gif" alt="Component" width="128" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="128"><A href="/index?t=tournaments&amp;c=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_component_off.gif" alt="Component" width="128" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

                    <td width="28%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
               </tr>
            </table>

</xsl:template>
</xsl:stylesheet>
