<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>
<head>
<title></title>
</head>
<body>
<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(coderId) {
    document.frmResults.Task.value    = 'systemtestcasereport';
    document.frmResults.Command.value = 'getSystemTestCaseReportList';
    document.frmResults.coderid.value = coderId;
    document.frmResults.filter.value = 1;
    document.frmResults.submit();
  }

]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0" >
  <tr>
    <td>
      <br/><br/>
      <table width="319" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td>
            <xsl:text>Coder Id</xsl:text>
          </td>
          <td >
            <xsl:text>Handle</xsl:text>
          </td>
        </tr>
        <xsl:for-each select="/TC/SYSTEMTESTCASEREPORT/SystemTestCaseReport">
           <tr>
              <td>
                 <A>
                    <xsl:attribute name="HREF">
                       JavaScript:doSubmit('<xsl:value-of select="CoderId" />') 
                    </xsl:attribute>
                    <xsl:value-of select="CoderId" /> 
                 </A>
              </td>
              <td>
                  <xsl:value-of select="Handle" /> 
              </td>
           </tr>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
<xsl:attribute name="ACTION">http<xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
<INPUT TYPE="HIDDEN" NAME="Task" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="problemid" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="coderid" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="filter" VALUE=""/>
</FORM>

 
</body>

</html>
</xsl:template>
</xsl:stylesheet>
