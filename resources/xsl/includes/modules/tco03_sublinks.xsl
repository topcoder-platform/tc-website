<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_sublinks">
  <xsl:param name="selectedTab"></xsl:param>

<xsl:choose>
    <xsl:when test="$selectedTab='summary'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig">Overview</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_conditions" class="statTextBig">Conditions</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_structure" class="statTextBig">Round Structure</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_onsite" class="statTextBig">Online/Onsite Rounds</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_prizes" class="statTextBig">Prizes</a></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:when test="$selectedTab='rules'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr>
                    <td class="tourney_subnav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig">Overview</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_conditions" class="statTextBig">Conditions</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_structure" class="statTextBig">Round Structure</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_onsite" class="statTextBig">Online/Onsite Rounds</a></td>
                    <td class="tourney_subnav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tccc03_rules_prizes" class="statTextBig">Prizes</a></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:otherwise>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tourney_subnav">
                <tr><td width="100%" bgcolor="#999999"><img src="/i/clear.gif" alt="" width="10" height="4" border="0" /></td></tr>
            </table>
    </xsl:otherwise>
</xsl:choose>

    </xsl:template>
</xsl:stylesheet>
