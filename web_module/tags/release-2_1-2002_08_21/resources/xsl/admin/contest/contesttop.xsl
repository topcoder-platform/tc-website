<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>


<xsl:template name="RegSpacers">
  <tr>
    <td>
      <img src="/images/spacer.gif" alt="" width="619" height="1" border="0"/>
    </td>
  </tr>
</xsl:template>


<xsl:template name="ContestInformationInactive">
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doContest()">1. *Contest Information ></a> 
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="ContestInformationActive">
  <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">1. *Contest Information ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundInformationInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doRound()">2. Round Information ></a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundInformationActive">
<img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
  <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">2. Round Information ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundSegmentsInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doRoundSegments()">3. Round Segments ></a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundSegmentsActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">3. Round Segments ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundProblemsInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doRoundProblems()">4. Round Problems ></a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundProblemsActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">4. Round Problems ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RegButtonConfirmInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doConfirm()">5. *Confirmation </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RegButtonConfirmActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
  <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">5. *Confirmation ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


</xsl:stylesheet>

