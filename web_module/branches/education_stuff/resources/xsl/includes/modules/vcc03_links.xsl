<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="vcc03_links">
  <xsl:param name="selectedTab"></xsl:param>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Summary tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='overview'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Schedule tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='schedule'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_sched" class="statTextBig"><img src="/i/tournament/vcc03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_sched" class="statTextBig"><img src="/i/tournament/vcc03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Rules tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='rules'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_rules_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=vcc03_rules_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>
                                
                    <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
                </tr>
            </table>

</xsl:template>
</xsl:stylesheet>
