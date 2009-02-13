<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="contesttop.xsl"/>
<xsl:import href="contestbottom.xsl"/>

<xsl:template match="/">
<html>

<head>
<title>Contest Round Setup Screen</title>

<xsl:call-template name="CSS"/>

</head>

<SCRIPT TYPE="text/Javascript"><![CDATA[

function doUpdate() {
  if(doCheck()) {
    window.document.frmRound.Command.value="roundsave";
    doSubmit();
  }
}

function doNext() { 
  if(doCheck()) {
    window.document.frmRound.Command.value="roundnext";
    doSubmit();
  }
}

function doRoundSegments() {
  window.document.frmRound.Command.value="roundsegment";
  if(window.document.frmRound.modified.value="M") {
    doSubmit();
  }
  else if(doCheck()) {
    doSubmit();
  }
}

function doRoundProblems() {
  window.document.frmRound.Command.value="roundproblem";
  if(window.document.frmRound.modified.value="M") {
    doSubmit();
  }
  else if(doCheck()) {
    doSubmit();
  }
}


function doContest() {
    window.document.frmRound.Command.value="getContestModifyScreen";
    doSubmit();
}

function doSubmit(){ window.document.frmRound.submit(); }

function doCheck(){
  if(window.document.frmRound.roundname.value=="") {
    alert("Please enter a Round Name.");
    window.document.frmRound.roundname.focus();
    return false;
  }
  return true;
}

]]></SCRIPT>


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="initPage()">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
    <td width="619" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
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
    <table width="619" cellpadding="0" cellspacing="0" border="0"  >
           <tr>
              <td align="center" valign="top" colspan="2">
               <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                    <b>ROUND SETUP SCREEN</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmRound" METHOD="POST">
               <xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
               <tr>
                 <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
               </tr>
               <tr>
                  <td>
                       <xsl:call-template name="ContestInformationInactive"/>
                       <xsl:call-template name="RoundInformationActive"/>
                       <xsl:call-template name="RoundSegmentsInactive"/>
                       <xsl:call-template name="RoundProblemsInactive"/>
                   </td>
                </tr>
 
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Round Name: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="roundname" size="45">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/Round/RoundDesc"/>
                    </xsl:attribute>
                  </INPUT>
                </td>
              </tr>
 
              <tr>
                 <td colspan="2" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
                 <td><img src="/images/spacer.gif" width="200" height="15" /></td>
                 <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
           <tr>
             <td align="center" colspan="2">
                <xsl:call-template name="NextButton"/>
                <xsl:call-template name="UpdateButton"/>
             </td>
           </tr>
           </table>
              
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="contest"/>
              <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/LoggedIn"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="modified">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/Round/Modified"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="results">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/Round/ContestId"/>
                </xsl:attribute>
              </INPUT>

              </FORM>
           </table>
    </td>
  </tr>
</table>


</body>

</html>
</xsl:template>
</xsl:stylesheet>
