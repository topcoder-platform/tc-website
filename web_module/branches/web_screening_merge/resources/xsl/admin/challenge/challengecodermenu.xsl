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
 function doSubmit(coderid) {
    document.frmResults.Task.value    = 'challenge';
    document.frmResults.Command.value = 'getCoderChallengeList';
    document.frmResults.coderid.value = coderid;
    document.frmResults.filter.value = 90;
    document.frmResults.submit();
  }
]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0" >
  <tr>
    <td valign="center" align="center">
      <br/><br/>
      <table width="619" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td>
            <xsl:text>User Id</xsl:text>
          </td>
          <td>
            <xsl:text>Handle</xsl:text>
          </td>
         </tr>
         <xsl:for-each select="/TC/CHALLENGE/SystemTestCaseReport">
            <tr>
                <td>
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="CoderId"/>')
                      </xsl:attribute>
                      <xsl:value-of select="CoderId"/>
                    </A>
                </td>
                <td>
                      <xsl:value-of select="Handle"/>
                 </td>
            </tr>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
     <xsl:attribute name="ACTION">/admin</xsl:attribute>
     <INPUT TYPE="HIDDEN" NAME="Task" VALUE=""/>
     <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
     <INPUT TYPE="HIDDEN" NAME="coderid" VALUE=""/>
     <INPUT TYPE="HIDDEN" NAME="filter" VALUE=""/>
     <input type="hidden" name="constraintid" value="">
         <xsl:attribute name="value">
             <xsl:value-of select="/TC/CONSTRAINTID"/>
         </xsl:attribute>
     </input>
     <input type="hidden" name="roundid" value="">
         <xsl:attribute name="value">
             <xsl:value-of select="/TC/CHALLENGE/Challenge/RoundId"/>
         </xsl:attribute>
     </input>
     
     <INPUT TYPE="HIDDEN" NAME="problemid" VALUE=""/>
</FORM>

 
</body>

</html>
</xsl:template>
</xsl:stylesheet>
