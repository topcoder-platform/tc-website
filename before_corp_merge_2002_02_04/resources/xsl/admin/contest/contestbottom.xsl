<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>


<xsl:template name="NextButton">
    <a href="JavaScript:doNext()">
      <img src="/images/next_button.gif" alt="next" width="70" height="19" border="0" />
    </a>
</xsl:template>


<xsl:template name="PreviousButton">
  <td align="right" valign="middle">
    <a href="JavaScript:doPrevious()">
      <img src="/images/prev_button.gif" alt="previous" width="70" height="19" border="0" />
    </a>
  </td>
</xsl:template>


<xsl:template name="UpdateButton">
    <a href="JavaScript:doUpdate()">
      <img src="/images/reg_update_button.gif" alt="update" width="70" height="19" border="0" />
    </a>
</xsl:template>


<xsl:template name="AcceptButton">
  <td align="right" valign="middle">
    <a href="JavaScript:doSubmitNavBar('registration','terms')">
      <img src="/images/accept_button.gif" alt="I Accept" width="70" height="19" border="0" />
    </a>
  </td>
</xsl:template>


<xsl:template name="DeclineButton">
  <td align="left" valign="middle">
    <a href="JavaScript:doSubmitNavBar('','')">
      <img src="/images/decline_button.gif" alt="I Decline" width="70" height="19" border="0" />
    </a>
  </td>
</xsl:template>



</xsl:stylesheet>
