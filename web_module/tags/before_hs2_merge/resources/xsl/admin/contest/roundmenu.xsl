<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="contesttop.xsl"/>
<xsl:import href="contestbottom.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>
<head>
<title>Contest Round Administrative Menu Page</title>
<xsl:call-template name="CSS"/>
</head>
<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(roundId) {
    document.frmResults.results.value = roundId;
    document.frmResults.Task.value = 'contest';
    if (roundId == -1) {
      document.frmResults.Command.value = 'getNewRoundScreen';
    } else if(roundId == -2) {
      document.frmResults.Command.value = 'getContestModifyScreen';
      document.frmResults.results.value = document.frmResults.contestId.value;
    } else { 
      document.frmResults.Command.value = 'getRoundModifyScreen';
    }
    document.frmResults.submit();
  }

function doContest() {
  doSubmit(-2);
}
]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="100%" bgcolor="#4d0000"> <img src="/images/spacer.gif" width="1" height="1"/> </td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/ADMIN/LoggedIn='true'">
            <xsl:call-template name="Contest_LI"/>
          </xsl:when>
        </xsl:choose>
        <tr> 
          <td valign="top"> 
            <xsl:call-template name="LeftSideNavBarForm"/>
          </td> 
        </tr>
      </table>
    </td>
    <td valign="top">
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr><td><img src="/images/spacer.gif" width="619" height="5" /></td></tr>
      </table>
      <br/><br/>
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
        </tr>
        <tr>
          <td>
            <xsl:call-template name="ContestInformationInactive"/>
            <xsl:call-template name="RoundInformationActive"/>
            <xsl:call-template name="RoundSegmentsActive"/>
            <xsl:call-template name="RoundProblemsActive"/>
          </td>
        </tr>
        <tr>
          <td align="left" valign="center" width="350" height="50" colspan="1">
             <a href="JavaScript:doSubmit(-1)">
                  <b><xsl:text>Create New Round</xsl:text></b>
             </a>
          </td>
        </tr>
      </table>
      <table width="319" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="50" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Round Id</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="250" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Round Name</xsl:text>
            </font>
          </td>
         </tr>
         <xsl:for-each select="/ADMIN/CONTESTS/Contest/Round">
          <FORM>
            <tr>
                <td align="center" valign="center" width="50" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="RoundId"/>')
                      </xsl:attribute>
                      <xsl:value-of select="RoundId"/>
                    </A>
                  </font>
                </td>
                <td align="center" valign="center" width="250" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:value-of select="RoundDesc"/>
                  </font>
                </td>
            </tr>
          </FORM>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
<xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
<INPUT TYPE="HIDDEN" NAME="Task" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="LoggedIn">
  <xsl:attribute name="VALUE"><xsl:value-of select="/ADMIN/LoggedIn"/></xsl:attribute>
</INPUT>
<INPUT TYPE="HIDDEN" NAME="results" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="contestId">
  <xsl:attribute name="VALUE">
    <xsl:value-of select="/ADMIN/CONTESTS/Contest/ContestId"/>
  </xsl:attribute>
</INPUT>
</FORM>

<xsl:call-template name="Bottom"/>
 
</body>

</html>
</xsl:template>
</xsl:stylesheet>
