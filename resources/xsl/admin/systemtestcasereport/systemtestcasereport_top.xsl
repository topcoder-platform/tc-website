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


<xsl:template name="SystemTestCaseReportAllInactive">
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doFilter(2)">All SystemTestCaseReport </a> 
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SystemTestCaseReportAllActive">
  <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">All SystemTestCaseReport </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SuccessfulSystemTestCaseReportInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doFilter(1)">Successful SystemTestCaseReport </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SuccessfulSystemTestCaseReportActive">
<img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
  <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">Successful SystemTestCaseReport </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="UnsuccessfulSystemTestCaseReportInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doFilter(0)">Unsuccessful SystemTestCaseReport </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="UnsuccessfulSystemTestCaseReportActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">Unsuccessful SystemTestCaseReport </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="NullifiedSystemTestCaseReportInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">
      <a href="JavaScript:doFilter(-1)">Nullified SystemTestCaseReport </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="NullifiedSystemTestCaseReportActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" color="#ffffff">Nullified SystemTestCaseReport </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


</xsl:stylesheet>

