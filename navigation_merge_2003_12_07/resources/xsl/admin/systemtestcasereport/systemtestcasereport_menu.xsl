<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="systemtestcasereport_top.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">

<html>
<head>
<title>Administrative Menu Page</title>


</head>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">

<a name="top"></a>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
 <tr>
   <td valign="top" align="center">

<form name="frmResults" method="post">
<xsl:attribute name="action">http<xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
<input type="hidden" name="Task" value=""/>
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="results" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/SYSTEMTESTCASEREPORT/SystemTestCaseReport/RoundId"/>
    </xsl:attribute>
</input>
<input type="hidden" name="filter" value=""/>
<input type="hidden" name="coderid" value=""/>
<input type="hidden" name="roomid" value=""/>
<input type="hidden" name="testcaseid" value=""/>
<input type="hidden" name="remove" value=""/>
<input type="hidden" name="roundid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/SYSTEMTESTCASEREPORT/SystemTestCaseReport/RoundId"/>
    </xsl:attribute>
</input>
<input type="hidden" name="problemid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/SYSTEMTESTCASEREPORT/SystemTestCaseReport/Problem/ProblemId"/>
    </xsl:attribute>
</input>



<SCRIPT TYPE="text/Javascript"><![CDATA[
  function doRemove(coderId, roomId, testCaseId) {
    document.frmResults.coderid.value = coderId;
    document.frmResults.roomid.value = roomId;
    document.frmResults.testcaseid.value = testCaseId;
    document.frmResults.filter.value = 1;
    document.frmResults.Task.value = 'systemtestcasereport';
    document.frmResults.Command.value = 'removeSystemTestCaseReport';
    document.frmResults.submit();
  }
  function doFilter(id ) {
    document.frmResults.filter.value = id;
    document.frmResults.Task.value = 'systemtestcasereport';
    document.frmResults.Command.value = 'getSystemTestCaseReportList';
    document.frmResults.submit();
  }
]]></SCRIPT>

      <table width="800" cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td><img src="/images/spacer.gif" height="20" width="20" /></td>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" height="20" /></td>
          <td>
              <xsl:call-template name="SystemTestCaseReportAllInactive"/>
          </td>
          <td>
              <xsl:call-template name="UnsuccessfulSystemTestCaseReportInactive"/>
          </td>
          <td>
              <xsl:call-template name="SuccessfulSystemTestCaseReportInactive"/>
          </td>
          <td>
              <xsl:call-template name="NullifiedSystemTestCaseReportInactive"/>
          </td>
        </tr>

      </table><br/>

      <table width="800" cellspacing="0" cellpadding="0" border="0">
          <xsl:for-each select="/TC/SYSTEMTESTCASEREPORT/SystemTestCaseReport">      

            <tr>
              <td colspan="2"><br/><hr/><br/></td>
            </tr>
            <tr >
              <td width="150">Test Case Id</td>
              <td><xsl:value-of select="TestCaseId"/></td>
            </tr>
            <tr>
              <td>Timestamp</td>
              <td><xsl:value-of select="Timestamp"/></td>
            </tr>
            <tr>
              <td>
                <a><xsl:attribute name="HREF">
                        JavaScript:doRemove('<xsl:value-of select="CoderId"/>','<xsl:value-of select="RoomId"/>','<xsl:value-of select="TestCaseId"/>')
                   </xsl:attribute>
                   Nullify
                </a>
              </td>
            </tr>
            <tr>
              <td><xsl:value-of select="RoomName"/></td>
              <td><xsl:value-of select="RoomId"/></td>
            </tr>
            <tr>
              <td>Problem Id</td>
              <td><xsl:value-of select="Problem/ProblemId"/></td>
            </tr>
            <tr>
              <td>Round Id</td>
              <td><xsl:value-of select="RoundId"/></td>
            </tr>
            <tr>
              <td>Handle</td>
              <td><xsl:value-of select="Handle"/></td>
            </tr>
            <tr>
              <td>Args</td>
              <td><xsl:value-of select="Args"/></td>
            </tr>
            <tr>
              <td>Expected</td>
              <td><xsl:value-of select="Expected"/></td>
            </tr>
            <tr>
              <td>Received</td>
              <td><xsl:value-of select="Received"/></td>
            </tr>
            <tr>
              <td>Succeded</td>
              <td>
                  <xsl:if test="Succeeded=1">Yes</xsl:if>
                  <xsl:if test="Succeeded=0">No</xsl:if>
                  <xsl:if test="Succeeded=-1">Nullified</xsl:if>
              </td>
            </tr>
            <tr>
              <td>Message</td>
              <td><xsl:value-of select="Message"/></td>
            </tr>
        </xsl:for-each>    
    </table>


            
</form>            
    </td>
  </tr>
</table>


</body> 
</html>
</xsl:template>
</xsl:stylesheet>
