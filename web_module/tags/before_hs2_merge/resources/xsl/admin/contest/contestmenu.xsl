<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>
<head>
<title>Contest Administrative Menu Page</title>
<xsl:call-template name="CSS"/>
</head>
<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(contestId) {
    document.frmResults.results.value = contestId;
    document.frmResults.Task.value = 'contest';
    if (contestId == -1) {
      document.frmResults.Command.value = 'getNewContestScreen';
    } else { 
      document.frmResults.Command.value = 'getContestModifyScreen';
    }
    document.frmResults.submit();
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
          <td align="left" valign="center" width="350" height="50" colspan="1">
             <a href="JavaScript:doSubmit(-1)">
                  <b><xsl:text>Create New Contest</xsl:text></b>
             </a>
          </td>
        </tr>
      </table>
      <table width="619" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="50" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Contest Id</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="550" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Contest Name</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="650" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Start Date</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="650" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>End Date</xsl:text>
            </font>
          </td>
         </tr>
         <xsl:for-each select="/ADMIN/CONTESTS/Contest">
          <FORM>
            <tr>
                <td align="center" valign="center" width="50" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="ContestId"/>')
                      </xsl:attribute>
                      <xsl:value-of select="ContestId"/>
                    </A>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:value-of select="ContestName"/>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="ContestStartTimestamp"/>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="20">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="ContestEndTimestamp"/>
                  </font>
                </td>
            </tr>
            <INPUT TYPE="HIDDEN" NAME="contestId">
              <xsl:attribute name="VALUE">
                <xsl:value-of select="ContestId"/>
              </xsl:attribute>
            </INPUT>
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
</FORM>

<xsl:call-template name="Bottom"/>
 
</body>

</html>
</xsl:template>
</xsl:stylesheet>
