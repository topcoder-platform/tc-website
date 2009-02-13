<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tco03_sublinks">
  <xsl:param name="selectedList"></xsl:param>
  <xsl:param name="selectedTab"></xsl:param>

<xsl:choose>
    <xsl:when test="$selectedList='summary'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_champ" class="statTextBig">Championship</a></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom4" class="statTextBig">Room 4</a></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom3" class="statTextBig">Room 3</a></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom2" class="statTextBig">Room 2</a></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_semiroom1" class="statTextBig">Room 1</a></td>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_reception" class="statTextBig">Reception</a></td>
                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </xsl:when>

    <xsl:when test="$selectedList='coding_rules'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                <xsl:choose>
                <xsl:when test="$selectedTab='overview'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_overview" class="topLink">Overview</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_overview" class="topLink">Overview</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='eligibility'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_eligibility" class="topLink">Eligibility</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_eligibility" class="topLink">Eligibility</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='conditions'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='structure'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_structure" class="topLink">Structure</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_structure" class="topLink">Structure</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='prizes'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:otherwise>
                </xsl:choose>

                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>
    </xsl:when>

    <xsl:when test="$selectedList='component_rules'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tcoSubNav">
                <tr>
                    <td class="tcoSubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                <xsl:choose>
                <xsl:when test="$selectedTab='overview'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_overview" class="topLink">Overview</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_overview" class="topLink">Overview</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='eligibility'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_eligibility" class="topLink">Eligibility</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_eligibility" class="topLink">Eligibility</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='conditions'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_conditions" class="topLink">Conditions of Participation</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='structure'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_structure" class="topLink">Structure</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_structure" class="topLink">Structure</a></td>
                </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                <xsl:when test="$selectedTab='prizes'">
                    <td class="tcoSubNav_on" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="tcoSubNav" width="1" nowrap="nowrap"><a href="/index?t=tournaments&amp;c=tco03_comp_rules_prizes" class="topLink">Prizes</a></td>
                </xsl:otherwise>
                </xsl:choose>

                    <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>
    </xsl:when>

    <xsl:otherwise>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tcoSubNav">
                <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
            </table>
    </xsl:otherwise>
</xsl:choose>

    </xsl:template>
</xsl:stylesheet>
