<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_links">
  <xsl:param name="selectedContest"></xsl:param>
  <xsl:param name="selectedTab"></xsl:param>

            <table border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
<xsl:choose>
   <xsl:when test="$selectedContest='coding'">
                    <td width="50%" align="center">
                        <img src="/i/tournament/tco03/coding_start.gif" alt="Coding Start" width="219" height="15" border="0" vspace="5"/><br/>
                        <A href="/index?t=tournaments&amp;c=tco03_overview"><img src="/i/tournament/tco03/coding_tab_on.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0"/></A>
                    </td>
                    <td width="50%" align="center">
                        <img src="/i/tournament/tco03/component_start.gif" alt="Component Start" width="222" height="15" border="0" vspace="5"/><br/>
                        <A href="/index?t=tournaments&amp;c=tco03_comp_overview"><img src="/i/tournament/tco03/component_tab_off.gif" alt="Component tab" width="239" height="54" border="0" vspace="0"/></A>
                    </td>
    </xsl:when>
    <xsl:when test="$selectedContest='component'">
                    <td width="50%" align="center">
                        <img src="/i/tournament/tco03/coding_start.gif" alt="Coding Start" width="219" height="15" border="0" vspace="5"/><br/>
                        <A href="/index?t=tournaments&amp;c=tco03_overview"><img src="/i/tournament/tco03/coding_tab_off.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0"/></A>
                    </td>
                    <td width="50%" align="center">
                        <img src="/i/tournament/tco03/component_start.gif" alt="Component Start" width="222" height="15" border="0" vspace="5"/><br/>
                        <A href="/index?t=tournaments&amp;c=tco03_comp_overview"><img src="/i/tournament/tco03/component_tab_on.gif" alt="Component tab" width="239" height="54" border="0" vspace="0"/></A>
                    </td>
    </xsl:when>
</xsl:choose>
                </tr>
                
                <tr>
                    <td align="center" colspan="2">
                        <img src="/i/tournament/tco03/bracket_left.gif" alt="bracket" width="25" height="19" border="0" vspace="0"/>
                        <img src="/i/tournament/tco03/bracket_middle.gif" alt="bracket" width="240" height="19" border="0" vspace="0"/>
                        <img src="/i/tournament/tco03/bracket_right.gif" alt="bracket" width="25" height="19" border="0" vspace="0"/>
                    </td>
                </tr>
            </table>

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

<!-- Coding Advancers tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='coding_advancers'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_highlights" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_highlights" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
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
                                
<!-- Component Advancers tab -->
            <xsl:choose>
                <xsl:when test="$selectedTab='advancers'">
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_des_rd1" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_on.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="statTextBig" width="88"><A href="/index?t=tournaments&amp;c=tco03_comp_des_rd1" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_off.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
                </xsl:otherwise>
            </xsl:choose>

   </xsl:when>
</xsl:choose>

                    <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
                </tr>
            </table>
          

</xsl:template>
</xsl:stylesheet>
