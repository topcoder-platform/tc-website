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


<xsl:template name="ProblemInformationInactive">
    <font size="1"> 
      <a href="JavaScript:doProblem()">1. *Problem Information ></a> 
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="ProblemInformationActive">
  <font size="1">1. *Problem Information ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SystemTestInformationInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font size="1">
      <a href="JavaScript:doSystemTest()">2. System Test Information ></a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SystemTestInformationActive">
<img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
  <font size="1">2. System Test Information ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundsInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font size="1">
      <a href="JavaScript:doAssignRound()">3. Assign to Round  ></a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="RoundsActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font size="1">3. Assign to Round ></font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>



</xsl:stylesheet>

