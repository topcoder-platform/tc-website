<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="problemtop.xsl"/>
<xsl:import href="problembottom.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>
<head>
<title>System Test Administrative Menu Page</title>
</head>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">

<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doProblem(){doSubmit(-2,0,0);}
 function doCancel() {
  doSubmit(-2,0,0);
}

 function doSubmit(testCaseId, delFlag, testOrder) {
    document.frmResults.testCaseId.value = testCaseId;
    document.frmResults.testOrder.value = testOrder;
    if (delFlag == 1) {
      document.frmResults.Command.value = 'deleteTestCase';
    } else if (testCaseId == -1) {
      document.frmResults.Command.value = 'getNewTestCaseScreen';
    } else if(testCaseId == -2) {
      document.frmResults.Command.value = 'getProblemModifyScreen';
    } else { 
      document.frmResults.Command.value = 'getTestCaseModifyScreen';
    }
    document.frmResults.submit();
  }
]]></SCRIPT>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
<!--
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/TC/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="100%" bgcolor="#4d0000"> <img src="/images/spacer.gif" width="1" height="1"/> </td>
  </tr> 
-->
  <tr>
<!--
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/TC/LoggedIn='true'">
            <xsl:call-template name="Problems_LI"/>
          </xsl:when>
        </xsl:choose>
        <tr> 
          <td valign="top"> 
            <xsl:call-template name="LeftSideNavBarForm"/>
          </td> 
        </tr>
      </table>
    </td>
-->
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
            <xsl:call-template name="ProblemInformationInactive"/>
            <xsl:call-template name="SystemTestInformationActive"/>
          </td>
        </tr>

        <tr>
          <td align="left" valign="center" width="350" height="50" colspan="1">
             <a href="JavaScript:doSubmit('-1','0','0')">
                  <b><xsl:text>Create New Test Case</xsl:text></b>
             </a>
          </td>
        </tr>
      </table>
      <table width="619" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="100" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text>Test Case Id</xsl:text>
            </font>
          </td>
          <td align="center" valign="center" width="450" height="20">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            <xsl:text></xsl:text>
            </font>
          </td>
         </tr>
         <xsl:for-each select="/TC/PROBLEMS/Problem/TestCase">
          <FORM>
            <tr>
                <td align="center" valign="center" width="450" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="TestCaseId"/>','0','<xsl:value-of select="TestOrder"/>')
                      </xsl:attribute>
                      <xsl:value-of select="TestCaseId"/>
                    </A>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="50">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit('<xsl:value-of select="TestCaseId"/>','1','<xsl:value-of select="TestOrder"/>')
                      </xsl:attribute>
                      <xsl:text>Delete</xsl:text>
                    </A>
                  </font>
                </td>
            </tr>
          </FORM>
         </xsl:for-each>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
    <td colspan="2"><img src="/images/spacer.gif" width="400" height="15" /></td>
  </tr>
  <tr>
    <td align="center" colspan="1">
      <xsl:call-template name="CancelButton"/>
    </td>
    <td colspan="2">
    </td>
           
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
<xsl:attribute name="ACTION">http<xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
<INPUT TYPE="HIDDEN" NAME="Task" VALUE="problems"/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
<!--
<INPUT TYPE="HIDDEN" NAME="LoggedIn">
  <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
</INPUT>
-->
<INPUT TYPE="HIDDEN" NAME="testCaseId" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="testOrder" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="results">
  <xsl:attribute name="VALUE">
    <xsl:value-of select="/TC/PROBLEMS/Problem/ProblemId"/>
  </xsl:attribute>
</INPUT>
</FORM>

</body>

</html>
</xsl:template>
</xsl:stylesheet>
