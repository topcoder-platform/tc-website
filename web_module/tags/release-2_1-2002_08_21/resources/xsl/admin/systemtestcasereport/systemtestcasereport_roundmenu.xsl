<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>
<head>
</head>
<body>
<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(roundId) {
    document.frmResults.Task.value    = 'systemtestcasereport';
    document.frmResults.Command.value = 'getProblemList';
    document.frmResults.results.value = roundId;
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
            <xsl:text>Round Id</xsl:text>
          </td>
          <td>
            <xsl:text>Round Name</xsl:text>
          </td>
         </tr>
           <xsl:for-each select="/TC/SYSTEMTESTCASEREPORT/Round">
              <tr>
                 <td>
                    <A>
                       <xsl:attribute name="HREF">
                             JavaScript:doSubmit('<xsl:value-of select="RoundId" />') 
                        </xsl:attribute>
                        <xsl:value-of select="RoundId" /> 
                     </A>
                  </td>
                 <td>
                     <xsl:value-of select="RoundDesc" /> 
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
<INPUT TYPE="HIDDEN" NAME="results" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="filter" VALUE=""/>
</FORM>

 
</body>

</html>
</xsl:template>
</xsl:stylesheet>
