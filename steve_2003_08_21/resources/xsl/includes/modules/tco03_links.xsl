<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_links">
  <xsl:param name="selectedContest"></xsl:param>
  <xsl:param name="selectedTab"></xsl:param>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>


<!-- Coding Tabs-->
<xsl:choose>
   <xsl:when test="$selectedContest='coding'">
<!-- Coding Summary tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='coding_overview'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Coding Schedule tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='coding_schedule'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_sched" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_sched" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Coding Rules tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='coding_rules'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

   </xsl:when>



<!-- Component Tabs-->
   <xsl:when test="$selectedContest='component'">
<!-- Component Summary tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='component_overview'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Component Schedule tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='component_schedule'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_sched" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_sched" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

<!-- Component Rules tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='component_rules'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>
                                
   </xsl:when>
</xsl:choose>

                    <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
                </tr>
            </table>
          

</xsl:template>
</xsl:stylesheet>
