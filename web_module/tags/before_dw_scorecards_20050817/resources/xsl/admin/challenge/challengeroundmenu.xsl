<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>

<xsl:preserve-space elements="*"/>
<xsl:template match="/">

<html>
<head>
<title>Contest Round Administrative Menu Page</title>
</head>
<body>
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>


<SCRIPT TYPE="text/Javascript"><![CDATA[

 function doRound(roundId) {
    document.frmResults.module.value    = 'Challenge';
    document.frmResults.Command.value = 'getRoomList';
    document.frmResults.roundid.value = roundId;
    document.frmResults.filter.value = 90;
    document.frmResults.submit();
  }

 function doProblem(roundId) {
    document.frmResults.module.value    = 'Challenge';
    document.frmResults.Command.value = 'getProblemList';
    document.frmResults.roundid.value = roundId;
    document.frmResults.filter.value = 90;
    document.frmResults.submit();
  }

 function doCoder(roundId) {
    document.frmResults.module.value    = 'Challenge';
    document.frmResults.Command.value = 'getCoderList';
    document.frmResults.roundid.value = roundId;
    document.frmResults.filter.value = 90;
    document.frmResults.submit();
  }

]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0" >
  <tr>
    <td valign="center" align="center">
      <br/><br/>
      <table width="819" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td>
            <xsl:text>Round Id</xsl:text>
          </td>
          <td>
            <xsl:text>Challenges by Room</xsl:text>
          </td>
          <td>
            <xsl:text>Challenges by Problem</xsl:text>
          </td>
          <td>
            <xsl:text>Challenges by Coder</xsl:text>
          </td>
          <td>
            <xsl:text>Round Name</xsl:text>
          </td>
         </tr>
         <xsl:for-each select="/TC/CHALLENGE/Round">
            <tr>
                <td>
                      <xsl:value-of select="RoundId"/>
                </td>
                <td>
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doRound('<xsl:value-of select="RoundId"/>')
                      </xsl:attribute>
                      click
                    </A>
                </td>
                <td>
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doProblem('<xsl:value-of select="RoundId"/>')
                      </xsl:attribute>
                      click
                    </A>
                </td>
                <td>
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doCoder('<xsl:value-of select="RoundId"/>')
                      </xsl:attribute>
                      click
                    </A>
                </td>
                <td>
                    <xsl:value-of select="ContestName"/> / <xsl:value-of select="RoundName"/>
                </td>
            </tr>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
<xsl:attribute name="ACTION">/admin/</xsl:attribute>
<input type="hidden" name="constraintid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/CONSTRAINTID"/>
    </xsl:attribute>
</input>

<INPUT TYPE="HIDDEN" NAME="module" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="roundid" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="filter" VALUE=""/>
</FORM>


</body>

</html>
</xsl:template>
</xsl:stylesheet>
