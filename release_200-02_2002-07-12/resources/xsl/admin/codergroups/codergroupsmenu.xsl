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
<title>Coder Groups Administrative Menu Page</title>
<xsl:call-template name="CSS"/>
</head>
<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(contestId) {
    document.frmResults.results.value = contestId;
    document.frmResults.Task.value = 'codergroups';
    document.frmResults.Command.value = 'getSetupScreen';
    document.frmResults.submit();
  }
]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'"> <xsl:call-template name="TopLoggedIn"/> </xsl:when>
        <xsl:otherwise>  <xsl:call-template name="TopLoggedOut"/> </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="100%" bgcolor="#4d0000"> <img src="/images/spacer.gif" width="1" height="1"/> </td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/ADMIN/LoggedIn='true'"> </xsl:when>
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
      <table width="619" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="100" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Contest Id</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="450" height="20">
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
          <td align="center" valign="center" width="75" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Group Id</xsl:text>
            </font>
          </td>
         </tr>
         <xsl:for-each select="/ADMIN/CODERGROUPS/Contest">
          <FORM>
            <tr>
                <td align="center" valign="center" width="450" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="ContestId"/>')
                      </xsl:attribute>
                      <xsl:value-of select="ContestId"/>
                    </A>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:value-of select="ContestName"/>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:if test="ContestStart=''"><img src="/images/spacer.gif" width="1" height="1"/></xsl:if>
                    <xsl:if test="ContestStart!=''"><xsl:value-of select="substring(ContestStart, 0, 11)"/></xsl:if>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:if test="ContestEnd=''"><img src="/images/spacer.gif" width="1" height="1"/></xsl:if>
                    <xsl:if test="ContestEnd!=''"><xsl:value-of select="substring(ContestEnd, 0, 11)"/></xsl:if>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:if test="Group/GroupId=''"><img src="/images/spacer.gif" width="1" height="1"/></xsl:if>
                    <xsl:if test="Group/GroupId!=''"><xsl:value-of select="Group/GroupId"/></xsl:if>
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
