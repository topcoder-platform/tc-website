<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_sublinks">
  <xsl:param name="selectedTab"></xsl:param>

<xsl:choose>
    <xsl:when test="$selectedTab='summary'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_champ" class="statTextBig">Championship</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom4" class="statTextBig">Room 4</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom3" class="statTextBig">Room 3</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom2" class="statTextBig">Room 2</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom1" class="statTextBig">Room 1</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_reception" class="statTextBig">Reception</a></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:when test="$selectedTab='rules'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_overview" class="statTextBig">Overview</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_eligibility" class="statTextBig">Eligibility</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_conditions" class="statTextBig">Conditions of Participation</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_prizes" class="statTextBig">Prizes</a></td>
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
