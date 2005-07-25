<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>


<xsl:import href="challenge_top.xsl"/>
<xsl:preserve-space elements="*"/>
<xsl:template match="/">

<html>
<head>
<title>Administrative Menu Page</title>


</head>

<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>



<a name="top"></a>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
 <tr>
   <td valign="top" align="center">

<form name="frmResults" method="post">
<xsl:attribute name="action">/admin/</xsl:attribute>
<input type="hidden" name="module" value=""/>
<input type="hidden" name="constraintid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/CONSTRAINTID"/>
    </xsl:attribute>
</input>
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="filter" value="90"/>
<input type="hidden" name="remove" value=""/>
<input type="hidden" name="overturn" value=""/>
<input type="hidden" name="roundid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/CHALLENGE/RoundId"/>
    </xsl:attribute>
</input>
<input type="hidden" name="roomid" value="">
    <xsl:attribute name="value">
        <xsl:value-of select="/TC/CHALLENGE/RoomId"/>
    </xsl:attribute>
</input>



<SCRIPT TYPE="text/Javascript"><![CDATA[
  function doRemove(id,roundid) {
    document.frmResults.remove.value = id;
    document.frmResults.roundid.value = roundid;
    document.frmResults.module.value = 'Challenge';
    document.frmResults.Command.value = 'removeChallenge';
    document.frmResults.submit();
  }
  function doOverturn(id,roundid) {
    document.frmResults.overturn.value = id;
    document.frmResults.roundid.value = roundid;
    document.frmResults.module.value = 'Challenge';
    document.frmResults.Command.value = 'overturnChallenge';
    document.frmResults.submit();
  }
  function doFilter(id) {
    document.frmResults.filter.value = id;
    document.frmResults.module.value = 'Challenge';
    if(document.frmResults.constraintid.value == '1')
    {
        document.frmResults.Command.value = 'getChallengeList';
    } else if(document.frmResults.constraintid.value == '2')  {
        document.frmResults.Command.value = 'getProblemChallengeList';
    } else if(document.frmResults.constraintid.value == '3')  {
        document.frmResults.Command.value = 'getCoderChallengeList';
    }
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
              <xsl:call-template name="ChallengeAllInactive"/>
          </td>
          <td>
              <xsl:call-template name="UnsuccessfulChallengesInactive"/>
          </td>
          <td>
              <xsl:call-template name="SuccessfulChallengeInactive"/>
          </td>
          <td>
              <xsl:call-template name="NullifiedChallengesInactive"/>
          </td>
        </tr>

      </table>
      <table width="800" cellspacing="0" cellpadding="0" border="0">
           <xsl:for-each select="/TC/CHALLENGE/Challenge">
            <tr>
              <td colspan="2"><br/><hr/><br/></td>
            </tr>
              <tr>
                <td width="150">Challenge Id</td>
                <td><xsl:value-of select="ChallengeId"/></td>
              </tr>
              <tr>
                <td>Timestamp</td>
                <td><xsl:value-of select="SubmitTime"/></td>
              </tr>
              <tr>
                <td>
                   <a><xsl:attribute name="HREF">JavaScript:doRemove('<xsl:value-of select="ChallengeId"/>','<xsl:value-of select="RoundId"/>')</xsl:attribute>
                      Nullify
                   </a>
                </td>
              </tr>
              <tr>
                <td>
                   <a><xsl:attribute name="HREF">JavaScript:doOverturn('<xsl:value-of select="ChallengeId"/>','<xsl:value-of select="RoundId"/>')</xsl:attribute>
                      Overturn
                   </a>
                </td>
              </tr>
              <tr>
                <td><xsl:value-of select="Contest/RoomDesc"/></td>
                <td><xsl:value-of select="Contest/RoomId"/></td>
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
                <td>Challenger Name</td>
                <td><xsl:value-of select="ChallengerName"/>  (<xsl:value-of select="ChallengerId"/>)</td>
              </tr>
              <tr>
                <td>Defendant Name</td>
                <td><xsl:value-of select="DefendantName"/>   (<xsl:value-of select="DefendantId"/>)</td>
              </tr>
              <tr>
                <td>Expected</td>
                <td><xsl:value-of select="ExpectedResult"/></td>
              </tr>
              <tr>
                <td>Received</td>
                <td><xsl:value-of select="ResultValue"/></td>
              </tr>
              <tr>
                <td>Challenge Args</td>
                <td><xsl:value-of select="Args"/></td>
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
                <td>Status</td>
                <td><xsl:value-of select="StatusDesc"/></td>
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
