<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="vcc03_sublinks">
  <xsl:param name="selectedList"></xsl:param>
  <xsl:param name="selectedTab"></xsl:param>

<xsl:choose>
    <xsl:when test="$selectedList='summary'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_champ" class="statTextBig">Championship</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_semiroom4" class="statTextBig">Room 4</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_semiroom3" class="statTextBig">Room 3</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_semiroom2" class="statTextBig">Room 2</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_semiroom1" class="statTextBig">Room 1</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_reception" class="statTextBig">Reception</a></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:when test="$selectedList='rules'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                <xsl:choose>
                <xsl:when test="$selectedTab='overview'">
                    <td class="tourney_subnav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_overview" class="topLink">Overview</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_overview" class="topLink">Overview</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='registration'">
                    <td class="tourney_subnav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_registration" class="topLink">Registration</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_registration" class="topLink">Registration</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='conditions'">
                    <td class="tourney_subnav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='structure'">
                    <td class="tourney_subnav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_structure" class="topLink">Structure</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_structure" class="topLink">Structure</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='prizes'">
                    <td class="tourney_subnav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=vcc03_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:otherwise>
                </xsl:choose>

                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:otherwise>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
            </table>
    </xsl:otherwise>
</xsl:choose>

    </xsl:template>
</xsl:stylesheet>
