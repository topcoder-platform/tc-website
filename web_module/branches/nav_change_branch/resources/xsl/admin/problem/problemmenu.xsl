<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="problemtop.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">
<html>

<head>
<title>Problem Administrative Menu Page</title>
</head>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">

<a name="top"></a>

<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doSubmit(problemId, deleteFlag) {
    document.frmResults.results.value = problemId;
    document.frmResults.Task.value = 'problems';
    if (problemId == -1) {
      document.frmResults.Command.value = 'getNewProblemScreen';
    } else if (deleteFlag == 1) {
      document.frmResults.Command.value = 'deleteProblem';
    } else { 
      document.frmResults.Command.value = 'getProblemModifyScreen';
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
<!--
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr><td><img src="/images/spacer.gif" width="619" height="5" /></td></tr>
      </table>
      <br/><br/>
-->
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td align="left" valign="center" width="350" height="50" colspan="1">
             <a href="JavaScript:doSubmit(-1,0)">
                  <b><xsl:text>Create New Problem</xsl:text></b>
             </a>
          </td>
        </tr>
      </table>
      <table width="619" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="60" height="20">Problem Id</td>
          <td align="center" valign="center" width="350" height="20">Class Name</td>
          <td align="center" valign="center" width="350" height="20">Method Name</td>
          <td align="center" valign="center" width="250" height="20">Difficulty Level</td>
          <td align="center" valign="center" width="60" height="20"></td>

         </tr>
         <xsl:for-each select="/TC/PROBLEMS/Problem">
          <FORM>
            <tr>
                <td align="center" valign="center" width="60" height="20">
                  <font size="2" color="#ffffff">
                    <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit(<xsl:value-of select="ProblemId"/>,0)
                      </xsl:attribute>
                      <xsl:value-of select="ProblemId"/>
                    </A>
                  </font>
                </td>
                <td align="center" valign="center" width="350" height="20"><xsl:value-of select="ClassName"/></td>
                <td align="center" valign="center" width="350" height="20"><xsl:value-of select="MethodName"/></td>
                <td align="center" valign="center" width="250" height="20"><xsl:value-of select="Difficulty"/></td>
                <td align="center" valign="center" width="60" height="20">
                  <font size="2" color="#ffffff">
                     <A>
                      <xsl:attribute name="HREF">JavaScript:doSubmit(<xsl:value-of select="ProblemId"/>,1)
                      </xsl:attribute>
                      <xsl:text>Delete</xsl:text>
                    </A>
                  </font>
                </td>

            </tr>
            <INPUT TYPE="HIDDEN" NAME="problemId">
              <xsl:attribute name="VALUE">
                <xsl:value-of select="ProblemId"/>
              </xsl:attribute>
            </INPUT>
          </FORM>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>

<FORM NAME="frmResults" METHOD="POST">
<!-- <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute> -->
<xsl:attribute name="ACTION">http<xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
<INPUT TYPE="HIDDEN" NAME="Task" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
<!--
<INPUT TYPE="HIDDEN" NAME="LoggedIn">
  <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
</INPUT>
-->
<INPUT TYPE="HIDDEN" NAME="results" VALUE=""/>
</FORM>

<!--
<xsl:call-template name="Bottom"/>
-->
 
</body>
</html>
</xsl:template>
</xsl:stylesheet>
