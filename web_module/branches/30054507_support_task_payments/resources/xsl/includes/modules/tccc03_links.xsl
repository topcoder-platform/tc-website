<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tccc03_links">
  <xsl:param name="selectedTab"></xsl:param>
            <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_bkgd">
                <tr valign="top">
                    <td width="110"><a href="/?&amp;t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                    <td valign="middle" class="statText" width="99%">
                            <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                            <font size="3"><strong>Congratulations to dgarthur, the 2003 Sun Microsystems and TopCoder Collegiate Challenge Champion!</strong></font><br />
                            <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                    </td>
                    <td width="135"><a href="/?&amp;t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                </tr>
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#151515">
                <tr>
                    <td width="49%"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td>

<!-- Summary tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='summary'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_champ" class="statTextBig"><img src="/i/tournament/tabSummaryOn.gif" alt="Summary" width="85" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_champ" class="statTextBig"><img src="/i/tournament/tabSummaryOff.gif" alt="Summary" width="85" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>

<!-- Schedule tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='schedule'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_sched" class="statTextBig"><img src="/i/tournament/tabScheduleOn.gif" alt="Schedule" width="85" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_sched" class="statTextBig"><img src="/i/tournament/tabScheduleOff.gif" alt="Schedule" width="85" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>

<!-- Competitors tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='competitors'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_competitors&amp;rds=4462,4464,4466" class="statTextBig"><img src="/i/tournament/tabCompetitorsOn.gif" alt="Competitors" width="104" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_competitors&amp;rds=4462,4464,4466" class="statTextBig"><img src="/i/tournament/tabCompetitorsOff.gif" alt="Competitors" width="104" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>

<!-- Regions tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='regions'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_regions" class="statTextBig"><img src="/i/tournament/tabRegionsOn.gif" alt="Regions" width="77" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_regions" class="statTextBig"><img src="/i/tournament/tabRegionsOff.gif" alt="Regions" width="77" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>

<!-- Schools tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='schools'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_schools" class="statTextBig"><img src="/i/tournament/tabSchoolsOn.gif" alt="Schools Represented" width="158" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_schools" class="statTextBig"><img src="/i/tournament/tabSchoolsOff.gif" alt="Schools Represented" width="158" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>

<!-- Rules tab -->
                                <xsl:choose>
                                    <xsl:when test="$selectedTab='rules'">
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig"><img src="/i/tournament/tabRulesOn.gif" alt="Rules" width="63" height="21" border="0" /></a></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig"><img src="/i/tournament/tabRulesOff.gif" alt="Rules" width="63" height="21" border="0" /></a></td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                                <td width="49%"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td>
                </tr>
            </table>

</xsl:template>
</xsl:stylesheet>
